using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class testing : System.Web.UI.Page
{
	protected void Page_Init(object sender, EventArgs e)
	{
		
	}

	protected void rtvDept(object sender, EventArgs e)
	{
		LinkButton lbSender = (LinkButton)sender;
		string strKeyword = String.Empty;
		if(lbSender.CommandArgument == "search")
		{
			strKeyword = txtSearchBox.Text;
		} else
		{
			strKeyword = lbSender.Text;
		}
		string thisUrl = "/Browse_Page.aspx?listid=" + Request.QueryString["listid"].ToString() + "&department=" + strKeyword;
		Page.Response.Redirect(thisUrl, false);
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		if (Request.QueryString["listid"] == null)
		{
			Session["currentListName"] = System.DateTime.Now.ToString();

			ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["cnMyGrocerySavr"];
			string connectionString = settings.ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				SqlCommand command = new SqlCommand();
				command.Connection = connection;
				command.CommandText = "CREATE_LIST";
				command.CommandType = CommandType.StoredProcedure;

				SqlParameter parameter = new SqlParameter();
				parameter.ParameterName = "@UserID";
				parameter.SqlDbType = SqlDbType.Int;
				parameter.Value = (int)Session["UserID"];
				parameter.Direction = ParameterDirection.Input;
				command.Parameters.Add(parameter);

				parameter = new SqlParameter();
				parameter.ParameterName = "@ListName";
				parameter.SqlDbType = SqlDbType.VarChar;
				parameter.Value = (string)Session["currentListName"];
				parameter.Direction = ParameterDirection.Input;
				command.Parameters.Add(parameter);

				parameter = new SqlParameter();
				parameter.ParameterName = "@Shareable";
				parameter.SqlDbType = SqlDbType.Bit;
				parameter.Value = 0;
				parameter.Direction = ParameterDirection.Input;
				command.Parameters.Add(parameter);

				connection.Open();
				int newListID = (int)command.ExecuteScalar();
				if (newListID != 0)
				{
					//Reload  page with new ListID in the querystring
					Response.Redirect("/Browse_Page.aspx?listid=" + newListID.ToString());
				}
			}
		}
	}

	protected void EditButton_Click(object sender, EventArgs e)
	{
		Button btnSender = (Button)sender;
		int ItemID = System.Convert.ToInt32(btnSender.CommandArgument);

		ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["cnMyGrocerySavr"];
		string connectionString = settings.ConnectionString;

		using (SqlConnection connection = new SqlConnection(connectionString))
		{
			SqlCommand command = new SqlCommand();
			command.Connection = connection;
			command.CommandText = "APPEND_TO_LIST";
			command.CommandType = CommandType.StoredProcedure;

			SqlParameter parameter = new SqlParameter();
			parameter.ParameterName = "@ItemID";
			parameter.Value = ItemID;
			parameter.Direction = ParameterDirection.Input;
			parameter.SqlDbType = SqlDbType.Int;
			command.Parameters.Add(parameter);

			parameter = new SqlParameter();
			parameter.ParameterName = "@ListID";
			parameter.Value = Request.QueryString["listid"];
			parameter.SqlDbType = SqlDbType.Int;
			parameter.Direction = ParameterDirection.Input;
			command.Parameters.Add(parameter);

			connection.Open();
			command.ExecuteNonQuery();
		}
		Page.Response.Redirect(Page.Request.Url.ToString(), false); //need to find a way to keep from going to the top of the page here...
		
	}


	protected void lbViewList_Click(object sender, EventArgs e)
	{
		Page.Response.Redirect("./Lists_Page.aspx?listid=" + (string)Request.QueryString["listid"]);
	}
}