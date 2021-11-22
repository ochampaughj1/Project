
namespace DoctorsOffice
{
    partial class Form1
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
            this.uxOfficesListBox = new System.Windows.Forms.ListBox();
            this.uxAddOfficeBtn = new System.Windows.Forms.Button();
            this.uxViewOfficeBtn = new System.Windows.Forms.Button();
            this.uxOfficesLabel = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // uxOfficesListBox
            // 
            this.uxOfficesListBox.FormattingEnabled = true;
            this.uxOfficesListBox.ItemHeight = 16;
            this.uxOfficesListBox.Location = new System.Drawing.Point(12, 64);
            this.uxOfficesListBox.Name = "uxOfficesListBox";
            this.uxOfficesListBox.Size = new System.Drawing.Size(343, 84);
            this.uxOfficesListBox.TabIndex = 0;
            // 
            // uxAddOfficeBtn
            // 
            this.uxAddOfficeBtn.Location = new System.Drawing.Point(110, 164);
            this.uxAddOfficeBtn.Name = "uxAddOfficeBtn";
            this.uxAddOfficeBtn.Size = new System.Drawing.Size(120, 23);
            this.uxAddOfficeBtn.TabIndex = 1;
            this.uxAddOfficeBtn.Text = "Add Office";
            this.uxAddOfficeBtn.UseVisualStyleBackColor = true;
            // 
            // uxViewOfficeBtn
            // 
            this.uxViewOfficeBtn.Location = new System.Drawing.Point(110, 193);
            this.uxViewOfficeBtn.Name = "uxViewOfficeBtn";
            this.uxViewOfficeBtn.Size = new System.Drawing.Size(120, 23);
            this.uxViewOfficeBtn.TabIndex = 2;
            this.uxViewOfficeBtn.Text = "View Office";
            this.uxViewOfficeBtn.UseVisualStyleBackColor = true;
            // 
            // uxOfficesLabel
            // 
            this.uxOfficesLabel.AutoSize = true;
            this.uxOfficesLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.uxOfficesLabel.Location = new System.Drawing.Point(40, 9);
            this.uxOfficesLabel.Name = "uxOfficesLabel";
            this.uxOfficesLabel.Size = new System.Drawing.Size(288, 38);
            this.uxOfficesLabel.TabIndex = 3;
            this.uxOfficesLabel.Text = "Available Offices:";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlDark;
            this.ClientSize = new System.Drawing.Size(367, 250);
            this.Controls.Add(this.uxOfficesLabel);
            this.Controls.Add(this.uxViewOfficeBtn);
            this.Controls.Add(this.uxAddOfficeBtn);
            this.Controls.Add(this.uxOfficesListBox);
            this.Name = "Form1";
            this.Text = "Offices";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ListBox uxOfficesListBox;
        private System.Windows.Forms.Button uxAddOfficeBtn;
        private System.Windows.Forms.Button uxViewOfficeBtn;
        private System.Windows.Forms.Label uxOfficesLabel;
    }
}

