<%@ Page Language="C#" MasterPageFile="MasterPages/MJGrocersMaster.master" AutoEventWireup="true" CodeFile="Account_Page.aspx.cs" Inherits="Account_Page" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href="styles/forms.css" rel="stylesheet" />
</asp:Content>
<asp:Content ContentPlaceHolderID="sideBarSection" runat="server">
    
</asp:Content>
<asp:Content ContentPlaceHolderID="cpMainContent" runat="server">
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" >        
        
        <EditItemTemplate>
            <span style="">User Name:
                <asp:TextBox ID="User_NameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                <br />
                First Name:
                <asp:TextBox ID="First_NameTextBox"  runat="server" Text='<%# Bind("FirstName") %>' />
                <br />
                Last Name:
                <asp:TextBox ID="Last_NameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                <br />
                Email:
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                Phone Number:
                <asp:TextBox ID="Phone_NumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' />
                <br />
                Favorite Store:
                <asp:TextBox ID="Favorite_StoreTextBox" runat="server" Text='<%# Bind("FavoriteStore") %>' />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Your choice is not on the list." MinimumValue="101" MaximumValue="103" ControlToValidate="Favorite_StoreTextBox"></asp:RangeValidator>
                <br />
                <div>
                    <p>J&M Grocery West = 101</p>
                    <p>J&M Grocery South = 102</p>
                    <p>J&M Grocery East = 103</p>
                </div>
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
  
        <ItemTemplate>
            <span style="">User Name:
                <asp:Label ID="User_NameLabel" runat="server" Text='<%# Eval("UserName") %>' />
                <br />
                First Name:
                <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                <br />
                Last Name:
                <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                <br />
                Phone Number:
                <asp:Label ID="Phone_NumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' />
                <br />
                Favorite Store:
                <asp:Label ID="Favorite_StoreLabel" runat="server" Text='<%# Eval("FavoriteStore") %>' />
                <br />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
            <br />
            <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div style="" id="itemPlaceholderContainer" runat="server">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString='<%$ ConnectionStrings:cnMyGrocerySavr %>'
        SelectCommand="GET_USER_BY_ID" SelectCommandType="StoredProcedure"
        UpdateCommand="UPDATE_USER_INFO" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" />
            <asp:Parameter Name="LastName" />
            <asp:Parameter Name="PhoneNumber" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="UserName" />
            <asp:Parameter Name="FavoriteStore" />
            <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <%--<asp:SqlDataSource ID="sdsStores" runat="server" ConnectionString='<%$ ConnectionStrings:cnMyGrocerySavr %>' SelectCommand="SELECT [StoreID], [StoreName] FROM [Stores]"></asp:SqlDataSource>--%>
    <br />
    </asp:Content>
<asp:Content ContentPlaceHolderID="contextSection" runat="server">
    
</asp:Content>