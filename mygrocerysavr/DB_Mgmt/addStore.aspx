<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MJGrocersMaster.master" AutoEventWireup="true" CodeFile="addStore.aspx.cs" Inherits="addStore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>Create a New User Account:</h1>
    <%-- StoreName varchar[25]  --%>
    <asp:Label ID="lblStoreName" runat="server" Text="Store Name"></asp:Label>
    <br />
    <asp:TextBox ID="txtStoreName" runat="server"></asp:TextBox>
    <br />
    <%--address varchar[50]--%>
    <asp:Label ID="lblStoreAddress" runat="server" Text="Street Address"></asp:Label>
    <br />
    <asp:TextBox ID="txtStoreAddress" runat="server"></asp:TextBox>
    <br />
    <%--city varcahr[50]--%>
    <asp:Label ID="lblStoreCity" runat="server" Text="City"></asp:Label>
    <br />
    <asp:TextBox ID="txtStoreCity" runat="server"></asp:TextBox>
    <br />
    <%--state varchar[2]--%>
    <asp:Label ID="lblStoreState" runat="server" Text="State"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlStoreState" runat="server">
        <asp:ListItem Value="State"></asp:ListItem>
        <%--is there a way to programmaticaly put states in here?--%>
    </asp:DropDownList>
    <br />
    <%--zip varchar[10]--%>
    <asp:Label ID="lblStoreZip" runat="server" Text="Zip Code"></asp:Label>
    <br />
    <asp:TextBox ID="txtStoreZip" runat="server"></asp:TextBox>
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

