<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
        <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
        <title>Login and Registration Form</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"/> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
</head>
<body>
<div id="container_demo" >
        
        
        <div id="wrapper">
        <div id="login" class="animate form">
            <form id="form1" runat="server">

                <asp:ScriptManager ID="SM1" runat="server">
                </asp:ScriptManager>

                <h1> Sign up </h1> 
                <p> 
                    <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                    <input runat="server" id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="mysuperusername690" />
                </p>
                <p> 
                    <label for="emailsignup" class="youmail" data-icon="e" > Your email</label>
                    <input runat="server" id="emailsignup" name="emailsignup" required="required" type="text" placeholder="mysupermail@mail.com"/> 
                </p>
                <p> 
                    <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                    <input runat="server" id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="eg. X8df!90EO"/>
                </p>
                <p> 
                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label>
                    <input runat="server" id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO"/>
                </p>
                <p>
                    <asp:UpdatePanel ID="UP1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td style="height: 50px; width: 100px;">
                                        <asp:Image ID="imgCaptcha" runat="server" />
                                    </td>
                                    <td valign="middle">
                                        <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <label for="Captha" class="uname" data-icon="p" > Enter above captcha code :</label>
                    <input runat="server" id="txtCaptcha" type="text" width="200px"/> 

                </p>
                <p class="signin button"> 
                    <span style="color: Red; font-weight: bold">
                        <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>
					<asp:Button ID="btnSignup" runat="server" Text="Sign Up" 
                        onclick="btnSignup_Click" />
				</p>
                <p class="change_link">  
					Already a member ?
					<a href="Login.aspx" > Go and log in </a>
				</p>
            </form>
        </div>
        </div>
</div>    
</body>
</html>
