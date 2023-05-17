' Copyright © 2013 Annpoint, s.r.o.
'   Use of this software is subject to license terms. 
'   http://www.daypilot.org/
'
'   If you have purchased a DayPilot Pro license, you are allowed to use this 
'   code under the conditions of DayPilot Pro License Agreement:
'
'   http://www.daypilot.org/files/LicenseAgreement.pdf
'
'   Otherwise, you are allowed to use it for evaluation purposes only under 
'   the conditions of DayPilot Pro Trial License Agreement:
'   
'   http://www.daypilot.org/files/LicenseAgreementTrial.pdf
'   
'

Imports System
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports DayPilot.Web.Ui
Imports DayPilot.Web.Ui.Data
Imports DayPilot.Web.Ui.Enums
Imports DayPilot.Web.Ui.Events.Scheduler

Partial Public Class _Default
	Inherits System.Web.UI.Page

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		' prevent invalid ViewState errors in Firefox

		If Request.Browser.Browser = "Firefox" Then
			Response.Cache.SetNoStore()
		End If


		If Not IsPostBack Then

			DayPilotScheduler1.StartDate = New Date(Date.Today.Year, 1, 1)
			DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days)
			DayPilotScheduler1.DataBind()

			' scroll to this month
			Dim firstOfMonth As New Date(Date.Today.Year, Date.Today.Month, 1)
			DayPilotScheduler1.SetScrollX(firstOfMonth)

			LoadResources()

		End If

		LoadSeparators()

	End Sub

	Private Sub LoadSeparators()
		DayPilotScheduler1.Separators.Clear()
		For i As Integer = 0 To DayPilotScheduler1.Days - 1
			Dim start As Date = DayPilotScheduler1.StartDate.AddDays(i)
			DayPilotScheduler1.Separators.Add(start, ColorTranslator.FromHtml("#cccccc"))
		Next i
		DayPilotScheduler1.Separators.Add(Date.Today, ColorTranslator.FromHtml("#ffaaaa"))

	End Sub

	Protected Sub DayPilotScheduler1_EventMove(ByVal sender As Object, ByVal e As DayPilot.Web.Ui.Events.EventMoveEventArgs)
        Dim id_Renamed As String = e.Value
		Dim start As Date = e.NewStart
		Dim [end] As Date = e.NewEnd

		dbUpdateEvent(id_Renamed, start, [end])

		DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days)
		DayPilotScheduler1.DataBind()
		DayPilotScheduler1.UpdateWithMessage("Updated")

		LoadResources()
	End Sub

	Private Function dbGetEvents(ByVal start As Date, ByVal days As Integer) As DataTable
		Dim da As New SqlDataAdapter("SELECT * FROM [Reservation] WHERE NOT (([ReservationEnd] <= @start) OR ([ReservationStart] >= @end))", ConfigurationManager.ConnectionStrings("daypilot").ConnectionString)
		da.SelectCommand.Parameters.AddWithValue("start", start)
		da.SelectCommand.Parameters.AddWithValue("end", start.AddDays(days))
		Dim dt As New DataTable()
		da.Fill(dt)
		Return dt
	End Function

	Private Sub dbUpdateEvent(ByVal id As String, ByVal start As Date, ByVal [end] As Date)
		Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("daypilot").ConnectionString)
			con.Open()
			Dim cmd As New SqlCommand("UPDATE [Reservation] SET ReservationStart = @start, ReservationEnd = @end WHERE ReservationId = @id", con)
			cmd.Parameters.AddWithValue("id", id)
			cmd.Parameters.AddWithValue("start", start)
			cmd.Parameters.AddWithValue("end", [end])
			cmd.ExecuteNonQuery()
		End Using
	End Sub

	Private Sub LoadResources()
		DayPilotScheduler1.Resources.Clear()

		Dim start As Date = DayPilotScheduler1.StartDate
		Dim [end] As Date = DayPilotScheduler1.EndDate

		Dim da As New SqlDataAdapter("SELECT [Person].[PersonId], [Person].[PersonFirst], [Person].[PersonLast], sum(datediff(minute, [ReservationStart], [ReservationEnd])) as [Total] FROM [Person] left outer join [Reservation] on [Person].[PersonId] = [Reservation].[PersonId] and NOT (([ReservationEnd] <= @start) OR ([ReservationStart] >= @end)) GROUP BY [Person].[PersonId], [Person].[PersonFirst], [Person].[PersonLast] ORDER BY [PersonLast], [PersonFirst]", ConfigurationManager.ConnectionStrings("daypilot").ConnectionString)
		da.SelectCommand.Parameters.AddWithValue("start", start)
		da.SelectCommand.Parameters.AddWithValue("end", [end])
		Dim dt As New DataTable()
		da.Fill(dt)

		For Each r As DataRow In dt.Rows
			Dim first As String = CStr(r("PersonFirst"))
			Dim last As String = CStr(r("PersonLast"))
            Dim id_Renamed As String = Convert.ToString(r("PersonId"))
			Dim totalMin As Double = 0
			If Not r.IsNull("Total") Then
				Dim [to] As Object = r("Total")
				totalMin = CInt(Fix(r("Total")))
			End If
			Dim total As TimeSpan = TimeSpan.FromMinutes(totalMin)

			Dim res As New Resource(last & ", " & first, id_Renamed)
			res.DataItem = r

			res.Columns.Add(New ResourceColumn(String.Format("{0:0.0} days", total.TotalDays)))

			DayPilotScheduler1.Resources.Add(res)
		Next r

	End Sub

	Protected Sub DayPilotScheduler1_Command(ByVal sender As Object, ByVal e As DayPilot.Web.Ui.Events.CommandEventArgs)
		Select Case e.Command
			Case "refresh"
				DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days)
				DayPilotScheduler1.DataBind()
				DayPilotScheduler1.Update()
				LoadResources()
		End Select
	End Sub

	Protected Sub DayPilotScheduler1_EventResize(ByVal sender As Object, ByVal e As DayPilot.Web.Ui.Events.EventResizeEventArgs)
        Dim id_Renamed As String = e.Value
		Dim start As Date = e.NewStart
		Dim [end] As Date = e.NewEnd
		dbUpdateEvent(id_Renamed, start, [end])

		DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days)
		DayPilotScheduler1.DataBind()
		DayPilotScheduler1.UpdateWithMessage("Updated")

		LoadResources()
	End Sub

	Protected Sub DayPilotScheduler1_BeforeEventRender(ByVal sender As Object, ByVal e As DayPilot.Web.Ui.Events.Scheduler.BeforeEventRenderEventArgs)
		Dim duration As TimeSpan = e.End - e.Start
		e.Html = String.Format("{0} days", duration.TotalDays)
        e.EventMoveVerticalEnabled = False
        e.BackgroundColor = "#d9ead3"
    End Sub

	Protected Sub DayPilotScheduler1_BeforeCellRender(ByVal sender As Object, ByVal e As DayPilot.Web.Ui.Events.BeforeCellRenderEventArgs)
		If e.IsBusiness Then
			e.BackgroundColor = "#ffffff"
		Else
			e.BackgroundColor = "#f8f8f8"
		End If
	End Sub

	Protected Sub DayPilotScheduler1_BeforeResHeaderRender(ByVal sender As Object, ByVal e As BeforeResHeaderRenderEventArgs)
	End Sub
End Class
