using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminActios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //this is for creating the User
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("/CreateUser.aspx");
    }
    //This method is to open access to Database access to admin.
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("/manageData_Admin.aspx");
    }
}