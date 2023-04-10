<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="DrProject.WebForm1" %>

<!DOCTYPE html>  
  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head runat="server">  
    <title></title>  
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>  
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>  
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />  
    <script type="text/javascript">  
        function AlertBox(msgtitle, message, controlToFocus) {
            $("#msgDialogAlert").dialog({
                autoOpen: false,
                modal: true,
                title: msgtitle,
                closeOnEscape: true,
                buttons: [{
                    text: "Ok",
                    click: function () {
                        $(this).dialog("close");
                        if (controlToFocus != null)
                            controlToFocus.focus();
                    }
                }],
                close: function () {
                    $("#operationMsgAlert").html("");
                    if (controlToFocus != null)
                        controlToFocus.focus();
                },
                show: { effect: "clip", duration: 200 }
            });
            $("#operationMsgAlert").html(message);
            $("#msgDialogAlert").dialog("open");
        };

        function ShowMessage() {
            AlertBox("This is Title", "And This is the content of the message!", null);
            return false;
        }
    </script>  
</head>  
<body>  
    <form id="form2" runat="server">  
        <div id="msgDialogAlert" style="display: none; text-align: center; vertical-align: central">  
            <p id="operationMsgAlert"> </p>  
        </div>  
        <asp:Button Text="Click!" runat="server" OnClientClick="return ShowMessage();" />  
    </form>  
</body>  
</html> 
