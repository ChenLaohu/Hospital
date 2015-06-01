using Pex.Core.Data;
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
    public partial class _Default : System.Web.UI.Page
    {
        public List<Video> list1 = null;
        public List<Video> list2 = null;
        public List<Video> list3 = null;
        public List<Video> list4 = null;
        public List<Video> list5 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            page();
        }

        private void page() {
            VideoDao dao = new VideoDao();
            list1 = dao.getList(1);
            list2 = dao.getList(6);
            list3 = dao.getList(10);
            list4 = dao.getList(1);
            list5 = dao.getList(10);
        }

        //public  ToTable()
        //{
        //    VideoDao video = new VideoDao();
        //}


    }
}