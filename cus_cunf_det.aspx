<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cus_cunf_det.aspx.cs" Inherits="cus_cunf_det" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Confirm Booking</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

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

        /* MOBILE PHONE */

        .phone{
            width:360px;
            height:740px;
            background:white;
            border-radius:35px;
            overflow:hidden;
            box-shadow:0 15px 40px rgba(0,0,0,0.20);
        }

        /* HEADER */

        .header{
            height:65px;
            display:flex;
            align-items:center;
            padding:0 18px;
            border-bottom:1px solid #e5e5e5;
            background:white;
        }

        .back{
            color:#222;
            text-decoration:none;
            font-size:21px;
            margin-right:15px;
        }

        .header h2{
            font-size:20px;
            color:#222;
        }

        /* CONTENT */

        .content{
            height:675px;
            overflow-y:auto;
            padding:18px;
            padding-bottom:30px;
        }

        /* CONFIRMATION */

        .success{
            text-align:center;
            margin-bottom:18px;
        }

        .success-icon{
            width:65px;
            height:65px;
            margin:auto;
            border-radius:50%;
            background:#dcfce7;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .success-icon i{
            color:#16a34a;
            font-size:32px;
        }

        .success h2{
            margin-top:10px;
            color:#16a34a;
            font-size:21px;
        }

        .success p{
            margin-top:5px;
            color:#666;
            font-size:13px;
        }

        /* MESS CARD */

        .mess-card{
            background:#f0fdf4;
            border:1px solid #dcfce7;
            border-radius:15px;
            padding:15px;
            margin-bottom:18px;
        }

        .mess-name{
            color:#15803d;
            font-size:19px;
            font-weight:bold;
            margin-bottom:9px;
        }

        .mess-info{
            color:#555;
            font-size:13px;
            margin-top:6px;
        }

        .mess-info i{
            color:#16a34a;
            width:18px;
        }

        /* SECTION TITLE */

        .section-title{
            font-size:17px;
            font-weight:bold;
            color:#222;
            margin:17px 0 10px;
        }

        /* BOOKING DETAILS */

        .details{
            background:#f8f8f8;
            border-radius:13px;
            padding:13px;
        }

        .row{
            display:flex;
            justify-content:space-between;
            align-items:center;
            padding:8px 0;
            border-bottom:1px solid #e5e5e5;
            font-size:14px;
        }

        .row:last-child{
            border-bottom:none;
        }

        .row span:first-child{
            color:#666;
        }

        .row span:last-child{
            font-weight:600;
            color:#222;
            text-align:right;
        }

        .confirmed{
            color:#16a34a !important;
        }

        /* TODAY MENU */

        .menu-card{
            background:white;
            border:1px solid #e5e7eb;
            border-radius:14px;
            padding:13px;
        }

        .meal{
            padding:9px 0;
            border-bottom:1px solid #eeeeee;
        }

        .meal:last-child{
            border-bottom:none;
        }

        .meal-title{
            color:#16a34a;
            font-weight:bold;
            font-size:14px;
            margin-bottom:4px;
        }

        .meal-title i{
            width:20px;
        }

        .food{
            color:#555;
            font-size:13px;
            line-height:19px;
        }

        /* WEEKLY MENU BUTTON */

        .week-btn{
            width:100%;
            height:44px;
            margin-top:12px;
            border:none;
            border-radius:10px;
            background:#16a34a;
            color:white;
            font-size:15px;
            font-weight:bold;
            cursor:pointer;
        }

        /* WEEKLY MENU */

        .weekly{
            margin-top:12px;
            background:#f0fdf4;
            border-radius:13px;
            padding:12px;
        }

        .day{
            background:white;
            border-radius:10px;
            padding:10px;
            margin-bottom:8px;
            border-left:4px solid #16a34a;
        }

        .day:last-child{
            margin-bottom:0;
        }

        .day h4{
            color:#15803d;
            font-size:14px;
            margin-bottom:5px;
        }

        .day p{
            color:#555;
            font-size:12px;
            line-height:19px;
        }

        /* RATING */

        .review-box{
            background:#f8f8f8;
            border-radius:13px;
            padding:14px;
        }

        .rating-title{
            text-align:center;
            font-size:14px;
            font-weight:600;
            color:#444;
            margin-bottom:8px;
        }

        .stars{
            text-align:center;
            margin-bottom:12px;
        }

        .stars i{
            font-size:26px;
            color:#fbbf24;
            margin:2px;
        }

        /* REVIEW TEXTBOX */

        .review-text{
            width:100%;
            height:80px;
            border:1px solid #d1d5db;
            border-radius:10px;
            padding:10px;
            resize:none;
            outline:none;
            font-size:13px;
        }

        .review-text:focus{
            border-color:#16a34a;
        }

        /* SUBMIT */

        .submit{
            width:100%;
            height:43px;
            margin-top:10px;
            border:none;
            border-radius:10px;
            background:#16a34a;
            color:white;
            font-size:15px;
            font-weight:bold;
            cursor:pointer;
        }

        .submit:hover{
            background:#15803d;
        }

        .bottom-space{
            height:25px;
        }

    </style>

</head>


<body>

<form id="form1" runat="server">

<div class="phone">


    <!-- HEADER -->

    <div class="header">

        <a href="cus_my_booking.aspx" class="back">
            <i class="fa fa-arrow-left"></i>
        </a>

        <h2>Confirm Booking</h2>

    </div>


    <!-- CONTENT -->

    <div class="content">


        <!-- BOOKING CONFIRMED -->

        <div class="success">

            <div class="success-icon">

                <i class="fa fa-check"></i>

            </div>

            <h2>Booking Confirmed!</h2>

            <p>
                Your booking has been confirmed successfully.
            </p>

        </div>


        <!-- MESS DETAILS -->
<div class="mess-card">

    <div class="mess-name">
        <i class="fa fa-utensils"></i>
        <asp:Label ID="lblMessName" runat="server"></asp:Label>
    </div>

    
    <div class="mess-info">
        <i class="fa fa-user"></i>
        <asp:Label ID="lblOwnerName" runat="server"></asp:Label>
    </div>

    <div class="mess-info">
        <i class="fa fa-location-dot"></i>
        <asp:Label ID="lblLocation" runat="server"></asp:Label>
    </div>

    <div class="mess-info">
        <i class="fa fa-phone"></i>
        <asp:Label ID="lblContact" runat="server"></asp:Label>
    </div>

</div>


        <!-- BOOKING DETAILS -->

        <div class="section-title">

            Booking Details

        </div>

        <div class="row">

    <span>Booking ID</span>

    <span>
        <asp:Label ID="lblBookingId"
            runat="server">
        </asp:Label>
    </span>

</div>
        <div class="details">


            <div class="row">

                <span>Booking Date</span>

                <span>

                    <asp:Label ID="lblBookingDate"
                        runat="server">
                    </asp:Label>

                </span>

            </div>


            <div class="row">

                <span>Meal Type</span>

                <span>

                    <asp:Label ID="lblMealType"
                        runat="server">
                    </asp:Label>

                </span>

            </div>


            <div class="row">

                <span>Amount</span>

                <span>

                    <asp:Label ID="lblAmount"
                        runat="server">
                    </asp:Label>

                </span>

            </div>


            <div class="row">

                <span>Status</span>

                <span class="confirmed">

                    <asp:Label ID="lblStatus"
                        runat="server">
                    </asp:Label>

                </span>

            </div>


        </div>


        <!-- TODAY'S MENU -->

        <div class="section-title">

            Today's Menu

        </div>


        <div class="menu-card">


            <!-- BREAKFAST -->

            <div class="meal">

                <div class="meal-title">

                    <i class="fa fa-mug-hot"></i>

                    Breakfast

                </div>

                <div class="food">

                    <asp:Label ID="lblBreakfast"
                        runat="server">
                    </asp:Label>

                </div>

            </div>


            <!-- LUNCH -->

            <div class="meal">

                <div class="meal-title">

                    <i class="fa fa-bowl-food"></i>

                    Lunch

                </div>

                <div class="food">

                    <asp:Label ID="lblLunch"
                        runat="server">
                    </asp:Label>

                </div>

            </div>


            <!-- DINNER -->

            <div class="meal">

                <div class="meal-title">

                    <i class="fa fa-utensils"></i>

                    Dinner

                </div>

                <div class="food">

                    <asp:Label ID="lblDinner"
                        runat="server">
                    </asp:Label>

                </div>

            </div>


        </div>


        <!-- WEEKLY MENU -->

        <asp:Button ID="btnWeeklyMenu"
            runat="server"
            Text="View Weekly Menu"
            CssClass="week-btn"
            OnClientClick="showWeeklyMenu(); return false;" />


        <div id="weeklyMenu"
             class="weekly"
             style="display:none;">


            <!-- REPEATER -->

            <asp:Repeater ID="rptWeeklyMenu"
                runat="server">

                <ItemTemplate>

                    <div class="day">

                        <h4>

                            <%# Eval("Day") %>

                        </h4>

                        <p>

                            <b>Breakfast:</b>

                            <%# Eval("BreakFast") %>

                            <br />

                            <b>Lunch:</b>

                            <%# Eval("Lunch") %>

                            <br />

                            <b>Dinner:</b>

                            <%# Eval("Dinner") %>

                        </p>

                    </div>

                </ItemTemplate>

            </asp:Repeater>


        </div>


        <!-- RATING -->

        <div class="section-title">

            Rate Your Experience

        </div>


        <div class="review-box">


            <div class="rating-title">

                How was your experience?

            </div>


            <asp:RadioButtonList ID="rblRating"
    runat="server"
    RepeatDirection="Horizontal">

    <asp:ListItem Value="1">⭐</asp:ListItem>
    <asp:ListItem Value="2">⭐⭐</asp:ListItem>
    <asp:ListItem Value="3">⭐⭐⭐</asp:ListItem>
    <asp:ListItem Value="4">⭐⭐⭐⭐</asp:ListItem>
    <asp:ListItem Value="5">⭐⭐⭐⭐⭐</asp:ListItem>

</asp:RadioButtonList>

            <!-- REVIEW -->

            <asp:TextBox ID="txtReview"
                runat="server"
                TextMode="MultiLine"
                CssClass="review-text"
                placeholder="Write your review...">
            </asp:TextBox>


            <!-- SUBMIT REVIEW -->

            <asp:Button ID="btnSubmitReview"
                runat="server"
                Text="Submit Review"
                CssClass="submit"
                OnClick="btnSubmitReview_Click" />


        </div>


        <div class="bottom-space"></div>


    </div>

</div>


<script>

    function showWeeklyMenu() {

        var menu = document.getElementById("weeklyMenu");

        var button =
            document.getElementById("<%= btnWeeklyMenu.ClientID %>");


        if (menu.style.display === "none") {

            menu.style.display = "block";

            button.value = "Hide Weekly Menu";

        }
        else {

            menu.style.display = "none";

            button.value = "View Weekly Menu";

        }

    }

</script>


</form>

</body>

</html>