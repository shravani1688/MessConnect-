<%@ Page Language="C#" AutoEventWireup="true" CodeFile="messdetails.aspx.cs" Inherits="messdetails" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Mess Details</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{
            background:#e5e7eb;
            font-family:Segoe UI;
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
        }

        /* Mobile Screen */
        .phone{
            width:360px;
            height:740px;
            background:#fff;
            border-radius:30px;
            overflow:hidden;
            box-shadow:0 10px 30px rgba(0,0,0,.2);
        }

        /* Header */
        .header{
            height:60px;
            background:#16a34a;
            color:#fff;
            display:flex;
            align-items:center;
            padding:0 15px;
        }

        .back{
            text-decoration:none;
            color:#fff;
            font-size:28px;
            margin-right:15px;
            font-weight:bold;
        }

        .title{
            font-size:20px;
            font-weight:bold;
        }

        .content{
            padding:20px;
        }

        h2{
            color:#16a34a;
            margin-bottom:20px;
        }

        .info{
            margin-top:15px;
            font-size:17px;
            line-height:28px;
        }

        .btn{
            width:100%;
            height:48px;
            background:#16a34a;
            color:white;
            border:none;
            border-radius:12px;
            margin-top:30px;
            font-size:17px;
            font-weight:bold;
            cursor:pointer;
        }

        .btn:hover{
            background:#15803d;
        }
    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

    <!-- Header -->
    <div class="header">
        <a href="javascript:history.back()" class="back">&#8592;</a>
        <div class="title">Mess Details</div>
        <a href="page.aspx">
    <i class="fa fa-arrow-left"></i>
</a>
    </div>

    <div class="content">

        <h2>
            <asp:Label ID="lblName" runat="server"></asp:Label>
        </h2>

        <div class="info">
            📍
            <asp:Label ID="lblLocation" runat="server"></asp:Label>
        </div>

        <div class="info">
            <asp:Label ID="lblDescription" runat="server"></asp:Label>
        </div>

        <div class="info">
            💰 ₹
            <asp:Label ID="lblPrice" runat="server"></asp:Label>
            / Month
        </div>

        <div class="info">
            🪑 Seats :
            <asp:Label ID="lblSeats" runat="server"></asp:Label>
        </div>

        <asp:Button ID="btnBook"
            runat="server"
            Text="Book Now"
            CssClass="btn"
            OnClick="btnBook_Click"/>

    </div>

</div>

</form>

</body>
</html>