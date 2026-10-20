<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="MyMess.aspx.cs"
    Inherits="MyMess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>My Mess</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background: #e5e7eb;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Mobile Screen */

        .phone {
            width: 360px;
            height: 740px;
            background: #ffffff;
            border-radius: 35px;
            box-shadow: 0 15px 40px rgba(0,0,0,.20);
            overflow-y: auto;
            position: relative;
        }

        /* Header */

        .header {
            height: 70px;
            display: flex;
            align-items: center;
            padding: 0 20px;
            border-bottom: 1px solid #e5e5e5;
            position: sticky;
            top: 0;
            background: white;
            z-index: 10;
        }
        .edit-btn {
    width: 100%;
    height: 50px;
    background: #16a34a;
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 20px;
    transition: 0.3s;
}

.edit-btn:hover {
    background: #15803d;
}

.edit-btn:active {
    transform: scale(0.98);
}

        .back {
            color: #16a34a;
            font-size: 21px;
            text-decoration: none;
            margin-right: 15px;
        }

        .header h2 {
            font-size: 21px;
            color: #222;
        }

        /* Content */

        .content {
            padding: 20px;
        }

        /* Mess Image */

        .mess-image {
            text-align: center;
            margin-bottom: 18px;
        }

        .mess-image img {
            width: 110px;
            height: 110px;
            border-radius: 18px;
            object-fit: cover;
            border: 3px solid #16a34a;
        }

        .mess-title {
            text-align: center;
            margin-bottom: 22px;
        }

        .mess-title h1 {
            font-size: 22px;
            color: #222;
        }

        .mess-title p {
            color: #777;
            font-size: 14px;
            margin-top: 4px;
        }

        /* Details Card */

        .details-card {
            background: #f8faf9;
            border-radius: 15px;
            padding: 15px;
            border: 1px solid #e1e1e1;
        }

        .detail-row {
            display: flex;
            align-items: flex-start;
            padding: 12px 0;
            border-bottom: 1px solid #e5e5e5;
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .icon {
            width: 35px;
            color: #16a34a;
            font-size: 17px;
            padding-top: 2px;
        }

        .detail-text {
            flex: 1;
        }

        .detail-text .label {
            font-size: 12px;
            color: #777;
            margin-bottom: 3px;
        }

        .detail-text .value {
            font-size: 15px;
            color: #222;
            font-weight: 500;
        }

        /* Facilities */

        .section-title {
            margin-top: 22px;
            margin-bottom: 10px;
            font-size: 17px;
            color: #222;
            font-weight: 600;
        }

        .facility-container {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .facility {
            background: #dcfce7;
            color: #15803d;
            border-radius: 20px;
            padding: 8px 12px;
            font-size: 12px;
            font-weight: 600;
        }

        /* Edit Button */

        .edit-btn {
            width: 100%;
            height: 46px;
            margin-top: 22px;
            border: none;
            border-radius: 12px;
            background: #16a34a;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
        }

        .edit-btn:hover {
            background: #15803d;
        }

        .edit-btn i {
            margin-right: 8px;
        }

        /* Bottom Space */

        .bottom-space {
            height: 25px;
        }

    </style>

</head>


<body>

<form id="form1" runat="server">

    <div class="phone">

        <!-- Header -->

        <div class="header">

            <a href="OwnerProfile.aspx" class="back">
                <i class="fa-solid fa-arrow-left"></i>
            </a>

            <h2>My Mess</h2>

        </div>


        <!-- Content -->

        <div class="content">

            <!-- Mess Name -->
<div class="detail-row">
    <div class="icon"><i class="fa-solid fa-utensils"></i></div>
    <div class="detail-text">
        <div class="label">Mess Name</div>
        <div class="value">
            <asp:Label ID="lblMessName" runat="server"></asp:Label>
        </div>
    </div>
</div>

<!-- Location -->
<div class="detail-row">
    <div class="icon"><i class="fa-solid fa-location-dot"></i></div>
    <div class="detail-text">
        <div class="label">Location</div>
        <div class="value">
            <asp:Label ID="lblLocation" runat="server"></asp:Label>
        </div>
    </div>
</div>

<!-- Contact -->
<div class="detail-row">
    <div class="icon"><i class="fa-solid fa-phone"></i></div>
    <div class="detail-text">
        <div class="label">Contact Number</div>
        <div class="value">
            <asp:Label ID="lblContact" runat="server"></asp:Label>
        </div>
    </div>
</div>

<!-- Description -->
<div class="detail-row">
    <div class="icon"><i class="fa-solid fa-file-lines"></i></div>
    <div class="detail-text">
        <div class="label">Description</div>
        <div class="value">
            <asp:Label ID="lblDescription" runat="server"></asp:Label>
        </div>
    </div>
</div>

<!-- Price -->
<div class="detail-row">
    <div class="icon"><i class="fa-solid fa-indian-rupee-sign"></i></div>
    <div class="detail-text">
        <div class="label">Price Per Month</div>
        <div class="value">
            ₹ <asp:Label ID="lblPrice" runat="server"></asp:Label>
        </div>
    </div>
</div>

<!-- Total Seats -->
<div class="detail-row">
    <div class="icon"><i class="fa-solid fa-users"></i></div>
    <div class="detail-text">
        <div class="label">Total Seats</div>
        <div class="value">
            <asp:Label ID="lblTotalSeats" runat="server"></asp:Label>
        </div>
    </div>
</div>

<!-- Available Seats -->
<div class="detail-row">
    <div class="icon"><i class="fa-solid fa-chair"></i></div>
    <div class="detail-text">
        <div class="label">Available Seats</div>
        <div class="value">
            <asp:Label ID="lblAvailableSeats" runat="server"></asp:Label>
        </div>
    </div>
</div>

<!-- Status -->
<div class="detail-row">
    <div class="icon"><i class="fa-solid fa-circle-check"></i></div>
    <div class="detail-text">
        <div class="label">Status</div>
        <div class="value">
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
        </div>
    </div>
</div>

<!-- Veg -->
<div class="detail-row">
    <div class="icon">
        <i class="fa-solid fa-leaf"></i>
    </div>
    <div class="detail-text">
        <div class="label">Veg</div>
        <div class="value">
            <asp:Label ID="lblVeg" runat="server"></asp:Label>
        </div>
    </div>
</div>

<!-- Non Veg -->
<div class="detail-row">
    <div class="icon">
        <i class="fa-solid fa-drumstick-bite"></i>
    </div>
    <div class="detail-text">
        <div class="label">Non Veg</div>
        <div class="value">
            <asp:Label ID="lblNonVeg" runat="server"></asp:Label>
        </div>
    </div>
</div>

<!-- WiFi -->
<div class="detail-row">
    <div class="icon">
        <i class="fa-solid fa-wifi"></i>
    </div>
    <div class="detail-text">
        <div class="label">WiFi</div>
        <div class="value">
            <asp:Label ID="lblWifi" runat="server"></asp:Label>
        </div>
    </div>
</div>

<!-- Parking -->
<div class="detail-row">
    <div class="icon">
        <i class="fa-solid fa-square-parking"></i>
    </div>
    <div class="detail-text">
        <div class="label">Parking</div>
        <div class="value">
            <asp:Label ID="lblParking" runat="server"></asp:Label>
        </div>
    </div>
</div>

<!-- AC Dining -->
<div class="detail-row">
    <div class="icon">
        <i class="fa-solid fa-snowflake"></i>
    </div>
    <div class="detail-text">
        <div class="label">AC Dining</div>
        <div class="value">
            <asp:Label ID="lblACDining" runat="server"></asp:Label>
        </div>
    </div>
    
</div>    
            <asp:Button ID="btnEdit"
runat="server"
Text="✏ Edit Mess Details"
CssClass="edit-btn"
PostBackUrl="~/EditMess.aspx" />
        </div>

</form>

</body>

</html>