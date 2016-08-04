<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="page">
            <div style="text-align: center; margin-right: 120Px">
                <asp:Image ID="Image1" runat="server" ImageUrl="images/Logo2.png" />
            </div>
            <div style="text-align: center;">
                <div style="width: 350px; margin-left: auto; margin-right: auto;">
                    <asp:Login ID="Login1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" TextLayout="TextOnTop"
                        PasswordRecoveryUrl="/RecoverPassword.aspx"
                        DestinationPageUrl="/Default.aspx" PasswordRecoveryText="Forgot Password"
                        CssClass="table" OnLoggedIn="Login1_LoggedIn">
                        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                        <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                        <TextBoxStyle Font-Size="0.8em" />
                        <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                    </asp:Login>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
