using System;
using System.Data.SqlClient;


public partial class Booking : System.Web.UI.Page
{


    SqlConnection connection = new SqlConnection(
    "Data Source=SHRAVANI\\SQLEXPRESS2025;" +
    "Initial Catalog=Mess_connect;" +
    "User Id=sa;" +
    "Password=web@123;");



    protected void btnConfirm_Click(object sender, EventArgs e)
    {

        if (Session["CustomId"] == null)
        {
            Response.Write("<script>alert('Please login first');</script>");
            return;
        }


        int customId = Convert.ToInt32(Session["CustomId"]);

        int messId = Convert.ToInt32(Request.QueryString["MessId"]);



        string query = @"
    INSERT INTO mst_bookingInfo
    (CustomId, MessId, MealType, Date, Amount, Status)

    VALUES
    (@CustomerId,@MessId,@MealType,@Date,@Amount,@Status)";


        SqlCommand cmd = new SqlCommand(query, connection);


        cmd.Parameters.AddWithValue("@CustomerId", customId);

        cmd.Parameters.AddWithValue("@MessId", messId);

        cmd.Parameters.AddWithValue("@MealType", ddlMeal.Text);

        cmd.Parameters.AddWithValue("@Date", DateTime.Now);

        cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);

        cmd.Parameters.AddWithValue("@Status", "Pending");


        connection.Open();

        cmd.ExecuteNonQuery();

        connection.Close();


        Response.Write("<script>alert('Booking Successful');window.location='mess6.aspx';</script>");

    }

}