<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="BDTareaProgramada2.WebForm1" %>

<!DOCTYPE html>
<script runat="server">

</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Seleccione como desea ingresar :<br />
            <br />
            Identificación:<asp:TextBox ID="txtIdentificacion" runat="server" AutoCompleteType ="Disabled"></asp:TextBox>
            <br />
            <br />
            Contraseña&nbsp;&nbsp;&nbsp; :<asp:TextBox ID="txtContrasena" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnOk" runat="server" Text="Ok" OnClick="btnOk_Click" />
            <br />
        </div>
    </form>
</body>
</html>
