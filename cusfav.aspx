<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cusfav.aspx.cs" Inherits="cusfav" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Favourite Messes</title>

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
background:white;
border-radius:35px;
overflow:hidden;
box-shadow:0 15px 40px rgba(0,0,0,.2);
}

.header{
display:flex;
align-items:center;
padding:20px;
border-bottom:1px solid #eee;
}

.header a{
text-decoration:none;
color:black;
font-size:22px;
margin-right:15px;
}

.content{
padding:15px;
height:620px;
overflow-y:auto;
}

.card{
background:white;
padding:15px;
border-radius:15px;
box-shadow:0 2px 8px rgba(0,0,0,.15);
margin-bottom:15px;
}

.top{
display:flex;
justify-content:space-between;
align-items:center;
}

.mess-name{
font-size:18px;
font-weight:bold;
}
.heart{
    color:red;
    font-size:22px;
    text-decoration:none;
    border:none;
    background:none;
    cursor:pointer;
}

.info{
margin-top:10px;
color:#666;
}

.rating{
margin-top:10px;
color:#16a34a;
font-weight:bold;
}

.price{
margin-top:10px;
font-weight:bold;
}


.btn{
width:100%;
height:42px;
background:#16a34a;
color:white;
border:none;
border-radius:8px;
margin-top:12px;
font-size:15px;
font-weight:bold;
cursor:pointer;
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

<h2>Favourite Messes</h2>

</div>

<div class="content">

<asp:Repeater ID="rptFavourite" runat="server">

<ItemTemplate>

<div class="card">

<div class="top">

<div class="mess-name">
<%# Eval("MessName") %>
</div>

<asp:LinkButton
    ID="btnRemoveFav"
    runat="server"
    CommandArgument='<%# Eval("MessId") %>'
    OnClick="btnRemoveFav_Click"
    CssClass="heart"
    CausesValidation="false">
    <i class="fa-solid fa-heart"></i>
</asp:LinkButton>
</div>

<div class="info">
<i class="fa fa-location-dot"></i>
<%# Eval("Location") %>
</div>

<div class="rating">
⭐ <%# Eval("Rating") %>
</div>

<div class="price">
₹ <%# Eval("PricePerMonth") %> / Month
</div>

<asp:Button ID="btnBook"
runat="server"
Text="Book Now"
CssClass="btn"
PostBackUrl='<%# "booking.aspx?MessId="+Eval("MessId") %>' />

</div>

</ItemTemplate>

</asp:Repeater>

</div>

</div>

</form>

</body>
</html>