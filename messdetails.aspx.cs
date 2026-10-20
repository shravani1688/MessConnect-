using System;
using System.Data.SqlClient;


public partial class messdetails : System.Web.UI.Page
{

    SqlConnection connection = new SqlConnection(
    "Data Source=SHRAVANI\\SQLEXPRESS2025;" +
    "Initial Catalog=Mess_connect;" +
    "User Id=sa;" +
    "Password=web@123;");


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            LoadMess();
        }

    }



    void LoadMess()
    {

        int id = Convert.ToInt32(Request.QueryString["MessId"]);


        string query = "SELECT * FROM mst_messinfo WHERE MessId=@id";


        SqlCommand cmd = new SqlCommand(query, connection);

        cmd.Parameters.AddWithValue("@id", id);


        connection.Open();

        SqlDataReader dr = cmd.ExecuteReader();


        if (dr.Read())
        {

            lblName.Text = dr["MessName"].ToString();

            lblLocation.Text = dr["Location"].ToString();

            lblDescription.Text = dr["Description"].ToString();

            lblPrice.Text = dr["PricePerMonth"].ToString();

            lblSeats.Text = dr["AvailableSeats"].ToString();

        }


        connection.Close();


    }



    protected void btnBook_Click(object sender, EventArgs e)
    {

        Response.Redirect(
        "booking.aspx?MessId=" + Request.QueryString["MessId"]
        );

    }


}