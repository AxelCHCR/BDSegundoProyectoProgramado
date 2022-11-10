using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlTypes;


namespace BDTareaProgramada2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        String a;
        protected void Page_Load(object sender, EventArgs e)
        {
            string mainconn = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(mainconn);
            SqlCommand sqlcomm = new SqlCommand("[dbo].[propiedadesUsuario]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.Add("@inUsername", SqlDbType.VarChar, 32).Value = Request.QueryString["Parameter"].ToString();
            sqlcomm.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gridLecturas.DataSource = dt;
            gridLecturas.DataBind();
            sqlconn.Close();


        }

        protected void gridLecturas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string mainconn = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(mainconn);
            SqlCommand sqlcomm = new SqlCommand("[dbo].[recibosPendientes]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.Add("@inNumeroFinca", SqlDbType.VarChar, 32).Value = gridLecturas.SelectedRow.Cells[3].Text;
            sqlcomm.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            sqlconn.Close();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int index = 0;
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                CheckBox chk = (CheckBox)gvrow.FindControl("chkSelect");
                if (chk != null & chk.Checked)
                {
                    int ID = int.Parse(GridView1.Rows[index].Cells[1].Text.ToString());
                    string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
                    using (SqlConnection cn = new SqlConnection(connStr))
                    {
                        SqlCommand cmd = new SqlCommand("[dbo].[pagarRecibo]", cn);

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@inIdRecibo", SqlDbType.VarChar, 32).Value = ID;
                        cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
                        cn.Open();

                        cmd.ExecuteNonQuery();
                    }
                }
                index++;
            }
        }

       
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Principal.aspx");
        }
    }
}