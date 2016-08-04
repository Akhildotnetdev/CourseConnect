<%@ Page Language="C#" AutoEventWireup="true" CodeFile="errorHandling.aspx.cs" Inherits="errorHandling" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color: #11aaf7">
            <asp:Image ID="Image1" runat="server" ImageUrl="/images/Logo2.png" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Some thing went wrong, We will work on it" Font-Bold="true" Font-Size="Large"></asp:Label>

        </div>
    </form>
</body>
</html>
