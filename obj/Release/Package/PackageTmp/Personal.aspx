<%@ Page Title="" Language="C#" MasterPageFile="~/Share.Master" AutoEventWireup="true" CodeBehind="Personal.aspx.cs" Inherits="Hospital.Personal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Personal.css" rel="stylesheet" />
    <script src="http://apps.bdimg.com/libs/jquery/1.7.1/jquery.min.js"></script>

    <script>
        window.onload = function()
        {
            $("#one span").css("color", "#fff");
        }
        $(function () {
            $('#left_part2 a').click(function () {
                $('#left_part2 a').removeClass('current');
                $(this).addClass("current");
                $('#left_part2 a span').css("color","#000");
                $(this).find("span").css("color", "#fff");
                var idName = $(this).attr("id");
                if (idName == "one")
                {
                    $("#right_content").show();
                    $("#right_content_video").hide();
                }
                if (idName == "two") {
                    $("#right_content").hide();
                    $("#right_content_video").show();
                }

            });


            $.ajax({
                type: "post",
                url: "/ashx/Register.ashx?act=userInformation&userName=<%=userName%>",// 跳转到 action 
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                async: false, //默认为true 异步   
                success: function (result) {
                    alert(result);
                    

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("XMLHttpRequest：" + XMLHttpRequest.readyState + ";;;textStatus：" + XMLHttpRequest.status + ";;;errorThrown：" + errorThrown);
                }

            });




            $.ajax({
                type: "post",
                url: "javascript/Upload.aspx/CheckLogin",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data.d == false) {
                        alert("请先登录！");
                        window.location.href = "Login.aspx";
                    }
                },
                error: function (err) {
                    alert(err);
                }
            });

        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div id="left">
            <div id="left_part1">
                <img src="images/4.png" width="120" height="120" />
                <h3>路人甲路人乙</h3>
            </div>
            <div id="left_part2">
                    <a href="#" class="current" id="one">
                        <img src="images/01.png"  width="20" height="20"/>
                        <span>个人资料</span>
                    </a>
                 <a href="#" id="two">
                        <img src="images/02.png"  width="20" height="20"/>
                        <span>我的视频</span>
                    </a>
                 <a href="#" id="four">
                        <img src="images/03.png"  width="20" height="20"/>
                        <span>修改密码</span>
                    </a>
            </div>
        </div>
         <!--结束left-->
        <div id="right">
            <div id="right_content">
                <div id="right_content_top">账户信息</div>
                <div id="right_content_bottom">
                    <table>
                        <tr>
                            <td class="bt">用户头像：</td>
                            <td><img src="images/4.png" width="120" height="120" /></td>
                        </tr>
                        <td class="kong"></td>
                        <tr>
                            <td class="bt">用户账号：</td>
                            <td class="nr">路人甲路人乙</td>
                        </tr>
                        <td class="kong"></td>
                        <tr>
                            <td class="bt">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                            <td class="nr">路人甲路人乙</td>
                        </tr>
                        <td class="kong"></td>
                         <tr>
                            <td class="bt">所属医院：</td>
                            <td class="nr">路人甲路人乙</td>
                        </tr>
                        <td class="kong"></td>
                         <tr>
                            <td class="bt">所属科室：</td>
                            <td class="nr">路人甲路人乙</td>
                        </tr>
                        <td class="kong"></td>
                         <tr>
                            <td class="bt">联系电话：</td>
                            <td class="nr">路人甲路人乙</td>
                        </tr>
                        <td class="kong"></td>
                         <tr>
                            <td class="bt">电子邮箱：</td>
                            <td class="nr">路人甲路人乙</td>
                        </tr>
                        <td class="kong"></td>
                         <tr>
                            <td class="bt">积&nbsp;&nbsp;&nbsp;&nbsp;分：</td>
                            <td class="nr">9999</td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--结束个人中心-->

            <div id="right_content_video" style="display:none;">
                <a class="video" href="#">
							<div class="video_content">
								<div class="video_content_img"><img src="images/40.jpg" width="175" height="100" /></div>
								<div class="video_content_img_title_double">标题</div>
								<div class="video_content_img_title_double count">7777</div>
							</div>
						</a>
                 <a class="video" href="#">
							<div class="video_content">
								<div class="video_content_img"><img src="images/40.jpg" width="175" height="100" /></div>
								<div class="video_content_img_title_double">标题</div>
								<div class="video_content_img_title_double count">7777</div>
							</div>
						</a>
                 <a class="video" href="#">
							<div class="video_content">
								<div class="video_content_img"><img src="images/40.jpg" width="175" height="100" /></div>
								<div class="video_content_img_title_double">标题</div>
								<div class="video_content_img_title_double count">7777</div>
							</div>
						</a>
                 <a class="video" href="#">
							<div class="video_content">
								<div class="video_content_img"><img src="images/40.jpg" width="175" height="100" /></div>
								<div class="video_content_img_title_double">标题</div>
								<div class="video_content_img_title_double count">7777</div>
							</div>
						</a>
                 <a class="video" href="#">
							<div class="video_content">
								<div class="video_content_img"><img src="images/40.jpg" width="175" height="100" /></div>
								<div class="video_content_img_title_double">标题</div>
								<div class="video_content_img_title_double count">7777</div>
							</div>
						</a>
                 <a class="video" href="#">
							<div class="video_content">
								<div class="video_content_img"><img src="images/40.jpg" width="175" height="100" /></div>
								<div class="video_content_img_title_double">标题</div>
								<div class="video_content_img_title_double count">7777</div>
							</div>
						</a>
           </div>


        </div>
         <!--结束right-->
    </div>
    <!--结束content-->
</asp:Content>
