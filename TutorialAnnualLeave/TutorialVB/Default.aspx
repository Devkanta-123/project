<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" MasterPageFile="~/Site.master" Title="Annual Leave Booking Tutorial" %>
<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
	<script type="text/javascript" src="js/modal.js"></script>
	<link href='css/main.css' type="text/css" rel="stylesheet" /> 
	<link href='Themes/scheduler_white.css' type="text/css" rel="stylesheet" /> 
	<script type="text/javascript">

		var modal = new DayPilot.Modal();
		modal.border = "10px solid #ccc";
		modal.closed = function () {
			if (this.result == "OK") {
				dps.commandCallBack('refresh');
			}
		};

		function createEvent(start, end, resource) {
			modal.height = 250;
			modal.showUrl("New.aspx?start=" + start.toStringSortable() + "&end=" + end.toStringSortable() + "&r=" + resource);
		}

		function editEvent(id) {
			modal.height = 300;
			modal.showUrl("Edit.aspx?id=" + id);
		}

		function afterRender(data) {
		};

	</script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
	<DayPilot:DayPilotScheduler 
		ID="DayPilotScheduler1" 
		runat="server" 

		DataStartField="ReservationStart" 
		DataEndField="ReservationEnd" 
		DataTextField="ReservationId" 
		DataValueField="ReservationId" 
		DataResourceField="PersonId" 

		ClientObjectName="dps"

		Days="365"

		HeightSpec="Max"
		Height="350"
		Width="100%"
		HeaderFontSize="8pt"
		EventFontSize="8pt"

		EventMoveHandling="CallBack" 
		OnEventMove="DayPilotScheduler1_EventMove" 

		EventResizeHandling="CallBack"
		OnEventResize="DayPilotScheduler1_EventResize"

		TimeRangeSelectedHandling="JavaScript"
		TimeRangeSelectedJavaScript="createEvent(start, end, column);" 

		OnCommand="DayPilotScheduler1_Command"

		EventClickHandling="JavaScript"
		EventClickJavaScript="editEvent(e.value());" 

		AfterRenderJavaScript="afterRender(data);" 


		OnBeforeEventRender="DayPilotScheduler1_BeforeEventRender" OnBeforeCellRender="DayPilotScheduler1_BeforeCellRender"

		RowHeaderWidthAutoFit="true"
		DurationBarVisible="false"
		SyncResourceTree="false"

		OnBeforeResHeaderRender="DayPilotScheduler1_BeforeResHeaderRender"

		CellDuration="720" 
		CellWidth="20"
		>
		<TimeHeaders>
			<DayPilot:TimeHeader GroupBy="Month" />
			<DayPilot:TimeHeader GroupBy="Day" />
		</TimeHeaders>
		<HeaderColumns>
			<DayPilot:RowHeaderColumn Title="Person" Width="80" />
			<DayPilot:RowHeaderColumn Title="Total"  Width="80" />
		</HeaderColumns>
	</DayPilot:DayPilotScheduler>

	<br />

</asp:Content>