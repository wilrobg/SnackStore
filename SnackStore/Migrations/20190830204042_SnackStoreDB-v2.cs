using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace SnackStore.Migrations
{
    public partial class SnackStoreDBv2 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_LikesTrack_AspNetUsers_UserId",
                table: "LikesTrack");

            migrationBuilder.AddColumn<DateTime>(
                name: "UpdateDate",
                table: "PriceProductLog",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AlterColumn<string>(
                name: "UserId",
                table: "LikesTrack",
                nullable: false,
                oldClrType: typeof(string),
                oldNullable: true);

            migrationBuilder.CreateTable(
                name: "PurchaseHistory",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    Quantity = table.Column<int>(nullable: false),
                    PurchaseTotal = table.Column<decimal>(type: "money", nullable: false),
                    PurchasePrice = table.Column<decimal>(type: "money", nullable: false),
                    PurchaseDate = table.Column<DateTime>(nullable: false),
                    ProductId = table.Column<int>(nullable: false),
                    UserId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PurchaseHistory", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PurchaseHistory_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PurchaseHistory_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseHistory_ProductId",
                table: "PurchaseHistory",
                column: "ProductId");

            migrationBuilder.CreateIndex(
                name: "IX_PurchaseHistory_UserId",
                table: "PurchaseHistory",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_LikesTrack_AspNetUsers_UserId",
                table: "LikesTrack",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_LikesTrack_AspNetUsers_UserId",
                table: "LikesTrack");

            migrationBuilder.DropTable(
                name: "PurchaseHistory");

            migrationBuilder.DropColumn(
                name: "UpdateDate",
                table: "PriceProductLog");

            migrationBuilder.AlterColumn<string>(
                name: "UserId",
                table: "LikesTrack",
                nullable: true,
                oldClrType: typeof(string));

            migrationBuilder.AddForeignKey(
                name: "FK_LikesTrack_AspNetUsers_UserId",
                table: "LikesTrack",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
