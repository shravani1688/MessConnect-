<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="MyMenu.aspx.cs"
    Inherits="MyMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<title>Weekly Menu</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

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
background:white;
border-radius:35px;
box-shadow:0 15px 40px rgba(0,0,0,.2);
overflow-y:auto;

}


.header{

height:70px;
display:flex;
align-items:center;
padding:0 20px;
border-bottom:1px solid #ddd;
position:sticky;
top:0;
background:white;

}


.back{

color:#16a34a;
font-size:21px;
margin-right:15px;

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


.header h2{

font-size:21px;

}



.content{
    padding:15px;
}

.day-card{
    background:#fff;
    border:1px solid #e5e7eb;
    border-left:5px solid #16a34a;
    border-radius:15px;
    margin-bottom:18px;
    padding:15px;
    box-shadow:0 4px 10px rgba(0,0,0,.05);
}

.day-title{
    font-size:19px;
    font-weight:600;
    color:#16a34a;
    margin-bottom:15px;
    border-bottom:1px solid #eee;
    padding-bottom:8px;
}

.menu-row{
    display:flex;
    align-items:center;
    background:#f8fafc;
    border-radius:10px;
    padding:10px;
    margin-bottom:10px;
}

.icon{
    width:42px;
    height:42px;
    background:#16a34a;
    color:white;
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:18px;
    margin-right:12px;
}

.label{
    color:#777;
    font-size:13px;
}

.value{
    color:#222;
    font-size:16px;
    font-weight:600;
}

</style>

</head>


<body>

<form id="form1" runat="server">


<div class="phone">


<div class="header">

<a href="OwnerProfile.aspx" class="back">
<i class="fa-solid fa-arrow-left"></i>
</a>

<h2>Weekly Menu</h2>

</div>



<div class="content">


<asp:Repeater ID="rptMenu" runat="server">

<ItemTemplate>


<div class="day-card">


<div class="day-title">

<i class="fa-solid fa-calendar"></i>

<%# Eval("Day") %>

</div>



<div class="menu-row">

<div class="icon">
<i class="fa-solid fa-mug-hot"></i>
</div>

<div>

<div class="label">Breakfast</div>

<div class="value">

<%# Eval("Breakfast") %>

</div>

</div>

</div>




<div class="menu-row">

<div class="icon">
<i class="fa-solid fa-bowl-food"></i>
</div>


<div>

<div class="label">Lunch</div>

<div class="value">

<%# Eval("Lunch") %>

</div>

</div>


</div>




<div class="menu-row">

<div class="icon">
<i class="fa-solid fa-utensils"></i>
</div>


<div>

<div class="label">Dinner</div>

<div class="value">

<%# Eval("Dinner") %>

</div>

</div>


</div>


</div>


</ItemTemplate>


</asp:Repeater>


    
            <asp:Button ID="btnEdit"
runat="server"
Text="✏ Edit Mess Details"
CssClass="edit-btn"
PostBackUrl="~/MessEdit.aspx" />
</div>


</div>


</form>


</body>
</html>