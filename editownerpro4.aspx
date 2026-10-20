<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editownerpro4.aspx.cs" Inherits="editownerpro4" %>








<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Profile</title>

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
            box-shadow:0 15px 40px rgba(0,0,0,.2);
        }

        .header{
            display:flex;
            align-items:center;
            padding:20px;
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

        .profile{
            text-align:center;
            margin-top:10px;
        }

        .profile img{
            width:110px;
            height:110px;
            border-radius:50%;
            border:4px solid #16a34a;
        }

        .change{
            color:#16a34a;
            margin-top:10px;
            font-weight:bold;
        }

        .form{
            padding:25px;
        }

        .form label{
            display:block;
            margin-bottom:8px;
            font-weight:bold;
        }

        .txt{
            width:100%;
            height:45px;
            border:1px solid #ccc;
            border-radius:10px;
            padding-left:12px;
            margin-bottom:18px;
            font-size:15px;
        }

        .txt:focus{
            border:2px solid #16a34a;
            outline:none;
        }

        .btnSave{
            width:100%;
            height:50px;
            background:#16a34a;
            color:white;
            border:none;
            border-radius:12px;
            font-size:17px;
            font-weight:bold;
            cursor:pointer;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

    <div class="header">

        <a href="ownerprofile.aspx">
            <i class="fa fa-arrow-left"></i>
        </a>

        <h2>Edit Profile</h2>

    </div>

    <div class="profile">

        <img src="Images/user.png" alt="Profile" />

        <div class="change">
            <i class="fa fa-camera"></i>
            Change Photo
        </div>

    </div>

    <div class="form">

        <label>Full Name</label>

        <asp:TextBox ID="txtName"
            runat="server"
            CssClass="txt">
        </asp:TextBox>

        <label>Email</label>

        <asp:TextBox ID="txtEmail"
            runat="server"
            CssClass="txt">
        </asp:TextBox>

        <label>Mobile Number</label>

        <asp:TextBox ID="txtMobile"
            runat="server"
            CssClass="txt">
        </asp:TextBox>

        <br /><br/>

              </br/>
        <br />
        <br />
        <br />
        <br>

        <asp:Button ID="btnSave"
            runat="server"
            Text="Save Changes"
            CssClass="btnSave" OnClick="btnsave_click" />

    </div>

</div>

</form>

</body>
</html>