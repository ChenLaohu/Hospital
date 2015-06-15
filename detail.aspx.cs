using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pex.PlayVideo.Dao;
using Pex.PlayVideo.Entity;
using System.Web.Services;
using System.Web.SessionState; //引入命名空间

namespace Hospital
{
    public partial class detail : System.Web.UI.Page
    {
        public List<Video> list1 = null;
        public string userName = null;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            VideoDao dao = new VideoDao();
            list1 = dao.getList(10); 
            
            if (HttpContext.Current.Session["userName"] != null)
            {
                userName = HttpContext.Current.Session["userName"].ToString();
            }
        }


    }
}