<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <style>
     body {
         height: 100vh;
         display: flex;
         justify-content: center;
         align-items: center;
         background-image: url("https://images.unsplash.com/photo-1497366754035-f200968a6e72");
         background-size: cover;
         background-position: center;
         background-repeat: no-repeat;
     }
     .container {
         width: 350px;
         background: rgba(255,255,255,0.2);
         padding: 35px;
         border-radius: 15px;
         box-shadow: 0 0 15px rgba(0,0,0,0.4);
     }
     .input{
         width=10px;
     }

 </style>
</head>
<body>
    

   
    <form id="form1" runat="server">
        <div  class ="container">
         <h2>Login page</h2>
<label>user name:</label> 
           
             <asp:TextBox ID="usText" runat="server" >  </asp:TextBox> <br /><br />
            

 <label>password:</label>

 <asp:TextBox ID="paText" runat="server">   </asp:TextBox>
     
       <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
       
      <asp:Button ID="btnreset" runat="server" Text="Reset" OnClick="btnReset_click" />
            <asp:label ID="Iblmsg" runat="server">  </asp:label>   
 </div>
        
    </form>
</body>
</html>
