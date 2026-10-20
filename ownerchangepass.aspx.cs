using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ownerchangepass : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        // Check if customer is logged in
        if (Session["OwnerId"] == null)
        {
            Response.Redirect("mess21.aspx");
            return;
        }

        string OwnerId = Session["OwnerId"].ToString();

        // Check New Password and Confirm Password
        if (txtNewPassword.Text != txtConfirmPassword.Text)
        {
            Response.Write("<script>alert('New Password and Confirm Password do not match.');</script>");
            return;
        }

        string connectionString = @"Data Source=SHRAVANI\SQLEXPRESS2025;
                                    Initial Catalog=Mess_connect;
                                    Integrated Security=True";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();

            // Verify current password
            SqlCommand cmd = new SqlCommand(
                "SELECT COUNT(*) FROM mst_owner WHERE OwnerId=@id AND password=@pass", con);

            cmd.Parameters.AddWithValue("@id", OwnerId);
            cmd.Parameters.AddWithValue("@pass", txtCurrentPassword.Text);

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            if (count > 0)
            {
                // Update password
                SqlCommand updateCmd = new SqlCommand(
                    "UPDATE mst_owner SET password=@newpass WHERE OwnerId=@id", con);

                updateCmd.Parameters.AddWithValue("@newpass", txtNewPassword.Text);
                updateCmd.Parameters.AddWithValue("@id", OwnerId);

                int rows = updateCmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    Response.Write("<script>alert('Password updated successfully.');</script>");

                    txtCurrentPassword.Text = "";
                    txtNewPassword.Text = "";
                    txtConfirmPassword.Text = "";
                }
                else
                {
                    Response.Write("<script>alert('Password update failed.');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Current Password is incorrect.');</script>");
            }
        }
    }
}