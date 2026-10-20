<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mess21.aspx.cs" Inherits="mess21" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
            background:white;
            border-radius:35px;
            overflow:hidden;
            box-shadow:0 15px 40px rgba(0,0,0,0.25);
        }

        .top{
            height:240px;
            background-image:url('https://images.unsplash.com/photo-1547592180-85f173990554');
            background-size:cover;
            background-position:center;
        }

        .overlay{
            width:100%;
            height:100%;
            background:rgba(0,0,0,0.35);
            display:flex;
            justify-content:center;
            align-items:center;
            color:white;
            font-size:32px;
            font-weight:bold;
        }

        .form{
            padding:25px;
        }

        .form h2{
            margin-bottom:20px;
            color:#111827;
        }

        .textbox{
            width:100%;
            padding:16px;
            margin-bottom:15px;
            border:none;
            border-radius:14px;
            background:#f3f4f6;
            font-size:15px;
        }

        .forgot{
            text-align:right;
            color:#16a34a;
            margin-bottom:20px;
            font-size:14px;
        }

        .btn{
            width:100%;
            padding:08px;
            border:none;
            border-radius:14px;
            background:linear-gradient(135deg,#16a34a,#22c55e);
            color:white;
            font-size:17px;
            font-weight:bold;
            cursor:pointer;
        }

        .signup{
            margin-top:25px;
            text-align:center;
            color:#6b7280;
        }

        .signup span{
            color:#16a34a;
            font-weight:bold;
        }
    </style>

</head>
<body>

    <form id="form1" runat="server">

        <div class="phone">

            <div class="top">
                <div class="overlay">MessConnect</div>
            </div>

            <div class="form">

                <h2>Login</h2>

                <asp:TextBox ID="txtEmail" runat="server"
                    CssClass="textbox"
                    placeholder="Email / Phone">
                </asp:TextBox>

                <asp:TextBox ID="txtPassword" runat="server"
                    CssClass="textbox"
                    TextMode="Password"
                    placeholder="Password">
                </asp:TextBox>

                <div class="forgot">
                    <asp:LinkButton ID="lnkForgot" runat="server">
                        Forgot Password?
                    </asp:LinkButton>
                </div>
                <div class="btn">

                <asp:Button ID="btnLogin"
                    runat="server"
                    Text="Login"
                   CssClass="btn"
                    OnClick="btnLogin_Click" /></div>
                <asp:Label ID="Iblmsg" runat="server"></asp:Label>

                <div class="signup">
                    Don't have an account?
                    <asp:LinkButton ID="lnkSignup" runat="server" PostBackUrl="~/mess5.aspx">

                        <span>Sign Up</span>
                    </asp:LinkButton>
                </div>

            </div>

        </div>

    </form>

</body>
</html>