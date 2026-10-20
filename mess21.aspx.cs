using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mess21 : System.Web.UI.Page
{
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(
            @"Data Source=SHRAVANI\SQLEXPRESS2025;
        Initial Catalog=Mess_connect;
        Integrated Security=True");

        string query = "SELECT OwnerId, Email, Password FROM mst_owner WHERE Email=@Email AND Password=@Password";

        SqlCommand cmd = new SqlCommand(query, connection);

        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

        try
        {
            connection.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["OwnerId"] = dr["OwnerId"].ToString();
                Response.Redirect("ownerdash.aspx");
            }
            else
            {
                Iblmsg.Text = "Invalid user name and password";
            }

            dr.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            connection.Close();
        }
    }

}
