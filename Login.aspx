<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Login and Registration Form</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
    </script>
</head>

<body>
<div class="container">
<div id="container_demo" >
        <div id="wrapper">
            <div id="login" class="animate form">
                <form id="form1" runat="server">
                        <h1>Log in</h1> 
                        <p> 
                            <label for="username" class="uname" data-icon="u" > Your email or username </label>
                            <input runat="server" id="username" name="username" required="required" type="text" placeholder="myusername or mymail@mail.com"/>
                        </p>
                        <p> 
                            <label for="password" class="youpasswd" data-icon="p"> Your password </label>
                            <input runat="server" id="password" name="password" required="required" type="password" placeholder="eg. X8df!90EO" /> 
                        </p>
                        <p class="keeplogin"> 
							<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
							<label for="loginkeeping">Keep me logged in</label>
						</p>
                        <p class="login button"> 
                            <asp:Label ID="lblMessage" runat="server" style="font-size: small"></asp:Label>
                            <asp:Button ID="btnLogin" runat="server" Text="Login" 
                                onclick="btnLogin_Click" />
                            
						</p>
                        <p class="change_link">
                            Are You Admin ?
                            <a href="Admin/AdminLogin.aspx">Log In</a>

							Not a member yet ?
							<a href="Signup.aspx">Join us</a>
						
                            
                        </p>
                </form>
            </div>
        </div>
</div>
</div>
</body>
</html>
