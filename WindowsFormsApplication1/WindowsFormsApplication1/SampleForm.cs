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
    public partial class SampleForm : Form
    {
        string id, name,gender, hobby = "";

        double sub1, sub2, sub3, sub4;
        double cr1, cr2, cr3, cr4;
        double result = 0;
        public SampleForm()
        {
            InitializeComponent();
        }

        private void showButton_Click(object sender, EventArgs e)
        {
            if(studentIdTextBox.Text == "" || studentNameTextBox.Text == "")
                MessageBox.Show("Name and ID not filled properly");

            id = studentIdTextBox.Text;
            name = studentNameTextBox.Text;

            if(!maleCheckBox.Checked && !femaleCheckBox.Checked)
                MessageBox.Show("Gender not filled properly");

            if (maleCheckBox.Checked)
                gender = "Male";
            if (femaleCheckBox.Checked)
                gender = "Female";

            
            if (sub1txt.Text == "" || sub2txt.Text == "" || sub3txt.Text == "" || sub4txt.Text == "")
            {
                MessageBox.Show("Subjects not filled properly");
            }
            if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "" || textBox4.Text == "")
            {
                MessageBox.Show("Credits not filled properly");
            }

            try
            {
                sub1 = Convert.ToDouble(sub1txt.Text);
                sub2 = Convert.ToDouble(sub2txt.Text);
                sub3 = Convert.ToDouble(sub3txt.Text);
                sub4 = Convert.ToDouble(sub4txt.Text);

                cr1 = Convert.ToDouble(textBox1.Text);
                cr2 = Convert.ToDouble(textBox2.Text);
                cr3 = Convert.ToDouble(textBox3.Text);
                cr4 = Convert.ToDouble(textBox4.Text);
            }
            catch (Exception ob)
            {
                //MessageBox.Show("Exception");
            }

            if (sub1 > 100 || sub1 < 0 || sub2 > 100 || sub2 < 0 || sub3 > 100 || sub3 < 0 || sub4 > 100 || sub4 < 0)
            {
                MessageBox.Show("Limit in Subjects");
            }

            if (cr1 > 3 || cr1 < 0.75 || cr2 > 3 || cr2 < 0.75 || cr3 > 3 || cr3 < 0.75 || cr4 > 3 || cr4 < 0.75)
            {
                MessageBox.Show("Credit in Subjects");
            }
            else
            {
                sub1 = changeGrade(sub1);
                sub2 = changeGrade(sub2);
                sub3 = changeGrade(sub3);
                sub4 = changeGrade(sub4);

                result = (sub1 * cr1 + sub2 * cr2 + sub3 * cr3 + sub4 * cr4) / (cr1 + cr2 + cr3 + cr4);

                Show ob = new Show(id, name, gender, result);
                ob.Show();
                this.Hide();
            }
        }

        public double changeGrade(double sub)
        {
            double grade = 0;

            if (sub >= 80)
                grade = 4;
            else if (sub >= 60 && sub < 80)
                grade = 3.5;
            else if (sub >= 40 && sub < 60)
                grade = 3;
            else
                grade = 0;


            return grade;
        }
        
    }
}
