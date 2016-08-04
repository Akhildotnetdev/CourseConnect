<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">



    <asp:Image ID="Image1" ImageUrl="images/univLogo.png" runat="server" ImageAlign="Middle" />
    <br />
    <p>
        As a student I always faced issue to know some basic details like what that course is all 
        about and how it helps in reaching our career goals…etc., regarding various courses offered,
         it is a hectic process to know about those details and get in contact with the professor offering the course, 
        scheduling a meeting with him to get all those details from him.
         <br />
        To avoid all that waste of time and to provide a single point where you can look for various courses offered 
            and to see what professor is saying about it also view what the other students saying about the courses 
            we created this <b>CourseConnect </b>an centralized tool get connected to your courses.
    </p>
    <br />

    <br />

    <table style="background-color: whitesmoke">
        <tr>
            <td>Total number Of Courses Avilable:</td>

            <td>
                <asp:Label ID="Count" runat="server" Text=" "></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Total No:of users:
                <asp:Label ID="numberOfUsers" runat="server" Text=" "></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="home_getstarted" runat="server" Text="Get Started" OnClick="home_getstarted_Click" />


</asp:Content>

