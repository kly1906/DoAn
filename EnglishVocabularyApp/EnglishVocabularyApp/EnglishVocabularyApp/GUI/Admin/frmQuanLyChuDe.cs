using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EnglishVocabularyApp.GUI.Admin
{
    public partial class frmQuanLyChuDe : Form
    {
        public frmQuanLyChuDe()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            frmQuanLyTuVung frmXemTuVung = new frmQuanLyTuVung();
            frmXemTuVung.ShowDialog();
        }
    }
}
