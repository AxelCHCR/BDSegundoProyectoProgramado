<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsuarioNoAdministrador.aspx.cs" Inherits="BDTareaProgramada2.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Seleccione una propiedad :<br />
            <br />
        </div>
        <asp:GridView ID="gridLecturas" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gridLecturas_SelectedIndexChanged">
        </asp:GridView>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server">
                    <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="chkSelect" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="btnVerLecturas" runat="server" Text="Ver lecturas" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Pagar seleccionadas" OnClick="Button2_Click" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Regresar" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
    </form>
</body>
</html>
