<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PostCommnets.aspx.cs" Inherits="PostCommnets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 341px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <b>Here you can post your commnet directly to a particular course. Select School and Degree to see all the courses</b>
        <br />
        <asp:SqlDataSource ID="SDSSchools" runat="server" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" SelectCommand="SELECT [SchoolID], [SchoolName] FROM [School]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSDepartments" runat="server" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" SelectCommand="SELECT [DepartmentID], [DepartmentName] FROM [Department] WHERE ([SchoolID] = @SchoolID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="PC_DL_Schools" Name="SchoolID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSCourse" runat="server" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" SelectCommand="SELECT [CourseID], [CourseName], [DepartmentID], [ProfID], [Details], [SEMOffered], [CreditsPossible] FROM [Courses] WHERE ([DegreeID] = @DegreeID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="PC_DL_Degree" Name="DegreeID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSDegree" runat="server" ConnectionString="<%$ ConnectionStrings:CourseConnect %>" SelectCommand="SELECT [DegreeID], [DegreeName] FROM [Degrees] WHERE ([DepartmentID] = @DepartmentID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="PC_DL_Department" Name="DepartmentID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />

        <table style="margin-top: 10Px; width: 675px; height: 245px;">
            <tr>
                <td class="auto-style1">School:
                    <asp:DropDownList ID="PC_DL_Schools" runat="server" DataSourceID="SDSSchools" DataTextField="SchoolName" DataValueField="SchoolID" AutoPostBack="True">
                    </asp:DropDownList></td>

                <td>Department:
                    <asp:DropDownList ID="PC_DL_Department" runat="server" DataSourceID="SDSDepartments" DataTextField="DepartmentName" DataValueField="DepartmentID" AutoPostBack="True">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="auto-style1">Degree:
                    <asp:DropDownList ID="PC_DL_Degree" runat="server" DataSourceID="SDSDegree" DataTextField="DegreeName" DataValueField="DegreeID" AutoPostBack="True" Width="199px">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td class="auto-style1">Course:
                    <asp:DropDownList ID="PC_DL_Courses" runat="server" DataSourceID="SDSCourse" DataTextField="CourseName" DataValueField="CourseID" OnSelectedIndexChanged="PC_DL_Courses_SelectedIndexChanged" AutoPostBack="True" Width="285px"></asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="PC_LB_Credits" runat="server"></asp:Label>
                </td>

            </tr>
            <tr>
                <td class="auto-style1">Semester</td>
                <td>
                    <asp:Label ID="PC_LB_Semester" runat="server"></asp:Label></td>
            </tr>

            <tr>
                <td class="auto-style1">Text Comment</td>
                <td>
                    <asp:TextBox ID="PC_LB_Comment" runat="server" TextMode="MultiLine" ToolTip="Enter comments"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style1">Video URL</td>
                <td>
                    <asp:TextBox ID="PC_LB_VidURL" runat="server"></asp:TextBox>

                </td>
            </tr>
            <tr>

                <td class="auto-style1">
                    <asp:Button ID="PC_B_Reset" runat="server" Text="Cancel" OnClick="PC_B_Reset_Click" /></td>

                <td>
                    <asp:Button ID="PC_B_Submit" runat="server" Text="Submit" OnClick="PC_B_Submit_Click" /></td>
            </tr>
        </table>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Connot post empty comments" ControlToValidate="PC_LB_Comment"></asp:RequiredFieldValidator>
        <div>
            <b>Comments posted by this user:</b>
            <asp:GridView ID="PC_GV_Comments" runat="server" Style="margin-top: 31px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="PC_GV_Comments_RowCancelingEdit" OnRowDataBound="PC_GV_Comments_RowDataBound" OnRowEditing="PC_GV_Comments_RowEditing" OnRowUpdating="PC_GV_Comments_RowUpdating" OnRowDeleted="PC_GV_Comments_RowDeleted" OnRowDeleting="PC_GV_Comments_RowDeleting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="CommentID" SortExpression="CommentsID" Visible="False">
                        <EditItemTemplate>
                            <asp:Label ID="PC_LB_CommentID" runat="server" Text='<%# Eval("CommentsID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="PC_LB_CommentID" runat="server" Text='<%# Bind("CommentsID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
                        <EditItemTemplate>
                            <asp:TextBox ID="PC_TB_Comment" runat="server" Text='<%# Bind("Commnet") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="PC_TB_Comment"
                                runat="server" ErrorMessage="Comment Cannot be null"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Commnet") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Video URL" SortExpression="URL">
                        <EditItemTemplate>
                            <asp:TextBox ID="PC_TB_VideoComment" runat="server" Text='<%# Bind("URL") %>'></asp:TextBox>

                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("URL") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course ID">
                        <EditItemTemplate>
                            <asp:TextBox ID="Label5" runat="server" Text='<%# Bind("CourseID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("CourseID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
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
        </div>




    </div>
</asp:Content>

