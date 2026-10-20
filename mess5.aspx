<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mess5.aspx.cs" Inherits="mess5" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Owner Signup</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
    background:#e5e7eb;
}

.phone{
    width:360px;
    height:740px;
    background:white;
    border-radius:35px;
    overflow:hidden;
    box-shadow:0 15px 40px rgba(0,0,0,.25);
}

.top{
    height:170px;
    background-image:url('https://images.unsplash.com/photo-1556910103-1c02745aae4d');
    background-size:cover;
    background-position:center;
}

.overlay{
    width:100%;
    height:100%;
    background:rgba(0,0,0,.35);
    display:flex;
    justify-content:center;
    align-items:center;
    color:white;
    font-size:28px;
    font-weight:bold;
}

.form{
    padding:18px;
}

.textbox{
    width:100%;
    padding:14px;
    margin-bottom:12px;
    border:none;
    border-radius:12px;
    background:#f3f4f6;
    font-size:14px;
}

.password-box{
    position:relative;
    margin-bottom:12px;
}

.eye{
    position:absolute;
    right:15px;
    top:50%;
    transform:translateY(-50%);
    cursor:pointer;
    color:#666;
}

.btn{
    width:100%;
    padding:15px;
    border:none;
    border-radius:14px;
    background:linear-gradient(135deg,#16a34a,#22c55e);
    color:white;
    font-size:16px;
    font-weight:bold;
    cursor:pointer;
}

.login{
    text-align:center;
    margin-top:15px;
    color:#6b7280;
    font-size:14px;
}

.login a{
    color:#16a34a;
    text-decoration:none;
    font-weight:bold;
}
    </style>

</head>
<body>

<form id="form1" runat="server">

<div class="phone">

    <div class="top">
        <div class="overlay">Owner Signup</div>
    </div>

    <div class="form">

        <asp:TextBox ID="txtOwnerName" runat="server"
            CssClass="textbox"
            placeholder="Owner Name"></asp:TextBox>

        <asp:TextBox ID="txtMessName" runat="server"
            CssClass="textbox"
            placeholder="Mess Name"></asp:TextBox>

        <asp:TextBox ID="txtEmail" runat="server"
            CssClass="textbox"
            TextMode="Email"
            placeholder="Email"></asp:TextBox>

        <asp:TextBox ID="txtPhone" runat="server"
            CssClass="textbox"
            placeholder="Phone Number"></asp:TextBox>

        <div class="password-box">
            <asp:TextBox ID="txtPassword" runat="server"
                CssClass="textbox"
                TextMode="Password"
                placeholder="Password"></asp:TextBox>

            <span class="eye" onclick="togglePassword('<%= txtPassword.ClientID %>', this); return false;">
                <i class="fa-solid fa-eye"></i>
            </span>
        </div>

        <div class="password-box">
            <asp:TextBox ID="txtConfirmPassword" runat="server"
                CssClass="textbox"
                TextMode="Password"
                placeholder="Confirm Password"></asp:TextBox>

            <span class="eye" onclick="togglePassword('<%= txtConfirmPassword.ClientID %>', this); return false;">
                <i class="fa-solid fa-eye"></i>
            </span>
        </div>

        <asp:Button ID="btnCreate"
            runat="server"
            Text="Create Account"
            CssClass="btn" 
            onclick="btnCreate_Click"/>

        <div class="login">
            Already have account?
            <a href="mess2.aspx">Login</a>
        </div>

    </div>

</div>

</form>

<script>
function togglePassword(id, element) {

    var input = document.getElementById(id);
    var icon = element.querySelector("i");

    if (input.type === "password") {
        input.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
    }
    else {
        input.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
    }
}
</script>

</body>
</html>