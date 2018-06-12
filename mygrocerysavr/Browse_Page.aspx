<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MJGrocersMaster.master" AutoEventWireup="true" CodeFile="Browse_Page.aspx.cs" Inherits="testing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sideBarSection" Runat="Server" >
	<asp:Panel ID="pnlNavigation" runat="server" DefaultButton="btnSearch">
	<!-- 
       This ContentPlaceHolder contains controls for retreiving inventory that can be added to lists.
       Methods used: btnSearch_Click, rtvDept 
			
        Questions, comments, etc.:
        JH- Search works, but only if you click the search button, not if yout type 'enter'
    --> <div class="dropdown">
			<a class="dropLink" href="#">Departments</a>
			<div class="menu">
				<asp:TextBox ID="txtSearchBox" runat="server"></asp:TextBox>
				<asp:LinkButton ID="btnSearch" runat="server" Text="Search" OnClick="rtvDept" CommandArgument="search" /><br />
    
				<br />
				<asp:LinkButton ID="Dairy" runat="server" CssClass="sideBarButton" OnClick="rtvDept" Text="Dairy" /><br />
				<asp:LinkButton ID="Grocery" runat="server" CssClass="sideBarButton" OnClick="rtvDept" Text="Grocery" /><br />
				<asp:LinkButton ID="Meat" runat="server" CssClass="sideBarButton" OnClick="rtvDept" Text="Meat" /><br />
				<asp:LinkButton ID="Bakery" runat="server" CssClass="sideBarButton" OnClick="rtvDept" Text="Bakery" /><br />
				<asp:LinkButton ID="Seafood" runat="server" CssClass="sideBarButton" OnClick="rtvDept" Text="Seafood" /><br />
				<asp:LinkButton ID="Produce" runat="server" CssClass="sideBarButton" OnClick="rtvDept" Text="Produce" /><br />
				<asp:LinkButton ID="ShowAll" runat="server" CssClass="sideBarButton" OnClick="rtvDept" Text="All" /><br />
			</div>
		</div>
	</asp:Panel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cpMainContent" Runat="Server">
	<p class="mobileHint">Tap to add item to your list.</p>

	<asp:ListView ID="ListView1" runat="server" DataKeyNames="ItemID" DataSourceID="SqlDataSource1">
		
		<EmptyDataTemplate>
			<div runat="server">No Data was returned.</div>
		</EmptyDataTemplate>
		<EmptyItemTemplate>
			<br />
		</EmptyItemTemplate>
		
		<ItemTemplate><div class="BrowsedContent">
                    <span class="imgCrop">
                        <img src='<%# Eval("Image") %>' class="imgInventory" />
                    </span>
                    <br />
                    <asp:Button ID="Button1" Text="Add To List" runat="server" OnClick="EditButton_Click" CommandArgument='<%# Eval("ItemID") %>' />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Name") %>' />
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("UnitPrice") %>' />
                    <br />                    
            </div></ItemTemplate>

		<LayoutTemplate>
			<div id="itemPlaceHolder" runat="server" ></div>
		</LayoutTemplate>
		
	</asp:ListView>
    <br />
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myGrocerySavrNewConnectionString %>" SelectCommand="GET_INVENTORY" SelectCommandType="StoredProcedure" UpdateCommand="APPEND_TO_LIST" UpdateCommandType="StoredProcedure">
		<SelectParameters>
			<asp:QueryStringParameter QueryStringField="department" DefaultValue="all" Name="department" Type="String"></asp:QueryStringParameter>
			<%--<asp:QueryStringParameter QueryStringField="search" DefaultValue="" Name="search" Type="String"></asp:QueryStringParameter>--%>
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="ItemID" Type="Int32"></asp:Parameter>
			<asp:Parameter Name="ListID" Type="Int32"></asp:Parameter>
		</UpdateParameters>
	</asp:SqlDataSource>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contextSection" Runat="Server">
	<%-- Let's shelve this for now.
		Let's put in a textbox for re-naming the list,
		and implement a querystring that allows for passing
		listID variable between forms. 
		THat is, when a list is chosen in the Lists_Page, it is passed to Browse_page so that a new list isn't made.
		When browse page is opened it creates a new list by default. if that list is empty when the page is exited the lsit is destroyed
		If there is a listID in the query string then a new lsit is not created
		--%>
	<%-- add a listview or detailview here that will display the name of the new list and allow for the name to be changed. --%>
	<asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
		
		<EmptyDataTemplate>
			<span>Choose an item to add it to your list.</span>
		</EmptyDataTemplate>
		
		<ItemTemplate>
			<%# Eval("NumberOnList").ToString() + ": " + Eval("Name").ToString() %><br />
		</ItemTemplate>
		<LayoutTemplate>
			<br />
			<asp:Label ID="lblListName" runat="server" Text="Your New List:" /><br /><br />
			<div id="itemPlaceholder" runat="server" style=""></div>
            <br /><asp:LinkButton ID="lbViewList" runat="server" OnClick="lbViewList_Click" >View in List Page</asp:LinkButton><br />
		</LayoutTemplate>		
	</asp:ListView>
	<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myGrocerySavrNewConnectionString %>" SelectCommand="GET_ITEMS_FROM_LIST" SelectCommandType="StoredProcedure">
		<SelectParameters>
			<asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
			<asp:QueryStringParameter QueryStringField="listid" Name="ListID" Type="Int32"></asp:QueryStringParameter>

		</SelectParameters>
	</asp:SqlDataSource>

</asp:Content>

