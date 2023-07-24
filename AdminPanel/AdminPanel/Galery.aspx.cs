using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace AdminPanel
{
    public partial class Galery : System.Web.UI.Page
    {
        MySqlConnection connection = new MySqlConnection(ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString);

        void LoadData()
        {
            MySqlCommand cmd = new MySqlCommand("Select * from images", connection);
            MySqlDataAdapter d = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            d.Fill(dt);
            PathGridView.DataSource = dt;
            PathGridView.DataBind();
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

        protected void ButtonUpload_Click(object sender, EventArgs e)
        {
            if (GaleryFileUpload.HasFile)
            {

                string fileExtension = Path.GetExtension(GaleryFileUpload.FileName);

                string desc = DescriptionTextBox.Text.Trim();

                string[] allowedExtensions = { ".png", ".jpg", ".jpeg"};
                if (allowedExtensions.Contains(fileExtension.ToLower()))
                {

                    string uploadPhysicalPath = Path.GetFullPath(Path.Combine(System.AppContext.BaseDirectory, @"..\..\images\galery"));


                    GaleryFileUpload.SaveAs(Path.Combine(uploadPhysicalPath, GaleryFileUpload.FileName));

                    using (connection)
                    {
                        connection.Open();

                        string insertQuery = "INSERT INTO images (path, description) VALUES (@path, @desc)";
                        string file_path = @"./images/galery/" + GaleryFileUpload.FileName;
                        using (MySqlCommand command = new MySqlCommand(insertQuery, connection))
                        {
                            command.Parameters.AddWithValue("@path", file_path);
                            command.Parameters.AddWithValue("@desc", desc);
                            command.ExecuteNonQuery();
                        }
                    }
                }
                else
                {
                    Response.Redirect(Request.RawUrl);
                }
            }

            LoadData();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            string deletePath = DescriptionTextBox.Text.Trim();
            string deletePathCombined = Path.GetFullPath(Path.Combine(System.AppContext.BaseDirectory, @"..\..\", deletePath));
            System.Diagnostics.Debug.WriteLine(deletePathCombined);

     
            if (!string.IsNullOrEmpty(deletePathCombined) && File.Exists(deletePathCombined))
            {
                File.Delete(deletePathCombined);
            }


            using (connection)
            {
                connection.Open();

                string deleteQuery = "DELETE FROM images WHERE path = @path";


                using (MySqlCommand command = new MySqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@path", deletePath);
                    command.ExecuteNonQuery();
                }
            }
            Console.WriteLine(deletePathCombined);
            LoadData();
        }

        protected void ButtonShowImage_Click(object sender, EventArgs e)
        {
            string path = DescriptionTextBox.Text.Trim();
            string imagePath = Path.GetFullPath(Path.Combine(System.AppContext.BaseDirectory, @"..\..\", path));


            if (!string.IsNullOrEmpty(imagePath) && File.Exists(imagePath))
            {
                byte[] imageBytes = File.ReadAllBytes(imagePath);
                string base64String = Convert.ToBase64String(imageBytes);
                Pic.ImageUrl = "data:image/jpeg;base64," + base64String;
                Pic.Visible = true;
            }
            else
            {
                Pic.Visible = false;
            }
        }
    }
}