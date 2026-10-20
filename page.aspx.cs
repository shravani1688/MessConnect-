using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class page : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        "Data Source=SHRAVANI\\SQLEXPRESS2025;" +
        "Initial Catalog=Mess_connect;" +
        "User Id=sa;" +
        "Password=web@123;");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["CustomId"] == null)
            {
                Response.Redirect("mess2.aspx");
                return;
            }

            LoadBookings();
        }
    }

    private void LoadBookings()
    {
        SqlDataAdapter da = new SqlDataAdapter(@"
SELECT
    b.BookingId,
    b.MessId,
    b.MealType,
    b.Date,
    b.Amount,
    b.Status,
    m.MessName,
    m.Location
FROM mst_BookingInfo b
INNER JOIN mst_MessInfo m
ON b.MessId=m.MessId
WHERE b.CustomId=@CustomId
AND b.Status<>'Cancelled'
ORDER BY b.BookingId DESC", con);

        da.SelectCommand.Parameters.AddWithValue("@CustomId", Session["CustomId"]);

        DataTable dt = new DataTable();

        da.Fill(dt);

        rptBooking.DataSource = dt;
        rptBooking.DataBind();
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;

        SqlCommand cmd = new SqlCommand(@"
SELECT MessId
FROM mst_BookingInfo
WHERE BookingId=@BookingId
AND CustomId=@CustomId", con);

        cmd.Parameters.AddWithValue("@BookingId", btn.CommandArgument);
        cmd.Parameters.AddWithValue("@CustomId", Session["CustomId"]);

        con.Open();

        object messId = cmd.ExecuteScalar();

        con.Close();

        if (messId != null)
        {
            Session["MessId"] = messId.ToString();
            Response.Redirect("cbviewDetails.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "msg",
                "alert('Booking Details Not Found');",
                true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;

        SqlCommand cmd = new SqlCommand(@"
UPDATE mst_BookingInfo
SET Status='Cancelled'
WHERE BookingId=@BookingId
AND CustomId=@CustomId", con);

        cmd.Parameters.AddWithValue("@BookingId", btn.CommandArgument);
        cmd.Parameters.AddWithValue("@CustomId", Session["CustomId"]);

        con.Open();

        cmd.ExecuteNonQuery();

        con.Close();

        LoadBookings();

        ClientScript.RegisterStartupScript(
            this.GetType(),
            "msg",
            "alert('Booking Cancelled Successfully');",
            true);
    }
}