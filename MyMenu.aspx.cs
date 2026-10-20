using System;
using System.Data;
using System.Data.SqlClient;

public partial class MyMenu : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        @"Data Source=SHRAVANI\SQLEXPRESS2025;
          Initial Catalog=Mess_connect;
          Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMenu();
        }
    }

    private void LoadMenu()
    {
        try
        {
            if (Session["OwnerId"] == null)
            {
                Response.Redirect("mess21.aspx");
                return;
            }

            int ownerId = Convert.ToInt32(Session["OwnerId"]);

            string query = @"
SELECT m.Day, m.BreakFast, m.Lunch, m.Dinner
FROM mst_Menu m
INNER JOIN mst_MessInfo mi ON m.MessId = mi.MessId
WHERE mi.OwnerId = @OwnerId
ORDER BY
CASE m.Day
WHEN 'Monday' THEN 1
WHEN 'Tuesday' THEN 2
WHEN 'Wednesday' THEN 3
WHEN 'Thursday' THEN 4
WHEN 'Friday' THEN 5
WHEN 'Saturday' THEN 6
WHEN 'Sunday' THEN 7
END";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            da.SelectCommand.Parameters.AddWithValue("@OwnerId", ownerId);

            DataTable dt = new DataTable();
            da.Fill(dt);

            rptMenu.DataSource = dt;
            rptMenu.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}