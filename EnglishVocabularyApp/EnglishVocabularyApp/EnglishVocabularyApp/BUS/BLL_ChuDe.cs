
using System.Data;
using System.Collections.Generic;
using System.Linq;

namespace EnglishVocabularyApp.BLL
{
    internal class BLL_ChuDe
    {
        public DataTable GetAll()
        {
            return SqlDataAccess.GetDataFromTable("ChuDe");
        }

        public string GetNewID()
        {
            string header = "CD";
            var dt = SqlDataAccess.GetDataFromTable("ChuDe");
            if (dt.Rows.Count == 0) return header + "001";

            List<int> ids = new List<int>();
            foreach (DataRow row in dt.Rows)
                ids.Add(int.Parse(row[0].ToString().Substring(2)));

            return header + (ids.Max() + 1).ToString("D3");
        }

        public void Add(string id, string name)
        {
            string cmd = $"exec ThemChuDe '{id}', N'{name}'";
            SqlDataAccess.ExecuteNonQuery(cmd);
        }
    }
}
