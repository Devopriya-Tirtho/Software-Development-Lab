using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Show : Form
    {
        public Show()
        {
            InitializeComponent();
        }
        public Show(String id , String name , String gender , double result)
        {
            InitializeComponent();
            idTextBox.Text = id;
            deptTextBox.Text = name;
            hobbyTextBox.Text = gender;
            textBox1.Text = Convert.ToString(result);
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
