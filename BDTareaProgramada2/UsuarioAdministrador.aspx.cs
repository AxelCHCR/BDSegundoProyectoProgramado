using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Diagnostics;

namespace BDTareaProgramada2
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                ListItem i;

                i = new ListItem("Cedula CR", "1");
                listaTipoIdentidad.Items.Add(i);
                i = new ListItem("Persona Jurídica CR", "2");
                listaTipoIdentidad.Items.Add(i);
                i = new ListItem("Pasaporte CR", "3");
                listaTipoIdentidad.Items.Add(i);

                ListItem j;

                j = new ListItem("Administrador", "1");
                listaTipoUsuario.Items.Add(j);
                j = new ListItem("Propietario", "2");
                listaTipoUsuario.Items.Add(j);

                ListItem x;

                x = new ListItem("Residencial", "1");
                listaTipoTerreno.Items.Add(x);
                x = new ListItem("Agricola", "2");
                listaTipoTerreno.Items.Add(x);
                x = new ListItem("Bosque", "3");
                listaTipoTerreno.Items.Add(x);
                x = new ListItem("Zona industrial", "4");
                listaTipoTerreno.Items.Add(x);
                x = new ListItem("Zona comercial", "5");
                listaTipoTerreno.Items.Add(x);

                ListItem n;

                n = new ListItem("Habitacion", "1");
                listaTipoZona.Items.Add(n);
                n = new ListItem("Comercial", "2");
                listaTipoZona.Items.Add(n);
                n = new ListItem("Industrial", "3");
                listaTipoZona.Items.Add(n);
                n = new ListItem("Lote baldio", "4");
                listaTipoZona.Items.Add(n);
                n = new ListItem("Agricola", "5");
                listaTipoZona.Items.Add(n);
            }

        }

        protected void btnEliminar0_Click(object sender, EventArgs e)
        {
            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[deletePerson]", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inValorDocId", SqlDbType.VarChar, 32).Value = txtNumeroDocumento.Text;
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
                cn.Open();

                cmd.ExecuteNonQuery();

            }
        }

        protected void btnEliminar1_Click(object sender, EventArgs e)
        {

            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[deleteProperty]", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inNumeroFinca", SqlDbType.VarChar, 32).Value = txtNumeroFinca.Text;
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
                cn.Open();

                cmd.ExecuteNonQuery();
            }

        }

        protected void btnEliminar2_Click(object sender, EventArgs e)
        {

            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[deleteUser]", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inUsername", SqlDbType.VarChar, 32).Value = txtUsername.Text;
                cmd.Parameters.Add("@inPassword", SqlDbType.VarChar, 32).Value = txtPasswordUsuario.Text;
                cmd.Parameters.Add("@inTipoUsuario", SqlDbType.VarChar, 32).Value = listaTipoUsuario.SelectedItem.Text;
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;

                cn.Open();

                cmd.ExecuteNonQuery();

            }
        }

        protected void btnCrear2_Click(object sender, EventArgs e)
        {
            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[insertUser]", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inDocID", SqlDbType.VarChar, 32).Value = txtIdPersona.Text;
                cmd.Parameters.Add("@inUsername", SqlDbType.VarChar, 32).Value = txtUsername.Text;
                cmd.Parameters.Add("@inPassword", SqlDbType.VarChar, 32).Value = txtPasswordUsuario.Text;
                cmd.Parameters.Add("@inTipoUsuario", SqlDbType.VarChar, 32).Value = listaTipoUsuario.SelectedItem.Text;
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;

                cn.Open();

                cmd.ExecuteNonQuery();
            }
        }

        protected void btnCrear0_Click(object sender, EventArgs e)
        {

            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[insertPerson]", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inNombre", SqlDbType.VarChar, 32).Value = txtNombrePersona.Text;
                cmd.Parameters.Add("@inValorDocId", SqlDbType.VarChar, 32).Value = txtNumeroDocumento.Text;
                cmd.Parameters.Add("@inEmail", SqlDbType.VarChar, 32).Value = txtEmail.Text;
                cmd.Parameters.Add("@inIdTipoDoc", SqlDbType.VarChar, 32).Value = listaTipoIdentidad.SelectedItem.Value;
                cmd.Parameters.Add("@inTelefono1", SqlDbType.VarChar, 32).Value = txtTele1.Text;
                cmd.Parameters.Add("@inTelefono2", SqlDbType.VarChar, 32).Value = txtTele2.Text;
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;

                cn.Open();

                cmd.ExecuteNonQuery();

            }
        }
        protected void btnCrear1_Click(object sender, EventArgs e)
        {
            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[insertProperty]", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inNumeroFinca", SqlDbType.VarChar, 32).Value = txtNumeroFinca.Text;
                cmd.Parameters.Add("@inArea", SqlDbType.VarChar, 32).Value = txtArea.Text;
                cmd.Parameters.Add("@inValorFiscal", SqlDbType.VarChar, 32).Value = txtValorFiscal.Text;
                cmd.Parameters.Add("@inFechaRegistro", SqlDbType.Date, 32).Value = txtFechaRegistro.Text;
                cmd.Parameters.Add("@inIdTipoTerreno", SqlDbType.Int).Value = listaTipoTerreno.SelectedItem.Value;
                cmd.Parameters.Add("@inIdTipoZona", SqlDbType.Int).Value = listaTipoZona.SelectedItem.Value;
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;

                cn.Open();

                cmd.ExecuteNonQuery();

            }

        }

        protected void btnConsultar0_Click(object sender, EventArgs e)
        {
            string mainconn = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(mainconn);
            SqlCommand sqlcomm = new SqlCommand("[dbo].[readPerson]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.Add("@inValorDocId", SqlDbType.VarChar, 32).Value = txtNumeroDocumento.Text;
            sqlcomm.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gridA.DataSource = dt;
            gridA.DataBind();
            sqlconn.Close();
        }

        protected void btnConsultar1_Click(object sender, EventArgs e)
        {
            string mainconn = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(mainconn);
            SqlCommand sqlcomm = new SqlCommand("[dbo].[readProperty]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.Add("@inNumeroFinca", SqlDbType.VarChar, 32).Value = txtNumeroFinca.Text;
            sqlcomm.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gridB.DataSource = dt;
            gridB.DataBind();
            sqlconn.Close();
        }

        protected void btnConsultar2_Click(object sender, EventArgs e)
        {
            string mainconn = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(mainconn);
            SqlCommand sqlcomm = new SqlCommand("[dbo].[readUser]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.Add("@inUsername", SqlDbType.VarChar, 32).Value = txtUsername.Text;
            sqlcomm.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gridC.DataSource = dt;
            gridC.DataBind();
            sqlconn.Close();
        }

        protected void btnActualizar0_Click(object sender, EventArgs e)
        {

            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[updatePerson]", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inNombre", SqlDbType.VarChar, 32).Value = txtNombrePersona.Text;
                cmd.Parameters.Add("@inValorDocId", SqlDbType.VarChar, 32).Value = txtNumeroDocumento.Text;
                cmd.Parameters.Add("@inEmail", SqlDbType.VarChar, 32).Value = txtEmail.Text;
                cmd.Parameters.Add("@inTelefono1", SqlDbType.VarChar, 32).Value = txtTele1.Text;
                cmd.Parameters.Add("@inIdTipoDocId", SqlDbType.VarChar, 32).Value = listaTipoIdentidad.SelectedItem.Value;
                cmd.Parameters.Add("@inTelefono2", SqlDbType.VarChar, 32).Value = txtTele2.Text;
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;

                

                cn.Open();

                cmd.ExecuteNonQuery();
            }


        }

        protected void btnActualizar2_Click(object sender, EventArgs e)
        {
            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[updateUser]", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inNewTipoUsuario", SqlDbType.VarChar, 32).Value = listaTipoUsuario.SelectedItem.Text;
                cmd.Parameters.Add("@inUsername", SqlDbType.VarChar, 32).Value = txtUsername.Text;
                cmd.Parameters.Add("@inPassword", SqlDbType.VarChar, 32).Value = txtPasswordUsuario.Text;
                cmd.Parameters.Add("@inNewUsername", SqlDbType.VarChar, 32).Value = txtNewUserName.Text;
                cmd.Parameters.Add("@inNewPassword", SqlDbType.VarChar, 32).Value = txtNewPassword.Text;
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;

                cn.Open();

                cmd.ExecuteNonQuery();
            }

        }
        protected void btnActualizar1_Click(object sender, EventArgs e)
        {
            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[updateProperty]", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inNumeroFinca", SqlDbType.VarChar, 32).Value = txtNumeroFinca.Text;
                cmd.Parameters.Add("@inArea", SqlDbType.VarChar, 32).Value = txtArea.Text;
                cmd.Parameters.Add("@inValorFiscal", SqlDbType.VarChar, 32).Value = txtValorFiscal.Text;
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;

                cn.Open();

                cmd.ExecuteNonQuery();
            }

        }

        protected void txtPropiedadesUsuarios_Click(object sender, EventArgs e)
        {
            string mainconn = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(mainconn);
            SqlCommand sqlcomm = new SqlCommand("[dbo].[propiedadesUsuario]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.Add("@inUsername", SqlDbType.VarChar, 32).Value = txtUsuarioF.Text;
            sqlcomm.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gridE.DataSource = dt;
            gridE.DataBind();
            sqlconn.Close();

        }

        protected void btnPropietariosPropiedad_Click(object sender, EventArgs e)
        {

            string mainconn = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(mainconn);
            SqlCommand sqlcomm = new SqlCommand("[dbo].[propietarioPropiedad]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.Add("@inNumeroFinca", SqlDbType.VarChar, 32).Value = txtNumFinca.Text;
            sqlcomm.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gridE.DataSource = dt;
            gridE.DataBind();
            sqlconn.Close();

        }

        protected void btnPropiedadesPropetario_Click(object sender, EventArgs e)
        {
            string mainconn = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(mainconn);
            SqlCommand sqlcomm = new SqlCommand("[dbo].[propiedadesPropietario]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.Add("@inIdentificacion", SqlDbType.VarChar, 32).Value = txtPropetario.Text;
            sqlcomm.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gridE.DataSource = dt;
            gridE.DataBind();
            sqlconn.Close();

        }

        protected void btnUsuariosPropiedad_Click(object sender, EventArgs e)
        {
            string mainconn = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(mainconn);
            SqlCommand sqlcomm = new SqlCommand("[dbo].[usuariosPropiedad]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.Add("@inNumeroFinca", SqlDbType.VarChar, 32).Value = txtNumFinca.Text;
            sqlcomm.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gridE.DataSource = dt;
            gridE.DataBind();
            sqlconn.Close();

        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {

            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[asociarPXP]", cn);
                

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inNumDocId", SqlDbType.VarChar, 32).Value = idPersonaPxP.Text;
                cmd.Parameters.Add("@inNumeroFinca", SqlDbType.VarChar, 32).Value = idPropiedadPxP.Text;
                cmd.Parameters.Add("@inFechaInicio", SqlDbType.VarChar, 32).Value = DateTime.Now.ToString("yyyy-MM-dd");
                cmd.Parameters.Add("@inFechaFin", SqlDbType.VarChar, 32).Value = DateTime.Now.ToString("yyyy-MM-dd");
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;

                cn.Open();

                cmd.ExecuteNonQuery();
            }

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[desasociarPXP]", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inNumDocId", SqlDbType.VarChar, 32).Value = idPersonaPxP.Text;
                cmd.Parameters.Add("@inNumeroFinca", SqlDbType.VarChar, 32).Value = idPropiedadPxP.Text;
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;

                cn.Open();

                cmd.ExecuteNonQuery();
            }

        }

        protected void btnEliminar5_Click(object sender, EventArgs e)
        {
            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[desasociarPXU]", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inUserName", SqlDbType.VarChar, 32).Value = idUsuarioPxU.Text;
                cmd.Parameters.Add("@inNumeroFinca", SqlDbType.Int).Value = idPropiedadPxU.Text;
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;

                cn.Open();

                cmd.ExecuteNonQuery();
            }

        }

        protected void btnCrear5_Click(object sender, EventArgs e)
        {

            string connStr = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("[dbo].[asociarPXU]", cn);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@inUsername", SqlDbType.VarChar, 32).Value = idUsuarioPxU.Text;
                cmd.Parameters.Add("@inNumeroFinca", SqlDbType.VarChar, 32).Value = idPropiedadPxU.Text;
                cmd.Parameters.Add("@inFechaInicio", SqlDbType.VarChar, 32).Value = DateTime.Now.ToString("yyyy-MM-dd");
                cmd.Parameters.Add("@inFechaFin", SqlDbType.VarChar, 32).Value = DateTime.Now.ToString("yyyy-MM-dd");
                cmd.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;

                cn.Open();

                cmd.ExecuteNonQuery();
            }

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Principal.aspx");
        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {

            string mainconn = @"Data Source=LAPTOP-9BCLTGCP;Initial Catalog=Municipalidad;Integrated Security=True";
            SqlConnection sqlconn = new SqlConnection(mainconn);
            SqlCommand sqlcomm = new SqlCommand("[dbo].[rangoCambiosEntidades]", sqlconn);
            sqlcomm.CommandType = CommandType.StoredProcedure;
            sqlcomm.Parameters.Add("@inFechaInicio", SqlDbType.VarChar, 32).Value = textFechaInicio.Text;
            sqlcomm.Parameters.Add("@inFechaFin", SqlDbType.VarChar, 32).Value = textFechaFin.Text;

            sqlcomm.Parameters.Add("@outResultCode", SqlDbType.Int).Value = 0;
            sqlconn.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            sqlconn.Close();

        }
    }
}