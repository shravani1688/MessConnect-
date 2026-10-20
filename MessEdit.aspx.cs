using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class MessEdit : System.Web.UI.Page
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

    void LoadMenu()
    {
        if (Session["OwnerId"] == null)
        {
            Response.Redirect("mess21.aspx");
            return;
        }

        int ownerId = Convert.ToInt32(Session["OwnerId"]);

        string query = @"
        SELECT m.MenuId,
               m.Day,
               m.BreakFast,
               m.Lunch,
               m.Dinner
        FROM mst_Menu m
        INNER JOIN mst_MessInfo mi
            ON m.MessId = mi.MessId
        WHERE mi.OwnerId=@OwnerId
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

        rptEdit.DataSource = dt;
        rptEdit.DataBind();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int count = 0;

        con.Open();

        foreach (RepeaterItem item in rptEdit.Items)
        {
            HiddenField hfId = (HiddenField)item.FindControl("hfId");

            TextBox txtBreakfast = (TextBox)item.FindControl("txtBreakfast");
            TextBox txtLunch = (TextBox)item.FindControl("txtLunch");
            TextBox txtDinner = (TextBox)item.FindControl("txtDinner");

            SqlCommand cmd = new SqlCommand(@"
        UPDATE mst_Menu
        SET BreakFast=@BreakFast,
            Lunch=@Lunch,
            Dinner=@Dinner
        WHERE MenuId=@MenuId", con);

            cmd.Parameters.AddWithValue("@BreakFast", txtBreakfast.Text);
            cmd.Parameters.AddWithValue("@Lunch", txtLunch.Text);
            cmd.Parameters.AddWithValue("@Dinner", txtDinner.Text);
            cmd.Parameters.AddWithValue("@MenuId", hfId.Value);

            count += cmd.ExecuteNonQuery();
        }

        con.Close();

        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "msg",
            "alert('Menu Updated Successfully');window.location='MyMenu.aspx';", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "msg",
            "alert('Menu Update Failed');", true);
        }
    }
}