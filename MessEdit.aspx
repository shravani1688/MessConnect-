<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MessEdit.aspx.cs" Inherits="MessEdit" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Weekly Menu</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI';
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
overflow:auto;
box-shadow:0 15px 40px rgba(0,0,0,.2);
}

.header{
height:70px;
display:flex;
align-items:center;
padding:20px;
border-bottom:1px solid #ddd;
}

.back{
font-size:22px;
color:#16a34a;
margin-right:15px;
text-decoration:none;
}

.header h2{
font-size:22px;
}

.content{
padding:15px;
}

.card{
background:#fff;
border:1px solid #ddd;
border-left:5px solid #16a34a;
border-radius:15px;
padding:15px;
margin-bottom:20px;
}

.day{
font-size:20px;
font-weight:bold;
color:#16a34a;
margin-bottom:15px;
}

label{
display:block;
margin-top:10px;
margin-bottom:5px;
font-weight:600;
}

input{
width:100%;
padding:10px;
border:1px solid #ccc;
border-radius:8px;
}

.save{
width:100%;
height:45px;
background:#16a34a;
color:#fff;
border:none;
border-radius:10px;
font-size:16px;
font-weight:bold;
cursor:pointer;
margin-top:20px;
}

.save:hover{
background:#15803d;
}

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

<div class="header">
<a href="MyMenu.aspx" class="back">
<i class="fa-solid fa-arrow-left"></i>
</a>

<h2>Edit Weekly Menu</h2>

</div>

<div class="content">

<asp:Repeater ID="rptEdit" runat="server">

<ItemTemplate>

<div class="card">

<div class="day">
<%# Eval("Day") %>
</div>

<asp:HiddenField
ID="hfId"
runat="server"
Value='<%# Eval("MenuId") %>' />

<label>Breakfast</label>

<asp:TextBox
ID="txtBreakfast"
runat="server"
Text='<%# Eval("Breakfast") %>' />

<label>Lunch</label>

<asp:TextBox
ID="txtLunch"
runat="server"
Text='<%# Eval("Lunch") %>' />

<label>Dinner</label>

<asp:TextBox
ID="txtDinner"
runat="server"
Text='<%# Eval("Dinner") %>' />

</div>

</ItemTemplate>

</asp:Repeater>

<asp:Button
ID="btnSave"
runat="server"
Text="Save Changes"
CssClass="save"
OnClick="btnSave_Click"/>

</div>

</div>

</form>

</body>
</html>