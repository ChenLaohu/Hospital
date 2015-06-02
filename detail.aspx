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
                $.ajax({
                    type: "post",
                    url: "/ashx/Register.ashx?act=playVideo&tableid=" + getUrlParam("tableid") + "",// 跳转到 action 
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    async: false, //默认为true 异步    videoPath
                    success: function (result) {
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
                    data:"{TableID:'"+getUrlParam('tableid')+"'}",
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
                    data:"{TableID:'"+getUrlParam('tableid')+"'}",
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<nav>
          
			<div id="title"></div>
			<div id="shipin"></div>
			<!--视频点播-->
			<div id="xgsp">
				 <%for(int i=0;i<list1.Count;i++) {%>
						<a class="video" href="detail.aspx?tableid=<%=list1[i].TableID %> ">
							<div class="video_content">
								<div class="video_content_img">
                                    <%
                              string imgUrl = "";
                              string title = "";
                              if (!Convert.IsDBNull(list1[i].imgPath) && list1[i].imgPath != null)
                                  imgUrl += list1[i].imgPath.ToString();
                              else
                                  imgUrl += "/UpFiles/Tables/sy_73107821932.jpg";
                              if (list1[i].Title.Length >= 8)
                                  title = list1[i].Title.Substring(0, 8) + "..";
                              else
                                  title = list1[i].Title;
                                         %>
                                    <img src="<%=imgUrl %>" width="175" height="100" />

								</div>
								<div class="video_content_img_title"><%=title %></div>
								<div class="video_content_img_title_double"><%=title %></div>
								<div class="video_content_img_title_double count"><%=list1[i].click %></div>
							</div>
						</a>
                        <%} %>
			</div>
		</nav>
</asp:Content>
