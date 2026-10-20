using System;
using System.Data;
using System.Data.SqlClient;

public partial class cus_cunf_det : System.Web.UI.Page
{
    string cs = @"Data Source=SHRAVANI\SQLEXPRESS2025;
                  Initial Catalog=Mess_connect;
                  Integrated Security=True";

    SqlConnection con;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["BookingId"] != null)
            {
                int bookingId = Convert.ToInt32(Request.QueryString["BookingId"]);

                LoadBookingDetails(bookingId);

                int messId = GetMessId(bookingId);

                LoadTodayMenu(messId);
                LoadWeeklyMenu(messId);
            }
            else
            {
                Response.Write("<script>alert('Booking Id Not Found');</script>");
            }
        }
    }


    //==========================
    // Get MessId from Booking
    //==========================

    int GetMessId(int bookingId)
    {
        int messId = 0;

        con = new SqlConnection(cs);

        SqlCommand cmd = new SqlCommand(
            "SELECT MessId FROM mst_BookingInfo WHERE BookingId=@BookingId",
            con);

        cmd.Parameters.AddWithValue("@BookingId", bookingId);

        con.Open();

        object obj = cmd.ExecuteScalar();

        if (obj != null)
        {
            messId = Convert.ToInt32(obj);
        }

        con.Close();

        return messId;
    }


    //==========================
    // Load Booking Details
    //==========================

    void LoadBookingDetails(int bookingId)
    {
        con = new SqlConnection(cs);

        SqlCommand cmd = new SqlCommand(@"
        SELECT
            b.BookingId,
            b.Date,
            b.MealType,
            b.Amount,
            b.Status,
            m.MessName,
            m.Location,
            m.ContactNo,
            o.fullName
        FROM mst_BookingInfo b
        INNER JOIN mst_MessInfo m
        ON b.MessId=m.MessId
        INNER JOIN mst_owner o
        ON m.OwnerId=o.OwnerId
        WHERE b.BookingId=@BookingId", con);


        cmd.Parameters.AddWithValue("@BookingId", bookingId);

        con.Open();

        SqlDataReader dr = cmd.ExecuteReader();


        if (dr.Read())
        {
            lblBookingId.Text = dr["BookingId"].ToString();

            lblMessName.Text = dr["MessName"].ToString();

            lblOwnerName.Text = dr["fullName"].ToString();

            lblLocation.Text = dr["Location"].ToString();

            lblContact.Text = dr["ContactNo"].ToString();


            lblBookingDate.Text =
                Convert.ToDateTime(dr["Date"])
                .ToString("dd-MM-yyyy");


            lblMealType.Text = dr["MealType"].ToString();

            lblAmount.Text =
                "₹ " + dr["Amount"].ToString();

            lblStatus.Text =
                dr["Status"].ToString();
        }


        dr.Close();
        con.Close();
    }
    //==========================
    // Today's Menu
    //==========================

    private void LoadTodayMenu(int MessId)
    {
        con = new SqlConnection(cs);

        string Day = DateTime.Now.DayOfWeek.ToString();


        string qry = @"SELECT BreakFast,
                              Lunch,
                              Dinner
                       FROM mst_menu
                       WHERE MessId=@MessId
                       AND Day=@Day
                       AND isActive=1";


        SqlCommand cmd = new SqlCommand(qry, con);

        cmd.Parameters.AddWithValue("@MessId", MessId);
        cmd.Parameters.AddWithValue("@Day", Day);


        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();

        da.Fill(dt);


        if (dt.Rows.Count > 0)
        {
            lblBreakfast.Text =
                dt.Rows[0]["BreakFast"].ToString();

            lblLunch.Text =
                dt.Rows[0]["Lunch"].ToString();

            lblDinner.Text =
                dt.Rows[0]["Dinner"].ToString();
        }
        else
        {
            lblBreakfast.Text = "Menu Not Available";
            lblLunch.Text = "Menu Not Available";
            lblDinner.Text = "Menu Not Available";
        }
    }



    //==========================
    // Weekly Menu
    //==========================

    private void LoadWeeklyMenu(int MessId)
    {
        con = new SqlConnection(cs);


        string qry = @"SELECT Day,
                              BreakFast,
                              Lunch,
                              Dinner
                       FROM mst_menu
                       WHERE MessId=@MessId
                       AND isActive=1
                       ORDER BY
                       CASE Day
                            WHEN 'Monday' THEN 1
                            WHEN 'Tuesday' THEN 2
                            WHEN 'Wednesday' THEN 3
                            WHEN 'Thursday' THEN 4
                            WHEN 'Friday' THEN 5
                            WHEN 'Saturday' THEN 6
                            WHEN 'Sunday' THEN 7
                       END";


        SqlCommand cmd = new SqlCommand(qry, con);


        cmd.Parameters.AddWithValue("@MessId", MessId);


        SqlDataAdapter da = new SqlDataAdapter(cmd);


        DataTable dt = new DataTable();


        da.Fill(dt);


        rptWeeklyMenu.DataSource = dt;

        rptWeeklyMenu.DataBind();
    }    //==========================
    // Submit Review
    //==========================

    protected void btnSubmitReview_Click(object sender, EventArgs e)
    {
        if (Session["CustomId"] == null)
        {
            Response.Write("<script>alert('Customer Not Found');</script>");
            return;
        }


        if (txtReview.Text.Trim() == "")
        {
            Response.Write("<script>alert('Please Enter Review');</script>");
            return;
        }


        int CustId = Convert.ToInt32(Session["CustomId"]);


        // Booking मधून MessId घेणे
        int MessId = 0;


        con = new SqlConnection(cs);
        int BookingId = Convert.ToInt32(Request.QueryString["BookingId"]);

        SqlCommand getMess = new SqlCommand(
            @"SELECT MessId 
      FROM mst_BookingInfo
      WHERE BookingId=@BookingId
      AND CustomId=@CustId",
            con);

        getMess.Parameters.AddWithValue("@BookingId", BookingId);
   

        getMess.Parameters.AddWithValue("@CustId", CustId);


        con.Open();


        object obj = getMess.ExecuteScalar();


        if (obj != null)
        {
            MessId = Convert.ToInt32(obj);
        }


        con.Close();



        if (MessId == 0)
        {
            Response.Write("<script>alert('Mess Not Found');</script>");
            return;
        }



        string ins = @"INSERT INTO mst_review
                       (CustomId, MessId, Rating, ReviewText, isActive)
                       VALUES
                       (@CustId,@MessId,@Rating,@ReviewText,1)";



        con = new SqlConnection(cs);


        SqlCommand cmd = new SqlCommand(ins, con);



        cmd.Parameters.AddWithValue("@CustId", CustId);

        cmd.Parameters.AddWithValue("@MessId", MessId);

        cmd.Parameters.AddWithValue("@Rating", 5);

        cmd.Parameters.AddWithValue("@ReviewText",
                                    txtReview.Text.Trim());



        con.Open();

        cmd.ExecuteNonQuery();

        con.Close();



        txtReview.Text = "";

        Response.Write("<script>alert('Review Submitted Successfully');</script>");
    }

}