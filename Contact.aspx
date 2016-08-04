<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="ContactBody">
        Please contact us if you found some connect is not appropriate or if you face any issues.
    <table>
        <tr>
            <td><b>Name:</b></td>
            <td>
                <asp:TextBox ID="C_TB_Name" runat="server" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td><b>UserID:</b></td>
            <td>
                <asp:TextBox ID="C_TB_UserID" runat="server" Enabled="false"></asp:TextBox></td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="C_TB_UserID" ErrorMessage="UserID is mandatory"></asp:RequiredFieldValidator>
        </tr>
        <tr>
            <td><b>Email:</b></td>
            <td>
                <asp:TextBox ID="C_TB_Email" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><b>Issue URL</b></td>
            <td>
                <asp:TextBox ID="C_TB_IssueURL" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><b>Description:</b></td>
            <td>
                <asp:TextBox ID="C_TB_Description" runat="server" TextMode="MultiLine"></asp:TextBox></td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="C_TB_Description" runat="server" ErrorMessage=" Descritption field cannot be empty"></asp:RequiredFieldValidator>
        </tr>
    </table>
        <asp:Label ID="C_LB_Sucess" runat="server" Text=" "></asp:Label>
        <asp:Button ID="C_B_Submit" runat="server" Text="Submit" OnClick="C_B_Submit_Click" />
    </div>
</asp:Content>

