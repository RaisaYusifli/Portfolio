using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminPanel
{
    public partial class Login : System.Web.UI.Page
    {


        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            string query = "select username, password from portfolio;";

            using (MySqlCommand cmd = new MySqlCommand(query, connection))
            {
                try
                {
                    connection.Open();
                    MySqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string dbUsername = reader["Username"].ToString();
                        string dbPassword = reader["Password"].ToString();

                        if (username == dbUsername && password == dbPassword)
                        {
                            Session["IsLoggedIn"] = true;
                            Response.Redirect("Portfolio.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Invalid username or password.";
                        }
                    }
                    else
                    {
                        lblMessage.Text = "Invalid username or password.";
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
            
                    lblMessage.Text = "An error occurred: " + ex.Message;
                }
            }





        }
    }
}