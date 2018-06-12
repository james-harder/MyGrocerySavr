<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MJGrocersMaster.master" AutoEventWireup="true" CodeFile="addInventoryItem.aspx.cs" Inherits="addInventoryItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">
    <h1>Add an Item to Inventory:</h1>
    <%--name varchar[50]  --%>
    <asp:Label ID="lblItemName" runat="server" Text="Item Name"></asp:Label>
    <asp:RequiredFieldValidator ID="rfvItemName" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtItemName" text="*" CssClass="required"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtItemName" runat="server"></asp:TextBox>
    <br />
        
    <%-- description varchar[max] --%>
    <asp:Label ID="lblItemDesc" runat="server" Text="Item Description"></asp:Label>
    <asp:RequiredFieldValidator ID="rfvItemDesc" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtItemDesc" text="*" CssClass="required"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtItemDesc" runat="server"></asp:TextBox>
    <br />
        
    <%--aisle varchar[5]--%>
    <asp:Label ID="lblItemAisle" runat="server" Text="Item's Aisle"></asp:Label>
    <asp:RequiredFieldValidator ID="rfvItemAisle" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtItemAisle" text="*" CssClass="required"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtItemAisle" runat="server"></asp:TextBox>
    <br />
    
    
    <%--unitPrice float--%>
    <asp:Label ID="lblItemPrice" runat="server" Text="Item Price (per unit)"></asp:Label>
    <asp:RequiredFieldValidator ID="rfvItemPrice" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtItemPrice" text="*" CssClass="required"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtItemPrice" runat="server"></asp:TextBox>
    <br />
    
    <%--unitAmount  float--%>
    <asp:Label ID="lblUnitAmount" runat="server" Text="Unit Amount"></asp:Label>
    <asp:RequiredFieldValidator ID="rfvUnitAmount" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtUnitAmount" text="*" CssClass="required"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtUnitAmount" runat="server"></asp:TextBox>
    <br />
    
    <%--unitType varChar[20] dropdownlist--%>
    <asp:Label ID="lblUnitType" runat="server" Text="Unit Type"></asp:Label>
    <asp:RequiredFieldValidator ID="rfvUnitType" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="rblUnitType" text="*" CssClass="required"></asp:RequiredFieldValidator>
    <asp:RadioButtonList ID="rblUnitType" runat="server">
        <asp:ListItem Value="Weight" />
        <asp:ListItem Value="Item" />
    </asp:RadioButtonList>
    <br />
    
    <%--category varChar[50]--%>
    <asp:Label ID="lblItemCategory" runat="server" Text="Item Category"></asp:Label>
    <asp:RequiredFieldValidator ID="rfvUnitCategory" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtItemCategory" text="*" CssClass="required"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtItemCategory" runat="server"></asp:TextBox>
    <br />
    
    <%--image image--%>
    <asp:Label ID="lblItemImage" runat="server" Text="Image of Item"></asp:Label>
    <br />
    <asp:FileUpload ID="fulItemImage" runat="server" />
    <br />
    
    <%--Submit or clear form--%>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
    <asp:Button ID="btnReset" runat="server" Text="Reset" />
</asp:Content>
<asp:Content id="content3" ContentPlaceHolderID="contextSection" runat="server">
    <h3>Here's a preview of how this item will look:</h3>
    <hr />
    <p>to be added.</p>
</asp:Content>

