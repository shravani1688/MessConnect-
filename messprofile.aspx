<%@ Page Language="C#" AutoEventWireup="true" CodeFile="messprofile.aspx.cs" Inherits="messprofile" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

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
            position:relative;
        }

        .header{
            padding:20px;
            text-align:center;
            font-size:22px;
            font-weight:bold;
        }

        .profile{
            text-align:center;
            padding:15px;
        }

        .profile img{
            width:90px;
            height:90px;
            border-radius:50%;
            object-fit:cover;
        }

        .profile h3{
            margin-top:12px;
        }

        .profile p{
            color:#666;
            margin-top:5px;
        }

        .menu{
            padding:15px;
        }

        .menu-item{
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:16px 0;
            border-bottom:1px solid #eee;
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

        .bottom-nav{
            position:absolute;
            bottom:0;
            width:100%;
            display:flex;
            justify-content:space-around;
            padding:15px 0;
            border-top:1px solid #eee;
            background:white;
        }

        .bottom-nav i{
            font-size:20px;
            color:#666;
        }

        .active{
            color:#16a34a !important;
        }

        a{
            text-decoration:none;
            color:inherit;
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
        <asp:Image ID="imgProfile" runat="server"
            ImageUrl="https://www.facebook.com/RohitSharmaOfficialPage/" />

        <h3>
            <asp:Label ID="lblName" runat="server" Text="Rohit Sharma"></asp:Label>
        </h3>

        <p>
            <asp:Label ID="lblMobile" runat="server" Text="9876543210"></asp:Label>
        </p>
    </div>

    <div class="menu">

        <div class="menu-item">
            <div class="left">
                <i class="fa fa-book">

                </i><asp:HyperLink ID="lnkMess" runat="server"
NavigateUrl="page.aspx">My Bookings</asp:HyperLink>
               
            </div>
          <a href="page.aspx">  <i class="fa fa-chevron-right"></i></a>
        </div>

        <div class="menu-item">
            <div class="left">
                <i class="fa fa-star"></i>
               <asp:HyperLink ID="HyperLink1" runat="server"
NavigateUrl="cusreview.aspx">My Reviews</asp:HyperLink> 
            </div>
         <a href="cusreview.aspx">   <i class="fa fa-chevron-right"></i></a>
        </div>

        <div class="menu-item">
            <div class="left">
                <i class="fa fa-heart"></i>
                <asp:HyperLink ID="HyperLink2" runat="server"
NavigateUrl="cusfav.aspx">My Favorites</asp:HyperLink>
            </div>
           <a href="cusfav.aspx"><i class="fa fa-chevron-right"></i></a>
        </div>

        <div class="menu-item">
            <div class="left">
                <i class="fa fa-user-edit"></i>
                <asp:HyperLink ID="HyperLink3" runat="server"
NavigateUrl="cusEditpro.aspx">Edit Profile</asp:HyperLink>
            </div>
         <a href="cusEditPro.aspx" ><i class="fa fa-chevron-right"></i></a>
        </div>

        <div class="menu-item">
            <div class="left">
                <i class="fa fa-lock"></i>
                <asp:HyperLink ID="HyperLink4" runat="server"
NavigateUrl="cuschangepass.aspx">Change password</asp:HyperLink>
            </div>
          <a href="cuschangepass.aspx" ><i class="fa fa-chevron-right"></i></a>
        </div>

        <div class="menu-item">
            <div class="left">
                <i class="fa fa-headset"></i>
              <asp:HyperLink ID="HyperLink5" runat="server"
NavigateUrl="helpsuo.aspx">Help & Support</asp:HyperLink>
            </div><a href="helpsuo.aspx">
            <i class="fa fa-chevron-right"></i></a>
        </div>

        <div class="menu-item">
            <div class="left">
                <i class="fa fa-sign-out-alt"></i>
                <asp:HyperLink ID="HyperLink6" runat="server"
NavigateUrl="Firstpage.aspx">Logout</asp:HyperLink>
            </div>
         <a href="firstpage.aspx">  <i class="fa fa-chevron-right"></i></a>
        </div>

    </div>

    <div class="bottom-nav">
        <a href="mess6.aspx">
        <i class="fa fa-home"></i></a>
     <a href="page.aspx">  <i class="fa fa-book"></i></a>
      <a href="cus_my_booking.aspx">  <i class="fa fa-star"></i></a>
      <a href="messinfo.aspx"> <i class="fa fa-user active"></i></a>
    </div>

</div>

</form>

</body>
</html>