<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditMess.aspx.cs" Inherits="EditMess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Mess</title>

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
    overflow-y:auto;
    box-shadow:0 15px 40px rgba(0,0,0,.2);
}

.header{
    height:70px;
    display:flex;
    align-items:center;
    padding:0 20px;
    border-bottom:1px solid #ddd;
    position:sticky;
    top:0;
    background:#fff;
}

.back{
    color:#16a34a;
    font-size:22px;
    margin-right:15px;
    text-decoration:none;
}

.header h2{
    color:#222;
}

.content{
    padding:20px;
}

.lbl{
    font-size:14px;
    font-weight:600;
    margin-bottom:5px;
    display:block;
    color:#444;
}

.txt{
    width:100%;
    height:45px;
    border:1px solid #ccc;
    border-radius:10px;
    padding:10px;
    margin-bottom:15px;
}

textarea{
    height:80px!important;
}

.check{
    margin-bottom:15px;
    font-size:15px;
}

.btn{
    width:100%;
    height:48px;
    border:none;
    border-radius:12px;
    background:#16a34a;
    color:white;
    font-size:16px;
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

<div class="header">

<a href="MyMess.aspx">
<i class="fa-solid fa-arrow-left"></i></a>


<h2>Edit Mess</h2>

</div>

<div class="content">

<label class="lbl">Mess Name</label>
<asp:TextBox ID="txtMessName" runat="server" CssClass="txt"/>

<label class="lbl">Location</label>
<asp:TextBox ID="txtLocation" runat="server" CssClass="txt"/>

<label class="lbl">Description</label>
<asp:TextBox ID="txtDescription"
runat="server"
CssClass="txt"
TextMode="MultiLine"/>

<label class="lbl">Contact Number</label>
<asp:TextBox ID="txtContact" runat="server" CssClass="txt"/>

<label class="lbl">Price Per Month</label>
<asp:TextBox ID="txtPrice" runat="server" CssClass="txt"/>

<label class="lbl">Total Seats</label>
<asp:TextBox ID="txtTotalSeats" runat="server" CssClass="txt"/>

<label class="lbl">Available Seats</label>
<asp:TextBox ID="txtAvailableSeats" runat="server" CssClass="txt"/>

<label class="lbl">Status</label>

<asp:DropDownList ID="ddlStatus" runat="server" CssClass="txt">
    <asp:ListItem>Available</asp:ListItem>
    <asp:ListItem>Full</asp:ListItem>
</asp:DropDownList>

<div class="check">
<asp:CheckBox ID="chkVeg" runat="server" Text=" Veg"/>
</div>

<div class="check">
<asp:CheckBox ID="chkNonVeg" runat="server" Text=" Non Veg"/>
</div>

<div class="check">
<asp:CheckBox ID="chkWifi" runat="server" Text=" WiFi"/>
</div>

<div class="check">
<asp:CheckBox ID="chkParking" runat="server" Text=" Parking"/>
</div>

<div class="check">
<asp:CheckBox ID="chkACDining" runat="server" Text=" AC Dining"/>
</div>

<asp:Button ID="btnUpdate"
runat="server"
Text="Update Mess Details"
CssClass="btn"
OnClick="btnUpdate_Click"/>

</div>

</div>

</form>

</body>
</html>