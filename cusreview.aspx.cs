using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class cusreview : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection(
        "Data Source=SHRAVANI\\SQLEXPRESS2025;" +
        "Initial Catalog=mess_connect;" +
        "User Id=sa;" +
        "Password=web@123;");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["customId"] == null)
            {
                Response.Redirect("mess2.aspx");
                return;
            }

            LoadReviews();
        }
    }

    private void LoadReviews()
    {
        int customerId = Convert.ToInt32(Session["customId"]);

        string query = @"SELECT
                            r.ReviewId,
                            m.MessName,
                            r.Rating,
                            r.ReviewText
                         FROM mst_review r
                         INNER JOIN mst_messInfo m
                            ON r.messId = m.MessId
                         WHERE r.customId = @customerId
                         AND r.isActive = 1";

        SqlCommand cmd = new SqlCommand(query, connection);
        cmd.Parameters.AddWithValue("@customerId", customerId);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        da.Fill(dt);

        rptReview.DataSource = dt;
        rptReview.DataBind();
    }

    public string GetStars(int rating)
    {
        string stars = "";

        for (int i = 1; i <= 5; i++)
        {
            if (i <= rating)
                stars += "★";
            else
                stars += "☆";
        }

        return stars;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;

        int reviewId = Convert.ToInt32(btn.CommandArgument);

        string query = "UPDATE mst_review SET isActive=0 WHERE ReviewId=@ReviewId";

        SqlCommand cmd = new SqlCommand(query, connection);
        cmd.Parameters.AddWithValue("@ReviewId", reviewId);

        connection.Open();
        cmd.ExecuteNonQuery();
        connection.Close();

        LoadReviews();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;

        Response.Redirect("EditReview.aspx?id=" + btn.CommandArgument);
    }
}