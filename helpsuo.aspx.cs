using System;
using System.Data.SqlClient;

public partial class helpsuo : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=SHRAVANI\SQLEXPRESS2025;
Initial Catalog=Mess_connect;
Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Session["customerId"] == null)
        {
            Response.Redirect("mess2.aspx");
            return;
        }

        if (txtSubject.Text.Trim() == "" || txtMessage.Text.Trim() == "")
        {
            Response.Write("<script>alert('Please enter Subject and Message.');</script>");
            return;
        }

        string customerId = Session["customerId"].ToString();

        SqlCommand cmd = new SqlCommand(
            "INSERT INTO mst_support_help(customId,subject,message) VALUES(@customId,@subject,@message)", con);

        cmd.Parameters.AddWithValue("@customId", customerId);
        cmd.Parameters.AddWithValue("@subject", txtSubject.Text.Trim());
        cmd.Parameters.AddWithValue("@message", txtMessage.Text.Trim());

        con.Open();

        int rows = cmd.ExecuteNonQuery();

        con.Close();

        if (rows > 0)
        {
            txtSubject.Text = "";
            txtMessage.Text = "";

            Response.Write("<script>alert('Your message has been submitted successfully.');</script>");
        }
        else
        {
            Response.Write("<script>alert('Failed to submit your message.');</script>");
        }
    }
}