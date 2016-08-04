using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class CourseLists : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        { 
        MasterPage masterPage = (MasterPage)this.Master;
        HtmlGenericControl homeLi = masterPage.Home;
        homeLi.Attributes["class"] = "home";
        HtmlGenericControl aboutLi = masterPage.About;
        aboutLi.Attributes["class"] = "selected about";
        HtmlGenericControl userprofileLi = masterPage.UserProfile;
        userprofileLi.Attributes["class"] = "projects";
        HtmlGenericControl commentsLi = masterPage.Comments;
        commentsLi.Attributes["class"] = "blog";
        HtmlGenericControl contactLi = masterPage.Contact;
        contactLi.Attributes["class"] = "contact";
        HtmlGenericControl pageRef = masterPage.Background;
        pageRef.Attributes["class"] = "about-page";
        }
        //this.DataBind();

    }



    //method to hadel the selet action on the list view.
    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        string CourseSelected = ListView1.SelectedDataKey.Value.ToString();

        string url = "CourseDetails.aspx?";

        url += "courseID=" + CourseSelected;

        //redirect to the details page with the selected course
        Response.Redirect(url);

    }

    
}