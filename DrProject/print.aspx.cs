using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrProject
{
    public partial class print : System.Web.UI.Page
    {
       protected void Page_Load(object sender, EventArgs e) {
    if (!IsPostBack) {
        LoadGridData();
    }
}
private void LoadGridData() {
    try {
        System.Data.DataTable dtSubData = new System.Data.DataTable();
        //Creating grid columns
        dtSubData.Columns.Add("Subjects");
        dtSubData.Columns.Add("Marks");
        dtSubData.Columns.Add("Grade");
        //Adding row deails
        dtSubData.Rows.Add("Asp.net", "70", "B+");
        dtSubData.Rows.Add("C#", "80", "A");
        dtSubData.Rows.Add("Vb.net", "76", "A");
        dtSubData.Rows.Add("HTML", "91", "A+");
        dtSubData.Rows.Add("CSS", "95", "A+");
        dtSubData.Rows.Add("JavaScript", "78", "A");
        dtSubData.Rows.Add("jQuery", "74", "A");
        //Binding details to gridview
        grdResultDetails.DataSource = dtSubData;
        grdResultDetails.DataBind();
    } catch { }
}
protected void btnPrintFromCodeBehind_Click(object sender, EventArgs e) {
    try {
        ScriptManager.RegisterStartupScript(this, typeof(Page), "printGrid", "printGrid();", true);
    } catch { }
}
    }
}