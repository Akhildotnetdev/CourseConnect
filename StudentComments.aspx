<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentComments.aspx.cs" Inherits="StudentComments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 508px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" SelectCommand="SELECT * FROM [Comments] WHERE ([CourseID] = @CourseID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label1" Name="CourseID" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="align-content: space-around">
        <table>
            <tr>
                <td class="auto-style1">Course Comments For:
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Click here to add a comment" Height="25px" OnClick="Button1_Click" Style="margin-left: 114px" Width="447px" />
                </td>
            </tr>
        </table>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="1" OnItemDataBound="ListView1_ItemDataBound">
            <LayoutTemplate>
                <table>
                    <tr id="groupPlaceHolder" runat="server"></tr>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr>
                    <td id="itemPlaceHolder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <table border="1" width="750px" style="margin-bottom: 18Px">
                    <tr>
                        <td style="width: 200Px; align-content: stretch">
                            <asp:Label ID="PostedBy" runat="server" Text='<%# getName(Eval("PostedByID").ToString(),Eval("isProfessor").ToString()) %>' ForeColor="#000066" Font-Bold="true"></asp:Label>
                            :
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Commnet")%>' />
                        </td>
                        <td style="width: 550Px; align-content: stretch">
                            <iframe runat="server" id="commentVideo" src='<%# Eval("URL") %>' frameborder="0"></iframe>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <table border="1" style="background-color: #ebdd99; margin-bottom: 18px" width="750px">
                    <tr>
                        <td style="width: 550Px; align-content: stretch">
                            <iframe runat="server" id="commentVideo" src='<%# Eval("URL") %>' frameborder="0"></iframe>
                        </td>
                        <td style="width: 200Px; align-content: stretch">
                            <asp:Label ID="PostedBy" runat="server" Text='<%# getName(Eval("PostedByID").ToString(),Eval("isProfessor").ToString()) %>' ForeColor="#000066" Font-Bold="true"></asp:Label>
                            :
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Commnet")%>' />
                        </td>
                    </tr>
                </table>

            </AlternatingItemTemplate>

        </asp:ListView>
    </div>
    <br />

</asp:Content>

