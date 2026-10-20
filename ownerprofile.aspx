<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ownerprofile.aspx.cs" Inherits="ownerprofile" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Owner Profile</title>

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
overflow:hidden;
box-shadow:0 15px 40px rgba(0,0,0,.2);
}

.header{
padding:20px;
text-align:center;
font-size:26px;
font-weight:bold;
}

.profile{
text-align:center;
padding:10px 20px;
}

.profile img{
width:90px;
height:90px;
border-radius:50%;
border:3px solid #16a34a;
}

.profile h2{
margin-top:10px;
font-size:24px;
}

.profile p{
color:gray;
margin-top:5px;
font-size:15px;
}

.menu{
margin-top:20px;
}

.item{
display:flex;
justify-content:space-between;
align-items:center;
padding:18px 20px;
border-bottom:1px solid #eee;
font-size:17px;
}

.item i:first-child{
color:#16a34a;
width:30px;
}

.item a{
text-decoration:none;
color:#333;
flex:1;
margin-left:10px;
}

.bottom{
position:absolute;
bottom:0;
width:360px;
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
  .left{
     display:flex;
     align-items:center;
     gap:12px;
 }

 .left i{
     color:#16a34a;
     width:20px;
 }
</style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

<div class="header">
Profile
</div>

<div class="profile">

<img src="Images/profile.png" />

<h2>
<asp:Label ID="lblName" runat="server" Text="Owner Name"></asp:Label>
</h2>

<p>
<asp:Label ID="lblMobile" runat="server" Text="9876543210"></asp:Label>
</p>

</div>

<div class="menu">

<div class="item">
    <div class="left">
<i class="fa-solid fa-store"></i>
<asp:HyperLink ID="lnkMess" runat="server"
NavigateUrl="MyMess.aspx">My Mess</asp:HyperLink>
        </div>
<i class="fa-solid fa-chevron-right"></i>
    </div>

<div class="item">
    <div class="left">
<i class="fa-solid fa-utensils"></i>
<asp:HyperLink ID="lnkMenu" runat="server"
NavigateUrl="MyMenu.aspx">My Menu</asp:HyperLink>
    </div>
<i class="fa-solid fa-chevron-right"></i>
</div>
<div class="item">
    <div class="left">
<i class="fa-solid fa-star"></i>
<asp:HyperLink ID="HyperLink1" runat="server"
NavigateUrl="MessReview.aspx">Reviews</asp:HyperLink></div>
<i class="fa-solid fa-chevron-right"></i>
</div>


<div class="item">
    <div class="left">
<i class="fa-solid fa-user-pen"></i>
<asp:HyperLink ID="lnkEdit" runat="server"
NavigateUrl="editownerpro4.aspx">Edit Profile</asp:HyperLink></div>
<i class="fa-solid fa-chevron-right"></i>
</div>

<div class="item">
    <div class="left">
<i class="fa-solid fa-lock"></i>
<asp:HyperLink ID="lnkPassword" runat="server"
NavigateUrl="ownerchangepass.aspx">Change Password</asp:HyperLink></div>
<i class="fa-solid fa-chevron-right"></i>
</div>
<div class="item">
    <div class="left">
<i class="fa fa-headset"></i>
<asp:HyperLink ID="lnkBooking" runat="server"
NavigateUrl="ownerhs.aspx">Help & Support</asp:HyperLink>
        </div>
<i class="fa-solid fa-chevron-right"></i>
</div>

<div class="item">
    <div class="left">
<i class="fa-solid fa-right-from-bracket"></i>
<asp:HyperLink ID="lnkLogout" runat="server"
NavigateUrl="firstpage.aspx">Logout</asp:HyperLink></div>
<i class="fa-solid fa-chevron-right"></i>
</div>

</div>

<div class="bottom">

<a href="ownerdash.aspx">
<i class="fa-solid fa-house"></i>
</a>

<a href=BookingRequest.aspx">
<i class="fa-solid fa-store"></i>
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