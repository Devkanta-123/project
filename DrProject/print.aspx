<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="print.aspx.cs" Inherits="DrProject.print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Print asp.net gridview data using javascript</title>
    <script type="text/javascript">
        function printGrid() {
            var gridData = document.getElementById('<%= grdResultDetails.ClientID %>');
            var windowUrl = 'about:blank';
            //set print document name for gridview
            var uniqueName = new Date();
            var windowName = 'Print_' + uniqueName.getTime(); var prtWindow = window.open(windowUrl, windowName,
                'left=100,top=100,right=100,bottom=100,width=700,height=500');
            prtWindow.document.write('<html><head></head>');
            prtWindow.document.write('<body style="background:none !important">');
            prtWindow.document.write(gridData.outerHTML);
            prtWindow.document.write('</body></html>');
            prtWindow.document.close();
            prtWindow.focus();
            prtWindow.print();
            prtWindow.close();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <h4>Print asp.net gridview data in asp.net c#, vb.net</h4>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnPrint" runat="server" Text="Print From Client-side"
                        OnClientClick="printGrid()" />&nbsp;&nbsp;
                    <asp:Button ID="btnPrintFromCodeBehind" runat="server"
                        Text="Print From Code-behind" OnClick="btnPrintFromCodeBehind_Click" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="grdResultDetails" runat="server" AutoGenerateColumns="false">
                        <HeaderStyle Font-Bold="true" BackColor="#ff6600" BorderColor="#222"
                            ForeColor="White" Height="30" />
                        <Columns>
                            <asp:BoundField DataField="Subjects" HeaderText="Subjects" ItemStyle-Width="150"
                                ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="Marks" HeaderText="Marks" ItemStyle-Width="150"
                                ItemStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="Grade" HeaderText="Grade" ItemStyle-Width="150"
                                ItemStyle-HorizontalAlign="Center" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>