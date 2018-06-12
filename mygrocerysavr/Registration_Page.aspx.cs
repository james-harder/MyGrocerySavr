using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient; 

public partial class Registration_Page : System.Web.UI.Page
{
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int UserId = 0;

        ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["cnMyGrocerySavr"];

        string connectionString = settings.ConnectionString;


        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            // Create the command and set its properties.
            SqlCommand command = new SqlCommand();
            command.Connection = connection;
            command.CommandText = "InsertUser";
            command.CommandType = CommandType.StoredProcedure;

            //set the first name parameter
            SqlParameter parameter = new SqlParameter();
            parameter.ParameterName = "@firstName";
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Direction = ParameterDirection.Input;
            parameter.Value = txtFirstName.Text.Trim();
            command.Parameters.Add(parameter);

            //set the last name parameter
            parameter = new SqlParameter();
            parameter.ParameterName = "@LastName";
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Direction = ParameterDirection.Input;
            parameter.Value = txtLastName.Text.Trim();
            command.Parameters.Add(parameter);

            //Set the email paramater
            parameter = new SqlParameter();
            parameter.ParameterName = "@Email";
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Direction = ParameterDirection.Input;
            parameter.Value = txtEmail.Text.Trim();
            command.Parameters.Add(parameter);

            //Set the user name parameter, for now this is equal to the email
            parameter = new SqlParameter();
            parameter.ParameterName = "@UserName";
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Direction = ParameterDirection.Input;
            parameter.Value = txtEmail.Text.Trim();
            command.Parameters.Add(parameter);

            //Set the password parameter
            parameter = new SqlParameter();
            parameter.ParameterName = "@Password";
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Direction = ParameterDirection.Input;
            parameter.Value = txtPassword.Text.Trim();
            command.Parameters.Add(parameter);

            //Set the password parameter
            parameter = new SqlParameter();
            parameter.ParameterName = "@FavoriteStore";
            parameter.SqlDbType = SqlDbType.Int;
            parameter.Direction = ParameterDirection.Input;
            int storeChoice = int.Parse(ddlStore.SelectedValue);
            parameter.Value = storeChoice;
            command.Parameters.Add(parameter);

            //Set the phone number paramter, for now this is  adummy number
            parameter = new SqlParameter();
            parameter.ParameterName = "@PhoneNumber";
            parameter.SqlDbType = SqlDbType.VarChar;
            parameter.Direction = ParameterDirection.Input;
            parameter.Value = "(555)555-5555";
            command.Parameters.Add(parameter);

            connection.Open();
            UserId = Convert.ToInt32(command.ExecuteScalar());

			if (UserId > 0)
			{
				pnlPersonalInformation.Visible = false;
				pnlRegistered.Visible = true;

			}
			else
				pnlPersonalInformation.Visible = false;
				pnlNotRegistered.Visible = true;

        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}