<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cbviewDetails.aspx.cs" Inherits="cbviewDetails" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Booking Details</title>

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

    box-shadow:0 15px 40px rgba(0,0,0,.2);
      overflow-y:auto;
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

.header h2{
    font-size:22px;
}

.content{
    padding:20px;
}

.image{
    text-align:center;
    margin-bottom:20px;
}

.image img{
    width:120px;
    height:120px;
    border-radius:15px;
    border:3px solid #16a34a;
}

label{
    display:block;
    color:#16a34a;
    font-weight:bold;
    margin-top:12px;
}

.value{
    margin-top:5px;
    padding:10px;
    background:#f5f5f5;
    border-radius:8px;
}

.status{
    color:#16a34a;
    font-weight:bold;
}

.btn{
    width:100%;
    height:45px;
    margin-top:25px;
    border:none;
    border-radius:10px;
    background:#16a34a;
    color:#fff;
    font-size:16px;
    font-weight:bold;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

<div class="header">

<a href="page.aspx">
<i class="fa fa-arrow-left"></i>
</a>

<h2>Booking Details</h2>

</div>

<div class="content">

<div class="content">

<div class="image">
    <img src="Images/mess.jpg" alt="Mess Image"/>
</div>

<label>Mess Name</label>
<div class="value">
    <asp:Label ID="lblMessName" runat="server"></asp:Label>
</div>

<label>Owner Name</label>
<div class="value">
    <asp:Label ID="lblOwnerName" runat="server"></asp:Label>
</div>

<label>Location</label>
<div class="value">
    <asp:Label ID="lblLocation" runat="server"></asp:Label>
</div>

<label>Description</label>
<div class="value">
    <asp:Label ID="lblDescription" runat="server"></asp:Label>
</div>

<label>Contact No</label>
<div class="value">
    <asp:Label ID="lblContact" runat="server"></asp:Label>
</div>

<label>Veg</label>
<div class="value">
    <asp:Label ID="lblVeg" runat="server"></asp:Label>
</div>

<label>Non Veg</label>
<div class="value">
    <asp:Label ID="lblNonVeg" runat="server"></asp:Label>
</div>

<label>WiFi</label>
<div class="value">
    <asp:Label ID="lblWifi" runat="server"></asp:Label>
</div>

<label>Parking</label>
<div class="value">
    <asp:Label ID="lblParking" runat="server"></asp:Label>
</div>

<label>AC Dining</label>
<div class="value">
    <asp:Label ID="lblACDining" runat="server"></asp:Label>
</div>

<label>Price Per Month</label>
<div class="value">
    ₹ <asp:Label ID="lblPrice" runat="server"></asp:Label>
</div>

<label>Total Seats</label>
<div class="value">
    <asp:Label ID="lblTotalSeats" runat="server"></asp:Label>
</div>

<label>Available Seats</label>
<div class="value">
    <asp:Label ID="lblAvailableSeats" runat="server"></asp:Label>
</div>

<label>Status</label>
<div class="value status">
    <asp:Label ID="lblStatus" runat="server"></asp:Label>
</div>

<asp:Button ID="btnBack"
    runat="server"
    Text="Back to My Bookings"
    CssClass="btn"
    PostBackUrl="~/page.aspx" />

</div>
</div>
    </div>
</form>

</body>
</html>