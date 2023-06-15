using paytm;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DrProject.online
{
    public partial class PaytmCallBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			String merchantKey = "";
			Dictionary<string, string> parameters = new Dictionary<string, string>();
			string paytmChecksum = "";
			foreach (string key in Request.Form.Keys)
			{
				parameters.Add(key.Trim(), Request.Form[key].Trim());
			}
			if (parameters.ContainsKey("CHECKSUMHASH"))
			{
				paytmChecksum = parameters["CHECKSUMHASH"];
				parameters.Remove("CHECKSUMHASH");
			}
			if (CheckSum.verifyCheckSum(merchantKey, parameters, paytmChecksum))
			{
				string paytmStatus = parameters["STATUS"];
				string txnId = parameters["TXNID"];
				pTxnId.InnerText = "Transaction Id : " + txnId;
				if (paytmStatus == "TXN_SUCCESS")
				{
					h1Message.InnerText = "Your payment is success";
				}
				else if (paytmStatus == "PENDING")
				{
					h1Message.InnerText = "Payment is pending !";
				}
				else if (paytmStatus == "TXN_FAILURE")
				{
					h1Message.InnerText = "Payment Failure !";
				}
			}
			else
			{
				Response.Write("Checksum MisMatch");
			}
		}
    }
}