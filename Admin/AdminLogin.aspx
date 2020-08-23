<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="Admin_AdminLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/Admin/css/style.css">
</head>
<body>
<hgroup>
  <h1>Log In</h1>
  <h3>By Admin</h3>
</hgroup>

    <form id="form1" runat="server">

        <div class="group">
            <input runat="server" id="username" name="username" required="required" type="text" placeholder="myusername or mymail@mail.com"/><span class="highlight"></span><span class="bar"></span>
        </div>

        <div class="group">
            <input runat="server" id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO" /> <span class="highlight"></span><span class="bar"></span>
        </div>
        <asp:Label ID="lblMessage" runat="server" style="font-size: small"></asp:Label>
        <asp:Button ID="btnLogin" runat="server" class="button buttonBlue" 
            text="Log In" onclick="btnLogin_Click"/>
    </form>

    
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script  src="~/Admin/js/index.js"></script>

    
</body>
</html>
