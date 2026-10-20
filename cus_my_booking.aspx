<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="cus_my_booking.aspx.cs"
    Inherits="cus_my_booking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>My Bookings</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

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

/* PHONE */


.phone{

width:360px;
height:740px;
background:#fff;
border-radius:30px;
overflow:hidden;
box-shadow:0 10px 30px gray;
position:relative;

}


/* HEADER */

.header{
    height:65px;
    background:#fff;
    display:flex;
    align-items:center;
    padding:0 18px;
    border-bottom:1px solid #e5e5e5;
}

.back{
    color:#222;
    font-size:20px;
    text-decoration:none;
    margin-right:15px;
}

.header h2{
    color:#222;
    font-size:20px;
}

/* CONTENT */

.content{
    height:675px;
    overflow-y:auto;
    padding:18px;
}

/* BOOKING CARD */

.booking-card{
    background:#ffffff;
    border:1px solid #e5e7eb;
    border-radius:16px;
    padding:15px;
    margin-bottom:18px;
    box-shadow:0 3px 10px rgba(0,0,0,.08);
}

.mess-name{
    color:#15803d;
    font-size:18px;
    font-weight:bold;
    margin-bottom:10px;
}

.mess-name i{
    margin-right:6px;
}

.info{
    color:#555;
    font-size:13px;
    margin-top:8px;
}

.info i{
    width:20px;
    color:#16a34a;
}

.status{
    display:inline-block;
    margin-top:12px;
    padding:6px 14px;
    background:#dcfce7;
    color:#15803d;
    border-radius:20px;
    font-size:13px;
    font-weight:bold;
}
.bottom-nav{

position:absolute;
bottom:0;
width:100%;
background:white;
display:flex;
justify-content:space-around;
padding:15px;
box-shadow:0 -3px 10px #ddd;

}



.bottom-nav a{

text-decoration:none;

}
.bottom-nav .active{

color:#16a34a!important;

}

.bottom-nav i{

font-size:22px;
color:#777;

}

.details-btn{
    width:100%;
    height:42px;
    margin-top:15px;
    border:none;
    border-radius:10px;
    background:#16a34a;
    color:#fff;
    font-size:15px;
    font-weight:bold;
    cursor:pointer;
}

.details-btn:hover{
    background:#15803d;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

    <div class="header">

        <a href="mess6.aspx" class="back">
            <i class="fa fa-arrow-left"></i>
        </a>

        <h2>My Bookings</h2>

    </div>

    <div class="content">

        <asp:Repeater ID="rptBooking"
            runat="server">
                        <ItemTemplate>

                <div class="booking-card">

                    <div class="mess-name">
                        <i class="fa fa-utensils"></i>
                        <%# Eval("MessName") %>
                    </div>

                    <div class="info">
                        <i class="fa fa-location-dot"></i>
                        <%# Eval("Location") %>
                    </div>

                    <div class="info">
                        <i class="fa fa-calendar"></i>
                        Booking Date :
                        <%# Eval("Date","{0:dd-MM-yyyy}") %>
                    </div>

                    <div class="info">
                        <i class="fa fa-bowl-food"></i>
                        Meal Type :
                        <%# Eval("MealType") %>
                    </div>

                    <div class="info">
                        <i class="fa fa-indian-rupee-sign"></i>
                        Amount :
                        ₹ <%# Eval("Amount") %>
                    </div>

                    <div class="status">
                        <%# Eval("Status") %>
                    </div>

                    <br /><br />

                    <asp:Button ID="btnView"
                        runat="server"
                        Text="View Details"
                        CssClass="details-btn"
                        CommandName="ViewDetails"
                        CommandArgument='<%# Eval("BookingId") %>'
                        OnCommand="btnView_Command" />

                </div>

            </ItemTemplate>

        </asp:Repeater>
<div class="bottom-nav">


<a href="mess6.aspx">

<i class="fa fa-home active"></i>

</a>




<a href="page.aspx">

<i class="fa fa-book"></i>

</a>




<a href="cus_my_booking.aspx">

<i class="fa fa-star"></i>

</a>




<a href="messprofile.aspx">

<i class="fa fa-user "></i>

</a>



</div>


    </div>

</div>

</form>

</body>

</html>