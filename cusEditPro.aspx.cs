using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class cusEditPro : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=SHRAVANI\SQLEXPRESS2025;
Initial Catalog=Mess_connect;
Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        // Check Login
        if (Session["customId"] == null)
        {
            Response.Redirect("mess2.aspx");
            return;
        }

        if (!IsPostBack)
        {
            LoadProfile();
        }
    }

    private void LoadProfile()
    {
        string customerId = Session["customId"].ToString();

        SqlCommand cmd = new SqlCommand(
            "SELECT fullName, Email, phoneNo FROM mst_customer WHERE customId=@customId", con);

        cmd.Parameters.AddWithValue("@customId", customerId);

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
        string customerId = Session["customId"].ToString();

        SqlCommand cmd = new SqlCommand(
            "UPDATE mst_customer SET fullName=@fullName, Email=@Email, phoneNo=@phoneNo WHERE customId=@customId", con);

        cmd.Parameters.AddWithValue("@fullName", txtName.Text.Trim());
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
        cmd.Parameters.AddWithValue("@phoneNo", txtMobile.Text.Trim());
        cmd.Parameters.AddWithValue("@customId", customerId);

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