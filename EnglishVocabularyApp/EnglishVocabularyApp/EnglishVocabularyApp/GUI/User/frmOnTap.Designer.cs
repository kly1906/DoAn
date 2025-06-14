namespace EnglishVocabularyApp.GUI.User
{
    partial class frmOnTap
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.lbQuestion = new System.Windows.Forms.Label();
            this.btnAns1 = new System.Windows.Forms.Button();
            this.btnAns2 = new System.Windows.Forms.Button();
            this.btnAns3 = new System.Windows.Forms.Button();
            this.btnAns4 = new System.Windows.Forms.Button();
            this.lbResult = new System.Windows.Forms.Label();
            this.btnNext = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(42, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(263, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "Chọn nghĩa đúng của từ";
            // 
            // lbQuestion
            // 
            this.lbQuestion.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbQuestion.Location = new System.Drawing.Point(16, 7);
            this.lbQuestion.Name = "lbQuestion";
            this.lbQuestion.Size = new System.Drawing.Size(668, 108);
            this.lbQuestion.TabIndex = 0;
            this.lbQuestion.Text = "[từ ngẫu nhiên]";
            this.lbQuestion.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // btnAns1
            // 
            this.btnAns1.Location = new System.Drawing.Point(74, 246);
            this.btnAns1.Name = "btnAns1";
            this.btnAns1.Size = new System.Drawing.Size(266, 79);
            this.btnAns1.TabIndex = 1;
            this.btnAns1.Text = "button1";
            this.btnAns1.UseVisualStyleBackColor = true;
            // 
            // btnAns2
            // 
            this.btnAns2.Location = new System.Drawing.Point(74, 350);
            this.btnAns2.Name = "btnAns2";
            this.btnAns2.Size = new System.Drawing.Size(266, 79);
            this.btnAns2.TabIndex = 1;
            this.btnAns2.Text = "button1";
            this.btnAns2.UseVisualStyleBackColor = true;
            // 
            // btnAns3
            // 
            this.btnAns3.Location = new System.Drawing.Point(431, 246);
            this.btnAns3.Name = "btnAns3";
            this.btnAns3.Size = new System.Drawing.Size(266, 79);
            this.btnAns3.TabIndex = 1;
            this.btnAns3.Text = "button1";
            this.btnAns3.UseVisualStyleBackColor = true;
            // 
            // btnAns4
            // 
            this.btnAns4.Location = new System.Drawing.Point(431, 350);
            this.btnAns4.Name = "btnAns4";
            this.btnAns4.Size = new System.Drawing.Size(266, 79);
            this.btnAns4.TabIndex = 1;
            this.btnAns4.Text = "button1";
            this.btnAns4.UseVisualStyleBackColor = true;
            // 
            // lbResult
            // 
            this.lbResult.AutoSize = true;
            this.lbResult.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbResult.Location = new System.Drawing.Point(542, 206);
            this.lbResult.Name = "lbResult";
            this.lbResult.Size = new System.Drawing.Size(133, 20);
            this.lbResult.TabIndex = 0;
            this.lbResult.Text = "[Đúng rồi!/Sai rồi!]";
            // 
            // btnNext
            // 
            this.btnNext.Location = new System.Drawing.Point(600, 459);
            this.btnNext.Name = "btnNext";
            this.btnNext.Size = new System.Drawing.Size(75, 40);
            this.btnNext.TabIndex = 2;
            this.btnNext.Text = "Tiếp tục";
            this.btnNext.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(248)))), ((int)(((byte)(239)))), ((int)(((byte)(230)))));
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.lbQuestion);
            this.panel1.Location = new System.Drawing.Point(32, 65);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(698, 124);
            this.panel1.TabIndex = 3;
            // 
            // frmOnTap
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(770, 524);
            this.Controls.Add(this.lbResult);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.btnNext);
            this.Controls.Add(this.btnAns4);
            this.Controls.Add(this.btnAns3);
            this.Controls.Add(this.btnAns2);
            this.Controls.Add(this.btnAns1);
            this.Controls.Add(this.label1);
            this.Name = "frmOnTap";
            this.Text = "frmOnTap";
            this.panel1.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lbQuestion;
        private System.Windows.Forms.Button btnAns1;
        private System.Windows.Forms.Button btnAns2;
        private System.Windows.Forms.Button btnAns3;
        private System.Windows.Forms.Button btnAns4;
        private System.Windows.Forms.Label lbResult;
        private System.Windows.Forms.Button btnNext;
        private System.Windows.Forms.Panel panel1;
    }
}