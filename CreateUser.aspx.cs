using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateUser : System.Web.UI.Page
{
    static bool displayRoleCreation = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.updateView();           
        }

    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
     // as the user is created 
       
        displayRoleCreation = true;
        this.updateView();  
      
    } 
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    //This method is called once the user is created sucessfully.
    protected void UserCreated_Click(object sender, EventArgs e)
    {
        string userName = CreateUserWizard1.UserName;
        string userID = " ";
        if (RadioButtonList1.SelectedValue == utiliFuntions.professorRole)
        {
            if (!Roles.IsUserInRole(userName, utiliFuntions.professorRole))
            {
                Roles.AddUserToRole(userName, utiliFuntions.professorRole);
                // Update Professor table generating new professor ID
                userID = utiliFuntions.createProfessor(userName);
            }
            if (Roles.IsUserInRole(userName, utiliFuntions.studentRole))
            {
                Roles.RemoveUserFromRole(userName, utiliFuntions.studentRole);               
            }
            Label2.Text = "Created UserID: "+userID+" for user: "+userName+ " . With role as: " + utiliFuntions.professorRole+" .";
        }
        else if (RadioButtonList1.SelectedValue == utiliFuntions.studentRole)
        {
            if (!Roles.IsUserInRole(userName, utiliFuntions.studentRole))
            {
                Roles.AddUserToRole(CreateUserWizard1.UserName, utiliFuntions.studentRole);
                // Update student table with new student ID and name.
                userID = utiliFuntions.createStudent(userName);
            }
            if (Roles.IsUserInRole(userName, utiliFuntions.professorRole))
            {
                Roles.RemoveUserFromRole(CreateUserWizard1.UserName, utiliFuntions.professorRole);
            }
            Label2.Text = "Created UserID: "+userID+" for user: "+userName+ " . With role as: " + utiliFuntions.studentRole+" .";

            RadioButtonList1.Visible = false;   
            UserCreated.Visible = false;
            ReturnToAdmin.Visible = true;
        }
    }

    //This method is used to update the multive based on the requirement.
    protected void updateView()
    {
        if (displayRoleCreation)
        {

            MultiView1.SetActiveView(roleCreation);
        }
        else
        {
            MultiView1.SetActiveView(userCreation);
        }
    
    }
    protected void ReturnToAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("/adminActios.aspx");
    }
}