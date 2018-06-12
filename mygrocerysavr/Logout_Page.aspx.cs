using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout_Page : System.Web.UI.Page
{
    public void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] != null)
        {
            Session.Remove("UserID");
            Session.Remove("Password");
            Session.Remove("FirstName");
            Session.Remove("UserName");
            Session.Abandon();
            Response.Redirect("Index.aspx");
            if (Session["UserID"] == null)
            {
                lblLogoutStatus.Text = "Success!";
            } else
            {
                lblLogoutStatus.Text = Session["userName"] + "<br />"
                    + Session["UserID"] + "<br />"
                    + Session["FirstName"] + "<br />";
            }
        }
    }
}