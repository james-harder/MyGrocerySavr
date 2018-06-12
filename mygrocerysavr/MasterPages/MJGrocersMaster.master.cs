using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class MasterPages_MJGrocersMaster : System.Web.UI.MasterPage
{
    protected void Page_Init(object sender, EventArgs e)
    {
		string thisUrl = this.Page.Request.FilePath.ToString();
		if (Session["UserID"] != null)
        {
			changeAccountLinkText();
        } else if (thisUrl != "/Index.aspx" && thisUrl != "/Registration_Page.aspx" && thisUrl != "/Login_Page.aspx")
		{
			Response.Redirect("/Registration_Page.aspx");
		}
    }

	protected void Page_Load(object sender, EventArgs e)
	{
		
	}

    public void BtnLogout_Click(object sender, EventArgs e)
    {
        if (Session["userName"] != null)
        {
                Session.Remove("UserID");
                Session.Remove("Password");
                Session.Remove("FirstName");
                Session.Remove("UserName");
            Session.Abandon();
            hlAccount.Text = "Log In";
            Response.Redirect("Index.aspx");
        }
    }

	public void changeAccountLinkText()
	{
		hlAccount.Text = "Account";
		hlAccount.NavigateUrl = "../Account_Page.aspx";
	}
}
