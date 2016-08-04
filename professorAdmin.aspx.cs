using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class professorAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Roles.IsUserInRole(User.Identity.Name, utiliFuntions.professorRole))
        {
            string userId = CourseConnectAccess.getUserID("PF", User.Identity.Name);
            PA_LB_ProfName.Text = userId;
        }
    }
}