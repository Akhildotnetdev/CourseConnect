using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public HtmlGenericControl Home
    {
        get { return home; }

        set { home = value; }
    }

    public HtmlGenericControl About
    {
        get { return about; }

        set { about = value; }
    }

    public HtmlGenericControl UserProfile
    {
     get{return projects;}
     set{projects = value;}
    }

    public HtmlGenericControl Comments
    {
        get { return blog; }
        set { blog = value; }
    }

    public HtmlGenericControl Contact
    {
        get { return contact; }
        set { contact = value; }
    }

    public HtmlGenericControl Background
    {
        get { return pageBackgroundDiv; }
        set { pageBackgroundDiv = value; }
    }





}
