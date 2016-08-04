<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SystemStatus.ascx.cs" Inherits="UserRoles" %>
<table>
    <tr>
        <td>
           <b style="background-color:yellow"> Active Users: <asp:Label ID="SS_LB_ActiveUsers" runat="server" Text=" "></asp:Label> | 
            Total Courses Reviewed:<asp:Label ID="SS_LB_Courses" runat="server" Text=" "></asp:Label>  
            </b>
        </td>
    </tr>
</table>