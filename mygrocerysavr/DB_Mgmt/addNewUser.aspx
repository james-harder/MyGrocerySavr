<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MJGrocersMaster.master" AutoEventWireup="true" CodeFile="addNewUser.aspx.cs" Inherits="addNewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>Create a New User Account:</h1>
    <%-- UserName varchar[100]  --%>
    <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label>
    <br />
    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
    <br />
    <%--Password varchar[100]--%>
    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
    <br />
    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
    <br />
    <%--FirstName varchar[50]--%>
    <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
    <br />
    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
    <br />
    <%--LastName varchar[100]--%>
    <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
    <br />
    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
    <br />
    <%--RegisteredOn datetime--%> <%-- Need to figure out how to pass the current date time to the DB, should be able to use a hidden field, somehow --%>
    <asp:HiddenField ID="hfRegisteredOn" Value="current date time" runat="server" />
    <%--PhoneNumber varchar[15]--%>
    <asp:Label ID="lblPhoneNumber" runat="server" Text="Item Name"></asp:Label>
    <br />
    <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
    <br />
    <%--Email varchar[255]--%>
    <asp:Label ID="lblEmail" runat="server" Text="Item Name"></asp:Label>
    <br />
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <br />
    <%--FavoriteStore int--%>
    <asp:Label ID="lblFavStore" runat="server" Text="Favorite Store"></asp:Label>
    <br />
    <%--This ddl should be autopopulated by pulling data from the DB. I don't know hiow to do that yet--%>
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Value="Store 1" />
        <asp:ListItem Value="Store 2" />
        <asp:ListItem Value="Store 3" />
        <asp:ListItem Value="None" />
    </asp:DropDownList>
    <br />
    <%--image image--%>
    <asp:Label ID="lblUserImage" runat="server" Text="Image of Item"></asp:Label>
    <br />
    <asp:FileUpload ID="fulUserImage" runat="server" />
    <br />
    <%--Submit or clear form--%>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
    <asp:Button ID="btnReset" runat="server" Text="Reset" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contextSection" Runat="Server">
    <h3>Preview User Profile:</h3>
    <hr />
    <p>To be added.</p>
</asp:Content>

