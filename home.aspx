<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master"
AutoEventWireup="true" CodeBehind="Home.aspx.cs"
Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2 style="text-align:center; color:#0b3d91;">
        Welcome to My Website
    </h2>

    <p style="font-size:18px; text-align:center;">
        This is the <b>Home Page</b>.
    </p>

    <p style="font-size:16px; text-align:center;">
        Welcome to our ASP.NET Web Forms application.
        This page uses the Master Page layout.
    </p>

</asp:Content>