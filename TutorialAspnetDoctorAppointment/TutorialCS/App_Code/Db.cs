using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Db
/// </summary>
public static class Db
{

    public static DataTable LoadDoctors()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [Doctor1] ORDER BY [DoctorName]", ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataRow LoadDoctor(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [Doctor1] WHERE [DoctorId] = @id", ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString);
        da.SelectCommand.Parameters.AddWithValue("id", id);

        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            return dt.Rows[0];
        }
        return null;
        
    }

    public static DataRow LoadAppointment(int id)
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [Appointment1] WHERE [AppointmentId] = @id", ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString);
        da.SelectCommand.Parameters.AddWithValue("id", id);

        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            return dt.Rows[0];
        }
        return null;
        
    }


    public static DataTable LoadAppointmentsForDoctor(int id, DateTime start, DateTime end)
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [Appointment1] WHERE [DoctorId] = @doctor AND NOT (([AppointmentEnd] <= @start) OR ([AppointmentStart] >= @end))", ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString);
        da.SelectCommand.Parameters.AddWithValue("doctor", id);
        da.SelectCommand.Parameters.AddWithValue("start", start);
        da.SelectCommand.Parameters.AddWithValue("end", end);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable LoadAppointments(DateTime start, DateTime end)
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [Appointment1] WHERE NOT (([AppointmentEnd] <= @start) OR ([AppointmentStart] >= @end))", ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString);
        da.SelectCommand.Parameters.AddWithValue("start", start);
        da.SelectCommand.Parameters.AddWithValue("end", end);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;

    }

    public static DataTable LoadFreeAndMyAppointments(DateTime start, DateTime end, string sessionId)
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [Appointment1] WHERE ([AppointmentStatus] = 'free' OR ([AppointmentStatus] <> 'free' AND [AppointmentPatientSession] = @session)) AND NOT (([AppointmentEnd] <= @start) OR ([AppointmentStart] >= @end))", ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString);
        da.SelectCommand.Parameters.AddWithValue("session", sessionId);
        da.SelectCommand.Parameters.AddWithValue("start", start);
        da.SelectCommand.Parameters.AddWithValue("end", end);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;

    }


    public static int CreateAppointment(int doctor, DateTime start, DateTime end)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO [Appointment1] ([AppointmentStart], [AppointmentEnd], [DoctorId]) VALUES(@start, @end, @doctor)", con);
            cmd.Parameters.AddWithValue("start", start);
            cmd.Parameters.AddWithValue("end", end);
            cmd.Parameters.AddWithValue("doctor", doctor);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand("select @@identity;", con);
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            return id;
        }
    }

    public static void DeleteAppointmentsFree(DateTime start, DateTime end)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM [Appointment1] WHERE [AppointmentStatus] = 'free' AND NOT (([AppointmentEnd] <= @start) OR ([AppointmentStart] >= @end))", con);
            cmd.Parameters.AddWithValue("start", start);
            cmd.Parameters.AddWithValue("end", end);
            cmd.ExecuteNonQuery();
        }
    }

    public static void DeleteAppointmentIfFree(int id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM [Appointment1] WHERE [AppointmentId] = @id AND [AppointmentStatus] = 'free'", con);
            cmd.Parameters.AddWithValue("id", id);
            cmd.ExecuteNonQuery();
        }
    }

    public static DataRow LoadFirstDoctor()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT top 1 * FROM [Doctor1] ORDER BY [DoctorName]", ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString);

        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            return dt.Rows[0];
        }
        return null;
    }

    public static void UpdateAppointment(int id, DateTime start, DateTime end, string name, int doctor, string status)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [Appointment1] SET [AppointmentStart] = @start, [AppointmentEnd] = @end, [AppointmentPatientName] = @name, [AppointmentStatus] = @status WHERE [AppointmentId] = @id", con);
            cmd.Parameters.AddWithValue("start", start);
            cmd.Parameters.AddWithValue("end", end);
            cmd.Parameters.AddWithValue("name", name);
            cmd.Parameters.AddWithValue("status", status);
            cmd.Parameters.AddWithValue("id", id);
            cmd.ExecuteNonQuery();
        }

    }

    public static void DeleteAppointment(int id)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM [Appointment1] WHERE [AppointmentId] = @id", con);
            cmd.Parameters.AddWithValue("id", id);
            cmd.ExecuteNonQuery();
        }

    }

    public static void RequestAppointment(int id, string name, string sessionId)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [Appointment1] SET [AppointmentPatientName] = @name, [AppointmentStatus] = @status, [AppointmentPatientSession] = @session WHERE [AppointmentId] = @id", con);
            cmd.Parameters.AddWithValue("name", name);
            cmd.Parameters.AddWithValue("status", "waiting");
            cmd.Parameters.AddWithValue("session", sessionId);
            cmd.Parameters.AddWithValue("id", id);
            cmd.ExecuteNonQuery();
        }

    }

    public static void MoveAppointment(string id, DateTime start, DateTime end)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [Appointment1] SET [AppointmentStart] = @start, [AppointmentEnd] = @end WHERE [AppointmentId] = @id", con);
            cmd.Parameters.AddWithValue("start", start);
            cmd.Parameters.AddWithValue("end", end);
            cmd.Parameters.AddWithValue("id", id);
            cmd.ExecuteNonQuery();
        }
        
    }
}