using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ownerhs : System.Web.UI.Page
{
    
    SqlConnection con = new SqlConnection("Data Source=SHRAVANI\\SQLEXPRESS2025;" +
    "Initial Catalog=Mess_connect;" +
    "User Id=sa;" +
    "Password=web@123;");


    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (Session["OwnerId"] == null)
        {
            Response.Redirect("mess21.aspx");
            return;
        }


        if (txtSubject.Text.Trim() == "" || txtMessage.Text.Trim() == "")
        {
            Response.Write("<script>alert('Please enter Subject and Message.');</script>");
            return;
        }


        string ownerId = Session["OwnerId"].ToString();


        SqlCommand cmd = new SqlCommand(
        @"INSERT INTO mst_support_help
        (OwnerId, subject, message)
        VALUES
        (@OwnerId,@subject,@message)", con);



        cmd.Parameters.AddWithValue("@OwnerId", ownerId);

        cmd.Parameters.AddWithValue("@subject", txtSubject.Text.Trim());

        cmd.Parameters.AddWithValue("@message", txtMessage.Text.Trim());



        con.Open();

        int rows = cmd.ExecuteNonQuery();

        con.Close();



        if (rows > 0)
        {

            txtSubject.Text = "";

            txtMessage.Text = "";


            Response.Write(
            "<script>alert('Your request has been submitted successfully.');</script>");

        }
        else
        {

            Response.Write(
            "<script>alert('Failed to submit your request.');</script>");

        }

    }
}
