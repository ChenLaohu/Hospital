using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pex.PlayVideo.Dao;
using Pex.PlayVideo.Entity;

namespace Hospital
{
    public partial class detail : System.Web.UI.Page
    {
        public List<Video> list1 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            VideoDao dao = new VideoDao();
            list1 = dao.getList(10);
        }
    }
}