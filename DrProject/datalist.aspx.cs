using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrProject
{
    public partial class datalist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void ListImages()
        {
            DirectoryInfo dir = new DirectoryInfo(MapPath("~/doctor/profile"));
            FileInfo[] file = dir.GetFiles();
            ArrayList list = new ArrayList();
            foreach (FileInfo file2 in file)
            {
                if (file2.Extension == ".jpg" || file2.Extension == ".jpeg" || file2.Extension == ".gif" || file2.Extension == ".png")
                {
                    list.Add(file2);
                }
            }
            DataList1.DataSource = list;
            DataList1.DataBind();
        }
    }
}