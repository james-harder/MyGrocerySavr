<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MJGrocersMaster.master" AutoEventWireup="true" CodeFile="LogIn_Page.aspx.cs" Inherits="LogIn_Page" %>
<%@ MasterType VirtualPath="~/MasterPages/MJGrocersMaster.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<link href="styles/forms.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sideBarSection" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnLogin" >
		<h1>Please Login to your MyGrocerySavr account</h1>
		<p>If you don't have an account, please <a href="./Registration_Page.aspx">register</a> to create one.</p>
        <div>
            <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="left"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email Required" ControlToValidate="txtEmail" Display="Dynamic" CssClass="rfvError" >*</asp:RequiredFieldValidator>
            <br />
       <br />
            <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="left"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password Required" ControlToValidate="txtPassword" Display="Dynamic" CssClass="rfvError">*</asp:RequiredFieldValidator>
            <br />
        <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" />
        </div>
    </asp:Panel>
    <asp:Panel ID="pnlLoginSucces" runat="server" visible="false">
        <p>You have succesfully logged in to your myGrocerySavr account.</p>
        <p>Please click <a href="Account_Page.aspx">Here</a> to access your account, or use the links at the top of the screen to navigate the site.</p>
    </asp:Panel>
    <div>
        <br />
        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contextSection" Runat="Server">
</asp:Content>

