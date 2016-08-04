<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminActios.aspx.cs" Inherits="adminActios" %>

<%@ Register Src="~/SystemStatus.ascx" TagPrefix="uc1" TagName="SystemStatus" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div>
        <table style="background-color: whitesmoke">
            <tr>
                <td>
                    <uc1:SystemStatus runat="server" ID="SystemStatus" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Create User(student/Professor):<asp:Button ID="CreateUser" runat="server" Text="Start Here !!!" OnClick="Button1_Click" />
                </td>
                <td class="auto-style1">Manage Courses<asp:Button ID="Button1" runat="server" Text="ManageData Bases" OnClick="Button1_Click1" /></td>
            </tr>
        </table>
        <asp:SqlDataSource ID="AA_SDS_ContactUS" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" DeleteCommand="DELETE FROM [ContactUS] WHERE [ID] = @original_ID" InsertCommand="INSERT INTO [ContactUS] ([Name], [userID], [Email], [Description], [URL]) VALUES (@Name, @userID, @Email, @Description, @URL)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Name], [userID], [Email], [Description], [URL], [ID] FROM [ContactUS]" UpdateCommand="UPDATE ContactUS SET Name = @Name, userID = @userID, Email = @Email, Description = @Description, URL = @URL WHERE (ID = @original_ID)">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="URL" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="userID" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="URL" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div style="color: whitesmoke">

            <div style="color: #302525">
                Issues / Comments posted by user:               
            </div>
            <asp:GridView ID="GridView1" runat="server" Width="300Px" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="AA_SDS_ContactUS" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Posted BY" SortExpression="Name" />
                    <asp:BoundField DataField="userID" HeaderText="user ID" SortExpression="userID" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Description" HeaderText="Issue Description" SortExpression="Description" />
                    <asp:BoundField DataField="URL" HeaderText="Issue URL" SortExpression="URL" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>

