<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cusreview.aspx.cs" Inherits="cusreview" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Reviews</title>

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
            box-shadow:0 15px 40px rgba(0,0,0,0.2);
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
            overflow-y:auto;
            height:640px;
        }

        .card{
            background:#fff;
            border-radius:15px;
            padding:15px;
            margin-bottom:18px;
            box-shadow:0 2px 8px rgba(0,0,0,0.15);
        }

        .card h3{
            margin-bottom:8px;
        }

        .stars{
            color:#f59e0b;
            margin-bottom:10px;
        }

        .review{
            color:#555;
            margin-bottom:10px;
            line-height:22px;
        }

        .date{
            color:gray;
            font-size:13px;
            margin-bottom:15px;
        }

        .buttons{
            display:flex;
            justify-content:space-between;
        }.bottom-nav{
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

        .edit{
            width:48%;
            height:40px;
            border:none;
            border-radius:10px;
            background:#16a34a;
            color:white;
            font-weight:bold;
            cursor:pointer;
        }

        .delete{
            width:48%;
            height:40px;
            border:none;
            border-radius:10px;
            background:#ef4444;
            color:white;
            font-weight:bold;
            cursor:pointer;
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

        <h2>My Reviews</h2>
    </div>

    <div class="content">

       <asp:Repeater ID="rptReview" runat="server">

<ItemTemplate>

<div class="card">

    <h3><%# Eval("MessName") %></h3>

    <div class="stars">
        <%# GetStars(Convert.ToInt32(Eval("Rating"))) %>
    </div>

    <div class="review">
        <%# Eval("ReviewText") %>
    </div>

    <div class="buttons">

        <asp:Button
            ID="btnEdit"
            runat="server"
            Text="Edit"
            CssClass="edit"
            CommandArgument='<%# Eval("ReviewId") %>'
            OnClick="btnEdit_Click" />

        <asp:Button
            ID="btnDelete"
            runat="server"
            Text="Delete"
            CssClass="delete"
            CommandArgument='<%# Eval("ReviewId") %>'
            OnClick="btnDelete_Click" />

    </div>

</div>

</ItemTemplate>

</asp:Repeater>
            </div>

        
     <div class="bottom-nav">
     <a href="mess6.aspx">
     <i class="fa fa-home"></i></a>
  <a href="page.aspx">  <i class="fa fa-book "></i></a>
  <a href="cusreview.aspx">   <i class="fa fa-star active"></i></a>
     <a href="messprofile.aspx"><i class="fa fa-user "></i></a>
 </div>
        
    </div>
        

</form>

</body>
</html>