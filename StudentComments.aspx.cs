using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class StudentComments : System.Web.UI.Page
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

            HttpCookie cookie = Request.Cookies["CoursIDCookie"];
            if (cookie["CourseID"] != "NA")
            {
                Label1.Text = cookie["CourseID"];
            }
            else
            {
                Label1.Text = "NA";
            }

            getDatataToDisplay();
        }
    }
    public void reloadThisPage()
    {
        Response.Redirect(Request.Path);
    }
    protected void getDatataToDisplay( )
    {
        //DataTable dtPubs = CourseConnectAccess.getCommnetsForCourse(Label1.Text);

        //GridView1.DataSource = dtPubs;
        //this.DataBind();
    }
    public string getName(string ID, string isProfessor)
    {
        string name = "NA";
        if (isProfessor == "YES")
        {
            name = CourseConnectAccess.getProfNamefromId(ID) + "(Professor)";
        }
        else
        {
            name = CourseConnectAccess.getStudentNamefromId(ID);
        }
        return name;
    }
 
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
       
            HtmlControl videoControl = (HtmlControl)e.Item.FindControl("commentVideo");
            if (videoControl.Attributes["src"] == "NA")
            {
                videoControl.Visible = false;
                videoControl.Attributes["width"] = "200px";
                videoControl.Attributes["height"] = "100";
            }
            else
            {
                videoControl.Attributes["width"] = "550Px";
                videoControl.Attributes["height"] = "250";
            }
        
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
            if (Roles.IsUserInRole(User.Identity.Name, utiliFuntions.studentRole) 
                || Roles.IsUserInRole(User.Identity.Name, utiliFuntions.professorRole)
                || Roles.IsUserInRole(User.Identity.Name,"admin"))
        {
            if (Label1.Text != "NA")
            {
                string url = "CommnetsToCourse.aspx?";

                url += "courseID=" + Label1.Text;

                //redirect to the details page with the selected course
                this.Dispose();
                Response.Redirect(url);
            }
            else
            {
                Response.Redirect("errorHandling.aspx");
            }

           
        }
        else
        {
            MsgBox("Only logged in Students / Professors can post a comment", this.Page, this);
        }
    }

    public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }
}