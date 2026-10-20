using System;
using System.Data.SqlClient;

public partial class mess2 : System.Web.UI.Page
{
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string connectionString = "Data Source=SHRAVANI\\SQLEXPRESS2025;Initial Catalog=Mess_connect;User Id=sa;Password=web@123;Integrated Security=True";

        string query = @"SELECT CustomId 
                         FROM mst_customer 
                         WHERE Email=@Email AND Password=@Password";

        using (SqlConnection connection = new SqlConnection(connectionString))
        using (SqlCommand cmd = new SqlCommand(query, connection))
        {
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

            try
            {
                connection.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["CustomId"] = dr["CustomId"].ToString();
                    Response.Redirect("mess6.aspx");
                }
                else
                {
                    Iblmsg.Text = "Invalid username and password";
                }

                dr.Close();
            }
            catch (Exception ex)
            {
                Iblmsg.Text = ex.Message;
            }
        }
    }
}