<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CommnetsToCourse.aspx.cs" Inherits="CommnetsToCourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 556px;
        }

        .auto-style2 {
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <table>
            <tr style="margin-bottom: 10Px">
                <td class="auto-style2"><b>Course:</b>
                    <asp:Label ID="CourseName" runat="server" Text=" "></asp:Label>

                </td>
                <td class="auto-style1"><b>CourseId:</b>
                    <asp:Label ID="CourseID" runat="server" Text=" "></asp:Label>
                </td>
            </tr>
            <tr style="margin-bottom: 10Px">
                <td class="auto-style2"><b>ProfessorName:</b>
                    <asp:Label ID="ProfessorName" runat="server" Text=" "></asp:Label>
                </td>
            </tr>
            <tr style="margin-bottom: 10Px; height: 270Px">
                <td class="auto-style2"><b>Comment:</b>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="Commnet" runat="server" TextMode="MultiLine" Height="250" Width="542px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Cannot enter empty comment" ControlToValidate="Commnet"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="margin-bottom: 30Px">
                <td class="auto-style2">
                    <b>Commnet Video URL:</b>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="CommentURL" runat="server" Width="537px"></asp:TextBox>
                </td>
            </tr>
            <tr style="margin-bottom: 10Px; margin-top: 20Px">

                <td class="auto-style2">
                    <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" />
                </td>
                <td class="auto-style1">
                    <asp:Button ID="Update" runat="server" Text="PostComment!" OnClick="Update_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Redirect" runat="server" Text="Go To Commnets" Visible="false" OnClick="Redirect_Click" />
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SDSCourseDetails" runat="server" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" SelectCommand="SELECT Courses.CourseID, Courses.CourseName, Courses.ProfID, Professors.ProfName FROM Courses INNER JOIN Professors ON Courses.ProfID = Professors.ProfID WHERE (Courses.CourseID = @CourseID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="CourseID" QueryStringField="CourseID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

