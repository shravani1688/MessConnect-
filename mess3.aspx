<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mess3.aspx.cs" Inherits="mess3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  >
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Select Role</title>

    <style>
        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',sans-serif;
        }

        body{
            display:flex;
            justify-content:center;
            align-items:center;
            min-height:100vh;
            background:#e5e7eb;
        }

        .phone{
            width:360px;
            height:740px;
            background:#f9fafb;
            border-radius:35px;
            overflow:hidden;
            box-shadow:0 15px 40px rgba(0,0,0,0.25);
            padding:25px;
        }

        h1{
            text-align:center;
            margin-top:20px;
            color:#111827;
        }

        .subtitle{
            text-align:center;
            color:#6b7280;
            margin-top:8px;
            margin-bottom:30px;
        }

        .card{
            background:white;
            border-radius:15px;
            overflow:hidden;
            margin-bottom:18px;
            box-shadow:0 10px 25px rgba(0,0,0,0.08);
        }

        .card img{
            width:100%;
            height:100px;
            object-fit:cover;
        }

        .content{
            padding:15px;
        }

        .content h2{
            color:#111827;
        }

        .content p{
            color:#6b7280;
            margin-top:8px;
        }

        .btn{
            width:100%;
            padding:08px;
            margin-top:08px;
            border:none;
            border-radius:08px;
            background:#16a34a;
            color:white;
            font-size:16px;
            font-weight:bold;
            cursor:pointer;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="phone">

            <h1>Select Role</h1>
            <div class="subtitle">Choose how you want to continue</div>

            <div class="card">
                <img src="https://images.unsplash.com/photo-1523240795612-9a054b0db644" alt="Student" />
                <div class="content">
                    <h2>Customer</h2>
                    <p>Find and book the best mess near you.</p>
                    <div class="btn">
                    <asp:Button ID="btnStudent" runat="server"
                        Text="Select"
                        CssClass="btn"
                        OnClick="btnStudent_Click" /></div>
                </div>
            </div>
<div class="card">
                <img src="https://images.unsplash.com/photo-1556910103-1c02745aae4d" alt="Mess Owner" />
                <div class="content">
                    <h2>Mess Owner</h2>
                    <p>Manage your mess and bookings easily.</p>
                    <div class="btn">
                    <asp:Button ID="btnMessOwner" runat="server"
                        Text="Select"
                        CssClass="btn"
                        OnClick="btnMessOwner_Click" /></div>
                </div>
            </div>

        </div>

    </form>
</body>
</html>