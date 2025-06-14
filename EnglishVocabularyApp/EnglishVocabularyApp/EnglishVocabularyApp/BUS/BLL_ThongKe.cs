
using System.Data;

namespace EnglishVocabularyApp.BLL
{
    internal class BLL_ThongKe
    {
        public DataTable ChuDeThongKe()
        {
            return SqlDataAccess.GetDataFromTable("vw_ThongKeChuDe");
        }

        public DataTable TuDaHocTheoNguoiDung(string userID)
        {
            return SqlDataAccess.GetDataFromTable("vw_TuVungDaHoc", $"TenDangNhap = '{userID}'");
        }
    }
}
