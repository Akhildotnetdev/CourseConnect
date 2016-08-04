using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class CommnetsToCourse : System.Web.UI.Page
{
    static string professorId = null;
    static string prevPage = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!IsPostBack)
        {
            prevPage = Request.UrlReferrer.ToString();
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
            //Cancel.Attributes.Add("onClick", "javascript:history.back(); return false;");
            //Redirect.Attributes.Add("onClick", "javascript:history.back(-2); return false;");
        }
        getCourseDetails();
    }

    //Method to get the required course details
    private void getCourseDetails()
    {
        String courseID = Request.QueryString["courseID"];
        CourseID.Text = courseID;
        DataView dview = (DataView)SDSCourseDetails.Select(DataSourceSelectArguments.Empty);
        CourseName.Text = (String)dview.Table.Rows[0]["CourseName"];
        ProfessorName.Text = (String)dview.Table.Rows[0]["ProfName"];
        ProfessorName.Text = (String)dview.Table.Rows[0]["ProfName"];        
        professorId = (String)dview.Table.Rows[0]["ProfID"];
    }

    //This method is used to get back to the comments listpage.
    protected void Cancel_Click(object sender, EventArgs e)
    {
      
        Response.Redirect(prevPage);
    }

    //update the comments table with the comment added
    protected void Update_Click(object sender, EventArgs e)
    {
        // create a method to get a new unique comment number
        string commentID = utiliFuntions.getNextuniqueID("CM");
        int recordsUpdated = 0;
        string commnetURL = "NA";
        
        
        if( CommentURL.Text.Length > 2)
        {
            commnetURL = CommentURL.Text;
        }

        // method to update the comment in the database
            recordsUpdated = CourseConnectAccess.insterCommnet(commentID,
               Commnet.Text,
               commnetURL,
               CourseID.Text,
               utiliFuntions.userID,              
               utiliFuntions.isProfessor);

        //Display the pop us message to the user
        string messageText = "Commnet Posted for: "+CourseID.Text +"  as user: "+ utiliFuntions.userName;
        MsgBox(messageText, this.Page, this);
        Update.Visible = false;
        Redirect.Visible = true;
        
        //Response.Redirect("/StudentComments.aspx");       
    }

    public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }

    protected void Redirect_Click(object sender, EventArgs e)
    {
        Response.Redirect(prevPage);
    }
}