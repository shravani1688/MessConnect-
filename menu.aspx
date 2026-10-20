<%@ Page Language="C#" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Menu</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
            padding:18px;
            box-shadow:0 15px 40px rgba(0,0,0,.2);
        }

        .header{
            display:flex;
            align-items:center;
            margin-bottom:20px;
        }

        .header h2{
            margin-left:10px;
        }

        .content{
            overflow-y:auto;
        }

        .textbox{
            width:100%;
            padding:14px;
            margin-bottom:15px;
            border:none;
            border-radius:10px;
            background:#f3f4f6;
        }

        .btn{
            width:100%;
            padding:14px;
            border:none;
            border-radius:10px;
            background:green;
            color:white;
            font-size:16px;
            cursor:pointer;
        }
    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

<div class="header">

<asp:LinkButton ID="btnBack"
    runat="server"
    PostBackUrl="~/ownerdash.aspx">
<i class="fa fa-arrow-left"></i>
</asp:LinkButton>

<h2>Add Menu</h2>

</div>

<div class="content">

<asp:DropDownList ID="ddlDay" runat="server" CssClass="textbox">
    <asp:ListItem Value="">Select Day</asp:ListItem>
    <asp:ListItem>Monday</asp:ListItem>
    <asp:ListItem>Tuesday</asp:ListItem>
    <asp:ListItem>Wednesday</asp:ListItem>
    <asp:ListItem>Thursday</asp:ListItem>
    <asp:ListItem>Friday</asp:ListItem>
    <asp:ListItem>Saturday</asp:ListItem>
    <asp:ListItem>Sunday</asp:ListItem>
</asp:DropDownList>

<asp:TextBox ID="txtBreakfast" runat="server" CssClass="textbox" placeholder="Breakfast"></asp:TextBox>

<asp:TextBox ID="txtLunch" runat="server" CssClass="textbox" placeholder="Lunch"></asp:TextBox>

<asp:TextBox ID="txtDinner" runat="server" CssClass="textbox" placeholder="Dinner"></asp:TextBox>

<asp:Button ID="btnSave"
    runat="server"
    Text="Save Menu"
    CssClass="btn"
    OnClick="btnSave_Click"/>

</div>

</div>

</form>

</body>
</html>