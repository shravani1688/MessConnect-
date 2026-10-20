using System;
using System.Data.SqlClient;

public partial class menu : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        "Data Source=SHRAVANI\\SQLEXPRESS2025;" +
        "Initial Catalog=Mess_connect;" +
        "Integrated Security=True;");

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Session["OwnerId"] == null)
        {
            Response.Write("<script>alert('Please Login Again');</script>");
            return;
        }

        con.Open();

        SqlCommand cmd1 = new SqlCommand(
            "SELECT MessId FROM mst_MessInfo WHERE OwnerId=@OwnerId", con);

        cmd1.Parameters.AddWithValue("@OwnerId", Session["OwnerId"]);

        object result = cmd1.ExecuteScalar();

        if (result == null)
        {
            Response.Write("<script>alert('Please Add Mess First');</script>");
            con.Close();
            return;
        }

        int messId = Convert.ToInt32(result);

        SqlCommand cmd = new SqlCommand(
        "INSERT INTO mst_menu(MessId,Breakfast,Lunch,Dinner,Day,isActive) VALUES(@MessId,@Breakfast,@Lunch,@Dinner,@Day,@isActive)", con);

        cmd.Parameters.AddWithValue("@MessId", messId);
        cmd.Parameters.AddWithValue("@Breakfast", txtBreakfast.Text);
        cmd.Parameters.AddWithValue("@Lunch", txtLunch.Text);
        cmd.Parameters.AddWithValue("@Dinner", txtDinner.Text);
        cmd.Parameters.AddWithValue("@Day", ddlDay.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@isActive", true);

        cmd.ExecuteNonQuery();

        con.Close();

        Response.Write("<script>alert('Menu Saved Successfully');</script>");

        txtBreakfast.Text = "";
        txtLunch.Text = "";
        txtDinner.Text = "";
        ddlDay.SelectedIndex = 0;
    }
}