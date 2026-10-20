using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection("Data source=SHRAVANI\\SQLEXPRESS2025; " +

           "initial catalog=loginpage; " + "Integrated Security=true; "
          );
        SqlCommand com = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        DataSet ds = new DataSet();
        String str = string.Empty;
        str = "select * from mst_login where UserName='" + usText.Text + "'AND Password='" + paText.Text + "'";
        using (connection)
        {
            adp = new SqlDataAdapter(str, connection);
            adp.Fill(ds);
            connection.Close();

        }
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                Iblmsg.Text = "login successfull";
            }
            else
            {
                Iblmsg.Text = "invalid user name and password";
            }
        }
        else
        {
            Iblmsg.Text = "invalid user name and password";
        }
    }

    protected void btnReset_click(object sender, EventArgs e)
    {
        usText.Text = "";
        paText.Text = "";
        Iblmsg.Text = "";
            
    }
}