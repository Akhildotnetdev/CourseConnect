<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProfessorDetails.aspx.cs" Inherits="ProfessorDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div>
        <table border="1" align="center">
            <tr>
                <td class="profDetails">Name:<asp:Label ID="Name" runat="server"></asp:Label><br />
                    Specalization:<asp:Label ID="Specalization" runat="server" Text=""></asp:Label><br />
                    School:<asp:Label ID="School" runat="server" Text=""></asp:Label><br />
                    Location:<asp:Label ID="Location" runat="server" Text=""></asp:Label><br />
                    Course:
                    <asp:Label ID="Course" runat="server" Text=""></asp:Label><br />
                    Email:<asp:Label ID="Email" runat="server" Text=""></asp:Label><br />
                </td>
                <td align="center">
                    <asp:Image ID="ProfImage" runat="server" ImageUrl="images/professor.png" /></td>
            </tr>
            <tr>
                <%--<td class="profDetails"></td>--%>
                <td align="center" class="profDetails">
                    <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank">More Details</asp:HyperLink></td>
            </tr>
        </table>
    </div>
</asp:Content>

