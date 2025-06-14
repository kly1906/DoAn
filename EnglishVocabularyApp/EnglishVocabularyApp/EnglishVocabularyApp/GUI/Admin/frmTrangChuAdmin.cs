using EnglishVocabularyApp.GUI.Admin;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EnglishVocabularyApp
{
    public partial class frmTrangChuAdmin : Form
    {
        int mode = 1;
        public frmTrangChuAdmin()
        {
            InitializeComponent();
        }
        void LoadForm(Form form)
        {
            panelContent.Controls.Clear();
            form.TopLevel = false;
            panelContent.Controls.Add(form);
            form.FormBorderStyle = FormBorderStyle.None;
            form.Dock = DockStyle.Fill;
            form.Show();
        }
        private void frmTrangChuAdmin_Load(object sender, EventArgs e)
        {
            // 0: manager , 1: admin
            if (mode == 0)
            {
                button1.Visible = false;
                mode = 1;
            }
            else
            {
                button1.Visible = true;
                mode = 0;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            LoadForm(new frmQuanLyAdmin());
        }
        private void button2_Click(object sender, EventArgs e)
        {
            LoadForm(new frmQuanLyChuDe());
        }
        private void button3_Click(object sender, EventArgs e)
        {
            LoadForm(new frmThongTin());
        }
        private void button4_Click(object sender, EventArgs e)
        {
            LoadForm(new frmBaoCao());
        }
    }
}
