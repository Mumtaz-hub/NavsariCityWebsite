<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterAdmin.master" AutoEventWireup="true" CodeFile="Places.aspx.cs" Inherits="Admin_Places" %>

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
            width: 200px;
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
            /*width:30%*/
            padding: 5px;
            border: 1px solid #ccc;
        }
        
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate> 
<div style="margin-left:30%;margin-top:100px;">

    <asp:GridView ID="gvPlaceCategory" runat="server" AutoGenerateColumns="false" Width="700px">
        <Columns>
            <asp:TemplateField HeaderText="Category Code" ItemStyle-Width="110px" ItemStyle-CssClass="Category_Id">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Category_Id") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category Name" ItemStyle-Width="350px" ItemStyle-CssClass="Category_Name">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Category_Name") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("Category_Name") %>' runat="server" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton Text="Select" runat="server" CssClass="Select" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <br /><br />
<asp:GridView ID="gvPlaces" runat="server" AutoGenerateColumns="false"  Width="800px">
        <Columns>
            <asp:TemplateField HeaderText="Place Code" ItemStyle-Width="110px" ItemStyle-CssClass="Place_Code">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Place_Code") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Place Name" ItemStyle-Width="350px" ItemStyle-CssClass="Place_Name">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Place_Name") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("Place_Name") %>' runat="server" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" ItemStyle-Width="450px" ItemStyle-CssClass="Place_Address">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Place_Address") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("Place_Address") %>' runat="server" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contact No" ItemStyle-Width="250px" ItemStyle-CssClass="Place_Mobile">
                <ItemTemplate>
                    <asp:Label  Text='<%# Eval("Place_Mobile") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("Place_Mobile") %>' runat="server" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton Text="Edit" runat="server" CssClass="Edit" />
                    <asp:LinkButton Text="Update" runat="server" CssClass="Update" Style="display: none" />
                    <asp:LinkButton Text="Cancel" runat="server" CssClass="Cancel" Style="display: none" />
                    <asp:LinkButton Text="Delete" runat="server" CssClass="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
        <tr>
            <td style="width: 100px">
                Place Name:<br />
                <asp:TextBox ID="txtPName" runat="server" Width="140" />
            </td>
            <td style="width: 100px">
                Address:<br />
                <asp:TextBox ID="txtAddress" runat="server" Width="240" />
            </td>
            <td style="width: 100px">
                ContactNo:<br />
                <asp:TextBox ID="txtMobile" runat="server" Width="140" />
            </td>
            <td style="width: 100px">
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Add" />
            </td>
        </tr>
    </table>
</div>
 
</ContentTemplate>  
</asp:UpdatePanel>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">

        $(function () {
            $.ajax({
                type: "POST",
                url: "Places.aspx/GetCategory",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess
            });
        });

        $(function () {
            $.ajax({
                type: "POST",
                url: "Places.aspx/GetPlaceByCategoryId",
                data: '{CCode:1}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess1
            });
        });

        function OnSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var Categories = xml.find("Table");
            var row = $("[id*=gvPlaceCategory] tr:last-child").clone(true);
            $("[id*=gvPlaceCategory] tr").not($("[id*=gvPlaceCategory] tr:first-child")).remove();
            $.each(Categories, function () {
                var Category = $(this);
                AppendRow(row, $(this).find("Category_Id").text(), $(this).find("Category_Name").text())
                row = $("[id*=gvPlaceCategory] tr:last-child").clone(true);
            });
        }

        function AppendRow(row, CId, name) {
            //Bind Category Id.
            $(".Category_Id", row).find("span").html(CId);

            //Bind Category Name.
            $(".Category_Name", row).find("span").html(name);
            $(".Category_Name", row).find("input").val(name);

            $("[id*=gvPlaceCategory]").append(row);
        }


        //Selete event handler.
        $("body").on("click", "[id*=gvPlaceCategory] .Select", function () {

            var row = $(this).closest("tr");
            var CCode = row.find("span").html();


            $.ajax({
                type: "POST",
                url: "Places.aspx/GetPlaceByCategoryId",
                data: '{CCode: ' + CCode + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess1
            });

            return false;
        });

        function OnSuccess1(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);
            var Groups = xml.find("Table");
            var row = $("[id*=gvPlaces] tr:last-child").clone(true);
            $("[id*=gvPlaces] tr").not($("[id*=gvPlaces] tr:first-child")).remove();
            $.each(Groups, function () {
                var Group = $(this);
                AppendRow1(row, $(this).find("Place_Code").text(), $(this).find("Place_Name").text(), $(this).find("Place_Address").text(), $(this).find("Place_Mobile").text())
                row = $("[id*=gvPlaces] tr:last-child").clone(true);
            });
        }

        function AppendRow1(row, PId, name,address,ContactNo) {
            //Bind  Id.
            $(".Place_Code", row).find("span").html(PId);

            //Bind Name.
            $(".Place_Name", row).find("span").html(name);
            $(".Place_Name", row).find("input").val(name);

            $(".Place_Address", row).find("span").html(address);
            $(".Place_Address", row).find("input").val(address);

            $(".Place_Mobile", row).find("span").html(ContactNo);
            $(".Place_Mobile", row).find("input").val(ContactNo);

            $("[id*=gvPlaces]").append(row);
        }

        //Add event handler.
        $("body").on("click", "[id*=btnAdd]", function () {

            var txtPName = $("[id*=txtPName]");
            var txtAddress = $("[id*=txtAddress]");
            var txtMobile = $("[id*=txtMobile]");

            var data = { Place_Name: "" + txtPName.val() + "", Place_Address:"" +txtAddress.val() + "", Place_Mobile:"" +txtMobile.val() +""};

            $.ajax({
                type: "POST",
                url: "Places.aspx/InsertPlaces",
                data: JSON.stringify(data),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var row = $("[id*=gvPlaces] tr:last-child").clone(true);
                    AppendRow1(row, response.d, txtPName.val(),txtAddress.val(),txtMobile.val());
                    txtPName.val("");
                    txtAddress.val("");
                    txtMobile.val("");
                }
            });
            return false;
        });
        //Edit event handler.
        $("body").on("click", "[id*=gvPlaces] .Edit", function () {
            var row = $(this).closest("tr");
            $("td", row).each(function () {
                if ($(this).find("input").length > 0) {
                    $(this).find("input").show();
                    $(this).find("span").hide();
                }
            });
            row.find(".Update").show();
            row.find(".Cancel").show();
            row.find(".Delete").hide();
            $(this).hide();
            return false;
        });

        //Update event handler.
        $("body").on("click", "[id*=gvPlaces] .Update", function () {
            var row = $(this).closest("tr");
            $("td", row).each(function () {
                if ($(this).find("input").length > 0) {
                    var span = $(this).find("span");
                    var input = $(this).find("input");
                    span.html(input.val());
                    span.show();
                    input.hide();
                }
            });
            row.find(".Edit").show();
            row.find(".Delete").show();
            row.find(".Cancel").hide();
            $(this).hide();

            var Code = row.find(".Place_Code").find("span").html();
            var Name = row.find(".Place_Name").find("span").html();
            var Address = row.find(".Place_Address").find("span").html();
            var Mobile = row.find(".Place_Mobile").find("span").html();

            $.ajax({
                type: "POST",
                url: "Places.aspx/UpdatePlaces",
                data: '{Place_Code: ' + Code + ', Place_Name: "' + Name + '", Place_Address: "' + Address + '", Place_Mobile: "' + Mobile + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            });

            return false;
        });

        //Cancel event handler.
        $("body").on("click", "[id*=gvPlaces] .Cancel", function () {
            var row = $(this).closest("tr");
            $("td", row).each(function () {
                if ($(this).find("input").length > 0) {
                    var span = $(this).find("span");
                    var input = $(this).find("input");
                    input.val(span.html());
                    span.show();
                    input.hide();
                }
            });
            row.find(".Edit").show();
            row.find(".Delete").show();
            row.find(".Update").hide();
            $(this).hide();
            return false;
        });

        //Delete event handler.
        $("body").on("click", "[id*=gvPlaces] .Delete", function () {
            if (confirm("Do you want to delete this Item Group?")) {
                var row = $(this).closest("tr");
                var CCode = row.find("span").html();
                $.ajax({
                    type: "POST",
                    url: "Places.aspx/DeletePlaces",
                    data: '{Place_Code: ' + CCode + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        row.remove();
                    }
                });
            }

            return false;
        });

        </script>
</asp:Content>

