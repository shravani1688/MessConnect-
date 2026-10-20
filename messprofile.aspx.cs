using System;
using System.Data.SqlClient;

public partial class messprofile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadProfile();
        }
    }


    private void LoadProfile()
    {
        if (Session["CustomId"] == null)
        {
            Response.Redirect("mess2.aspx");
            return;
        }


        string connectionString = @"Data Source=SHRAVANI\SQLEXPRESS2025;
Initial Catalog=Mess_connect;
Integrated Security=True";


        using (SqlConnection con = new SqlConnection(connectionString))
        {
            string query = "SELECT FullName, PhoneNo FROM mst_customer WHERE CustomId=@CustomId";


            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@CustomId", Session["CustomId"].ToString());


            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();


            if (dr.Read())
            {
                lblName.Text = dr["FullName"].ToString();
                lblMobile.Text = dr["PhoneNo"].ToString();
            }
            else
            {
                lblName.Text = "Profile not found";
                lblMobile.Text = "";
            }


            dr.Close();
        }
    }


    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("firstpage.aspx");
    }
}