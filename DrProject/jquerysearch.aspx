<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jquerysearch.aspx.cs" Inherits="DrProject.jquerysearch" %>

<!DOCTYPE html>  
<script src="/js/jquery-3.6.4.min.js"></script>  
<script language="javascript" type="text/javascript">  
    $.expr[":"].containsNoCase = function (el, i, m) {  
        var search = m[3];  
        if (!search) return false;  
        return eval("/" + search + "/i").test($(el).text());  
    };  
  
    $(document).ready(function () {  
        $('#txtSearch').keyup(function () {  
            if ($('#txtSearch').val().length > 1) {  
                $('#searchGridView tr').hide();  
                $('#searchGridView tr:first').show();  
                $('#searchGridView tr td:containsNoCase(\'' + $('#txtSearch').val() + '\')').parent().show();  
            }  
            else if ($('#txtSearch').val().length == 0) {  
                resetSearchValue();  
            }  
  
            if ($('#searchGridView tr:visible').length == 1) {  
                $('.norecords').remove();  
                $('#searchGridView').append('<tr class="norecords"><td colspan="6" class="Normal" style="text-align: center">No records were found</td></tr>');  
            }  
        });  
  
        $('#txtSearch').keyup(function (event) {  
            if (event.keyCode == 27) {  
                resetSearchValue();  
            }  
        });  
    });  
  
    function resetSearchValue() {  
        $('#txtSearch').val('');  
        $('#searchGridView tr').show();  
        $('.norecords').remove();  
        $('#txtSearch').focus();  
    }  
  
</script>  
<html>  
<body>  
    <p style="text-align: right; width: 500px; margin-top: 50px; margin-left: 150px">  
        <span style="font-weight: bold;">Search:</span>  
        <input type="text" id="txtSearch" name="txtSearch"  placeholder="    type search text" maxlength="50" style="height: 25px; font: 100" />   
    </p>  
    <form id="form1" runat="server">  
        <div>  
            <asp:GridView ID="searchGridView" runat="server" Style="width: 80%; margin-left: 100px" ForeColor="Black" BackColor="#CCCCFF" BorderColor="#00FFCC" BorderStyle="Solid" Font-Names="Arial">  
                <AlternatingRowStyle BackColor="#FFCC99" BorderColor="#00FFCC" />  
            </asp:GridView>  
        </div>  
    </form>  
</body>  
</html>  