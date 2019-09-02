using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SnackStore.Models;

namespace SnackStore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly IConfiguration _configuration;
       

        public AccountController(
            UserManager<ApplicationUser> userManager,
            SignInManager<ApplicationUser> signInManager,
            RoleManager<IdentityRole> roleManager,
            IConfiguration configuration)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _roleManager = roleManager;
            _configuration = configuration;
        }

        /// <summary>
        /// Create a user
        /// </summary>
        /// <param name="userInfo">Provied user and password</param>
        /// <returns>Get valid JSON Web Token of user</returns>
        [HttpPost("CreateUser")]
        public async Task<ActionResult<UserTokenDTO>> CreateUser([FromBody] UserInfoDTO userInfo)
        {
            var user = new ApplicationUser { UserName = userInfo.Email, Email = userInfo.Email };
            var result = await _userManager.CreateAsync(user, userInfo.Password);
            var result2 = await _userManager.AddToRoleAsync(user, "Costumer");
            var roles = await _userManager.GetRolesAsync(user);

            if (result.Succeeded)
            {

                return BuildToken(userInfo, user.Id, roles);
            }
            else
            {
                return BadRequest("Username or password invalid");
            }

        }

        /// <summary>
        /// Add Admin role tu user.
        /// </summary>
        /// <param name="user">Provied user</param>
        /// <returns></returns>
        [HttpPost("AddAdminUser")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
        public async Task<ActionResult> AddAdminUser(string user)
        {
            var userap = await _userManager.FindByEmailAsync(user);

            if (userap == null)
            {
                return NotFound();
            }

            var result1 = await _userManager.AddToRoleAsync(userap, "Admin");

            return Ok("Added admin role to "+ userap.UserName);
        }

        /// <summary>
        /// Login user
        /// </summary>
        /// <param name="userInfo"></param>
        /// <returns></returns>
        [HttpPost("Login")]
        public async Task<ActionResult<UserTokenDTO>> Login([FromBody] UserInfoDTO userInfo)
        {
            var result = await _signInManager.PasswordSignInAsync(userInfo.Email, userInfo.Password, isPersistent: false, lockoutOnFailure: false);
            if (result.Succeeded)
            { 
                var user = await _userManager.FindByNameAsync(userInfo.Email);
                var roles = await _userManager.GetRolesAsync(user);

                return BuildToken(userInfo, user.Id, roles);
            }
            else
            {
                ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                return BadRequest(ModelState);
            }
        }


        private UserTokenDTO BuildToken(UserInfoDTO userInfo, string userid, IList<string> roles)
        {
            var claims = new List<Claim>
            {
                new Claim(JwtRegisteredClaimNames.UniqueName, userInfo.Email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(ClaimTypes.NameIdentifier, userid)
            };

            if(!(roles == null))
            foreach (string role in roles)
            {
                claims.Add(new Claim(ClaimTypes.Role, role));
            }
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["JWT:key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            // Time expiration token. 30 minutes
            var expiration = DateTime.UtcNow.AddMinutes(30);

            JwtSecurityToken token = new JwtSecurityToken(
               issuer: null,
               audience: null,
               claims: claims,
               expires: expiration,
               signingCredentials: creds);

            return new UserTokenDTO()
            {
                Token = new JwtSecurityTokenHandler().WriteToken(token),
                Expiration = expiration
            };
        }
    }
}