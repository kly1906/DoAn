
using System;
using System.Data;
using System.Data.SqlClient;

namespace EnglishVocabularyApp
{
    internal static class SqlDataAccess
    {
        private const string ConnectionString = @"Data Source=boideptraino1;Initial Catalog=EnglishVocabularyApp;Integrated Security=True";

        public static DataTable GetDataFromTable(string tableOrView, string condition = "")
        {
            string query = $"SELECT * FROM {tableOrView}";
            if (!string.IsNullOrEmpty(condition))
                query += $" WHERE {condition}";

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand(query, conn))
            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                conn.Open();
                adapter.Fill(dt);
                return dt;
            }
        }

        public static DataTable GetDataFromProcedure(string procCommand)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand(procCommand, conn))
            using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                conn.Open();
                adapter.Fill(dt);
                return dt;
            }
        }

        public static void ExecuteNonQuery(string sqlCommand)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sqlCommand, conn))
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public static object ExecuteScalar(string sqlCommand)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sqlCommand, conn))
            {
                conn.Open();
                return cmd.ExecuteScalar();
            }
        }
    }
}
