<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Display.aspx.cs" Inherits="Display" %>

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

        <asp:GridView ID="gvView" runat="server" AutoGenerateColumns="False" 
            >
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
                    <asp:Label Text='<%# Eval("Place_Mobile") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
    </asp:GridView>

    <%--<asp:SqlDataSource ID="sqlDataSourceGridView" runat="server"
            ConnectionString="<%$ ConnectionStrings:NCConnectionString %>"
            SelectCommand="SELECT [Place_Code], [Place_Name], [Place_Address], [Place_Mobile] FROM [Place_Master]"
            FilterExpression="[Place_Name] like '{0}%' and [Place_Address] like '{1}%' and [Place_Mobile] like '{2}%'">
            <FilterParameters>
                        <asp:ControlParameter ControlID="txtPlace" Name="Place_Name"
                    PropertyName="Text" Type="String" ConvertEmptyStringToNull="false" />
             
            </FilterParameters>
         </asp:SqlDataSource>--%>

    </div>
    
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">

        $(function () {
            $.ajax({
                type: "POST",
                url: "Display.aspx/GetView",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess
            });
        });

        function OnSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var Categories = xml.find("Table");
            var row = $("[id*=gvView] tr:last-child").clone(true);
            $("[id*=gvView] tr").not($("[id*=gvView] tr:first-child")).remove();
            $.each(Categories, function () {
                var Category = $(this);
                AppendRow(row, $(this).find("Place_Code").text(), $(this).find("Place_Name").text(), $(this).find("Place_Address").text(), $(this).find("Place_Mobile").text())
                row = $("[id*=gvView] tr:last-child").clone(true);
            });
        }

        function AppendRow(row, Code, Name, Address,Mobile) {

            $(".Place_Code", row).find("span").html(Code);
            $(".Place_Name", row).find("span").html(Name);

            $(".Place_Address", row).find("span").html(Address);
            $(".Place_Mobile", row).find("span").html(Mobile);

            $("[id*=gvView]").append(row);
        }
        </script>    
</asp:Content>

