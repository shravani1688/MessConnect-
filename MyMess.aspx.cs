using System;
using System.Data.SqlClient;

public partial class MyMess : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        @"Data Source=SHRAVANI\SQLEXPRESS2025;
          Initial Catalog=Mess_connect;
          Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMess();
        }
    }

    void LoadMess()
    {
        if (Session["OwnerId"] == null)
            return;

        SqlCommand cmd = new SqlCommand("SELECT * FROM mst_MessInfo WHERE OwnerId=@OwnerId", con);
        cmd.Parameters.AddWithValue("@OwnerId", Session["OwnerId"]);

        con.Open();

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            lblMessName.Text = dr["MessName"].ToString();
            lblLocation.Text = dr["Location"].ToString();
            lblDescription.Text = dr["Description"].ToString();
            lblContact.Text = dr["ContactNo"].ToString();
            lblPrice.Text = dr["PricePerMonth"].ToString();
            lblTotalSeats.Text = dr["TotalSeats"].ToString();
            lblAvailableSeats.Text = dr["AvailableSeats"].ToString();
            lblStatus.Text = dr["Status"].ToString();
            lblVeg.Text = Convert.ToBoolean(dr["Veg"]) ? "Yes" : "No";

            lblNonVeg.Text = Convert.ToBoolean(dr["NonVeg"]) ? "Yes" : "No";

            lblWifi.Text = Convert.ToBoolean(dr["wiFi"]) ? "Yes" : "No";

            lblParking.Text = Convert.ToBoolean(dr["Parking"]) ? "Yes" : "No";

            lblACDining.Text = Convert.ToBoolean(dr["ACDining"]) ? "Yes" : "No";
        }

        dr.Close();
        con.Close();
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditMess.aspx");
    }
}