
using System.Data;

namespace EnglishVocabularyApp.BLL
{
    internal class BLL_KetQua
    {
        public void Add(string id, string nguoiDungID, int soTu, int soDung)
        {
            string cmd = $"exec ThemKetQua '{id}', '{nguoiDungID}', {soTu}, {soDung}, {soTu - soDung}, GETDATE()";
            SqlDataAccess.ExecuteNonQuery(cmd);
        }

        public DataTable GetByUser(string nguoiDungID)
        {
            return SqlDataAccess.GetDataFromTable("vw_KetQuaNguoiDung", $"NguoiDungID = '{nguoiDungID}'");
        }
    }
}
