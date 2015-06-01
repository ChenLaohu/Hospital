using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Pex.PlayVideo.Dao;
using System.Web.SessionState; //引入命名空间

namespace Hospital.javascript
{
    public partial class Upload : System.Web.UI.Page, IRequiresSessionState
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string FilesRoot1 = ConfigurationManager.AppSettings["FilesRoot"];
            string FilesRoot = Server.MapPath(FilesRoot1);
            try
            {
                HttpPostedFile uploadFile;
                for (int i = 0; i < Request.Files.Count; ++i)
                {
                    uploadFile = Request.Files[i];
                    if (uploadFile == null || uploadFile.ContentLength == 0 || string.IsNullOrEmpty(uploadFile.FileName))
                        continue;

                    string savePath = Path.Combine(FilesRoot, DateTime.Now.ToString("yyyyMMdd"));
                    string savePath1 = Path.Combine(FilesRoot1, DateTime.Now.ToString("yyyyMMdd"));
                    string fileNameGuid = Guid.NewGuid().ToString("N") + Path.GetExtension(uploadFile.FileName);
                    //string playFileNameGuid = Guid.NewGuid().ToString("N") + ".mp4";
                    //string imgFileNameGuid = Guid.NewGuid().ToString("N") + ".jpg";
                    if (!Directory.Exists(savePath))
                        Directory.CreateDirectory(savePath);
                    string filename = string.Format("{0}\\{1}", savePath, fileNameGuid);  //绝对
                    //string playFilename = string.Format("{0}\\{1}", savePath, playFileNameGuid); //绝对
                    //string imgFilename = string.Format("{0}\\{1}", savePath, imgFileNameGuid); //绝对


                    string playFilename1 = string.Format("{0}\\{1}", savePath1, fileNameGuid); //相对
                    //string imgFilename1 = string.Format("{0}\\{1}", savePath1, imgFileNameGuid); //相对

                    uploadFile.SaveAs(filename);//保存文件


                    //将路径写入session
                    HttpContext.Current.Session["videoPath"] = playFilename1;
                    //HttpContext.Current.Session["imgPath"] = imgFilename1;

                    //转换文件 截图
                    //Pex.PlayVideo.Tool.OperateMethod.ChangeVideoType(filename, playFilename, imgFilename); //3个绝对

                    Response.Write("转换完成！");
                }
            }
            catch (Exception ex)
            {
                Response.StatusCode = 500;
                Response.Write(ex.Message);
                Response.End();
            }
        }


        [WebMethod]
        public static int insertDeatilToSQL(string videoname, string enname, string doctor, string ssyy, string ssjj, string bpts, string jybz, string spsm, string type, string n)
        {
            VideoDao dao = new VideoDao();
            return dao.insert(videoname, enname, doctor, ssyy, ssjj, bpts, jybz, spsm, type, n);
        }

        [WebMethod]
        public static bool CheckLogin() {
            UserDao dao = new UserDao();
            return dao.CheckLogin();
        }

        [WebMethod]
        public static bool addClick(string TableID) {
            VideoDao dao = new VideoDao();
            return dao.addClick(TableID);
        }
    }
}