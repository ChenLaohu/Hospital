using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pex.PlayVideo.Entity;
using Pex.PlayVideo.Dao;

namespace Hospital
{
    public partial class Personal : System.Web.UI.Page
    {
        public string userName = "";
        public string email = "";
        public string sex = "";
        public string img = "";
        public string phone = "";
        public string ssyy = "";
        public string ssks = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(HttpContext.Current.Session["userName"] != null)
            {
                userName = HttpContext.Current.Session["userName"].ToString();
            }
        }



    }
}