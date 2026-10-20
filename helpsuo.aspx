<%@ Page Language="C#" AutoEventWireup="true" CodeFile="helpsuo.aspx.cs" Inherits="helpsuo" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Help & Support</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:#e5e7eb;
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
}

.phone{
    width:360px;
    height:740px;
    background:#fff;
    border-radius:35px;
    overflow:hidden;
    box-shadow:0 15px 40px rgba(0,0,0,.2);
}

.header{
    display:flex;
    align-items:center;
    padding:20px;
    border-bottom:1px solid #ddd;
}

.header a{
    color:#000;
    text-decoration:none;
    font-size:22px;
    margin-right:15px;
}

.header h2{
    font-size:22px;
}

.content{
    padding:20px;
    height:640px;
    overflow-y:auto;
}

.section-title{
    color:#16a34a;
    font-size:18px;
    font-weight:bold;
    margin-bottom:12px;
}

.faq{
    background:#f8f8f8;
    padding:12px;
    border-radius:10px;
    margin-bottom:10px;
    font-size:15px;
}

label{
    display:block;
    margin-top:15px;
    margin-bottom:6px;
    font-weight:600;
}

.txt{
    width:100%;
    height:45px;
    border:1px solid #ccc;
    border-radius:10px;
    padding-left:10px;
}

.msg{
    width:100%;
    height:100px;
    border:1px solid #ccc;
    border-radius:10px;
    padding:10px;
    resize:none;
}

.btn{
    width:100%;
    height:45px;
    margin-top:20px;
    background:#16a34a;
    color:white;
    border:none;
    border-radius:10px;
    font-size:16px;
    font-weight:bold;
}

.contact{
    margin-top:15px;
    line-height:28px;
    color:#555;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

<div class="header">
<a href="messprofile.aspx">
<i class="fa fa-arrow-left"></i>
</a>

<h2>Help & Support</h2>
</div>

<div class="content">

<div class="section-title">
Frequently Asked Questions
</div>

<div class="faq">❓ How can I book a mess?</div>

<div class="faq">❓ How can I cancel my booking?</div>

<div class="faq">❓ How do I change my password?</div>

<div class="section-title">
Contact Support
</div>

<div class="contact">
📧 support@messconnect.com<br/>
📞 +91 9876543210
</div>

<label>Subject</label>

<asp:TextBox ID="txtSubject"
runat="server"
CssClass="txt">
</asp:TextBox>

<label>Message</label>

<asp:TextBox ID="txtMessage"
runat="server"
TextMode="MultiLine"
CssClass="msg">
</asp:TextBox>

<asp:Button ID="btnSubmit"
runat="server"
Text="Submit"
CssClass="btn" OnClick="btnSubmit_Click"
/>

</div>

</div>

</form>

</body>
</html>