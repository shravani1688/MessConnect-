using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class editownerpro4: System.Web.UI.Page
{
  
    SqlConnection con = new SqlConnection(@"Data Source=SHRAVANI\SQLEXPRESS2025;
Initial Catalog=Mess_connect;
Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        // Check Login
        if (Session["OwnerId"] == null)
        {
            Response.Redirect("mess21.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadProfile();
        }
    }

    private void LoadProfile()
    {
        string OwnerId = Session["OwnerId"].ToString();

        SqlCommand cmd = new SqlCommand(
            "SELECT fullName, Email, phoneNo FROM mst_owner WHERE ownerId=@OwnerId", con);

        cmd.Parameters.AddWithValue("@OwnerId", OwnerId);

        con.Open();

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            txtName.Text = dr["fullName"].ToString();
            txtEmail.Text = dr["Email"].ToString();
            txtMobile.Text = dr["phoneNo"].ToString();
        }

        dr.Close();
        con.Close();
    }

    protected void btnsave_click(object sender, EventArgs e)
    {
        string OwnerId = Session["OwnerId"].ToString();

        SqlCommand cmd = new SqlCommand(
            "UPDATE mst_owner SET fullName=@fullName, Email=@Email, phoneNo=@phoneNo WHERE OwnerId=@OwnerId", con);

        cmd.Parameters.AddWithValue("@fullName", txtName.Text.Trim());
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
        cmd.Parameters.AddWithValue("@phoneNo", txtMobile.Text.Trim());
        cmd.Parameters.AddWithValue("@OwnerId", OwnerId);

        con.Open();

        int rows = cmd.ExecuteNonQuery();

        con.Close();

        if (rows > 0)
        {
            Response.Write("<script>alert('Profile Updated Successfully');</script>");
        }
        else
        {
            Response.Write("<script>alert('Profile Update Failed');</script>");
        }
    }
}
