using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manageData_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    // To get all the schools data
    public DataTable getSchools()
    {

        DataTable schools = CourseConnectAccess.getSchools();
        return schools;    
    }

    //to get all the departments.
    public DataTable getDepartments()
    {


        DataTable departmentsRequired = null;
        DropDownList shoolSelected = (DropDownList)DetailsView1.FindControl("Schools_DL");
        if (shoolSelected != null)
        {
            string schoolSelected = shoolSelected.SelectedValue;

            departmentsRequired = CourseConnectAccess.getDepartmentsFromShoolID(schoolSelected);
        
        }

        return departmentsRequired;    
    }

    public DataTable getDegrees()
    {
        DataTable degrees = CourseConnectAccess.getDegreesFromSchoolID( );

        return degrees;        
    
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {

    }
    protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        Response.Redirect(Request.Path);
    }
}