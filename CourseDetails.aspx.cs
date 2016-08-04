using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class CourseDetails : System.Web.UI.Page
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

        this.setCourseIDToCookie();
        }        
    }

    // This method is to set the selected course ID to Cookie 
    private void setCourseIDToCookie()
    {
        HttpCookie CourseCookie = new HttpCookie("CoursIDCookie");
        if (Request.QueryString["courseID"] != "NA")
        {
            CourseCookie["CourseID"] = Request.QueryString["courseID"];
        }
        else
        {
            CourseCookie["CourseID"] = "NA";
        }
        Response.Cookies.Add(CourseCookie); 

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("PostCommnets.aspx");
    }

    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

        }


    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            HttpCookie profDetailsCookie = new HttpCookie("ProfDetails");

              DataView dview = (DataView)SDSCourseDetails.Select(DataSourceSelectArguments.Empty);
              string value = (String)dview.Table.Rows[0]["ProfName"];
              profDetailsCookie["ProfName"] = (String)dview.Table.Rows[0]["ProfName"];
              profDetailsCookie["Specalization"] = (String)dview.Table.Rows[0]["Specalization"];              
              profDetailsCookie["Location"] = (String)dview.Table.Rows[0]["Location"];
              profDetailsCookie["CourseName"] = (String)dview.Table.Rows[0]["CourseName"];
              profDetailsCookie["SchoolName"] = (String)dview.Table.Rows[0]["SchoolName"];  
              profDetailsCookie["Email"] = (String)dview.Table.Rows[0]["Email"];
              profDetailsCookie["Expr1"] = (String)dview.Table.Rows[0]["Expr1"];  //details PDF URL

              if ((String)dview.Table.Rows[0]["ImgUrl"] != "NA")
              { 
              profDetailsCookie["Image"] = (String)dview.Table.Rows[0]["ImgUrl"];
              }
              else
              {
                  // set default image to Prof if not avilable in databse.
                  profDetailsCookie["Image"] = "http://sr.photos3.fotosearch.com/bthumb/CSP/CSP993/k14955079.jpg";
              }
              Response.Cookies.Add(profDetailsCookie);
            Response.Redirect("ProfessorDetails.aspx");
        }
    }

   
}