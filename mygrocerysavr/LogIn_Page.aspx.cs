using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public partial class LogIn_Page : System.Web.UI.Page
{
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["cnMyGrocerySavr"];


		using (SqlConnection connection = new SqlConnection(settings.ConnectionString))
        {
            // Create the command and set its properties.
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "ValidateLogin";
            command.CommandType = CommandType.StoredProcedure;

            //set the email parameter, for now this is the 'user name'
            SqlParameter parameter = new SqlParameter();
            parameter = new SqlParameter();
            parameter.ParameterName = "@email";
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Direction = ParameterDirection.Input;
            parameter.Value = txtEmail.Text.Trim();
            command.Parameters.Add(parameter);

            //set the password parameter
            parameter = new SqlParameter();
            parameter.ParameterName = "@password";
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Direction = ParameterDirection.Input;
            parameter.Value = txtPassword.Text.Trim();
            command.Parameters.Add(parameter);

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            int UserID = 0;
            string FirstName = string.Empty;
            string UserName = string.Empty;
            string FavoriteStore = string.Empty;

            if (reader.HasRows)
            {
                if (reader.Read())
                {

                    UserID = Convert.ToInt32(reader["UserID"]);
                    FirstName = Convert.ToString(reader["firstName"]);
                    UserName = Convert.ToString(reader["UserName"]);
                    FavoriteStore = Convert.ToString(reader["FavoriteStore"]);

                    lblResult.Text = "Login Successful" + "<br/>";
                    lblResult.Text += "UserID: " + UserID + "<br/>";
                    lblResult.Text += "FirstName: " + FirstName + "<br/>";
                    lblResult.Text += "UserName: " + UserName + "<br/>";
                    lblResult.Text += "Favorite Store: " + FavoriteStore + "<br />";
                    pnlLogin.Visible = false;


                    Session["UserID"] = UserID;
                    Session["FirstName"] = FirstName;
                    Session["UserName"] = UserName;

                    //Server.Transfer("./Account_Page.aspx", true);
                    pnlLogin.Visible = false;
                    pnlLoginSucces.Visible = true;
                }
            }
            else
            {
                lblResult.Text = "Incorrect Login";
            }
            reader.Close();

        }

		Master.changeAccountLinkText();
    }


    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
