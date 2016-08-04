using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserRoles : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SS_LB_ActiveUsers.Text = Membership.GetNumberOfUsersOnline().ToString();
        SS_LB_Courses.Text = CourseConnectAccess.getnoOfCourses().ToString();
    }
}