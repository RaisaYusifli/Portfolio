using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.X500;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminPanel
{
    public partial class Portfolio : System.Web.UI.Page
    {


        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString);


        void GetData()
        {
            using (connection)
            {
                connection.Open();

                string insertQuery = "Select * from portfolio";
                using (MySqlCommand command = new MySqlCommand(insertQuery, connection))
                {
                    MySqlDataReader rdr = command.ExecuteReader();


                    while (rdr.Read())
                    {

                        Name.Text = rdr.GetValue(rdr.GetOrdinal("name")).ToString();
                        Surname.Text = rdr.GetValue(rdr.GetOrdinal("surname")).ToString();
                        Username.Text = rdr.GetValue(rdr.GetOrdinal("username")).ToString();
                        Password.Text = rdr.GetValue(rdr.GetOrdinal("password")).ToString();
                        Job.Text = rdr.GetValue(rdr.GetOrdinal("job")).ToString();
                        Jobdesc.Text = rdr.GetValue(rdr.GetOrdinal("job_desc")).ToString();
                        About.Text = rdr.GetValue(rdr.GetOrdinal("about")).ToString();
                        City.Text = rdr.GetValue(rdr.GetOrdinal("city")).ToString();
                        Phone.Text = rdr.GetValue(rdr.GetOrdinal("phone")).ToString();
                        Email.Text = rdr.GetValue(rdr.GetOrdinal("email")).ToString();
                    }

                }

            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["IsLoggedIn"] == null || (bool)Session["IsLoggedIn"] == false)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
                GetData();


        }

        protected void ButtonRefreshData_Click(object sender, EventArgs e)
        {
            GetData();
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {

            using (connection)
            {
                connection.Open();

                string insertQuery = "UPDATE portfolio SET " +
                    "name = @name, surname = @surname, username = @username, password=@password, " +
                    "job = @job, job_desc = @job_desc, email=@email, about = @about, city = @city, phone = @phone " +
                    "WHERE id = 1;";
                using (MySqlCommand command = new MySqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@name", Name.Text.Trim());
                    command.Parameters.AddWithValue("@surname", Surname.Text.Trim());
                    command.Parameters.AddWithValue("@username", Username.Text.Trim());
                    command.Parameters.AddWithValue("@password", Password.Text.Trim());
                    command.Parameters.AddWithValue("@job", Job.Text.Trim());
                    command.Parameters.AddWithValue("@job_desc", Jobdesc.Text.Trim());
                    command.Parameters.AddWithValue("@email", Email.Text.Trim());
                    command.Parameters.AddWithValue("@about", About.Text.Trim());
                    command.Parameters.AddWithValue("@city", City.Text.Trim());
                    command.Parameters.AddWithValue("@phone", Phone.Text.Trim());


                    command.ExecuteNonQuery();

                }

            }


        }
    }
}