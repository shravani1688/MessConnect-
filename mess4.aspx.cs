using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mess4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
  protected void btnCreate_Click(object sender, EventArgs e)
    {
        SqlConnection connection = new SqlConnection("Data source=SHRAVANI\\SQLEXPRESS2025; " +

           "initial catalog=Mess_connect; " + "Integrated Security=true; "
          );
        SqlCommand com = new SqlCommand();
        SqlDataAdapter adp = new SqlDataAdapter();
        DataSet ds = new DataSet();
        String str = string.Empty;
        String str1 = string.Empty;
        str = "insert into mst_customer(FullName,Email,PhoneNo,Password,isActive) values(@name,@email,@phone,@pass,@isactive)";
       
        using (connection)
        {
           connection.Open();
            com = new SqlCommand(str, connection);
          
            com.Parameters.AddWithValue("@name", txtName.Text);
            com.Parameters.AddWithValue("@Email", txtEmail.Text);
            com.Parameters.AddWithValue("@phone", txtPhone.Text);
            com.Parameters.AddWithValue("@pass", txtPassword.Text);
            com.Parameters.AddWithValue("@isactive", 1);
            com.ExecuteNonQuery();
            connection.Close();
            Response.Write("<script>alert('data inserted successfully');</script>");
            Response.Redirect("mess6.aspx");
        }
    

    }
}
