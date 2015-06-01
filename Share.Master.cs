using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hospital
{
    public partial class Share : System.Web.UI.MasterPage
    {
        public string userName = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userName"] != null)
            {
                userName = HttpContext.Current.Session["userName"].ToString();
            }
        }
    }
}