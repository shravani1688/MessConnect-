using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class cusfav : System.Web.UI.Page
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
            LoadFavourite();
        }
    }

    void LoadFavourite()
    {
        if (Session["CustomId"] == null)
        {
            Response.Redirect("mess2.aspx");
            return;
        }

        int cid = Convert.ToInt32(Session["CustomId"]);

        string query = @"
        SELECT
            m.MessId,
            m.MessName,
            m.Location,
            m.PricePerMonth,
            ISNULL(AVG(CAST(r.rating AS FLOAT)),0) AS rating
        FROM mst_favorite f
        INNER JOIN mst_messinfo m
            ON f.MessId = m.MessId
        LEFT JOIN mst_review r
            ON m.MessId = r.MessId
        WHERE f.CustomId=@CustomerId
        GROUP BY
            m.MessId,
            m.MessName,
            m.Location,
            m.PricePerMonth";

        SqlCommand cmd = new SqlCommand(query, connection);
        cmd.Parameters.AddWithValue("@CustomerId", cid);

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        da.Fill(dt);

        rptFavourite.DataSource = dt;
        rptFavourite.DataBind();
    }
    protected void btnRemoveFav_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;

        int messId = Convert.ToInt32(btn.CommandArgument);
        int customerId = Convert.ToInt32(Session["customId"]);

        string query = "DELETE FROM mst_favorite WHERE MessId=@MessId AND CustomId=@CustomerId";

        SqlCommand cmd = new SqlCommand(query, connection);
        cmd.Parameters.AddWithValue("@MessId", messId);
        cmd.Parameters.AddWithValue("@CustomerId", customerId);

        connection.Open();
        cmd.ExecuteNonQuery();
        Response.Write("<script>alert('remove form favorite list');</script>");
        connection.Close();

        LoadFavourite();
    }
}