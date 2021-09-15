using Microsoft.EntityFrameworkCore.Migrations;

namespace Domain.Migrations
{
    public partial class AddUserAndType : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Types",
                columns: new[] { "Id", "Code" },
                values: new object[] { 1, "INTERNAL" });

            migrationBuilder.InsertData(
                table: "Types",
                columns: new[] { "Id", "Code" },
                values: new object[] { 2, "EXTERNAL" });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "Id", "Name", "TypeId" },
                values: new object[] { 1, "User One", 1 });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Types",
                keyColumn: "Id",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "Id",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Types",
                keyColumn: "Id",
                keyValue: 1);
        }
    }
}
