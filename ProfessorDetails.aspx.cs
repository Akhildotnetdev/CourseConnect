using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ProfessorDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
        HttpCookie cookie = Request.Cookies["ProfDetails"];        
        ProfImage.ImageUrl = cookie["Image"];
        HyperLink1.NavigateUrl = cookie["Expr1"];
        Name.Text = cookie["ProfName"];
        Specalization.Text = cookie["Specalization"];
        School.Text = cookie["SchoolName"];
        Location.Text = cookie["Location"];
        Email.Text = cookie["Email"];
        Course.Text = cookie["CourseName"];
    }
}