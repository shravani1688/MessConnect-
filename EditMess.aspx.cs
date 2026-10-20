using System;
using System.Data.SqlClient;

public partial class EditMess : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
@"Data Source=SHRAVANI\SQLEXPRESS2025;
Initial Catalog=Mess_connect;
Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }

    void LoadData()
    {
        SqlCommand cmd = new SqlCommand("select * from mst_MessInfo where OwnerId=@OwnerId", con);

        cmd.Parameters.AddWithValue("@OwnerId", Session["OwnerId"]);

        con.Open();

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            txtMessName.Text = dr["MessName"].ToString();
            txtLocation.Text = dr["Location"].ToString();
            txtDescription.Text = dr["Description"].ToString();
            txtContact.Text = dr["ContactNo"].ToString();
            txtPrice.Text = dr["PricePerMonth"].ToString();
            txtTotalSeats.Text = dr["TotalSeats"].ToString();
            txtAvailableSeats.Text = dr["AvailableSeats"].ToString();
            ddlStatus.SelectedValue = dr["Status"].ToString();

            chkVeg.Checked = Convert.ToBoolean(dr["Veg"]);
            chkNonVeg.Checked = Convert.ToBoolean(dr["NonVeg"]);
            chkWifi.Checked = Convert.ToBoolean(dr["wiFi"]);
            chkParking.Checked = Convert.ToBoolean(dr["Parking"]);
            chkACDining.Checked = Convert.ToBoolean(dr["ACDining"]);
        }

        dr.Close();
        con.Close();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand(@"update mst_MessInfo set

MessName=@MessName,
Location=@Location,
Description=@Description,
ContactNo=@Contact,
PricePerMonth=@Price,
TotalSeats=@TotalSeats,
AvailableSeats=@AvailableSeats,
Status=@Status,
Veg=@Veg,
NonVeg=@NonVeg,
wiFi=@Wifi,
Parking=@Parking,
ACDining=@ACDining

where OwnerId=@OwnerId", con);

        cmd.Parameters.AddWithValue("@MessName", txtMessName.Text);
        cmd.Parameters.AddWithValue("@Location", txtLocation.Text);
        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
        cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
        cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
        cmd.Parameters.AddWithValue("@TotalSeats", txtTotalSeats.Text);
        cmd.Parameters.AddWithValue("@AvailableSeats", txtAvailableSeats.Text);
        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);

        cmd.Parameters.AddWithValue("@Veg", chkVeg.Checked);
        cmd.Parameters.AddWithValue("@NonVeg", chkNonVeg.Checked);
        cmd.Parameters.AddWithValue("@Wifi", chkWifi.Checked);
        cmd.Parameters.AddWithValue("@Parking", chkParking.Checked);
        cmd.Parameters.AddWithValue("@ACDining", chkACDining.Checked);

        cmd.Parameters.AddWithValue("@OwnerId", Session["OwnerId"]);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("MyMess.aspx");
    }
}