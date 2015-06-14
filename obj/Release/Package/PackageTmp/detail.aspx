<%@ Page Language="C#" MasterPageFile="~/Share.Master" AutoEventWireup="true" CodeBehind="detail.aspx.cs" Inherits="Hospital.detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link rel="stylesheet" href="css/detail.css" />
         <script src="http://apps.bdimg.com/libs/jquery/1.7.1/jquery.min.js"></script>
         <link href="video-js/video-js.css" rel="stylesheet" type="text/css"/>
        <script src="video-js/video.js"></script>
    <!–[if IE]>  
        <script src="js/html5shiv.js"></script>  
    <![endif]–>
  <script>
      videojs.options.flash.swf = "video-js/video-js.swf";
  </script>

        <script>
            window.onload = function () {
                showVideo();
                addClick();
            }

            function showVideo() {
                var html = "";
                var htmlNew = "";
                $.ajax({
                    type: "post",
                    url: "/ashx/Register.ashx?act=playVideo&tableid=" + getUrlParam("tableid") + "",// 跳转到 action 
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    async: false, //默认为true 异步    videoPath
                    success: function (result) {

                        htmlNew += "<h3>" + result.Title + "</h3>";
                        htmlNew += "<table>";
                        htmlNew += "<tr><td class=\"bt\" width=\"30%\">上传人员</td><td class=\"bt_nr\" width=\"70%\">" + result.userName + "</td></tr>";
                        htmlNew += "<tr><td class=\"kong\"></td></tr>";
                        htmlNew += "<tr><td class=\"bt\">英文名称</td><td class=\"bt_nr\">" + result.englishTitle + "</td></tr>";
                        htmlNew += "<tr><td class=\"kong\"></td></tr>";
                        htmlNew += "<tr> <td class=\"bt\">名主刀医生</td><td class=\"bt_nr\">" + result.zdys + "</td></tr>";
                        htmlNew += "<tr><td class=\"kong\"></td></tr>";
                        htmlNew += "<tr> <td class=\"bt\">所属医院</td><td class=\"bt_nr\">" + result.ssyy + "</td></tr>";
                        htmlNew += "<tr><td class=\"kong\"></td></tr>";
                        htmlNew += "<tr> <td class=\"bt\">上传时间</td><td class=\"bt_nr\">" + result.CreateTime.substring(0,10) + "</td></tr>";
                        htmlNew += "<tr><td class=\"kong\"></td></tr>";
                        htmlNew += "<tr> <td class=\"bt\">点击量</td><td class=\"bt_nr\">" + result.click + "次</td></tr>";
                        htmlNew += "</table>";

                        document.getElementById("detail").innerHTML = htmlNew;
                        if (result.videoPath != null) {
                            var videoUrl = result.videoPath;
                            html += "<video id=\"example_video_1\" class=\"video-js vjs-default-skin\" controls preload=\"none\" width=\"945\" height=\"450\"  data-setup=\"{}\">";
                            html += "<source src=\"" + videoUrl + "\" type=\"video/mp4\" />";
                            html += "<track kind=\"captions\" src=\"captions.vtt\" srclang=\"ch\" label=\"English\"></track>";
                            html += "</video>";
                            document.getElementById("shipin").innerHTML = html;
                            document.getElementById("title").innerHTML = result.Title;
                        }
                        else {
                            document.getElementById("shipin").style.background = "#000";
                        }


                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("XMLHttpRequest：" + XMLHttpRequest.readyState + ";;;textStatus：" + XMLHttpRequest.status + ";;;errorThrown：" + errorThrown);
                    }

                });
            }

            function addClick() {
                $.ajax({
                    type: "post",
                    url: "javascript/Upload.aspx/addClick",
                    data: "{TableID:'" + getUrlParam('tableid') + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    //async: false,
                    success: function (data) {
                        //if (data.d == false) {
                        //    //alert("请先登录！");
                        //    //window.location.href = "Login.aspx";
                        //}
                    },
                    error: function (err) {
                        alert(err);
                    }
                });
            }

            function addClick() {
                $.ajax({
                    type: "post",
                    url: "javascript/Upload.aspx/addClick",
                    data: "{TableID:'" + getUrlParam('tableid') + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    //async: false,
                    success: function (data) {
                        //if (data.d == false) {
                        //    //alert("请先登录！");
                        //    //window.location.href = "Login.aspx";
                        //}
                    },
                    error: function (err) {
                        alert(err);
                    }
                });
            }

            function getUrlParam(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
                var r = window.location.search.substr(1).match(reg);  //匹配目标参数
                if (r != null) return unescape(r[2]); return null; //返回参数值  decodeURIComponent
                //注：如果是中午unescape(r[2])则会是乱码  请用decodeURIComponent(r[2])来代替

            }

        </script>
    <style>
.bt{font-size:12px; text-align:center;}
.bt_nr{font-size:12px; color:#808080; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<nav>
          
			<div id="title"></div>
			<div id="shipin"></div>
			<!--视频点播-->
			<div id="xgsp">
				<div id="discusz"></div>
                <div id="detail">
                    
                </div>
			</div>
		</nav>
</asp:Content>
