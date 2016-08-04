using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        { 
        MasterPage masterPage = (MasterPage)this.Master;
        HtmlGenericControl homeLi = masterPage.Home;
        homeLi.Attributes["class"] = "home";
        HtmlGenericControl aboutLi = masterPage.About;
        aboutLi.Attributes["class"] = "about";
        HtmlGenericControl userprofileLi = masterPage.UserProfile;
        userprofileLi.Attributes["class"] = "projects";
        HtmlGenericControl commentsLi = masterPage.Comments;
        commentsLi.Attributes["class"] = "blog";
        HtmlGenericControl contactLi = masterPage.Contact;
        contactLi.Attributes["class"] = "selected contact";
        HtmlGenericControl backRef = masterPage.Background;
        backRef.Attributes["class"] = "contact-page";
        }

        string role = utiliFuntions.checkIFStudentorProfessor(User.Identity.Name);
        string userID = CourseConnectAccess.getUserID(role, User.Identity.Name);
        C_TB_UserID.Text = userID;
        C_TB_Name.Text = User.Identity.Name; 
    }


    protected void C_B_Submit_Click(object sender, EventArgs e)
    {
        // user this method to inset the userposted comment in to the database.

        int rowsInserted = CourseConnectAccess.inserContact(C_TB_Name.Text, C_TB_UserID.Text, C_TB_Email.Text, C_TB_IssueURL.Text, C_TB_Description.Text);

        if (rowsInserted > 0)
        {
            C_LB_Sucess.Text = "Your issue has been reporte; will respond accordingly";

            clearScreen();
        }
        else
        {
            C_LB_Sucess.Text = "Error in posting";
        }

    }

    public void clearScreen()
    { 
    // use this function to clear all the text in the screen.
                
        C_TB_Email.Text = null;
        C_TB_IssueURL.Text = null;
        C_TB_Description.Text = null;
    
    }
}