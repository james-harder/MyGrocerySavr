<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MJGrocersMaster.master" AutoEventWireup="true" CodeFile="Registration_Page.aspx.cs" Inherits="Registration_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="styles/forms.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sideBarSection" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:Panel ID="pnlPersonalInformation" runat="server">
      <h3>Register for a free <span class="emphasis">MyGrocerySavr</span> account</h3>
		<p>Bad news: It looks like you aren't logged into a MyGrocerySavr account.<br />
			Good news: You can register for a new account here!</p>
		<p>If you already have an account, please click the login button above. Otherwise, please fill out the form below to register for an account.</p>
        <div>
            <asp:Label ID="lblFirstName" runat="server" Text="First Name:" CssClass="left"></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="First Name Required" ControlToValidate="txtFirstName" Display="Dynamic" CssClass="rfvError">*</asp:RequiredFieldValidator>
        <br />
            <asp:Label ID="lblLastName" runat="server" Text="Last Name:" CssClass="left"></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Last Name Required" ControlToValidate="txtLastName" Display="Dynamic" CssClass="rfvError">*</asp:RequiredFieldValidator>
        <br />
            <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="left"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"  TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email Required" ControlToValidate="txtEmail" Display="Dynamic" CssClass="rfvError">*</asp:RequiredFieldValidator>
        <br />    
            <asp:Label ID="lblVerifyEmail" runat="server" Text="Re-Enter Email:" CssClass="left"></asp:Label>
            <asp:TextBox ID="txtVerifyEmail" runat="server"  TextMode="Email"></asp:TextBox>
            <!-- 
                I don't think we need to use a required field validator since we are using a comparison validator as well
            <asp:RequiredFieldValidator ID="rfvVerifyEmail" runat="server" ErrorMessage="Email Verification Required" ControlToValidate="txtVerifyEmail" Display="Dynamic" CssClass="rfvError">*</asp:RequiredFieldValidator>
            -->
            <asp:CompareValidator ID="cmvVerifyEmail" runat="server" ErrorMessage="Emails Do Not Match" ControlToCompare="txtEmail" ControlToValidate="txtVerifyEmail" Display="Dynamic" CssClass="rfvError">*</asp:CompareValidator>
        <br />
            <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="left"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server"  TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password Required" ControlToValidate="txtPassword" Display="Dynamic" CssClass="rfvError">*</asp:RequiredFieldValidator>
        <br />    
            <asp:Label ID="lblVerifyPassword" runat="server" Text="Re-Enter Password" CssClass="left"></asp:Label>
            <asp:TextBox ID="txtVerifyPassword" runat="server"  TextMode="Password"></asp:TextBox>
            <!--
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtVerifyPassword" Display="Dynamic" CssClass="rfvError">*</asp:RequiredFieldValidator>
            -->
            <asp:CompareValidator ID="cmvVerifyPassword" runat="server" ErrorMessage="Passwords Do Not Match" ControlToCompare="txtPassword" ControlToValidate="txtVerifyPassword" Display="Dynamic" CssClass="rfvError">*</asp:CompareValidator>
        <br />
            <asp:Label ID="Label1" runat="server" Text=" " CssClass="left"></asp:Label>
			<asp:DropDownList ID="ddlStore" runat="server">
                <asp:listItem text="Select a Favorite Store" Value="0"></asp:listItem>
                <asp:listItem Text="J&M Grocery West" Value="101"></asp:listItem>
                <asp:listItem Text="J&M Grocery South" Value="102"></asp:listItem>
                <asp:listItem Text="J&M Grocery East" Value="103"></asp:listItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvDDLStore" ControlToValidate="ddlStore" InitialValue="0" runat="server" ErrorMessage="No Store Selected" CssClass="rfvError">*</asp:RequiredFieldValidator><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"  />
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlRegistered" runat="server" Visible="false">
        <h1>Success!</h1>
		<p>You have completed your registration for MyGrocerySavr. Please click the login button above to login to your account.</p>      
    </asp:Panel>
	<asp:Panel ID="pnlNotRegistered" runat="server" Visible="false">
		<p>Sorry, there seems to have been a problem. PLease click <a href="Registration_Page.aspx">here</a> to try again.</p>
	</asp:Panel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contextSection" Runat="Server">
</asp:Content>

