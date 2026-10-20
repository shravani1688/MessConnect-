<%@ Page Language="C#" AutoEventWireup="true" CodeFile="messinfo.aspx.cs" Inherits="messinfo" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Mess</title>

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
            padding:18px;
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
            height:650px;
            overflow-y:auto;
        }

        .textbox{
            width:100%;
            padding:14px;
            margin-bottom:12px;
            border:none;
            border-radius:12px;
            background:#f3f4f6;
        }

        .checkbox{
            margin-bottom:12px;
            display:block;
            font-size:15px;
        }

        .upload-box{
            background:#f3f4f6;
            padding:20px;
            border-radius:15px;
            text-align:center;
            margin-bottom:15px;
        }

        .btn{
            width:100%;
            padding:15px;
            border:none;
            border-radius:12px;
            background:#16a34a;
            color:white;
            font-size:16px;
            font-weight:bold;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

<div class="phone">

<div class="header">
    <asp:LinkButton ID="btnBack" runat="server" PostBackUrl="~/ownerdash.aspx">
        <i class="fa fa-arrow-left"></i>
    </asp:LinkButton>

    <h2>Add New Mess</h2>
</div>

<div class="content">

    <asp:TextBox ID="txtMessName" runat="server" CssClass="textbox" placeholder="Mess Name"></asp:TextBox>

    <asp:TextBox ID="txtLocation" runat="server" CssClass="textbox" placeholder="Location"></asp:TextBox>

    <asp:TextBox ID="txtDescription" runat="server" CssClass="textbox"
        TextMode="MultiLine" Rows="3" placeholder="Description"></asp:TextBox>

    <asp:TextBox ID="txtContact" runat="server" CssClass="textbox" placeholder="Contact Number"></asp:TextBox>

    <asp:TextBox ID="txtPricePerMonth" runat="server" CssClass="textbox" placeholder="Price Per Month"></asp:TextBox>

    <asp:TextBox ID="txtTotalSeats" runat="server" CssClass="textbox" placeholder="Total Seats"></asp:TextBox>

    <asp:TextBox ID="txtAvailableSeats" runat="server" CssClass="textbox" placeholder="Available Seats"></asp:TextBox>

    <asp:CheckBox ID="chkVeg" runat="server" CssClass="checkbox" Text=" Veg Available" />

    <asp:CheckBox ID="chkNonVeg" runat="server" CssClass="checkbox" Text=" Non Veg Available" />

    <asp:CheckBox ID="chkWifi" runat="server" CssClass="checkbox" Text=" WiFi Available" />

    <asp:CheckBox ID="chkParking" runat="server" CssClass="checkbox" Text=" Parking Available" />

    <asp:CheckBox ID="chkACDining" runat="server" CssClass="checkbox" Text=" AC Dining" />

    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="textbox">
        <asp:ListItem Text="Select Status" Value=""></asp:ListItem>
        <asp:ListItem Text="Open" Value="Open"></asp:ListItem>
        <asp:ListItem Text="Closed" Value="Closed"></asp:ListItem>
    </asp:DropDownList>

    <asp:CheckBox ID="chkIsActive" runat="server" CssClass="checkbox" Text=" Active" />

    <div class="upload-box">

        <i class="fa fa-image fa-2x"></i>

        <p>Upload Mess Image</p>
        <br />

        <asp:FileUpload ID="fuMessImage" runat="server" />

    </div>

    <asp:Button ID="btnSave"
        runat="server"
        Text="Save Mess"
        CssClass="btn"
        OnClick="btnSave_Click"/>

</div>

</div>

</form>

</body>
</html>