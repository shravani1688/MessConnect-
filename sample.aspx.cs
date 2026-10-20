using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection(
            "Data Source=SHRAVANI\\SQLEXPRESS2025; " + "Initial Catalog=Address; " + "Integrated Security=true; ");
         SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        DataSet ds = new DataSet();

        String str = string.Empty;
        str = "select *from mst_village ";
        using (connection)
        {
            adp = new SqlDataAdapter(str, connection);
            adp.Fill(ds);
            connection.Close();
        }
        if (ds.Tables.Count > 0) {
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();


            }
            else
                GridView1.EmptyDataText = "no data";

        }
        else
            GridView1.EmptyDataText = "no data";
    }
}