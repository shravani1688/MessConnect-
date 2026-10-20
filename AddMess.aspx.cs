using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddMess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
protected void btnSave_Click(object sender, EventArgs e)
{
    SqlConnection con = new SqlConnection(
        "Data Source=SHRAVANI\\SQLEXPRESS2025;" +
        "Initial Catalog=Mess_connect;" +
        "User Id=sa;" +
        "Password=web@123;");

    string query = @"INSERT INTO mst_MessInfo
    (
        OwnerId,
        MessName,
        Location,
        Description,
        ContactNo,
        Veg,
        NonVeg,
        wiFi,
        Parking,
        ACDining,
        PricePerMonth,
        TotalSeats,
        AvailableSeats,
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
        @Veg,
        @NonVeg,
        @wiFi,
        @Parking,
        @ACDining,
        @PricePerMonth,
        @TotalSeats,
        @AvailableSeats,
        @Status,
        @isActive
    )";

    SqlCommand cmd = new SqlCommand(query, con);

    cmd.Parameters.AddWithValue("@OwnerId", Session["OwnerId"]);
    cmd.Parameters.AddWithValue("@MessName", txtMessName.Text);
    cmd.Parameters.AddWithValue("@Location", txtLocation.Text);
    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
    cmd.Parameters.AddWithValue("@ContactNo", txtContactNo.Text);

    cmd.Parameters.AddWithValue("@Veg", chkVeg.Checked);
    cmd.Parameters.AddWithValue("@NonVeg", chkNonVeg.Checked);
    cmd.Parameters.AddWithValue("@wiFi", chkWifi.Checked);
    cmd.Parameters.AddWithValue("@Parking", chkParking.Checked);
    cmd.Parameters.AddWithValue("@ACDining", chkACDining.Checked);

    cmd.Parameters.AddWithValue("@PricePerMonth", Convert.ToInt64(txtPrice.Text));
    cmd.Parameters.AddWithValue("@TotalSeats", Convert.ToInt32(txtTotalSeats.Text));
    cmd.Parameters.AddWithValue("@AvailableSeats", Convert.ToInt32(txtAvailableSeats.Text));

    cmd.Parameters.AddWithValue("@Status", "Available");
    cmd.Parameters.AddWithValue("@isActive", true);

    con.Open();
    cmd.ExecuteNonQuery();
    con.Close();

    Response.Write("<script>alert('Mess Information Saved Successfully');</script>");
}
}