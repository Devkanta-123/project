using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrProject.admin
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void bttn_Send_Click(object sender, EventArgs e)
        {
            string from = "devakantakonsam782@gmail.com";
            using (MailMessage mail = new MailMessage(from, txtTo.Text))
            {
                mail.Subject = txtSubject.Text;
                mail.Body = txtMessage.Text;
                if (fileUploader.HasFile)
                {
                    string fileName = Path.GetFileName(fileUploader.PostedFile.FileName);
                    mail.Attachments.Add(new Attachment(fileUploader.PostedFile.InputStream, fileName));
                }
                mail.IsBodyHtml = false;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential networkCredential = new NetworkCredential(from, "fnhisodcsxozsino");
                smtp.UseDefaultCredentials = true;

                smtp.Credentials = networkCredential;
                smtp.Port = 587;
                smtp.Send(mail);


                string message = "Message Sent Succesfull...";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "');";
                script += "window.location = '";
                script += Request.Url.AbsoluteUri;
                script += "'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);

            }
        }
    }
}