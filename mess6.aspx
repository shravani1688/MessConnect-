<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mess6.aspx.cs" Inherits="mess6" %>

<!DOCTYPE html>

<html>
<head runat="server">

<title>Mess Home</title>

<link rel="stylesheet" 
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>


<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI';
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
box-shadow:0 10px 30px gray;
position:relative;

}


.top{

background:linear-gradient(135deg,#16a34a,#22c55e);
padding:25px;
color:white;

}


.top h2{
font-size:24px;
}


.top p{
margin-top:5px;
}


.search-box{

margin-top:15px;
background:white;
padding:10px 15px;
border-radius:12px;

}


.search-box input{

border:none;
outline:none;
width:100%;

}



.content{

height:560px;
padding:15px;
overflow:auto;

}



.card{

background:white;
border-radius:15px;
padding:15px;
margin-bottom:15px;
box-shadow:0 4px 10px #ccc;

}



.card h3{

color:#16a34a;
margin-bottom:8px;

}



.card p{

margin-top:8px;

}



.info{

display:flex;
justify-content:space-between;
margin-top:12px;
font-weight:bold;
color:#16a34a;

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
.favBtn{
    color:#777;
    font-size:22px;
    text-decoration:none;
}

.favBtn.active{
    color:red;
}


.bottom-nav i{

font-size:22px;
color:#777;

}



.bottom-nav .active{

color:#16a34a!important;

}


</style>


</head>



<body>


<form id="form1" runat="server">


<div class="phone">



<div class="top">


<h2>

Hello 
<asp:Label ID="lblName" runat="server" Text="Customer"></asp:Label>
👋

</h2>



<p>
Find best mess near you
</p>




<div class="search-box">

<asp:TextBox ID="txtSearch"
    runat="server"
    AutoPostBack="true"
    OnTextChanged="txtSearch_TextChanged">
</asp:TextBox>


</div>


</div>





<div class="content">



<asp:Repeater ID="rptMess" runat="server">

<ItemTemplate>

<asp:LinkButton 
    ID="lnkMess"
    runat="server"
    CommandArgument='<%# Eval("MessId") %>'
    OnClick="lnkMess_Click"
    style="text-decoration:none;color:black;display:block;">

<div class="card">

<h3>
<%# Eval("MessName") %>
</h3>


<p>
<i class="fa fa-location-dot"></i>
<%# Eval("Location") %>
</p>


<p>
<%# Eval("Description") %>
</p>


<div class="info">

<span>
₹ <%# Eval("PricePerMonth") %>/Month
</span>


<span>
Seats :
<%# Eval("AvailableSeats") %>
</span>


</div>
   <asp:LinkButton
    ID="btnFav"
    runat="server"
    CommandArgument='<%# Eval("MessId") %>'
    OnClick="btnFav_Click"
    CssClass="favBtn">

    <i class="fa-regular fa-heart"></i>

</asp:LinkButton>

</div>

</asp:LinkButton>


</ItemTemplate>


</asp:Repeater>



</div>






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


</form>


</body>

</html>