<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CourseDetails.aspx.cs" Inherits="CourseDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <br />
    <asp:SqlDataSource ID="SDSCourseDetails" runat="server" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" SelectCommand="SELECT Courses.CourseName, Courses.CourseID, Courses.CRC_VideoURL, Courses.Details, Courses.SEMOffered, Courses.CreditsPossible, Degrees.DegreeName, Degrees.DegreeCat, School.SchoolName, Professors.ProfName, Professors.Specalization, Professors.Location, Professors.Email, Professors.Details AS Expr1, Courses.CreditsPossible AS Expr2, Professors.SchoolID, Professors.DepartmentID, Professors.ProfID, Professors.ImgUrl FROM Courses INNER JOIN Degrees ON Courses.DegreeID = Degrees.DegreeID INNER JOIN Department ON Courses.DepartmentID = Department.DepartmentID INNER JOIN Professors ON Courses.ProfID = Professors.ProfID INNER JOIN School ON Courses.SchoolID = School.SchoolID WHERE (Courses.CourseID = @CourseID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CourseID" QueryStringField="CourseID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SDSCourseDetails" ForeColor="Black" GridLines="None" AutoGenerateRows="False" OnItemCommand="DetailsView1_ItemCommand">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <Fields>
            <asp:TemplateField HeaderText="CourseIntro">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <iframe width="560"
                        height="315" src='<%# Eval("CRC_VideoURL") %>'
                        frameborder="0"></iframe>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="CourseName">
                <ItemTemplate>
                    <asp:Label ID="CourseName" runat="server" Text='<%# Eval("CourseName") %>'>'</asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CourseNumber">
                <ItemTemplate>
                    <asp:Label ID="CouseID" runat="server" Text='<%# Eval("CourseID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Course Information">
                <ItemTemplate>
                    <asp:Label ID="CourseDetails" runat="server" Text='<%# Eval("Details") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Semester Offered">
                <ItemTemplate>
                    <asp:Label ID="SemOffered" runat="server" Text='<%# Eval("SEMOffered") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Credits">
                <ItemTemplate>
                    <asp:Label ID="Credits" runat="server" Text='<%# Eval("CreditsPossible") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Degree:">
                <ItemTemplate>
                    <asp:Label ID="Degree" runat="server" Text='<%# Eval("DegreeName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Degree Type">
                <ItemTemplate>
                    <asp:Label ID="DegreeType" runat="server" Text='<%# Eval("DegreeCat") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="School Name">
                <ItemTemplate>
                    <asp:Label ID="SchoolName" runat="server" Text='<%# Eval("SchoolName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Professor">
                <ItemTemplate>
                    <asp:LinkButton ID="Professor" runat="server" Text='<%# Eval("ProfName") %>' CommandName="Select"> </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

        </Fields>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
    </asp:DetailsView>
    <div>


        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="StudentComments.aspx">
            <asp:Image ID="commentsImage" runat="server" ImageUrl="/images/Commnets.png" ToolTip="ViewComments" />
        </asp:HyperLink>
    </div>


</asp:Content>

