<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mess7.aspx.cs" Inherits="mess7" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Booking</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

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
box-shadow:0 15px 40px rgba(0,0,0,0.2);
padding:18px;
}

.header{
display:flex;
align-items:center;
margin-bottom:20px;
}

.header i{
font-size:20px;
margin-right:15px;
}

.header h2{
font-size:22px;
}

.mess-card{
display:flex;
background:#f9fafb;
padding:12px;
border-radius:16px;
margin-bottom:20px;
}

.mess-card img{
width:70px;
height:70px;
border-radius:12px;
object-fit:cover;
margin-right:12px;
}

.mess-info h3{
font-size:16px;
}

.mess-info p{
font-size:13px;
color:#6b7280;
margin-top:4px;
}

.section-title{
font-weight:bold;
margin-bottom:15px;
margin-top:20px;
}

.meal-row{
display:flex;
justify-content:space-between;
align-items:center;
padding:12px 0;
border-bottom:1px solid #eee;
}

.price{
color:#444;
}

.date-box{
margin-top:20px;
background:#f3f4f6;
padding:14px;
border-radius:12px;
display:flex;
justify-content:space-between;
align-items:center;
}

.total{
margin-top:25px;
display:flex;
justify-content:space-between;
font-size:18px;
font-weight:bold;
}

.amount{
color:#16a34a;
}

.btn{
width:100%;
padding:15px;
margin-top:25px;
border:none;
border-radius:12px;
background:#16a34a;
color:white;
font-size:16px;
font-weight:bold;
cursor:pointer;
}
    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

<div class="header">
<i class="fa fa-arrow-left"></i>
<h2>Booking</h2>
</div>

<div class="mess-card">

<img src="https://images.unsplash.com/photo-1547592180-85f173990554" />

<div class="mess-info">
<h3>Shiv Shakti Mess</h3>
<p>FC Road, Pune</p>
<p>₹3000 / month</p>
</div>

</div>

<div class="section-title">
Select Meal Type
</div>

<asp:RadioButtonList ID="rblMeal" runat="server">

    <asp:ListItem Text="Breakfast - ₹1000 / month" Value="1000"></asp:ListItem>

    <asp:ListItem Text="Lunch - ₹1500 / month" Value="1500" Selected="True"></asp:ListItem>

    <asp:ListItem Text="Dinner - ₹1000 / month" Value="1000"></asp:ListItem>

    <asp:ListItem Text="Full Day (3 Times) - ₹3000 / month" Value="3000"></asp:ListItem>

</asp:RadioButtonList>

<div class="section-title">
Select Date
</div>

<div class="date-box">

<asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>

<i class="fa fa-calendar"></i>

</div>

<div class="total">

<span>Total Amount</span>

<asp:Label ID="lblAmount" runat="server" CssClass="amount" Text="₹1500"></asp:Label>

</div>

<asp:Button ID="btnBooking"
    runat="server"
    Text="Confirm Booking"
    CssClass="btn"
    OnClick="btnBooking_Click" />

</div>

</form>

</body>
</html>