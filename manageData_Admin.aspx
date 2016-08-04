<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageData_Admin.aspx.cs" Inherits="manageData_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" DeleteCommand="DELETE FROM [Courses] WHERE [CourseID] = @original_CourseID AND [CourseName] = @original_CourseName AND (([DepartmentID] = @original_DepartmentID) OR ([DepartmentID] IS NULL AND @original_DepartmentID IS NULL)) AND (([SchoolID] = @original_SchoolID) OR ([SchoolID] IS NULL AND @original_SchoolID IS NULL)) AND (([DegreeID] = @original_DegreeID) OR ([DegreeID] IS NULL AND @original_DegreeID IS NULL)) AND (([ProfID] = @original_ProfID) OR ([ProfID] IS NULL AND @original_ProfID IS NULL)) AND (([CRC_VideoURL] = @original_CRC_VideoURL) OR ([CRC_VideoURL] IS NULL AND @original_CRC_VideoURL IS NULL)) AND (([Details] = @original_Details) OR ([Details] IS NULL AND @original_Details IS NULL)) AND (([SEMOffered] = @original_SEMOffered) OR ([SEMOffered] IS NULL AND @original_SEMOffered IS NULL)) AND (([CreditsPossible] = @original_CreditsPossible) OR ([CreditsPossible] IS NULL AND @original_CreditsPossible IS NULL))" InsertCommand="INSERT INTO [Courses] ([CourseID], [CourseName], [DepartmentID], [SchoolID], [DegreeID], [ProfID], [CRC_VideoURL], [Details], [SEMOffered], [CreditsPossible]) VALUES (@CourseID, @CourseName, @DepartmentID, @SchoolID, @DegreeID, @ProfID, @CRC_VideoURL, @Details, @SEMOffered, @CreditsPossible)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Courses]" UpdateCommand="UPDATE [Courses] SET [CourseName] = @CourseName, [DepartmentID] = @DepartmentID, [SchoolID] = @SchoolID, [DegreeID] = @DegreeID, [ProfID] = @ProfID, [CRC_VideoURL] = @CRC_VideoURL, [Details] = @Details, [SEMOffered] = @SEMOffered, [CreditsPossible] = @CreditsPossible WHERE [CourseID] = @original_CourseID AND [CourseName] = @original_CourseName AND (([DepartmentID] = @original_DepartmentID) OR ([DepartmentID] IS NULL AND @original_DepartmentID IS NULL)) AND (([SchoolID] = @original_SchoolID) OR ([SchoolID] IS NULL AND @original_SchoolID IS NULL)) AND (([DegreeID] = @original_DegreeID) OR ([DegreeID] IS NULL AND @original_DegreeID IS NULL)) AND (([ProfID] = @original_ProfID) OR ([ProfID] IS NULL AND @original_ProfID IS NULL)) AND (([CRC_VideoURL] = @original_CRC_VideoURL) OR ([CRC_VideoURL] IS NULL AND @original_CRC_VideoURL IS NULL)) AND (([Details] = @original_Details) OR ([Details] IS NULL AND @original_Details IS NULL)) AND (([SEMOffered] = @original_SEMOffered) OR ([SEMOffered] IS NULL AND @original_SEMOffered IS NULL)) AND (([CreditsPossible] = @original_CreditsPossible) OR ([CreditsPossible] IS NULL AND @original_CreditsPossible IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_CourseID" Type="String" />
                <asp:Parameter Name="original_CourseName" Type="String" />
                <asp:Parameter Name="original_DepartmentID" Type="String" />
                <asp:Parameter Name="original_SchoolID" Type="String" />
                <asp:Parameter Name="original_DegreeID" Type="String" />
                <asp:Parameter Name="original_ProfID" Type="String" />
                <asp:Parameter Name="original_CRC_VideoURL" Type="String" />
                <asp:Parameter Name="original_Details" Type="String" />
                <asp:Parameter Name="original_SEMOffered" Type="String" />
                <asp:Parameter Name="original_CreditsPossible" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CourseID" Type="String" />
                <asp:Parameter Name="CourseName" Type="String" />
                <asp:Parameter Name="DepartmentID" Type="String" />
                <asp:Parameter Name="SchoolID" Type="String" />
                <asp:Parameter Name="DegreeID" Type="String" />
                <asp:Parameter Name="ProfID" Type="String" />
                <asp:Parameter Name="CRC_VideoURL" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
                <asp:Parameter Name="SEMOffered" Type="String" />
                <asp:Parameter Name="CreditsPossible" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CourseName" Type="String" />
                <asp:Parameter Name="DepartmentID" Type="String" />
                <asp:Parameter Name="SchoolID" Type="String" />
                <asp:Parameter Name="DegreeID" Type="String" />
                <asp:Parameter Name="ProfID" Type="String" />
                <asp:Parameter Name="CRC_VideoURL" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
                <asp:Parameter Name="SEMOffered" Type="String" />
                <asp:Parameter Name="CreditsPossible" Type="String" />
                <asp:Parameter Name="original_CourseID" Type="String" />
                <asp:Parameter Name="original_CourseName" Type="String" />
                <asp:Parameter Name="original_DepartmentID" Type="String" />
                <asp:Parameter Name="original_SchoolID" Type="String" />
                <asp:Parameter Name="original_DegreeID" Type="String" />
                <asp:Parameter Name="original_ProfID" Type="String" />
                <asp:Parameter Name="original_CRC_VideoURL" Type="String" />
                <asp:Parameter Name="original_Details" Type="String" />
                <asp:Parameter Name="original_SEMOffered" Type="String" />
                <asp:Parameter Name="original_CreditsPossible" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CourseID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:TemplateField HeaderText="Course ID" SortExpression="CourseID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CourseID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CourseID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Course Name" SortExpression="CourseName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CourseName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CourseName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Department ID" SortExpression="DepartmentID" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DepartmentID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("DepartmentID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="School ID" SortExpression="SchoolID" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("SchoolID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("SchoolID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DegreeID" SortExpression="DegreeID" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("DegreeID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("DegreeID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ProfID" SortExpression="ProfID" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ProfID") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ProfID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CRC_VideoURL" SortExpression="CRC_VideoURL" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("CRC_VideoURL") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("CRC_VideoURL") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Details" SortExpression="Details" Visible="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Details") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Details") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Semester" SortExpression="SEMOffered">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("SEMOffered") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("SEMOffered") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Credits" SortExpression="CreditsPossible">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("CreditsPossible") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("CreditsPossible") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="MD_SDS_CourseDetails" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" DeleteCommand="DELETE FROM Courses WHERE (CourseID = @CourseID)" InsertCommand="INSERT INTO [Courses] ([CourseID], [CourseName], [DepartmentID], [SchoolID], [DegreeID], [ProfID], [CRC_VideoURL], [Details], [SEMOffered], [CreditsPossible]) VALUES (@CourseID, @CourseName, @DepartmentID, @SchoolID, @DegreeID, @ProfID, @CRC_VideoURL, @Details, @SEMOffered, @CreditsPossible)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Courses] WHERE ([CourseID] = @CourseID)" UpdateCommand="UPDATE Courses SET CourseName = @CourseName, DepartmentID = @DepartmentID, SchoolID = @SchoolID, DegreeID = @DegreeID, ProfID = @ProfID, CRC_VideoURL = @CRC_VideoURL, Details = @Details, SEMOffered = @SEMOffered, CreditsPossible = @CreditsPossible WHERE (CourseID = @original_CourseID)">
            <DeleteParameters>
                <asp:Parameter Name="CourseID" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CourseID" Type="String" />
                <asp:Parameter Name="CourseName" Type="String" />
                <asp:Parameter Name="DepartmentID" Type="String" />
                <asp:Parameter Name="SchoolID" Type="String" />
                <asp:Parameter Name="DegreeID" Type="String" />
                <asp:Parameter Name="ProfID" Type="String" />
                <asp:Parameter Name="CRC_VideoURL" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
                <asp:Parameter Name="SEMOffered" Type="String" />
                <asp:Parameter Name="CreditsPossible" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="CourseID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CourseName" Type="String" />
                <asp:Parameter Name="DepartmentID" Type="String" />
                <asp:Parameter Name="SchoolID" Type="String" />
                <asp:Parameter Name="DegreeID" Type="String" />
                <asp:Parameter Name="ProfID" Type="String" />
                <asp:Parameter Name="CRC_VideoURL" Type="String" />
                <asp:Parameter Name="Details" Type="String" />
                <asp:Parameter Name="SEMOffered" Type="String" />
                <asp:Parameter Name="CreditsPossible" Type="String" />
                <asp:Parameter Name="original_CourseID" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="CourseID" DataSourceID="MD_SDS_CourseDetails" Height="50px" Width="125px" OnItemUpdated="DetailsView1_ItemUpdated" OnItemUpdating="DetailsView1_ItemUpdating">
            <Fields>
                <asp:BoundField DataField="CourseID" HeaderText="CourseID" ReadOnly="True" SortExpression="CourseID" />
                <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                <asp:TemplateField HeaderText="School" SortExpression="SchoolID">
                    <EditItemTemplate>
                        <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SchoolID") %>'></asp:TextBox>--%>
                        <asp:DropDownList ID="Schools_DL" runat="server" SelectedValue='<%# Bind("SchoolID") %>' DataSource='<%# getSchools() %>' DataTextField="SchoolName" DataValueField="SchoolID"></asp:DropDownList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SchoolID") %>'></asp:TextBox>--%>
                        <asp:DropDownList ID="Schools_DL" SelectedValue='<%# Bind("SchoolID") %>' runat="server" DataSource='<%# getSchools() %>' DataTextField="SchoolName" DataValueField="SchoolID"></asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("SchoolID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Department" SortExpression="DepartmentID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Department_DL" SelectedValue='<%# Bind("DepartmentID") %>' runat="server" DataSource='<%# getDepartments()%>' DataValueField="DepartmentID" DataTextField="DepartmentName"></asp:DropDownList>
                        <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DepartmentID") %>'></asp:TextBox>--%>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="Department_DL" SelectedValue='<%# Bind("DepartmentID") %>' runat="server" DataSource='<%# getDepartments()%>' DataValueField="DepartmentID" DataTextField="DepartmentName"></asp:DropDownList>
                        <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DepartmentID") %>'></asp:TextBox>--%>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DepartmentID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Degree" SortExpression="DegreeID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Degree_DL" SelectedValue='<%# Bind("DegreeID") %>' DataSource='<%# getDegrees()%>' DataValueField="DegreeID" DataTextField="DegreeName" runat="server"></asp:DropDownList>
                        <%--<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DegreeID") %>'></asp:TextBox>--%>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="Degree_DL" SelectedValue='<%# Bind("DegreeID") %>' DataSource='<%# getDegrees()%>' DataValueField="DegreeID" DataTextField="DegreeName" runat="server"></asp:DropDownList>
                        <%--<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DegreeID") %>'></asp:TextBox>--%>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("DegreeID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Professor" SortExpression="ProfID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="Professor_DL" SelectedValue='<%# Bind("ProfID") %>' DataSource='<%# CourseConnectAccess.getProfessors() %>' DataTextField="ProfName" DataValueField="ProfID" runat="server"></asp:DropDownList>
                        <%--<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ProfID") %>'></asp:TextBox>--%>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="Professor_DL" SelectedValue='<%# Bind("ProfID") %>' DataSource='<%# CourseConnectAccess.getProfessors() %>' DataTextField="ProfName" DataValueField="ProfID" runat="server"></asp:DropDownList>
                        <%--<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ProfID") %>'></asp:TextBox>--%>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ProfID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CRC_VideoURL" HeaderText="Video URL" SortExpression="CRC_VideoURL" />
                <asp:TemplateField HeaderText="Details" SortExpression="Details">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" Text='<%# Bind("Details") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" Text='<%# Bind("Details") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Details") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SEMOffered" HeaderText="SEMOffered" SortExpression="SEMOffered" />
                <asp:BoundField DataField="CreditsPossible" HeaderText="CreditsPossible" SortExpression="CreditsPossible" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
    </div>
</asp:Content>

