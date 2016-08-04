using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class UserProfile : System.Web.UI.Page
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
        userprofileLi.Attributes["class"] = "selected projects";
        HtmlGenericControl commentsLi = masterPage.Comments;
        commentsLi.Attributes["class"] = "blog";
        HtmlGenericControl contactLi = masterPage.Contact;
        contactLi.Attributes["class"] = "contact";
        HtmlGenericControl bkcolorRef = masterPage.Background;
        bkcolorRef.Attributes["class"] = "project-page";        
        if (User.Identity.IsAuthenticated)
        {
            getProfiledetails();
        }
        }
    }

   public void getProfiledetails()
    {

        TextBox userID = (TextBox)(this.LoginView1.FindControl("userID"));
        if (Roles.IsUserInRole(User.Identity.Name, utiliFuntions.professorRole))
        {
            userID.Text = CourseConnectAccess.getUserID("PF", User.Identity.Name);
        }
        else if (Roles.IsUserInRole(User.Identity.Name, utiliFuntions.studentRole))
        {
            userID.Text = CourseConnectAccess.getUserID("ST", User.Identity.Name);
        }

        TextBox userName = (TextBox)(this.LoginView1.FindControl("userName"));
        userName.Text = User.Identity.Name;

        TextBox contact = (TextBox)(this.LoginView1.FindControl("contact"));
        contact.Text = Profile.contact;

        TextBox email = (TextBox)(this.LoginView1.FindControl("email"));
        email.Text = Profile.email;

        TextBox address = (TextBox)(this.LoginView1.FindControl("address"));
        address.Text = Profile.address;

    }


    public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }
  
    protected void UpdateDetails_Click(object sender, EventArgs e)
    {
        TextBox userID = (TextBox)(this.LoginView1.FindControl("userID"));
        if (Roles.IsUserInRole(User.Identity.Name, utiliFuntions.professorRole))
        {
            Profile.userID = CourseConnectAccess.getUserID("PF", User.Identity.Name);
            Profile.isProfessor = "YES";
        }
        else if (Roles.IsUserInRole(User.Identity.Name, utiliFuntions.studentRole))
        {
            Profile.userID = CourseConnectAccess.getUserID("PF", User.Identity.Name);
            Profile.isProfessor = "NO";
        }

        TextBox userName = (TextBox)(this.LoginView1.FindControl("userName"));
        Profile.userName = userName.Text;

        TextBox contact = (TextBox)(this.LoginView1.FindControl("contact"));
        Profile.contact = contact.Text;

        TextBox email = (TextBox)(this.LoginView1.FindControl("email"));
        Profile.email = email.Text;

        TextBox address = (TextBox)(this.LoginView1.FindControl("address"));
        Profile.address = address.Text;

        Profile.Save();
        
        if (User.Identity.IsAuthenticated)
        {
            getProfiledetails();
        }
    }
   
}