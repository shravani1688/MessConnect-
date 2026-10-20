using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;


public partial class mess6 : System.Web.UI.Page
{

    string connectionString = @"Data Source=SHRAVANI\SQLEXPRESS2025;
Initial Catalog=Mess_connect;
Integrated Security=True";


    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["CustomId"] == null)
        {
            Response.Redirect("mess2.aspx");
            return;
        }


        if (!IsPostBack)
        {

            ShowCustomerName();

            LoadMess();

        }

    }



    // CUSTOMER NAME DISPLAY

    void ShowCustomerName()
    {
        if (Session["CustomId"] == null)
        {
            lblName.Text = "Customer";
            return;
        }

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT FullName FROM mst_customer WHERE CustomId=@CustomId", con);

            cmd.Parameters.AddWithValue("@CustomId", Session["CustomId"]);

            con.Open();

            object result = cmd.ExecuteScalar();

            if (result != null)
            {
                lblName.Text = result.ToString();
            }
            else
            {
                lblName.Text = "Customer";
            }

            con.Close();
        }
    }




    // LOAD ALL MESS

    void LoadMess()
    {

        using (SqlConnection con = new SqlConnection(connectionString))
        {

            SqlDataAdapter da = new SqlDataAdapter(

            @"SELECT 
              MessId,
              MessName,
              Location,
              Description,
              PricePerMonth,
              AvailableSeats

              FROM mst_MessInfo

              WHERE IsActive = 1", con);



            DataTable dt = new DataTable();


            da.Fill(dt);


            rptMess.DataSource = dt;


            rptMess.DataBind();

        }

    }




    // SEARCH MESS

    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {

        using (SqlConnection con = new SqlConnection(connectionString))
        {


            SqlDataAdapter da = new SqlDataAdapter(@"
SELECT
    MessId,
    MessName,
    Location,
    Description,
    PricePerMonth,
    AvailableSeats
FROM mst_MessInfo
WHERE IsActive=1
AND (
        MessName LIKE @search
     OR Location LIKE @search
    )", con);


            da.SelectCommand.Parameters.AddWithValue(
            "@search",
            "%" + txtSearch.Text + "%");



            DataTable dt = new DataTable();


            da.Fill(dt);



            rptMess.DataSource = dt;


            rptMess.DataBind();


        }

    }
    protected void lnkMess_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;

        string messId = btn.CommandArgument;

        Response.Redirect("messdetails.aspx?MessId=" + messId);
    }

   protected void btnFav_Click(object sender, EventArgs e)
{
    if (Session["CustomId"] == null)
    {
        Response.Redirect("mess2.aspx");
        return;
    }

    LinkButton btn = (LinkButton)sender;

    int messId = Convert.ToInt32(btn.CommandArgument);
    int customerId = Convert.ToInt32(Session["CustomId"]);

    using (SqlConnection con = new SqlConnection(connectionString))
    {
        SqlCommand cmd = new SqlCommand(@"
IF NOT EXISTS
(
    SELECT *
    FROM mst_favorite
    WHERE CustomId=@CustomId
    AND MessId=@MessId
)
BEGIN
    INSERT INTO mst_favorite(CustomId,MessId)
    VALUES(@CustomId,@MessId)
END", con);

        cmd.Parameters.AddWithValue("@CustomId", customerId);
        cmd.Parameters.AddWithValue("@MessId", messId);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    ClientScript.RegisterStartupScript(
        this.GetType(),
        "msg",
        "alert('Added to Favorite Successfully');",
        true);
}

}