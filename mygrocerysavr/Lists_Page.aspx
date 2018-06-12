<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MJGrocersMaster.master" AutoEventWireup="true" CodeFile="Lists_Page.aspx.cs" Inherits="Lists_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="sideBarSection" Runat="Server">
    <asp:Label ID="lblUserMessage" runat="server" Text="Label">Here are your saved lists:</asp:Label>
    <br />

    <asp:ListView ID="lvUsersLists" runat="server" DataKeyNames="ListID" DataSourceID="sdsUsersLists">
        
        <EmptyDataTemplate>
            <span>It looks like you don't have any lists saved on your MyGrocerySavr account.<br />
				Click on the 'Browse' button to get started on a new list!
            </span>
        </EmptyDataTemplate>
        
        <ItemTemplate>
            <span style=""><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "./Lists_Page.aspx?listid=" + Eval("ListID") %>' ><%# Eval("ListName") %></asp:HyperLink><br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        
    </asp:ListView>
    <asp:SqlDataSource ID="sdsUsersLists" runat="server" ConnectionString="<%$ ConnectionStrings:myGrocerySavrNewConnectionString %>" SelectCommand="GET_LISTS_BY_USER" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpMainContent" Runat="Server">
    
	<asp:GridView ID="gvListContents" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sdsListContents">
		<Columns>
			<asp:BoundField DataField="Aisle" HeaderText="Aisle" SortExpression="Aisle" />
			<asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
			<asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
			<asp:BoundField DataField="NumberOnList" HeaderText="NumberOnList" SortExpression="NumberOnList" />
		</Columns>
	</asp:GridView>
	<asp:SqlDataSource ID="sdsListContents" runat="server" ConnectionString="<%$ ConnectionStrings:myGrocerySavrNewConnectionString %>" SelectCommand="GET_ITEMS_FROM_LIST" SelectCommandType="StoredProcedure">
		<SelectParameters>
			<asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
			<asp:QueryStringParameter Name="ListID" QueryStringField="listid" Type="Int32" />
		</SelectParameters>
	</asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contextSection" Runat="Server">
	<asp:Panel ID="pnlEditLists" runat="server" Visible="false">
		<asp:LinkButton ID="lbDeleteList" OnClick="lbDeleteList_Click" runat="server">Delete Current List</asp:LinkButton><br />
		<asp:LinkButton ID="lbAddToList" OnClick="lbAddToList_Click" runat="server">Edit Current List</asp:LinkButton>
	</asp:Panel>
</asp:Content>

