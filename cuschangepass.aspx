<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cuschangepass.aspx.cs" Inherits="cuschangepass" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Password</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

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
            box-shadow:0 15px 40px rgba(0,0,0,0.2);
        }

        .header{
            display:flex;
            align-items:center;
            padding:20px;
        }

        .header a{
            color:black;
            text-decoration:none;
            font-size:22px;
            margin-right:15px;
        }

        .header h2{
            font-size:22px;
        }

        .icon{
            text-align:center;
            margin:30px 0;
        }

        .icon i{
            font-size:70px;
            color:#16a34a;
        }

        .form{
            padding:25px;
        }

        label{
            display:block;
            font-weight:600;
            margin-bottom:8px;
        }

        .txt{
            width:100%;
            height:48px;
            border:1px solid #ccc;
            border-radius:12px;
            padding-left:15px;
            margin-bottom:18px;
            font-size:15px;
        }

        .txt:focus{
            outline:none;
            border:2px solid #16a34a;
        }

        .btn{
            width:100%;
            height:50px;
            border:none;
            border-radius:12px;
            background:#16a34a;
            color:#fff;
            font-size:17px;
            font-weight:bold;
            cursor:pointer;
            margin-top:10px;
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

        <h2>Change Password</h2>

    </div>

    <div class="icon">
        <i class="fa fa-lock"></i>
    </div>

    <div class="form">

        <label>Current Password</label>

        <asp:TextBox ID="txtCurrentPassword"
            runat="server"
            CssClass="txt"
            TextMode="Password">
        </asp:TextBox>

        <label>New Password</label>

        <asp:TextBox ID="txtNewPassword"
            runat="server"
            CssClass="txt"
            TextMode="Password">
        </asp:TextBox>

        <label>Confirm Password</label>

        <asp:TextBox ID="txtConfirmPassword"
            runat="server"
            CssClass="txt"
            TextMode="Password">
        </asp:TextBox>

        <asp:Button ID="btnUpdate"
            runat="server"
            Text="Update Password"
            CssClass="btn" 
            Onclick="btnUpdate_Click"/>

    </div>

</div>

</form>

</body>
</html>