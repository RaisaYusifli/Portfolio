using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdminPanel
{
    public partial class Skills : System.Web.UI.Page
    {

        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString);


        void LoadData()
        {
            MySqlCommand cmd = new MySqlCommand("Select * from skills", connection);
            MySqlDataAdapter d = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            d.Fill(dt);
            SkillsView.DataSource = dt;
            SkillsView.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["IsLoggedIn"] == null || (bool)Session["IsLoggedIn"] == false)
            {
                Response.Redirect("Login.aspx");
            }


            if (!IsPostBack)
                LoadData();
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            string query = "Update skills set name=@name, value=@value where id = @id";

           

            using (MySqlCommand cmd = new MySqlCommand(query, connection)) {

                connection.Open();

                cmd.Parameters.AddWithValue("@id", ID.Text.Trim());
                cmd.Parameters.AddWithValue("@name", Name.Text.Trim());
                cmd.Parameters.AddWithValue("@value", Percentage.Text.Trim());

                cmd.ExecuteNonQuery();

            }
                


            LoadData();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            string query = "Delete from skills where id = @id";

            

            using (MySqlCommand cmd = new MySqlCommand(query, connection))
            {
                connection.Open();

                cmd.Parameters.AddWithValue("@id", ID.Text.Trim());
                cmd.ExecuteNonQuery();
            }

            LoadData();
        }

        protected void ButtonGet_Click(object sender, EventArgs e)
        {
            string query = "Select * from skills where id=@id";

            connection.Open();
            MySqlCommand cmd = new MySqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@id", ID.Text);

            MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                Name.Text = rdr.GetValue(1).ToString();
                Percentage.Text = rdr.GetValue(2).ToString();
            }
            connection.Close();
        }

        protected void ButtonInsert_Click(object sender, EventArgs e)
        {
            string query = "Insert into skills (name, value) values( @name, @value)";

   

            using (MySqlCommand cmd = new MySqlCommand(query, connection))
            {
                connection.Open();

                cmd.Parameters.AddWithValue("@name", Name.Text.Trim());
                cmd.Parameters.AddWithValue("@value", Percentage.Text.Trim());
                cmd.ExecuteNonQuery();
            }





            LoadData();
        }
    }
}