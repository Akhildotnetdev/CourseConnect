using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //use this event after sucessfull login to get the profile details
    //get the userID from the userName
    //Check profile type
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        //getIdbased on userName
        string userName = Login1.UserName;
        string userID = "NA";
        string[] userRole = Roles.GetRolesForUser(userName);
        if (Roles.IsUserInRole(userName, utiliFuntions.professorRole))
        {
            userID = CourseConnectAccess.getUserID("PF", userName);
            utiliFuntions.isProfessor = "YES";
            //Profile.isProfessor = "YES";
        }
        else if (Roles.IsUserInRole(userName, utiliFuntions.studentRole))
        {
            userID = CourseConnectAccess.getUserID("ST", userName);
            //Profile.isProfessor = "NO";
            utiliFuntions.isProfessor = "NO";
        }
        else
        {
            //Roles.AddUserToRole(userName, utiliFuntions.studentRole);
            utiliFuntions.isProfessor = "NO";
            //logged in user was not either professor / student cannot have StudentID / ProfessorID
        }

        if (userID != "NA")
        {
            utiliFuntions.userID = userID;
            utiliFuntions.userName = userName;        
        
        }
    }

}