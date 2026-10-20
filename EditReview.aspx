<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditReview.aspx.cs" Inherits="EditReview" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Review</title>

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
            position:relative;
        }

        .header{
            display:flex;
            align-items:center;
            padding:20px;
            border-bottom:1px solid #ddd;
        }

        .header a{
            text-decoration:none;
            color:#000;
            font-size:22px;
            margin-right:15px;
        }

        .header h2{
            font-size:22px;
        }

        .content{
            padding:20px;
        }

        .label{
            font-size:16px;
            font-weight:bold;
            margin-bottom:8px;
            display:block;
        }

        .textbox{
            width:100%;
            height:130px;
            border:1px solid #ccc;
            border-radius:10px;
            padding:10px;
            resize:none;
            font-size:15px;
            margin-top:8px;
            margin-bottom:20px;
        }

        .dropdown{
            width:100%;
            height:45px;
            border:1px solid #ccc;
            border-radius:10px;
            padding-left:10px;
            margin-bottom:20px;
            font-size:15px;
        }

        .btn{
            width:100%;
            height:45px;
            border:none;
            border-radius:10px;
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
        <a href="cusreview.aspx">
            <i class="fa fa-arrow-left"></i>
        </a>

        <h2>Edit Review</h2>
    </div>

    <div class="content">

        <label class="label">
            Rating
        </label>

        <asp:DropDownList ID="ddlRating"
            runat="server"
            CssClass="dropdown">

            <asp:ListItem Value="1">★☆☆☆☆</asp:ListItem>
            <asp:ListItem Value="2">★★☆☆☆</asp:ListItem>
            <asp:ListItem Value="3">★★★☆☆</asp:ListItem>
            <asp:ListItem Value="4">★★★★☆</asp:ListItem>
            <asp:ListItem Value="5">★★★★★</asp:ListItem>

        </asp:DropDownList>

        <label class="label">
            Review
        </label>

        <asp:TextBox
            ID="txtReview"
            runat="server"
            CssClass="textbox"
            TextMode="MultiLine">
        </asp:TextBox>

        <asp:Button
            ID="btnUpdate"
            runat="server"
            Text="Update Review"
            CssClass="btn"
            OnClick="btnUpdate_Click"/>

    </div>

</div>

</form>

</body>
</html>