<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stepsprogress.aspx.cs" Inherits="DrProject.stepsprogress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     	
	  
	<!-- Style-->  
	<link rel="stylesheet" href="/css/style.css"/>
	<link rel="stylesheet" href="/css/skin_color.css"/>
    <style type="text/css">
    .progress
    {
        width: 100%;
        list-style: none;
        list-style-image: none;
        margin: 20px 0 20px 0;
        padding: 0;
    }
            
    .progress li
    {
        float: left;
        text-align: center;
        position: relative;
    }
            
    .progress .name
    {
        display: block;
        vertical-align: bottom;
        text-align: center;
        margin-bottom: 1em;
        color: black;
        opacity: 0.3;
    }
            
    .progress .step
    {
        color: black;
        border: 3px solid silver;
        background-color: silver;
        border-radius: 50%;
        line-height: 1.2;
        width: 1.2em;
        height: 1.2em;
        display: inline-block;
        z-index: 0;
    }
            
    .progress .step span
    {
        opacity: 0.3;
    }
            
    .progress .active .name, .progress .active .step span
    {
        opacity: 1;
    }
            
    .progress .step:before
    {
        content: "";
        display: block;
        background-color: silver;
        height: 0.4em;
        width: 50%;
        position: absolute;
        bottom: 0.6em;
        left: 0;
        z-index: -1;
    }
            
    .progress .step:after
    {
        content: "";
        display: block;
        background-color: silver;
        height: 0.4em;
        width: 50%;
        position: absolute;
        bottom: 0.6em;
        right: 0;
        z-index: -1;
    }
            
    .progress li:first-of-type .step:before
    {
        display: none;
    }
            
    .progress li:last-of-type .step:after
    {
        display: none;
    }
            
    .progress .done .step, .progress .done .step:before, .progress .done .step:after, .progress .active .step, .progress .active .step:before
    {
        background-color: lightgreen;
    }
            
    .progress .done .step, .progress .active .step
    {
        border: 3px solid lightblue;
    }
 
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('[id*=btnStatus]').on('click', function () {
            var id = $('[id*=txtOrderId]').val();
            $.ajax({
                type: "POST",
                url: "stepsprogress.aspx/GetStatus",
                data: '{appointID: "' + id + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    $('ol li').removeClass();
                    var status = response.d;
                    var i;
                    $('ol li').each(function (index, item) {
                        if ($(this).find('.name').html() == status) {
                            i = index;
                        }
                    });
                    $('ol li').each(function (index, item) {
                        if (i == index) {
                            $(this).addClass("active");
                        } else if (i > index) {
                            $(this).addClass("done");
                        } else {
                            $(this).removeClass;
                        }
                    });
                }, failure: function (response) {
                    alert(response.responseText);
                }, error: function (response) {
                    alert(response.responseText);
                }
            });
            return false;
        });
    });
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox runat="server" ID="txtOrderId" Text="10001" />
<asp:Button ID="btnStatus" Text="Check Status" runat="server" />
<br />
<ol class="progress">
    <li><span class="name">Booked</span> <span class="step"><span>1</span></span> </li>
    <li><span class="name">Approved</span> <span class="step"><span>2</span></span></li>
    <li><span class="name">Cancel</span> <span class="step"><span>3</span></span></li>
   
</ol>
        </div>
        
    </form>
</body>
</html>
