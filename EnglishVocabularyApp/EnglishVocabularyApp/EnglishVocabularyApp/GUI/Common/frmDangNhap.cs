using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Collections.Specialized.BitVector32;
using EnglishVocabularyApp.Common;
using EnglishVocabularyApp.BLL;

namespace EnglishVocabularyApp.GUI.User
{
    public partial class frmDangNhap : Form
    {
        BLL_NguoiDung bllNguoiDung = new BLL_NguoiDung();

        int mode = 0;
        public frmDangNhap()
        {
            InitializeComponent();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            // 0: Người dùng, 1: Admin
            if (mode == 0)
            {
                pictureBox1.BackgroundImage = Properties.Resources.admin;
                linkLabel1.Text = "Người dùng đăng nhập";
                mode = 1;
            }
            else
            {
                pictureBox1.BackgroundImage = Properties.Resources.learner;
                linkLabel1.Text = "Đăng nhập với vai trò Admin";
                mode = 0;
            }
        }

        private void frmDangNhap_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string tenDangNhap = textBox1.Text.Trim();
            string matKhau = textBox2.Text.Trim();

            if (string.IsNullOrEmpty(tenDangNhap) || string.IsNullOrEmpty(matKhau))
            {
                MessageBox.Show("Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu.");
                return;
            }

            DataTable dt = bllNguoiDung.DangNhap(tenDangNhap, matKhau);

            if (dt.Rows.Count > 0)
            {
                Session.NguoiDungID = dt.Rows[0]["NguoiDungID"].ToString();
                Session.TenDangNhap = dt.Rows[0]["TenDangNhap"].ToString();
                Session.HoTen = dt.Rows[0]["HoTen"].ToString(); // nếu có
                Session.VaiTro = dt.Rows[0]["VaiTro"].ToString(); // nếu có

                this.Hide();

                if (mode == 1 || Session.VaiTro == "Admin")
                {
                    new frmTrangChuAdmin().ShowDialog();
                }
                else
                {
                    new frmTrangChuNguoiDung().ShowDialog();
                }

                this.Close();
            }
            else
            {
                MessageBox.Show("Đăng nhập không thành công. Vui lòng kiểm tra lại.");
            }
        }
    }
}
