using System;
using System.Data.SqlClient;

public partial class cbviewDetails : System.Web.UI.Page
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
            if (Session["MessId"] == null)
            {
                Response.Redirect("page.aspx");
                return;
            }

            LoadMessDetails();
        }
    }

    private void LoadMessDetails()
    {
        SqlCommand cmd = new SqlCommand(@"
            SELECT
                m.MessName,
                o.FullName,
                m.Location,
                m.Description,
                m.ContactNo,
                m.Veg,
                m.NonVeg,
                m.WiFi,
                m.Parking,
                m.ACDining,
                m.PricePerMonth,
                m.TotalSeats,
                m.AvailableSeats,
                m.Status
            FROM mst_MessInfo m
            INNER JOIN mst_owner o
                ON m.OwnerId = o.OwnerId
            WHERE m.MessId = @MessId", con);

        cmd.Parameters.AddWithValue("@MessId", Session["MessId"]);

        try
        {
            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblMessName.Text = dr["MessName"].ToString();
                lblOwnerName.Text = dr["FullName"].ToString();
                lblLocation.Text = dr["Location"].ToString();
                lblDescription.Text = dr["Description"].ToString();
                lblContact.Text = dr["ContactNo"].ToString();

                lblVeg.Text = dr["Veg"].ToString();
                lblNonVeg.Text = dr["NonVeg"].ToString();
                lblWifi.Text = dr["WiFi"].ToString();
                lblParking.Text = dr["Parking"].ToString();
                lblACDining.Text = dr["ACDining"].ToString();

                lblPrice.Text = dr["PricePerMonth"].ToString();
                lblTotalSeats.Text = dr["TotalSeats"].ToString();
                lblAvailableSeats.Text = dr["AvailableSeats"].ToString();

                lblStatus.Text = dr["Status"].ToString();
            }
            else
            {
                Response.Redirect("page.aspx");
            }

            dr.Close();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error: " +
                ex.Message.Replace("'", "\\'") +
                "');</script>");
        }
        finally
        {
            if (con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
            }
        }
    }
}