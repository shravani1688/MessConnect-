using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class cus_my_booking : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        @"Data Source=SHRAVANI\SQLEXPRESS2025;
        Initial Catalog=Mess_connect;
        Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CustomId"] == null)
        {
            Response.Redirect("mess2.aspx");
        }

        if (!IsPostBack)
        {
            LoadBookings();
        }
    }

    void LoadBookings()
    {
        SqlCommand cmd = new SqlCommand(@"
        SELECT
            b.BookingId,
            b.Date,
            b.MealType,
            b.Amount,
            b.Status,
            m.MessName,
            m.Location
        FROM mst_BookingInfo b
        INNER JOIN mst_MessInfo m
            ON b.MessId = m.MessId
        WHERE b.CustomId=@CustomId
        ANd b.Status='confirmed'
        ORDER BY b.BookingId DESC", con);

        cmd.Parameters.AddWithValue("@CustomId", Session["CustomId"]);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        rptBooking.DataSource = dt;
        rptBooking.DataBind();
    }

    protected void btnView_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("cus_cunf_det.aspx?BookingId=" + e.CommandArgument.ToString());
    }
}