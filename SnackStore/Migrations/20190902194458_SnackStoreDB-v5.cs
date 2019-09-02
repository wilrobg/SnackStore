using Microsoft.EntityFrameworkCore.Migrations;

namespace SnackStore.Migrations
{
    public partial class SnackStoreDBv5 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PurchaseHistory_Products_ProductId",
                table: "PurchaseHistory");

            migrationBuilder.DropIndex(
                name: "IX_PurchaseHistory_ProductId",
                table: "PurchaseHistory");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_PurchaseHistory_ProductId",
                table: "PurchaseHistory",
                column: "ProductId");

            migrationBuilder.AddForeignKey(
                name: "FK_PurchaseHistory_Products_ProductId",
                table: "PurchaseHistory",
                column: "ProductId",
                principalTable: "Products",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
