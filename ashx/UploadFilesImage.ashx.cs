using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;


namespace Hospital.ashx
{
    /// <summary>
    /// UploadFilesImage 的摘要说明
    /// </summary>
    public class UploadFilesImage : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpFileCollection files = context.Request.Files;//这里只能用<input type="file" />才能有效果,因为服务器控件是HttpInputFile类型
            string msg = string.Empty;
            string error = string.Empty;
            string imgurl;
            if (files.Count > 0)
            {
                string str = System.IO.Path.GetFileName(files[0].FileName);
                if (str.IndexOf('.') != -1)
                    str = "." + str.Split('.')[1];  //拿到后缀
                str = DateTime.Now.ToString("yyyyMMddHHmmss") + str;   //图片名称
                files[0].SaveAs(context.Server.MapPath("/images/pic/") + System.IO.Path.GetFileName(str)); //上传到文件夹中
                msg = " 成功! 文件大小为:" + files[0].ContentLength;  //文件的大小
                imgurl = "/images/pic/" + str; //拿到图片的存放路径
                string res = "{ error:'" + error + "', msg:'" + msg + "',imgurl:'" + imgurl + "'}";
                context.Response.Write(res);
                context.Response.End();
            }
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