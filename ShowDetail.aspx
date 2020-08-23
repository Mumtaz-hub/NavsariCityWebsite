<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowDetail.aspx.cs" Inherits="ShowDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 1px solid #ccc;
            width: 550px;
            margin-bottom: -1px;
        }
        table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
        
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="margin-left:30%;margin-Top:10%;">
        <table  border="0" cellspacing="0" width="210px">
            <tr >
                <th>Place Name</th>
                <td ></td>
            </tr>
            <tr >
                <td><asp:TextBox ID="txtPlace" runat="server" Width="250px"></asp:TextBox></td>
                <td ><asp:Button ID="btnSearch" runat="server" Text="Search" 
                        onclick="btnSearch_Click" /></td>
            </tr>
        </table>

        <asp:GridView ID="gvView" runat="server" AutoGenerateColumns="False" >
        <Columns>
            <asp:TemplateField HeaderText="Code" ItemStyle-Width="110px" ItemStyle-CssClass="Place_Code">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Place_Code") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Name" ItemStyle-Width="210px" ItemStyle-CssClass="Place_Name">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Place_Name") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" ItemStyle-Width="350px" ItemStyle-CssClass="Place_Address">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Place_Address") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contact No" ItemStyle-Width="250px" ItemStyle-CssClass="Place_Mobile">
                <ItemTemplate>
                    <asp:Label  Text='<%# Eval("Place_Mobile") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
    </asp:GridView>
</asp:Content>

