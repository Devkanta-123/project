/* Copyright © 2013 Annpoint, s.r.o.
   Use of this software is subject to license terms. 
   http://www.daypilot.org/

   If you have purchased a DayPilot Pro license, you are allowed to use this 
   code under the conditions of DayPilot Pro License Agreement:

   http://www.daypilot.org/files/LicenseAgreement.pdf

   Otherwise, you are allowed to use it for evaluation purposes only under 
   the conditions of DayPilot Pro Trial License Agreement:
   
   http://www.daypilot.org/files/LicenseAgreementTrial.pdf
   
*/

using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using DayPilot.Utils;
using DayPilot.Web.Ui;
using DayPilot.Web.Ui.Data;
using DayPilot.Web.Ui.Enums;
using DayPilot.Web.Ui.Events.Scheduler;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // prevent invalid ViewState errors in Firefox
        
        if (Request.Browser.Browser == "Firefox") Response.Cache.SetNoStore();


        if (!IsPostBack)
        {

            DayPilotScheduler1.StartDate = new DateTime(DateTime.Today.Year, 1, 1);
            DayPilotScheduler1.Days = Year.Days(DateTime.Today.Year);
            DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days);
            DayPilotScheduler1.DataBind();

            // scroll to this month
            DateTime firstOfMonth = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
            DayPilotScheduler1.SetScrollX(firstOfMonth);

            LoadResources();

        }

        LoadSeparators();

    }

    private void LoadSeparators()
    {
        DayPilotScheduler1.Separators.Clear();
        for (int i = 0; i < DayPilotScheduler1.Days; i++)
        {
            DateTime start = DayPilotScheduler1.StartDate.AddDays(i);
            DayPilotScheduler1.Separators.Add(start, ColorTranslator.FromHtml("#cccccc"));
        }
        DayPilotScheduler1.Separators.Add(DateTime.Today, ColorTranslator.FromHtml("#ffaaaa"));

    }

    protected void DayPilotScheduler1_EventMove(object sender, DayPilot.Web.Ui.Events.EventMoveEventArgs e)
    {
        string id = e.Id;
        DateTime start = e.NewStart;
        DateTime end = e.NewEnd;

        dbUpdateEvent(id, start, end);
    
        DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days);
        DayPilotScheduler1.DataBind();
        DayPilotScheduler1.UpdateWithMessage("Updated");

        LoadResources();
    }

    private DataTable dbGetEvents(DateTime start, int days)
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [Reservation] WHERE NOT (([ReservationEnd] <= @start) OR ([ReservationStart] >= @end))", ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString);
        da.SelectCommand.Parameters.AddWithValue("start", start);
        da.SelectCommand.Parameters.AddWithValue("end", start.AddDays(days));
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    private void dbUpdateEvent(string id, DateTime start, DateTime end)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [Reservation] SET ReservationStart = @start, ReservationEnd = @end WHERE ReservationId = @id", con);
            cmd.Parameters.AddWithValue("id", id);
            cmd.Parameters.AddWithValue("start", start);
            cmd.Parameters.AddWithValue("end", end);
            cmd.ExecuteNonQuery();
        }
    }

    private void LoadResources()
    {
        DayPilotScheduler1.Resources.Clear();

        DateTime start = DayPilotScheduler1.StartDate;
        DateTime end = DayPilotScheduler1.EndDate;

        SqlDataAdapter da = new SqlDataAdapter("SELECT [Person].[PersonId], [Person].[PersonFirst], [Person].[PersonLast], sum(datediff(minute, [ReservationStart], [ReservationEnd])) as [Total] FROM [Person] left outer join [Reservation] on [Person].[PersonId] = [Reservation].[PersonId] and NOT (([ReservationEnd] <= @start) OR ([ReservationStart] >= @end)) GROUP BY [Person].[PersonId], [Person].[PersonFirst], [Person].[PersonLast] ORDER BY [PersonLast], [PersonFirst]", ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString);
        da.SelectCommand.Parameters.AddWithValue("start", start);
        da.SelectCommand.Parameters.AddWithValue("end", end);
        DataTable dt = new DataTable();
        da.Fill(dt);

        foreach (DataRow r in dt.Rows)
        {
            string first = (string)r["PersonFirst"];
            string last = (string)r["PersonLast"];
            string id = Convert.ToString(r["PersonId"]);
            double totalMin = 0;
            if (!r.IsNull("Total"))
            {
                object to = r["Total"];
                totalMin = (int)r["Total"];
            }
            TimeSpan total = TimeSpan.FromMinutes(totalMin);

            Resource res = new Resource(last + ", " + first, id);
            res.DataItem = r;

            res.Columns.Add(new ResourceColumn(String.Format("{0:0.0} days", total.TotalDays)));

            DayPilotScheduler1.Resources.Add(res);
        }

    }

    protected void DayPilotScheduler1_Command(object sender, DayPilot.Web.Ui.Events.CommandEventArgs e)
    {
        switch (e.Command)
        {
            case "refresh":
                DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days);
                DayPilotScheduler1.DataBind();
                DayPilotScheduler1.Update();
                LoadResources();
                break;
        }
    }
    
    protected void DayPilotScheduler1_EventResize(object sender, DayPilot.Web.Ui.Events.EventResizeEventArgs e)
    {
        string id = e.Id;
        DateTime start = e.NewStart;
        DateTime end = e.NewEnd;
        dbUpdateEvent(id, start, end);

        DayPilotScheduler1.DataSource = dbGetEvents(DayPilotScheduler1.StartDate, DayPilotScheduler1.Days);
        DayPilotScheduler1.DataBind();
        DayPilotScheduler1.UpdateWithMessage("Updated succesfully");

        LoadResources();
    }

    protected void DayPilotScheduler1_BeforeEventRender(object sender, DayPilot.Web.Ui.Events.Scheduler.BeforeEventRenderEventArgs e)
    {
        TimeSpan duration = e.End - e.Start;
        e.Html = String.Format("{0} days", duration.TotalDays);
        e.EventMoveVerticalEnabled = false;
        e.BackgroundColor = "#d9ead3";
    }

    protected void DayPilotScheduler1_BeforeCellRender(object sender, DayPilot.Web.Ui.Events.BeforeCellRenderEventArgs e)
    {
        if (e.IsBusiness)
        {
            e.BackgroundColor = "#ffffff";
        }
        else
        {
            e.BackgroundColor = "#f8f8f8";
        }
    }

    protected void DayPilotScheduler1_BeforeResHeaderRender(object sender, BeforeResHeaderRenderEventArgs e)
    {
    }
}
