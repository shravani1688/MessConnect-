<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ownerdash.aspx.cs" Inherits="ownaerdashbord" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Owner Dashboard</title>

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
    background:white;
    border-radius:35px;
    padding:18px;
    overflow:hidden;
    box-shadow:0 15px 40px rgba(0,0,0,0.2);
    position:relative;   
}

        .header{
            display:flex;
            justify-content:space-between;
            align-items:center;
            margin-bottom:20px;
        }

        .header h2{
            font-size:22px;
        }

        .summary-card{
            background:#16a34a;
            color:white;
            padding:18px;
            border-radius:18px;
            margin-bottom:20px;
        }

        .summary-card h3{
            margin-bottom:12px;
        }

        .stats{
            display:flex;
            justify-content:space-between;
            margin-top:15px;
        }

        .stat{
            text-align:center;
        }

        .stat h4{
            font-size:20px;
        }

        .section-title{
            font-size:18px;
            font-weight:bold;
            margin-bottom:15px;
        }

        .actions{
            display:grid;
            grid-template-columns:1fr 1fr;
            gap:12px;
            margin-bottom:20px;
        }

        .action-card{
            background:#f3f4f6;
            padding:20px;
            text-align:center;
            border-radius:16px;
            cursor:pointer;
        }

        .action-card i{
            font-size:22px;
            color:#16a34a;
            margin-bottom:10px;
        }

        .menu-card{
            background:#f9fafb;
            padding:18px;
            border-radius:18px;
        }

        .menu-row{
            display:flex;
            justify-content:space-between;
            padding:12px 0;
            border-bottom:1px solid #eee;
        }
       .bottom{
    position:absolute;
    bottom:0;
    left:0;
    right:0;
    display:flex;
    justify-content:space-around;
    padding:15px 0;
    background:#fff;
    border-top:1px solid #ddd;
}

.bottom i{
font-size:22px;
color:#16a34a;
} 
.left{
    display:flex;
    align-items:center;
    gap:12px;
}

.left i{
    color:#16a34a;
    width:20px;
}
        .linkbtn{
            text-decoration:none;
            color:black;
            display:block;
        }
    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="phone">

    <div class="header">
        <i class="fa fa-bars"></i>
        <h2>Owner Dashboard</h2>
        <i class="fa fa-bell"></i>
    </div>

    <div class="summary-card">

        <h3>
            <asp:Label ID="lblMessName" runat="server" Text="Add mess datials"></asp:Label>
        </h3>

        <p>
            <asp:Label ID="lblLocation" runat="server" Text="Address"></asp:Label>
        </p>

        <div class="stats">

            <div class="stat">
                <p>Total Bookings</p>
                <h4>
                    <asp:Label ID="lblBookings" runat="server" Text="120"></asp:Label>
                </h4>
            </div>

            <div class="stat">
                <p>Total Earnings</p>
                <h4>
                    <asp:Label ID="lblEarnings" runat="server" Text="₹1.2L"></asp:Label>
                </h4>
            </div>

            <div class="stat">
                <p>Seats</p>
                <h4>
                    <asp:Label ID="lblSeats" runat="server" Text="12/50"></asp:Label>
                </h4>
            </div>

        </div>

    </div>

    <div class="section-title">Quick Actions</div>

    <div class="actions">

        <div class="action-card">
            <asp:LinkButton ID="lnkAddMess" runat="server" CssClass="linkbtn" OnClick="lnkAddMess_Click">
                <i class="fa fa-plus"></i>
                <p>Add Mess</p>
            </asp:LinkButton>
        </div>

        <div class="action-card">
            <asp:LinkButton ID="lnkMenu" runat="server" CssClass="linkbtn" OnClick="lnkMenu_Click">
                <i class="fa fa-utensils"></i>
                <p>Manage Menu</p>
            </asp:LinkButton>
        </div>

        <div class="action-card">
            <asp:LinkButton ID="lnkBooking" runat="server" CssClass="linkbtn" OnClick="lnkBooking_Click">
                <i class="fa fa-book"></i>
                <p>Bookings</p>
            </asp:LinkButton>
        </div>

        <div class="action-card">
            <asp:LinkButton ID="lnkReview" runat="server" CssClass="linkbtn" OnClick="lnkReview_Click">
                <i class="fa fa-star"></i>
                <p>Reviews</p>
            </asp:LinkButton>
        </div>

    </div>

    <div class="section-title">Today's Menu</div>

    <div class="menu-card">

        <div class="menu-row">
            <span>Breakfast</span>
            <asp:Label ID="lblBreakfast" runat="server" Text="None"></asp:Label>
        </div>

        <div class="menu-row">
            <span>Lunch</span>
            <asp:Label ID="lblLunch" runat="server" Text="None"></asp:Label>
        </div>

        <div class="menu-row">
            <span>Dinner</span>
            <asp:Label ID="lblDinner" runat="server" Text="None"></asp:Label>
        </div>
        <div class="bottom">

<a href="ownerdash.aspx">
<i class="fa-solid fa-house"></i>
</a>

<a href="BookingRequest.aspx">
<i class="fa-solid fa-store"></i>
</a>

<a href="conf_booking.aspx">
<i class="fa-solid fa-calendar-check"></i>
</a>

<a href="OwnerProfile.aspx">
<i class="fa-solid fa-user"></i>
</a>

</div>
    </div>


</div>

</form>

</body>
</html>