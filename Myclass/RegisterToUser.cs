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
	public class RegisterToUser
	{
        /// <summary>
        /// ashx 传递的参数总入口
        /// </summary>
        /// <param name="act">类型</param>
        /// <param name="queryString">全部URL参数</param>
        /// <returns></returns>
        public string getList(HttpContext context,string act, NameValueCollection queryString)
        {
            string result = "";
            switch(act)
            {
                case"insert":
                    result = (insertToSQL(queryString) == true) ? "1" : "0";
                    return JsonConvert.SerializeObject(result);
                case"isName":
                    result = (ISName(queryString) == true) ? "1":"0";
                    return JsonConvert.SerializeObject(result);
                case"insertDetail":
                    result = (insertRyDeatil(queryString) == true) ? "1" : "0";
                    return JsonConvert.SerializeObject(result);
                case "login":
                    result = (Login(queryString) == true) ? "1" : "0";
                    return JsonConvert.SerializeObject(result);
                case"list_video":
                    result = this.getAllList(queryString);
                    return result;
                case"playVideo":
                    result = this.playVideo(queryString);
                    return result;
                case"userInformation":
                    result = this.getUserInformation(queryString);
                    return result;

            }
            return result;

        }

        //用户注册账号插入
        public bool insertToSQL(NameValueCollection queryString)
        {
            UserDao userDao = new UserDao();
            string strMd5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(queryString["pwd"].ToString(), "md5");
            return userDao.Register(queryString["name"].ToString(), strMd5, queryString["email"].ToString(), queryString["qq"].ToString());
        }

        //判断用户名是否存在
        public bool ISName(NameValueCollection queryString)
        {
            UserDao userDao = new UserDao();
            return userDao.CheckUserName(queryString["name"].ToString());
        }

        /// <summary>
        /// 详细信息录入
        /// </summary>
        /// <param name="queryString"></param>
        /// <returns></returns>
        public bool insertRyDeatil(NameValueCollection queryString)
        {
            UserDao userDao = new UserDao();
            return userDao.UpdateUserInfo(queryString["name"].ToString(),queryString["sex"].ToString(),queryString["ssyy"].ToString(),queryString["ssks"].ToString(),queryString["phone"].ToString(),queryString["img"].ToString());
        }

        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="queryString"></param>
        /// <returns></returns>
        public bool Login(NameValueCollection queryString)
        {

            UserDao userDao = new UserDao();
            string strMd5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(queryString["pwd"].ToString(), "md5");
            return userDao.CheckLogin(queryString["name"].ToString(), strMd5);
        }

        /// <summary>
        /// 获得视频的列表
        /// </summary>
        /// <param name="queryString"></param>
        /// <returns></returns>
        public string getAllList(NameValueCollection queryString)
        {
            VideoDao videoDao = new VideoDao();
            return JsonConvert.SerializeObject(videoDao.getList(queryString["value"].ToString(),Convert.ToInt32(queryString["lx"])));
        }

        /// <summary>
        /// 通过tableid获取单个视频的信息  视频点播
        /// </summary>
        /// <param name="queryString"></param>
        /// <returns></returns>
        public string playVideo(NameValueCollection queryString)
        {
            VideoDao videoDao = new VideoDao();
           // bool bl = videoDao.addClick(queryString["tableid"].ToString()); //添加点击量
            return JsonConvert.SerializeObject(videoDao.get(queryString["tableid"].ToString()));
        }

        /// <summary>
        /// 获得用户信息
        /// </summary>
        /// <returns></returns>
        public string getUserInformation(NameValueCollection queryString)
        {
            UserDao user = new UserDao();
            return JsonConvert.SerializeObject(user.get(queryString["userName"]).ToString());
        }

	}
}