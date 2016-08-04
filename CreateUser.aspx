<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div id="page" style="background-color: whitesmoke">
        <div>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="userCreation" runat="server">

                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser" LoginCreatedUser="false">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="User Created Sucessfuly Update Roles"></asp:Label>
                                    <br />
                                </ContentTemplate>
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                </asp:View>
                <asp:View ID="roleCreation" runat="server">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem>Professor</asp:ListItem>
                        <asp:ListItem>Student</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:Label ID="Label2" runat="server" Text="Created User:"></asp:Label>
                    <br />
                    <asp:Button ID="UserCreated" runat="server" OnClick="UserCreated_Click" Text="Generate ID with Role" />
                    <br />
                    <asp:Button ID="ReturnToAdmin" runat="server" Text="Return to Admin" Visible="False" OnClick="ReturnToAdmin_Click" />
                </asp:View>
            </asp:MultiView>
        </div>
    </div>

</asp:Content>
