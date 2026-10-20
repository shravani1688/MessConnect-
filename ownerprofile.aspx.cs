using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class ownerprofile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=SHRAVANI\SQLEXPRESS2025;
Initial Catalog=Mess_connect;
Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            


                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            if (Session["OwnerId"] == null)
            {
                Response.Redirect("mess21.aspx");
                return;
            }

            SqlCommand cmd = new SqlCommand(
                "SELECT FullName, PhoneNo FROM mst_owner WHERE OwnerId=@OwnerId", con);

            cmd.Parameters.AddWithValue("@OwnerId", Session["OwnerId"]);

            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            lblName.Text = dr["FullName"].ToString();
            lblMobile.Text = dr["PhoneNo"].ToString(); ;
            }

            dr.Close();
            con.Close();
        }
    }

