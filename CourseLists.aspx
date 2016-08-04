<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CourseLists.aspx.cs" Inherits="CourseLists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div id="courseSelection">

        <asp:SqlDataSource ID="SDSSchool" runat="server" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" SelectCommand="SELECT [SchoolID], [SchoolName] FROM [School]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSCourse" runat="server" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" SelectCommand="SELECT CourseID, CourseName, SEMOffered, CreditsPossible FROM Courses WHERE (DegreeID = @DegreeID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="crcDLDegree" Name="DegreeID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSDegree" runat="server" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" SelectCommand="SELECT [DegreeID], [DegreeName], [DegreeCat] FROM [Degrees] WHERE ([DepartmentID] = @DepartmentID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="crcDLDepartment" Name="DepartmentID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" SelectCommand="SELECT [DepartmentID], [DepartmentName] FROM [Department] WHERE ([SchoolID] = @SchoolID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="crcDLSchool" Name="SchoolID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table>
            <tr>
                <td>School:
                    <asp:DropDownList ID="crcDLSchool" runat="server" DataSourceID="SDSSchool" DataTextField="SchoolName" DataValueField="SchoolID" AutoPostBack="True"></asp:DropDownList>
                </td>
                <td>Department:
                    <asp:DropDownList ID="crcDLDepartment" runat="server" DataSourceID="SDSDepartment" DataTextField="DepartmentName" DataValueField="DepartmentID" AutoPostBack="True"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Degree:<asp:DropDownList ID="crcDLDegree" runat="server" AutoPostBack="True" DataSourceID="SDSDegree" DataTextField="DegreeName" DataValueField="DegreeID"></asp:DropDownList>
                </td>
            </tr>

        </table>

        <br />
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="CourseID" DataSourceID="SDSCourse" OnSelectedIndexChanged="ListView1_SelectedIndexChanged">
            <AlternatingItemTemplate>
                <tr style="background-color: #FAFAD2; color: #284775;">
                    <td>
                        <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SEMOfferedLabel" runat="server" Text='<%# Eval("SEMOffered") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Credits_Label" runat="server" Text='<%# Eval("CreditsPossible") %>' />
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Vew Details" CommandName="Select" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>No Courses Avilable</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr style="background-color: #FFFBD6; color: #333333;">
                    <td>
                        <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SEMOfferedLabel" runat="server" Text='<%# Eval("SEMOffered") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Credits_Label" runat="server" Text='<%# Eval("CreditsPossible") %>' />
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Vew Details" CommandName="Select" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #FFFBD6; color: #333333;">
                                    <th runat="server">CourseID</th>
                                    <th runat="server">CourseName</th>
                                    <th runat="server">Sem Offered</th>
                                    <th runat="server">Credits</th>
                                    <th runat="server">Select</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                    <td>
                        <asp:Label ID="CourseIDLabel" runat="server" Text='<%# Eval("CourseID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="SEMOfferedLabel" runat="server" Text='<%# Eval("SEMOffered") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Credits_Label" runat="server" Text='<%# Eval("CreditsPossible") %>' />
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Vew Details" CommandName="Select" />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />

    </div>




    <%-- <div id= "video">
 <iframe width="420" height="345"
src="http://www.youtube.com/embed/XGSy3_Czz8k">
</iframe>
    
     <br />
   <a href="ProfessorDetails.aspx" id="cl_professorName">[Professor Name]</a>
     <br />
     <a href="CourseDetails.aspx">[Breif Course Details]</a>

 </div>--%>
</asp:Content>

