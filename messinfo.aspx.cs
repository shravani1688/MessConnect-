using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class messinfo : System.Web.UI.Page
{
    string connectionString = @"Data Source=SHRAVANI\SQLEXPRESS2025;
                                Initial Catalog=Mess_connect;
                                Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        // Owner Login नसल्यास Login Page वर पाठव
        if (Session["OwnerId"] == null)
        {
            Response.Redirect("ownerlogin.aspx");
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            int ownerId = Convert.ToInt32(Session["OwnerId"]);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string str = @"INSERT INTO mst_MessInfo
                (
                    OwnerId,
                    MessName,
                    Location,
                    Description,
                    ContactNo,
                    PricePerMonth,
                    TotalSeats,
                    AvailableSeats,
                    Veg,
                    Nonveg,
                    WiFi,
                    Parking,
                    ACDining,
                    Status,
                    isActive
                )
                VALUES
                (
                    @OwnerId,
                    @MessName,
                    @Location,
                    @Description,
                    @ContactNo,
                    @PricePerMonth,
                    @TotalSeats,
                    @AvailableSeats,
                    @Veg,
                    @Nonveg,
                    @WiFi,
                    @Parking,
                    @ACDining,
                    @Status,
                    @isActive
                )";

                SqlCommand com = new SqlCommand(str, connection);

                com.Parameters.AddWithValue("@OwnerId", ownerId);
                com.Parameters.AddWithValue("@MessName", txtMessName.Text);
                com.Parameters.AddWithValue("@Location", txtLocation.Text);
                com.Parameters.AddWithValue("@Description", txtDescription.Text);
                com.Parameters.AddWithValue("@ContactNo", txtContact.Text);
                com.Parameters.AddWithValue("@PricePerMonth", txtPricePerMonth.Text);
                com.Parameters.AddWithValue("@TotalSeats", txtTotalSeats.Text);
                com.Parameters.AddWithValue("@AvailableSeats", txtAvailableSeats.Text);
                com.Parameters.AddWithValue("@Veg", chkVeg.Checked);
                com.Parameters.AddWithValue("@Nonveg", chkNonVeg.Checked);
                com.Parameters.AddWithValue("@WiFi", chkWifi.Checked);
                com.Parameters.AddWithValue("@Parking", chkParking.Checked);
                com.Parameters.AddWithValue("@ACDining", chkACDining.Checked);
                com.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                com.Parameters.AddWithValue("@isActive", true);

                int result = com.ExecuteNonQuery();

                if (result > 0)
                {
                    Response.Write("<script>alert('Mess Information Saved Successfully');</script>");
                }
                else
                {
                    Response.Write("<script>alert('Data not saved');</script>");
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message.Replace("'", "") + "');</script>");
        }
    }
}