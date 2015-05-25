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
    /// Register 的摘要说明
    /// </summary>
    public class Register : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string act = context.Request.QueryString["act"];
            RegisterToUser insertUser = new RegisterToUser();
            context.Response.ContentType = "text/plain";
            context.Response.Write(insertUser.getList(context,act, context.Request.QueryString));
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