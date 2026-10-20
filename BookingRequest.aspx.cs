using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class BookingRequest : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        "Data Source=SHRAVANI\\SQLEXPRESS2025;" +
        "Initial Catalog=Mess_connect;" +
        "Integrated Security=True;");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["OwnerId"] == null)
            {
                Response.Redirect("mess21.aspx");
                return;
            }

            LoadBooking();
        }
    }

    private void LoadBooking()
    {
        string query = @"
        SELECT
            b.BookingId,
            c.FullName,
            c.PhoneNo,
            m.MessName,
            b.MealType,
            b.Date,
            b.Amount,
            b.Status
        FROM mst_BookingInfo b
        INNER JOIN mst_customer c
            ON b.CustomId = c.CustomId
        INNER JOIN mst_MessInfo m
            ON b.MessId = m.MessId
        WHERE m.OwnerId=@OwnerId
        AND b.Status='Pending'";

        SqlDataAdapter da = new SqlDataAdapter(query, con);
        da.SelectCommand.Parameters.AddWithValue("@OwnerId", Session["OwnerId"]);

        DataTable dt = new DataTable();
        da.Fill(dt);

        rptBooking.DataSource = dt;
        rptBooking.DataBind();
    }

    protected void Booking_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "Accept")
        {
            SqlCommand cmd = new SqlCommand(
                "UPDATE mst_BookingInfo SET Status='Confirmed' WHERE BookingId=@id", con);

            cmd.Parameters.AddWithValue("@id", e.CommandArgument);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadBooking();
        }

        else if (e.CommandName == "Reject")
        {
            SqlCommand cmd = new SqlCommand(
                "UPDATE mst_BookingInfo SET Status='Cancelled' WHERE BookingId=@id", con);

            cmd.Parameters.AddWithValue("@id", e.CommandArgument);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadBooking();
        }
    }
}