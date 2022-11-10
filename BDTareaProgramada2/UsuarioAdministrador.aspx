<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioAdministrador.aspx.cs" Inherits="BDTareaProgramada2.WebForm2" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Persona&nbsp;&nbsp;&nbsp;:<br />
            <br />
            Nombre&nbsp;&nbsp;&nbsp; :<asp:TextBox ID="txtNombrePersona" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;Email:
            <asp:TextBox ID="txtEmail" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
            Telefono 1:
            <asp:TextBox ID="txtTele1" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;Telefono 2:<asp:TextBox ID="txtTele2" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
            <br />
            <br />
            Documento identidad:
            <asp:TextBox ID="txtNumeroDocumento" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;&nbsp;&nbsp; Tipo documento identidad:
            <asp:DropDownList ID="listaTipoIdentidad" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:GridView ID="gridA" runat="server">
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="btnCrear0" runat="server" Text="Crear" OnClick="btnCrear0_Click" />
            <asp:Button ID="btnConsultar0" runat="server" Text="Consultar" OnClick="btnConsultar0_Click" />
            <asp:Button ID="btnActualizar0" runat="server" Text="Actualizar" OnClick="btnActualizar0_Click" />
            <asp:Button ID="btnEliminar0" runat="server" Text="Eliminar" OnClick="btnEliminar0_Click" />
            <br />
            <br />
            Propiedad :<br />
            <br />
            Area:<asp:TextBox ID="txtArea" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;Valor fiscal:
            <asp:TextBox ID="txtValorFiscal" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;Fecha registro:<asp:TextBox ID="txtFechaRegistro" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
            Tipo terreno:<asp:DropDownList ID="listaTipoTerreno" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            Tipo zona:
            <asp:DropDownList ID="listaTipoZona" runat="server">
            </asp:DropDownList>
            &nbsp;Numero de finca:
            <asp:TextBox ID="txtNumeroFinca" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
            &nbsp;<br />
            <br />
            <asp:Button ID="btnCrear1" runat="server" Text="Crear" OnClick="btnCrear1_Click" />
            <asp:Button ID="btnConsultar1" runat="server" Text="Consultar" OnClick="btnConsultar1_Click" />
            <asp:Button ID="btnActualizar1" runat="server" Text="Actualizar" OnClick="btnActualizar1_Click" />
            <asp:Button ID="btnEliminar1" runat="server" Text="Eliminar" OnClick="btnEliminar1_Click" />
            <br />
            <br />
            <br />
            <asp:GridView ID="gridB" runat="server">
            </asp:GridView>
            <br />
            <br />
            <br />
            Usuarios&nbsp;&nbsp;&nbsp;:<br />
            <br />
            Documento Identidad:
            <asp:TextBox ID="txtIdPersona" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtUsername" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
&nbsp;Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPasswordUsuario" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
            Tipo usuario:
            <asp:DropDownList ID="listaTipoUsuario" runat="server">
            </asp:DropDownList>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New username:
            <asp:TextBox ID="txtNewUserName" runat="server" AutoCompleteType ="Disabled"></asp:TextBox>
&nbsp;New password:
            <asp:TextBox ID="txtNewPassword" runat="server" AutoCompleteType ="Disabled"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="btnCrear2" runat="server" Text="Crear" OnClick="btnCrear2_Click" />
            <asp:Button ID="btnConsultar2" runat="server" Text="Consultar" OnClick="btnConsultar2_Click" />
            <asp:Button ID="btnActualizar2" runat="server" Text="Actualizar" OnClick="btnActualizar2_Click" />
            <asp:Button ID="btnEliminar2" runat="server" Text="Eliminar" OnClick="btnEliminar2_Click" />
            <br />
            <br />
            <br />
            <asp:GridView ID="gridC" runat="server">
            </asp:GridView>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            Asociacion entre personas y propiedades:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       <br />
            Persona&nbsp;&nbsp;&nbsp;&nbsp; :<asp:TextBox ID="idPersonaPxP" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
            <br />
            <br />
            Propiedad :<asp:TextBox ID="idPropiedadPxP" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnCrear" runat="server" Text="Crear" OnClick="btnCrear_Click"  />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" />
            <br />
            <br />
            Asociacion entre usuarios y propiedades:<br />
            <br />
            Usuario&nbsp;&nbsp;&nbsp;&nbsp; :<asp:TextBox ID="idUsuarioPxU" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
            <br />
            <br />
            Propiedad :<asp:TextBox ID="idPropiedadPxU" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnCrear5" runat="server" OnClick="btnCrear5_Click" Text="Crear" />
            <asp:Button ID="btnEliminar5" runat="server" OnClick="btnEliminar5_Click" Text="Eliminar" />
            <br />
            <br />
            <br />
            <asp:GridView ID="gridD" runat="server">
            </asp:GridView>
            <br />
            <br />
            <br />
            Número de finca :<asp:TextBox ID="txtNumFinca" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
            <br />
            <br />
            Propetario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<asp:TextBox ID="txtPropetario" runat="server"></asp:TextBox>
            <br />
            <br />
            Usuario&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<asp:TextBox ID="txtUsuarioF" runat="server" AutoCompleteType ="Disabled"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="txtPropiedadesUsuarios" runat="server" Text="Propiedades visibles del usuario" Width="276px" OnClick="txtPropiedadesUsuarios_Click" />
            <br />
            <br />
            <asp:Button ID="btnPropietariosPropiedad" runat="server" Text="Propetario de la propiedad" Width="276px" OnClick="btnPropietariosPropiedad_Click" />
            <br />
            <br />
            <asp:Button ID="btnPropiedadesPropetario" runat="server" Text="Propiedades del propetario" Width="277px" OnClick="btnPropiedadesPropetario_Click" />
            <br />
            <br />
            <asp:Button ID="btnUsuariosPropiedad" runat="server" Text="Usuarios de la propiedad" Width="277px" OnClick="btnUsuariosPropiedad_Click" />
            <br />
            <br />
            <br />
            <br />
            <asp:GridView ID="gridE" runat="server">
            </asp:GridView>
            <br />
            <asp:Button ID="btnRegresar" runat="server" OnClick="btnRegresar_Click" Text="Regresar" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Fecha inicio: "></asp:Label>
            <asp:TextBox ID="textFechaInicio" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Fecha Fin      :"></asp:Label>
            <asp:TextBox ID="textFechaFin" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
        </div>
        <asp:Button ID="btnRegistro" runat="server" OnClick="btnRegistro_Click" Text="Mostrar registro" />
    </form>
</body>
</html>
