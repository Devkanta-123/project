<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="DrProject.online.payment" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            background-color: black;
            z-index: 99;
            opacity: 0.8;
            filter: alpha(opacity=80);
            -moz-opacity: 0.8;
            min-height: 100%;
            width: 100%;
            border-radius:3px;
        }

        .loading {
            font-family:Garamond (serif);
            font-size: 12pt;
            width: 400px;
            height: 200px;
            display: none;
            position: fixed;
            background-color: White;
            z-index: 999;
            border-radius:7px;
        }

        body {
            font-family: Arial;
            font-size: 10pt;
        }

        table {
            border: 1px solid #ccc;
        }

            table th {
                background-color: #F7F7F7;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border-color: #ccc;
            }
    </style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">
        function ShowProgress() {
            setTimeout(function () {
                var modal = $('<div />');
                modal.addClass("modal");
                $('body').append(modal);
                var loading = $(".loading");
                loading.show();
                var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
                var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
                loading.css({ top: top, left: left });
            }, 200);
        }
        $('form').live("submit", function () {
            ShowProgress();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        Country:
        <asp:DropDownList ID="ddlCountries" runat="server">
            <asp:ListItem Text="India" Value="" />
            <asp:ListItem Text="Russia" Value="USA" />
            <asp:ListItem Text="Brazil" Value="Brazil" />
            <asp:ListItem Text="France" Value="France" />
            <asp:ListItem Text="Germany" Value="Germany" />
        </asp:DropDownList>
        <asp:Button ID="btnSubmit" runat="server" Text="Load Customers" OnClick="Submit" />
        <hr />
        <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="CustomerId" HeaderText="Customer Id" />
     
            </Columns>
        </asp:GridView>
        <div class="loading" align="center">
       Transaction is processing Please don't  Refresh this Pages<br />
            <br />
            <img src="1.gif" alt="" />
        </div>
    </form>
</body>
</html>
