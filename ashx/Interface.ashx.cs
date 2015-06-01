using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Pex.PlayVideo.Dao;
using Hospital.Myclass;
using System.Web.SessionState;

namespace Hospital.ashx
{
    /// <summary>
    /// Interface 的摘要说明
    /// </summary>
    public class Interface : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string act = context.Request.QueryString["act"];
            InterfaceTosql interfaceToSql = new InterfaceTosql();
            context.Response.ContentType = "text/plain";
            context.Response.Write(interfaceToSql.getAct(context, act, context.Request.QueryString));
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}