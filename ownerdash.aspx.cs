using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class ownaerdashbord : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection(
        @"Data Source=SHRAVANI\SQLEXPRESS2025;
        Initial Catalog=Mess_connect;
        Integrated Security=True");


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDashboard();
        }
    }


    private void LoadDashboard()
    {
        if (Session["OwnerId"] == null)
        {
            Response.Redirect("mess21.aspx");
            return;
        }


        int ownerId = Convert.ToInt32(Session["OwnerId"]);
        int messId = 0;


        // Mess Information

        SqlCommand cmd = new SqlCommand(
            @"SELECT MessId, MessName, Location, TotalSeats
              FROM mst_messInfo
              WHERE OwnerId=@OwnerId", connection);


        cmd.Parameters.AddWithValue("@OwnerId", ownerId);


        connection.Open();

        SqlDataReader dr = cmd.ExecuteReader();


        if (dr.Read())
        {
            messId = Convert.ToInt32(dr["MessId"]);

            lblMessName.Text = dr["MessName"].ToString();

            lblLocation.Text = dr["Location"].ToString();

            lblSeats.Text = dr["TotalSeats"].ToString();
        }


        dr.Close();
        connection.Close();



        // Total Bookings

        SqlCommand bookingCmd = new SqlCommand(
            @"SELECT COUNT(*)
              FROM mst_bookingInfo
              WHERE MessId=@MessId", connection);


        bookingCmd.Parameters.AddWithValue("@MessId", messId);


        connection.Open();

        int totalBooking = Convert.ToInt32(
            bookingCmd.ExecuteScalar()
        );

        connection.Close();


        lblBookings.Text = totalBooking.ToString();



        // Total Earnings

        SqlCommand earningCmd = new SqlCommand(
            @"SELECT ISNULL(SUM(Amount),0)
              FROM mst_bookingInfo
              WHERE MessId=@MessId", connection);


        earningCmd.Parameters.AddWithValue("@MessId", messId);


        connection.Open();

        decimal totalEarning = Convert.ToDecimal(
            earningCmd.ExecuteScalar()
        );

        connection.Close();


        lblEarnings.Text = "₹" + totalEarning.ToString("N0");



        // Today's Menu

        SqlCommand menuCmd = new SqlCommand(
            @"SELECT Breakfast, Lunch, Dinner
              FROM mst_menu
              WHERE MessId=@MessId
              AND Day=@Day", connection);


        menuCmd.Parameters.AddWithValue("@MessId", messId);

        menuCmd.Parameters.AddWithValue("@Day",
            DateTime.Now.DayOfWeek.ToString());


        connection.Open();

        SqlDataReader menuReader = menuCmd.ExecuteReader();


        if (menuReader.Read())
        {
            lblBreakfast.Text =
                menuReader["Breakfast"].ToString();

            lblLunch.Text =
                menuReader["Lunch"].ToString();

            lblDinner.Text =
                menuReader["Dinner"].ToString();
        }


        menuReader.Close();
        connection.Close();

    }



    protected void lnkAddMess_Click(object sender, EventArgs e)
    {
        Response.Redirect("messinfo.aspx");
    }


    protected void lnkMenu_Click(object sender, EventArgs e)
    {
        Response.Redirect("menu.aspx");
    }


    protected void lnkBooking_Click(object sender, EventArgs e)
    {
        Response.Redirect("conf_booking.aspx");
    }


    protected void lnkReview_Click(object sender, EventArgs e)
    {
        Response.Redirect("MessReview.aspx");
    }
}