<%@ Page Language="C#" AutoEventWireup="true" CodeFile="custreviwedit.aspx.cs" Inherits="custreviwedit" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Review</title>

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

        .header h2{
            font-size:22px;
        }

        .form{
            padding:20px;
        }

        label{
            font-weight:bold;
            display:block;
            margin-bottom:8px;
        }

        .txt{
            width:100%;
            height:45px;
            border:1px solid #ccc;
            border-radius:10px;
            padding-left:10px;
            margin-bottom:18px;
        }

        .review{
            width:100%;
            height:120px;
            border:1px solid #ccc;
            border-radius:10px;
            padding:10px;
            resize:none;
            margin-bottom:20px;
        }

        .stars{
            font-size:28px;
            color:#f59e0b;
            text-align:center;
            margin-bottom:20px;
        }

        .btn{
            width:100%;
            height:45px;
            background:#16a34a;
            color:white;
            border:none;
            border-radius:10px;
            font-size:16px;
            font-weight:bold;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

<div class="header">

<a href="Reviews.aspx">
<i class="fa fa-arrow-left"></i>
</a>

<h2>Edit Review</h2>

</div>

<div class="form">

<label>Mess Name</label>

<asp:TextBox ID="txtMess"
runat="server"
CssClass="txt"
ReadOnly="true"
Text="Shiv Shakti Mess">
</asp:TextBox>

<label>Rating</label>

<div class="stars">
★★★★★
</div>

<label>Review</label>

<asp:TextBox ID="txtReview"
runat="server"
CssClass="review"
TextMode="MultiLine">
Food quality is excellent and service is very good.
</asp:TextBox>

<asp:Button ID="btnUpdate"
runat="server"
Text="Update Review"
CssClass="btn"
/>

</div>

</div>

</form>

</body>
</html>