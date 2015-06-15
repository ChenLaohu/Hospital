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

                page();
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


            function page() {
                $.ajax({
                    type: "post",
                    url: "javascript/Upload.aspx/getList",
                    data: "{TableID:'" + getUrlParam('tableid') + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    //async: false,
                    success: function (data) {
                    },
                    error: function (err) {
                        alert(err);
                    }
                });
            }

            function insert() {
                var videoID = getUrlParam('tableid');
                var content = $("#content").html();
                $.ajax({
                    type: "post",
                    url: "javascript/Upload.aspx/insert",
                    data: "{videoID:'" + videoID + "',content:'" + content + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        var html = "<div class='ds-comment-body'><div class='ds-comment-header'><span class='ds-user-name' data-qqt-account=''><%= userName %></span></div><p>" + content + "</p><div class='ds-comment-footer ds-comment-actions'><span class='ds-time'>1分钟前</span></div></div>";
                        alert(html);
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
        .ds-comment-header{padding-top:1px}

        .ds-comment-body {background: #F0F0E3;padding:15px 15px 12px 32px;border-radius:5px; box-shadow:0 1px 2px rgba(0,0,0,.15), 0 1px 0 rgba(255,255,255,.75) inset;}
        .ds-comment-body p{color:#787968}
        .ds-user-name{color:#777;font-size:13px;margin-right:8px}
        .ds-comment-footer { line-height: 1.5em;}
        .ds-time {  font-size: 12px;  margin-right: 8px;  color: #999;  _zoom: 1;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<nav>
          
			<div id="title"></div>
			<div id="shipin"></div>
            <!--视频点播-->
			<div id="xgsp">
                <!--视频分享-->
                <div class="bshare-custom"><div class="bsPromo bsPromo2"></div><a title="分享到QQ空间" class="bshare-qzone"></a><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a title="分享到网易微博" class="bshare-neteasemb"></a><a title="分享到微信" class="bshare-weixin"></a><a title="分享到QQ好友" class="bshare-qqim"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count">0</span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=3&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
				<div id="discusz" style=" margin-top:20px;">
                    <div id="commentList">
                        <div class="ds-comment-body">
                            <div class="ds-comment-header">
                                <span class="ds-user-name" data-qqt-account="">老虎</span>
                            </div>
                            <p>111</p>
                            <div class="ds-comment-footer ds-comment-actions">
                                <span class="ds-time" datetime="2015-06-16T00:04:47+08:00" title="2015年6月16日 上午12:04:47">4分钟前</span>
                            </div>
                        </div>    
                    </div>
                    <div style="margin-top:20px;">
	                    <div style=" position: relative;    border: 1px solid #ccc;    border-bottom: none;    padding-right: 20px;    background: #fff url(&quot;//static.duoshuo.com/images/bg_sprites.png&quot;) 0 -90px repeat-x;    overflow: hidden;border-top-right-radius: 3px;    border-top-left-radius: 3px;">
		                    <textarea name="message" id="content" title="Ctrl+Enter快捷提交" placeholder="说点什么吧…" style=" box-shadow: none;    -webkit-appearance: none;    overflow: auto;    padding: 10px;    height: 54px;    margin: 0;    resize: none;    color: #999;    width: 100%;   display: block;    font-family: &quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;    font-size: 13px;    line-height: 20px;    border: none;  "></textarea>
		                    <pre style=" word-wrap: break-word;    visibility: hidden;    position: absolute;    top: 0;    left: 10px;    right: 10px; display: block;    font-family: &quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;    font-size: 13px;    line-height: 20px;    border: none;"></pre>
	                    </div>
	                    <div style=" position: relative;    width: 100%;    box-shadow: 0 1px 0 rgba(255,255,255,0.6);">
		                    <div style=" position: relative;    margin-right: 100px;    height: 30px;    border: 1px solid #ccc;    border-right: none;    border-bottom-color: #aaa;    border-bottom-left-radius: 3px;    -webkit-border-bottom-left-radius: 3px; background: url(&quot;//static.duoshuo.com/images/bg_sprites.png&quot;) 0 -60px repeat-x;  };">
			                    <span style=" font-size: 12px;    color: #999;    line-height: 30px;    position: absolute;    right: 5px; vertical-align: middle;    width: auto; display: inline;    margin: 0; "></span>
		                    </div>
			                    <button onclick="insert();" type="button" style=" cursor: pointer;    margin: 0;    padding: 0;    border-radius: 0; font-family: &quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;    position: absolute;    right: 0;    top: 0;    height: 32px;    width: 100px;    text-align: center;    text-shadow: 0 1px 0 #fff;    color: #555;    font-size: 14px;    font-weight: bold;    border: 1px solid #ccc;    border-bottom-color: #aaa;    border-bottom-right-radius: 3px;    -webkit-border-bottom-right-radius: 3px;    background-color: #e6e6e6;    background-repeat: no-repeat;    background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fcfcfc), color-stop(25%, #fcfcfc), to(#e6e6e6));    background-image: -webkit-linear-gradient(#fcfcfc, #fcfcfc 25%, #e6e6e6);    background-image: -moz-linear-gradient(top, #fcfcfc, #fcfcfc 25%, #e6e6e6);    background-image: -ms-linear-gradient(#fcfcfc, #fcfcfc 25%, #e6e6e6);    background-image: linear-gradient(#fcfcfc, #fcfcfc 25%, #e6e6e6);    -webkit-transition: all .15s linear;    -moz-transition: all .15s linear;    transition: all .15s linear;    box-shadow: inset 0 0 1px #fff;">发布</button>
		                    </div>
                        </div>
                    </div>
                </div>
                <div id="detail"></div>
			</div>
		</nav>
</asp:Content>
