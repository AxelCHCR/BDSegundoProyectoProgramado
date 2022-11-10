using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace BDTareaProgramada2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("ValidateLogin", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inUsername", SqlDbType.VarChar, 32).Value = txtIdentificacion.Text;
                cmd.Parameters.Add("@inPassword", SqlDbType.VarChar, 32).Value = txtContrasena.Text;
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;

                cmd.Parameters.Add("@inEncontrado",SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
                cn.Open();

                cmd.ExecuteNonQuery();
                int ret = int.Parse(cmd.Parameters["@inEncontrado"].Value.ToString());



                if(ret == 0)
                {
                    Response.Write("<script>alert('Combinación de usuario/password no existe en la BD');</script>");
                }
                if(ret == 1)
                {
                    Response.Redirect("UsuarioAdministrador.aspx");
                }
                if(ret == 2)
                {
                    Response.Redirect("UsuarioNoAdministrador.aspx?Parameter=" + txtIdentificacion.Text);
                }

            }
        }
    }
}