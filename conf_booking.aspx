<%@ Page Language="C#" AutoEventWireup="true" CodeFile="conf_booking.aspx.cs" Inherits="conf_booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<title>Confirmed Bookings</title>

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
padding:18px;
position:relative;
}

.header{
display:flex;
align-items:center;
margin-bottom:20px;
}

.header h2{
margin-left:12px;
font-size:22px;
}

.content{
height:650px;
overflow-y:auto;
padding-bottom:70px;
}

.card{
background:#f3f4f6;
padding:15px;
border-radius:15px;
margin-bottom:15px;
box-shadow:0 2px 5px rgba(0,0,0,.1);
}

.card p{
margin:8px 0;
font-size:15px;
}

.status{
margin-top:10px;
background:#16a34a;
color:white;
padding:8px;
border-radius:8px;
text-align:center;
font-weight:bold;
}

.bottom{
position:absolute;
bottom:0;
left:0;
right:0;
display:flex;
justify-content:space-around;
padding:15px 0;
background:#fff;
border-top:1px solid #ddd;
}

.bottom i{
font-size:22px;
color:#16a34a;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

<div class="header">

<asp:LinkButton ID="btnBack"
runat="server"
PostBackUrl="~/ownerdash.aspx">

<a href="ownerdash.aspx"><i class="fa fa-arrow-left"></i></a>

</asp:LinkButton>

<h2>Confirmed Bookings</h2>

</div>

<div class="content">

<asp:Repeater ID="rptConfirmed" runat="server">

<ItemTemplate>

<div class="card">

<p><b>Customer :</b> <%# Eval("FullName") %></p>

<p><b>Phone :</b> <%# Eval("PhoneNo") %></p>

<p><b>Mess :</b> <%# Eval("MessName") %></p>

<p><b>Meal :</b> <%# Eval("MealType") %></p>

<p><b>Date :</b> <%# Eval("Date") %></p>

<p><b>Amount :</b> ₹ <%# Eval("Amount") %></p>

<div class="status">
<i class="fa-solid fa-circle-check"></i>
Booking Confirmed
</div>

</div>

</ItemTemplate>

</asp:Repeater>

</div>

<div class="bottom">

<a href="ownerdash.aspx">
<i class="fa-solid fa-house"></i>
</a>

<a href="BookingRequest.aspx">
<i class="fa-solid fa-book"></i>
</a>

<a href="conf_booking.aspx">
<i class="fa-solid fa-calendar-check"></i>
</a>

<a href="OwnerProfile.aspx">
<i class="fa-solid fa-user"></i>
</a>

</div>

</div>

</form>

</body>
</html>