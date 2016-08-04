<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="professorAdmin.aspx.cs" Inherits="professorAdmin" %>

<%@ Register src="SystemStatus.ascx" tagname="SystemStatus" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div>

        <asp:SqlDataSource ID="PA_SDS_Course" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" DeleteCommand="DELETE FROM [Courses] WHERE [CourseID] = @original_CourseID" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [CourseID], [CourseName], [SchoolID], [DegreeID], [DepartmentID], [CRC_VideoURL], [Details], [SEMOffered], [CreditsPossible] FROM [Courses] WHERE ([ProfID] = @ProfID)" UpdateCommand="UPDATE [Courses] SET [CourseName] = @CourseName, [SchoolID] = @SchoolID, [DegreeID] = @DegreeID, [DepartmentID] = @DepartmentID, [CRC_VideoURL] = @CRC_VideoURL, [Details] = @Details, [SEMOffered] = @SEMOffered, [CreditsPossible] = @CreditsPossible WHERE [CourseID] = @original_CourseID">
            <DeleteParameters>
                <asp:Parameter Name="original_CourseID" Type="String" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="PA_LB_ProfName" Name="ProfID" PropertyName="Text" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CourseName" Type="String" />
                <asp:Parameter Name="SchoolID" Type="String" />
                <asp:Parameter Name="DegreeID" Type="String" />
                <asp:Parameter Name="DepartmentID" Type="String" />
                <asp:Parameter Name="CRC_VideoURL" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
                <asp:Parameter Name="SEMOffered" Type="String" />
                <asp:Parameter Name="CreditsPossible" Type="String" />
                <asp:Parameter Name="original_CourseID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <uc1:SystemStatus ID="SystemStatus1" runat="server" />
        <b>Professor:
            <asp:Label ID="PA_LB_ProfName" runat="server" Text="Label"></asp:Label></b><br />
        <b>Course Offered</b>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="CourseID" DataSourceID="PA_SDS_Course" ForeColor="Black" GridLines="Vertical" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID" />
                <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                <asp:TemplateField HeaderText="School" SortExpression="SchoolID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Schools_DL" runat="server" SelectedValue='<%# Bind("SchoolID") %>' DataSource='<%# CourseConnectAccess.getSchools() %>' DataTextField="SchoolName" DataValueField="SchoolID"></asp:DropDownList>
                        <%--<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SchoolID") %>'></asp:TextBox>--%>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SchoolID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("SchoolID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Department" SortExpression="DepartmentID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Department_DL" SelectedValue='<%# Bind("DepartmentID") %>' runat="server" DataSource='<%# CourseConnectAccess.getDepartmentsFromShoolID("SC1234")%>' DataValueField="DepartmentID" DataTextField="DepartmentName"></asp:DropDownList>
                        <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DepartmentID") %>'></asp:TextBox>--%>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DepartmentID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("DepartmentID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Degree" SortExpression="DegreeID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Degree_DL" SelectedValue='<%# Bind("DegreeID") %>' DataSource='<%# CourseConnectAccess.getDegreesFromSchoolID()%>' DataValueField="DegreeID" DataTextField="DegreeName" runat="server"></asp:DropDownList>
                        <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DegreeID") %>'></asp:TextBox>--%>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DegreeID") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DegreeID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CRC_VideoURL" HeaderText="Video" SortExpression="CRC_VideoURL" />
                <asp:TemplateField HeaderText="Details" SortExpression="Details">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" TextMode="MultiLine" runat="server" Text='<%# Bind("Details") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Details") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Details") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SEMOffered" HeaderText="Semester" SortExpression="SEMOffered" />
                <asp:BoundField DataField="CreditsPossible" HeaderText="Credits" SortExpression="CreditsPossible" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
        </asp:DetailsView>

    </div>
</asp:Content>

