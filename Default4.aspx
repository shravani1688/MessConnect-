<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Bookings</title>

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
    margin-right:15px;
    font-size:22px;
}

.content{
    padding:15px;
    height:650px;
    overflow-y:auto;
}

.card{
    background:#f8f8f8;
    border-radius:15px;
    padding:15px;
    margin-bottom:15px;
}

.card h3{
    color:#16a34a;
    margin-bottom:10px;
}

.card p{
    margin:6px 0;
}

.status{
    color:#16a34a;
    font-weight:bold;
}

.buttons{
    display:flex;
    justify-content:space-between;
    margin-top:15px;
}

.btnView{
    width:48%;
    height:40px;
    background:#16a34a;
    color:#fff;
    border:none;
    border-radius:10px;
    font-weight:bold;
}

.btnCancel{
    width:48%;
    height:40px;
    background:#ef4444;
    color:#fff;
    border:none;
    border-radius:10px;
    font-weight:bold;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

<div class="header">
<a href="Home.aspx">
<i class="fa fa-arrow-left"></i>
</a>

<h2>My Bookings</h2>
</div>

<div class="content">

<div class="card">

<h3>Shiv Shakti Mess</h3>

<p><b>Location:</b> Islampur</p>
<p><b>Meal:</b> Lunch</p>
<p><b>Date:</b> 22 July 2026</p>
<p><b>Amount:</b> ₹2500</p>
<p class="status">Status : Confirmed</p>

<div class="buttons">

<asp:Button ID="btnView1"
runat="server"
Text="View Details"
CssClass="btnView"
 />

<asp:Button ID="btnCancel1"
runat="server"
Text="Cancel Booking"
CssClass="btnCancel"
 />

</div>

</div>

<div class="card">

<h3>Sai Krupa Mess</h3>

<p><b>Location:</b> Kolhapur</p>
<p><b>Meal:</b> Full Day</p>
<p><b>Date:</b> 25 July 2026</p>
<p><b>Amount:</b> ₹3000</p>
<p class="status">Status : Pending</p>

<div class="buttons">

<asp:Button ID="btnView2"
runat="server"
Text="View Details"
CssClass="btnView"
 />

<asp:Button ID="btnCancel2"
runat="server"
Text="Cancel Booking"
CssClass="btnCancel"
 />

</div>

</div>

</div>

</div>

</form>

</body>
</html>