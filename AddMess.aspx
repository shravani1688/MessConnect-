<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddMess.aspx.cs" Inherits="AddMess" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Mess</title>

    <style>
        body{
            font-family:Arial;
            background:#f5f5f5;
        }

        .container{
            width:400px;
            margin:30px auto;
            background:white;
            padding:20px;
            border-radius:10px;
            box-shadow:0 0 10px gray;
        }

        h2{
            text-align:center;
        }

        .txt{
            width:100%;
            padding:10px;
            margin-top:8px;
            margin-bottom:12px;
        }

        .btn{
            width:100%;
            padding:12px;
            background:#2196F3;
            color:white;
            border:none;
            border-radius:5px;
            font-size:16px;
            cursor:pointer;
        }

        .chk{
            margin-right:15px;
        }
    </style>

</head>
<body>

<form id="form1" runat="server">

<div class="container">

<h2>Add Mess</h2>

<asp:TextBox ID="txtMessName" runat="server" CssClass="txt"
    placeholder="Mess Name"></asp:TextBox>

<asp:TextBox ID="txtLocation" runat="server" CssClass="txt"
    placeholder="Location"></asp:TextBox>

<asp:TextBox ID="txtDescription" runat="server" CssClass="txt"
    TextMode="MultiLine" Rows="4"
    placeholder="Description"></asp:TextBox>

<asp:TextBox ID="txtContactNo" runat="server" CssClass="txt"
    placeholder="Contact Number"></asp:TextBox>

<label>Facilities</label>
<br /><br />

<asp:CheckBox ID="chkVeg" runat="server" Text="Veg" CssClass="chk" />

<asp:CheckBox ID="chkNonVeg" runat="server" Text="Non-Veg" CssClass="chk" />

<asp:CheckBox ID="chkWifi" runat="server" Text="WiFi" CssClass="chk" />

<asp:CheckBox ID="chkParking" runat="server" Text="Parking" CssClass="chk" />

<asp:CheckBox ID="chkACDining" runat="server" Text="AC Dining" CssClass="chk" />

<br /><br />

<asp:TextBox ID="txtPrice" runat="server" CssClass="txt"
    placeholder="Price Per Month"></asp:TextBox>

<asp:TextBox ID="txtTotalSeats" runat="server" CssClass="txt"
    placeholder="Total Seats"></asp:TextBox>

<asp:TextBox ID="txtAvailableSeats" runat="server" CssClass="txt"
    placeholder="Available Seats"></asp:TextBox>

<asp:Button ID="btnSave"
    runat="server"
    Text="Save Mess"
    CssClass="btn"
    OnClick="btnSave_Click" />

</div>

</form>

</body>
</html>