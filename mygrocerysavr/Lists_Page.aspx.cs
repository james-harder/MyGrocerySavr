using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Lists_Page : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Request.QueryString["listid"] != null)
		{
			pnlEditLists.Visible = true;
		}
	}

	protected void lbDeleteList_Click(object sender, EventArgs e)
	{
		int ListID = System.Convert.ToInt32(Request.QueryString["listid"]);
		ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["cnMyGrocerySavr"];
		string connectionString = settings.ConnectionString;
		using (SqlConnection connection = new SqlConnection(connectionString))
		{
			SqlCommand command = new SqlCommand();
			command.Connection = connection;
			command.CommandText = "REMOVE_LIST";
			command.CommandType = CommandType.StoredProcedure;

			SqlParameter parameter = new SqlParameter();
			parameter.ParameterName = "@ListID";
			parameter.SqlDbType = SqlDbType.Int;
			parameter.Value = System.Convert.ToInt32(Request.QueryString["listid"]);
			command.Parameters.Add(parameter);

			parameter = new SqlParameter();
			parameter.ParameterName = "@UserID";
			parameter.SqlDbType = SqlDbType.Int;
			parameter.Value = System.Convert.ToInt32(Session["UserID"]);
			command.Parameters.Add(parameter);

			connection.Open();
			command.ExecuteNonQuery();
		}
		Response.Redirect("./Lists_Page.aspx");

	}

	protected void lbAddToList_Click(object sender, EventArgs e)
	{
		int ListID = System.Convert.ToInt32(Request.QueryString["listid"]);
		Response.Redirect("./Browse_Page.aspx?listid=" + ListID.ToString());
	}
}

