
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="firstpage.aspx.cs" Inherits="firstpage" %>



<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MessConnect</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #e5e7eb;
        }

        .phone {
            width: 360px;
            height: 740px;
            border-radius: 35px;
            overflow: hidden;
            position: relative;
            box-shadow: 0 15px 40px rgba(0,0,0,0.3);
            background-image: url('https://images.unsplash.com/photo-1504674900247-0877df9cc836');
            background-size: cover;
            background-position: center;
        }

        .overlay {
            width: 100%;
            height: 100%;
            background: linear-gradient(to top, rgba(0,0,0,0.85), rgba(22,163,74,0.35));
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            padding: 30px;
            color: white;
        }

        .logo {
    position: absolute;
    top: 50px; 
    left: 50%;
    transform: translateX(-50%);
    border-radius: 50%;
    background:#ffffff ;
    
    width : 135px ; 
    height: 135px; 
    
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 10;
    overflow: hidden;
    box-shadow : 0 4px 12px white
}

.logo img {
    width: 100%;
    height: 100%;
    object-fit: contain; 
}
        h1 {
            font-size: 38px;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            color: #d1d5db;
            margin-bottom: 25px;
            line-height: 24px;
        }

        .btn-custom {
            width: 100%;
            padding: 16px;
            border: none;
            border-radius: 250px;
            background: #16a34a;
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="phone">
            <div class="logo">
                <img src="logo.jpeg" alt="logo" />
            </div>

            <div class="overlay">
                <h1>MessConnect</h1>
                <p>Find the best mess near you with healthy and affordable food.</p>
                
                <!-- Fixed Error-Free Server Control Button -->
                <asp:Button id="btnGetStarted" runat="server" class="btn-custom" Text="Get Start" Onclick="btnSave_Button"></asp:Button>
            </div>
        </div>
    </form>
</body>
</html>
