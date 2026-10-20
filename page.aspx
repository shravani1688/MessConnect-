<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page.aspx.cs" Inherits="page" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

<title>My Bookings</title>

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
    color:#000;
    text-decoration:none;
    margin-right:15px;
    font-size:22px;
}


.header h2{
    font-size:22px;
}


.content{

    padding:15px;
    height:650px;
    overflow-y:auto;

}



.card{

    background:#f8f8f8;
    border-radius:15px;
    padding:15px;
    margin-bottom:15px;

}



.card h3{

    color:#16a34a;
    margin-bottom:10px;

}



.card p{

    margin:6px 0;

}



.status{

    color:#16a34a;
    font-weight:bold;

}
.bottom-nav{
    position:absolute;
    bottom:0;
    width:100%;
    display:flex;
    justify-content:space-around;
    padding:15px 0;
    border-top:1px solid #eee;
    background:white;
}


.bottom-nav a{

text-decoration:none;

}



.bottom-nav i{

font-size:22px;
color:#777;

}



.bottom-nav .active{

color:#16a34a!important;

}

.buttons{

    display:flex;
    justify-content:space-between;
    margin-top:15px;

}



.btnView{

    width:48%;
    height:40px;
    background:#16a34a;
    color:white;
    border:none;
    border-radius:10px;
    font-weight:bold;

}



.btnCancel{

    width:48%;
    height:40px;
    background:#ef4444;
    color:white;
    border:none;
    border-radius:10px;
    font-weight:bold;

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


<h2>My Bookings</h2>


</div>


<div class="content">



<asp:Repeater ID="rptBooking" runat="server">

<ItemTemplate>

<div class="card">

<h3><%# Eval("MessName") %></h3>

<p><b>Location:</b> <%# Eval("Location") %></p>

<p><b>Meal:</b> <%# Eval("MealType") %></p>

<p><b>Date:</b> <%# Eval("Date","{0:dd MMM yyyy}") %></p>

<p><b>Amount:</b> ₹ <%# Eval("Amount") %></p>

<p class="status">
Status : <%# Eval("Status") %>
</p>

<div class="buttons">

<asp:Button ID="btnView"
runat="server"
Text="View Details"
CssClass="btnView"
CommandArgument='<%# Eval("BookingId") %>'
OnClick="btnView_Click" />

<asp:Button ID="btnCancel"
runat="server"
Text="Cancel Booking"
CssClass="btnCancel"
CommandArgument='<%# Eval("BookingId") %>'
OnClick="btnCancel_Click" />

</div>

</div>

</ItemTemplate>

</asp:Repeater>

</div>




    <div class="bottom-nav">
     <a href="mess6.aspx">
     <i class="fa fa-home"></i></a>
  <a href="page.aspx">  <i class="fa fa-book active"></i></a>
    <a href="cus_my_booking.aspx"> <i class="fa fa-star"></i></a>
     <a href="messprofile.aspx"><i class="fa fa-user "></i></a>
 </div>


</div>   


</form>


</body>

</html>