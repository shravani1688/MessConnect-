<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <label>Enter number of a</label>
<input type="text" name="fno" id="fno" /><br /><br />
<label>Enter number of b</label>
<input type="text" name="sno" id="sno" /><br /><br />
<input type="button" name="swap" id="swap" value="swap" onclick="swapno()"/><br />
<label>After swap</label><br /><br />

<label>a</label>
<input type="text" name="no" id="no" readonly="readonly"/><br /><br />
<label>b</label>
<input type="text" name="no" id="ffno" readonly="readonly" />
<script>
    function swapno() {
        var n1 = document.getElementById("fno").value;
        var n2 = document.getElementById("sno").value;
        document.getElementById("no").value = n2;
        document.getElementById("ffno").value = n1;
    }
</script>
    </form>
</body>
</html>
