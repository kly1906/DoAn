
using System.Data;
using System.Collections.Generic;
using System.Linq;

namespace EnglishVocabularyApp.BLL
{
    internal class BLL_TuVung
    {
        public DataTable GetAllByChuDe(string chuDeID)
        {
            return SqlDataAccess.GetDataFromTable($"vw_TuVungTheoChuDe", $"ChuDeID = '{chuDeID}'");
        }

        public string GetNewID()
        {
            string header = "TV";
            var dt = SqlDataAccess.GetDataFromTable("TuVung");
            if (dt.Rows.Count == 0) return header + "001";

            List<int> ids = new List<int>();
            foreach (DataRow row in dt.Rows)
                ids.Add(int.Parse(row[0].ToString().Substring(2)));

            return header + (ids.Max() + 1).ToString("D3");
        }

        public void Add(string id, string eng, string viet, string am, string chuDeID)
        {
            string cmd = $"exec ThemTuVung '{id}', N'{eng}', N'{viet}', N'{am}', '{chuDeID}'";
            SqlDataAccess.ExecuteNonQuery(cmd);
        }
    }
}
