using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Pex.PlayVideo.Dao;
using Newtonsoft.Json;
using System.Collections.Specialized;
using Pex.PlayVideo.Entity;

namespace Hospital.Myclass
{
    public class InterfaceTosql
    {
        public string getAct(HttpContext context, string act, NameValueCollection queryString)
        {
            string result = "";
            switch(act)
            {
                case "getParentColumnList":
                    result = getParentColumnList();
                    return result;

                case "getChildColumnList":
                    result = getChildColumnList(queryString);
                    return result;
                case "getVideoList":
                    result = getVideoList(queryString);
                    return result;
                case "getDeatil":
                    result = getDeatil(queryString);
                    return result;
            }
            return result;
        }

        /// <summary>
        /// 拿到一级栏目
        /// </summary>
        /// <param name="queryString"></param>
        /// <returns></returns>
        public string getParentColumnList()
        {
            InterfaceDao interfaceDao = new InterfaceDao();
            return JsonConvert.SerializeObject(interfaceDao.getParentColumnList());
        }

        /// <summary>
        /// 拿到二级栏目
        /// </summary>
        /// <returns>父栏目值</returns>
        public string getChildColumnList(NameValueCollection queryString)
        {
            InterfaceDao interfaceDao = new InterfaceDao();
            return JsonConvert.SerializeObject(interfaceDao.getChildColumnList(queryString["ParentValue"].ToString()));
        }

        /// <summary>
        /// 获得视频列表
        /// </summary>
        /// <param name="queryString"></param>
        /// <returns></returns>
        public string getVideoList(NameValueCollection queryString)
        {
            int leixin = -1;
            InterfaceDao interfaceDao = new InterfaceDao();
            if ((queryString["n"].ToString()) != "")
                leixin = int.Parse(queryString["n"]);
            return JsonConvert.SerializeObject(interfaceDao.getVideoList(queryString["value"].ToString(), leixin, null, null));
        }

        /// <summary>
        /// 获得播放视频
        /// </summary>
        /// <param name="queryString"></param>
        /// <returns></returns>
        public string getDeatil(NameValueCollection queryString)
        {
            InterfaceDao interfaceDao = new InterfaceDao();
            return JsonConvert.SerializeObject(interfaceDao.getDeatil(queryString["tableid"].ToString()));
        }

    }


}