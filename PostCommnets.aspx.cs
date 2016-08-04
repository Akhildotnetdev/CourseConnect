using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class PostCommnets : System.Web.UI.Page
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
        commentsLi.Attributes["class"] = "selected blog";
        HtmlGenericControl contactLi = masterPage.Contact;
        contactLi.Attributes["class"] = "contact";
        HtmlGenericControl bkcolorRef = masterPage.Background;
        bkcolorRef.Attributes["class"] = "blog-page";
        }
        if (User.Identity.IsAuthenticated)
        {
            LoadDataToGridView();           
        }
        else
        {

            //user not logged in 
            MsgBox("Please login to view Comments", this.Page, this);
           
        }
        
    }
    protected void PC_DL_Courses_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataView dvSql = (DataView)SDSCourse.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView drvSql in dvSql)
        {
            if (drvSql["CourseID"].ToString() == PC_DL_Courses.SelectedValue)
            {
                PC_LB_Credits.Text = "Credits: "+ drvSql["CreditsPossible"].ToString();
                PC_LB_Semester.Text = drvSql["SEMOffered"].ToString();
            
            }
        }
    }
     protected void PC_B_Reset_Click(object sender, EventArgs e)    
    {

    }

  //Method to handel the button click for submitting the comment
     protected void PC_B_Submit_Click(object sender, EventArgs e)
    {
        if (PC_DL_Courses.SelectedValue != "")
        {
            if (Roles.IsUserInRole(User.Identity.Name, utiliFuntions.studentRole) || Roles.IsUserInRole(User.Identity.Name, utiliFuntions.professorRole))
            {
                string commentID = utiliFuntions.getNextuniqueID("CM");
                int recordsUpdated = 0;
                string commnetURL = "NA";

                // pass the value in the URL only if given any.
                if (PC_LB_VidURL.Text.Length > 0 )
                {
                    commnetURL = PC_LB_VidURL.Text;
                }
                string Role = utiliFuntions.checkIFStudentorProfessor(User.Identity.Name);
                string isProf = ( Role == "PF" ) ? "YES": "NO";
                string UserID = CourseConnectAccess.getUserID(Role, User.Identity.Name);
                // method to update the comment in the database
                recordsUpdated = CourseConnectAccess.insterCommnet(commentID,
                   PC_LB_Comment.Text,
                   commnetURL,
                   PC_DL_Courses.SelectedValue,
                   UserID,
                   isProf);

                string messageText = "Commnet Posted for: " + PC_DL_Courses.SelectedValue + "  as user: " + User.Identity.Name;
                MsgBox(messageText, this.Page, this);
                LoadDataToGridView();
                clearData();
                //Response.Redirect("/Default.aspx");
            }
            else
            {
                MsgBox("Only logged in Professors / Students can post comments", this.Page, this);
            }
        }
        else
        {
            MsgBox("Please select course to post comment", this.Page, this);
        }
    }
     public void clearData()
     {
         PC_LB_Comment.Text = null;
         PC_LB_VidURL.Text = null;

     }
    public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }   

    protected void PC_GV_Comments_RowEditing(object sender, GridViewEditEventArgs e)
    {
        PC_GV_Comments.EditIndex = e.NewEditIndex;
        PC_GV_Comments.DataBind();
    }
    protected void PC_GV_Comments_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        PC_GV_Comments.EditIndex = -1;
        PC_GV_Comments.DataBind();
    }
    protected void PC_GV_Comments_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //Code to udpate the comments table with the changed comments.

        Label commentID = (Label)PC_GV_Comments.Rows[e.RowIndex].FindControl("PC_LB_CommentID");
        string Role = utiliFuntions.checkIFStudentorProfessor(User.Identity.Name);
        string UserID = CourseConnectAccess.getUserID(Role, User.Identity.Name);

        TextBox comment = (TextBox)PC_GV_Comments.Rows[e.RowIndex].FindControl("PC_TB_Comment");

        TextBox videoURL = (TextBox)PC_GV_Comments.Rows[e.RowIndex].FindControl("PC_TB_VideoComment");
        string URl = "NA";
        if(videoURL.Text != "" )
        {
        URl = videoURL.Text;
        }
        Label courseID = (Label)PC_GV_Comments.Rows[e.RowIndex].FindControl("Label5");

        int rowsUpdated = CourseConnectAccess.updateComments(UserID, comment.Text, URl, commentID.Text);

        PC_GV_Comments.EditIndex = -1;

        LoadDataToGridView();
    }

    // This method is to load the data in to the gridview.
    public void LoadDataToGridView()
    {
        string Role = utiliFuntions.checkIFStudentorProfessor(User.Identity.Name);
        string UserID = CourseConnectAccess.getUserID(Role, User.Identity.Name);
        string testUserID = Profile.userID;
        DataTable commnetsData = CourseConnectAccess.getCommentsByID(UserID);
        PC_GV_Comments.DataSource = commnetsData;
        PC_GV_Comments.DataBind();
    
    }
    protected void PC_GV_Comments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        // if the video URl does not have any data display NA.

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // to check the data before display
            //update data to fields if any required
        }

    }
    protected void PC_GV_Comments_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        //LoadDataToGridView();
        //MsgBox("Comment Deleted", this.Page, this);
    }
    protected void PC_GV_Comments_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label commentID = (Label)PC_GV_Comments.Rows[e.RowIndex].FindControl("PC_LB_CommentID");        

        int rowsUpdated = CourseConnectAccess.deleteCommnet(commentID.Text);

        LoadDataToGridView();
        MsgBox("Comment Deleted", this.Page, this);
    }
}