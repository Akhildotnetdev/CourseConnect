using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //to update the slected item in the list
        if(!IsPostBack)
        {         
        MasterPage masterPage = (MasterPage)this.Master;
        HtmlGenericControl homeLi = masterPage.Home;
        homeLi.Attributes["class"] = "selected home";
        HtmlGenericControl aboutLi = masterPage.About;
        aboutLi.Attributes["class"] = "about";
        HtmlGenericControl userprofileLi = masterPage.UserProfile;
        userprofileLi.Attributes["class"] = "projects";
        HtmlGenericControl commentsLi = masterPage.Comments;
        commentsLi.Attributes["class"] = "blog";
        HtmlGenericControl contactLi = masterPage.Contact;
        contactLi.Attributes["class"] = "contact";
        HtmlGenericControl pageRef = masterPage.Background;
        pageRef.Attributes["class"] = "home-page";
        }

        UpdateThestatistics();

    }
    //This method is used to get the website details.
    private void UpdateThestatistics()
    {
        int count = Membership.GetAllUsers().Count;
        numberOfUsers.Text = count.ToString();
        int noOfCourses = CourseConnectAccess.getnoOfCourses();
        Count.Text = noOfCourses.ToString();
    }
 
    protected void home_getstarted_Click(object sender, EventArgs e)
    {
        Response.Redirect("CourseLists.aspx");
    }
}