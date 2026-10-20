<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MessReview.aspx.cs" Inherits="MessReview" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<title>Customer Reviews</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

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
overflow-y:auto;
box-shadow:0 15px 40px rgba(0,0,0,.2);
}

.header{
height:70px;
display:flex;
align-items:center;
padding:0 20px;
border-bottom:1px solid #ddd;
position:sticky;
top:0;
background:#fff;
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

.review-card{
background:#fff;
border:1px solid #e5e7eb;
border-left:5px solid #16a34a;
border-radius:15px;
padding:15px;
margin-bottom:15px;
box-shadow:0 4px 10px rgba(0,0,0,.05);
}

.customer{
font-size:18px;
font-weight:bold;
color:#16a34a;
margin-bottom:8px;
}

.rating{
color:#f59e0b;
font-size:18px;
margin-bottom:10px;
}

.review{
font-size:15px;
color:#444;
line-height:24px;
}

.empty{
text-align:center;
padding:50px;
font-size:18px;
color:gray;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

<div class="header">

<a href="OwnerProfile.aspx" class="back">
<i class="fa-solid fa-arrow-left"></i>
</a>

<h2>Customer Reviews</h2>

</div>

<div class="content">

<asp:Repeater ID="rptReview" runat="server">

<ItemTemplate>

<div class="review-card">

<div class="customer">
<i class="fa-solid fa-user"></i>
<%# Eval("FullName") %>
</div>

<div class="rating">
⭐ <%# Eval("rating") %>/5
</div>

<div class="review">
<%# Eval("ReviewText") %>
</div>

</div>

</ItemTemplate>

</asp:Repeater>

<asp:Label
ID="lblNoReview"
runat="server"
CssClass="empty"
Visible="false"
Text="No Reviews Available">
</asp:Label>

</div>

</div>

</form>

</body>
</html>
