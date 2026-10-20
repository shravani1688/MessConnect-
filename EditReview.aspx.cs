using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditReview : System.Web.UI.Page
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

            if (Request.QueryString["id"] != null)
            {
                LoadReview();
            }
            else
            {
                Response.Redirect("cusreview.aspx");
            }
        }
    }

    private void LoadReview()
    {
        string query = @"SELECT Rating, ReviewText
                         FROM mst_review
                         WHERE ReviewId=@ReviewId
                         AND customId=@customerId
                         AND isActive=1";

        SqlCommand cmd = new SqlCommand(query, connection);
        cmd.Parameters.AddWithValue("@ReviewId", Request.QueryString["id"]);
        cmd.Parameters.AddWithValue("@customerId", Session["customId"]);

        connection.Open();

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            ddlRating.SelectedValue = dr["Rating"].ToString();
            txtReview.Text = dr["ReviewText"].ToString();
        }
        else
        {
            dr.Close();
            connection.Close();
            Response.Redirect("cusreview.aspx");
            return;
        }

        dr.Close();
        connection.Close();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string query = @"UPDATE mst_review
                         SET Rating=@Rating,
                             ReviewText=@ReviewText
                         WHERE ReviewId=@ReviewId
                         AND customId=@customerId";

        SqlCommand cmd = new SqlCommand(query, connection);

        cmd.Parameters.AddWithValue("@Rating", ddlRating.SelectedValue);
        cmd.Parameters.AddWithValue("@ReviewText", txtReview.Text);
        cmd.Parameters.AddWithValue("@ReviewId", Request.QueryString["id"]);
        cmd.Parameters.AddWithValue("@customerId", Session["customId"]);

        connection.Open();
        cmd.ExecuteNonQuery();
        connection.Close();

        Response.Redirect("cusreview.aspx");
    }
}
