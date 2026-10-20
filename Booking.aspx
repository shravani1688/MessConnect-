<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Booking.aspx.cs" Inherits="Booking" %>

<!DOCTYPE html>

<html>

<head runat="server">

<title>Booking</title>

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
    background:white;
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



.box{

    padding:25px;

}



input,select{

    width:100%;
    height:45px;
    margin-top:15px;
    border:1px solid #ccc;
    border-radius:10px;
    padding-left:10px;
    font-size:15px;

}



.btn{

    width:100%;
    height:45px;
    margin-top:25px;
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

<a href="mess6.aspx">
    <i class="fa fa-arrow-left"></i>
</a>


<h2>
Book Mess
</h2>


</div>



<div class="box">



<asp:DropDownList ID="ddlMeal"
runat="server">

<asp:ListItem>Breakfast</asp:ListItem>

<asp:ListItem>Lunch</asp:ListItem>

<asp:ListItem>Dinner</asp:ListItem>
    <asp:ListItem>All</asp:ListItem>

</asp:DropDownList>



<asp:TextBox ID="txtAmount"
runat="server"
placeholder="Amount">
</asp:TextBox>



<asp:Button ID="btnConfirm"
runat="server"
Text="Confirm Booking"
CssClass="btn"
OnClick="btnConfirm_Click"/>



</div>


</div>


</form>


</body>

</html>