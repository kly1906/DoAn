
using System.Data;

namespace EnglishVocabularyApp.BLL
{
    internal class BLL_NguoiDung
    {
        public DataTable DangNhap(string tendangnhap, string matkhau)
        {
            string cmd = $"exec DangNhapNguoiDung '{tendangnhap}', '{matkhau}'";
            return SqlDataAccess.GetDataFromProcedure(cmd);
        }

        public DataTable GetAll()
        {
            return SqlDataAccess.GetDataFromTable("NguoiDung");
        }
    }
}
