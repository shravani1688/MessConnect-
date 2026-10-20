using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MessReview : System.Web.UI.Page
{
    
    SqlConnection con = new SqlConnection(
        @"Data Source=SHRAVANI\SQLEXPRESS2025;
          Initial Catalog=Mess_connect;
          Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadReviews();
        }
    }

    private void LoadReviews()
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
SELECT
    c.FullName,
    r.rating,
    r.ReviewText
FROM mst_review r
INNER JOIN mst_customer c
    ON r.CustomId = c.CustomId
INNER JOIN mst_MessInfo m
    ON r.MessId = m.MessId
WHERE m.OwnerId = @OwnerId
AND (r.isActive = 1 OR r.isActive IS NULL)
ORDER BY r.ReviewId DESC";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            da.SelectCommand.Parameters.AddWithValue("@OwnerId", ownerId);

            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                rptReview.DataSource = dt;
                rptReview.DataBind();
                lblNoReview.Visible = false;
            }
            else
            {
                rptReview.DataSource = null;
                rptReview.DataBind();
                lblNoReview.Visible = true;
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}
