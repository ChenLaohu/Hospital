<%@ Page Language="C#"  MasterPageFile="~/Share.Master" AutoEventWireup="true" CodeBehind="list.aspx.cs" Inherits="Hospital.list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="css/index.css" /> 
		<link rel="stylesheet" type="text/css" href="css/menu.css">
		<script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/menu_min.js"></script>
		<script type="text/javascript">
		    $(document).ready(function () {
		        $(".menu ul li").menu();
		    });
</script> 
 <script type="text/javascript">

     function MyOnclick(value, lx, mc) {
         var html = "";
         $.ajax({
             type: "post",
             url: "/ashx/Register.ashx?act=list_video&value=" + value + "&lx=" + lx + "",// 跳转到 action 
             contentType: "application/json;charset=utf-8",
             dataType: "json",
             async: false, //默认为true 异步   
             success: function (result) {
                 var list = result;
                 var title;
                 html += "<div class=\"part1_Name\">" + mc + "</div>"
                 for (var i = 0; i < list.length; i++) {
                     if (list[i].Title.length >= 8)
                         title = list[i].Title.substring(0, 8) + "..";
                     //alert(img);
                     html += "<a class=\"video\" href=\" detail.aspx?tableid=" + list[i].TableID + "\">";
                     html += "<div class=\"video_content\">";
                     html += "<div class=\"video_content_img\"><img src=\"" + list[i].imgPath + "\" width=\"175\" height=\"100\" /></div>";
                     html += "<div class=\"video_content_img_title\">" + title + "</div>";
                     html += "<div class=\"video_content_img_title_double\">" + title + "</div>";
                     html += "<div class=\"video_content_img_title_double count\">" + list[i].CreateTime.substring(0, 10) + "</div>";
                     html += "</div>";
                     html += "</a>";
                 }
                 document.getElementById("myVideo").innerHTML = html;

             },
             error: function (XMLHttpRequest, textStatus, errorThrown) {
                 alert("XMLHttpRequest：" + XMLHttpRequest.readyState + ";;;textStatus：" + XMLHttpRequest.status + ";;;errorThrown：" + errorThrown);
             }

         });
     }




      </script> 


<style>
	.module{height: 320px;}
	nav{height: 800px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<nav>
			<div id="left">
				<div class="part1" id="myVideo">
				</div>
				
			</div>
			<!--结束 nav left-->
			<div id="right">
				<div id="ranking">
					<div class="part1_Name name">视频分类</div>
				</div>
				<!--rihgt_part1-->
				<div class="menu">
					<ul>
						<li><a href="javascript:MyOnclick('1','0','甲乳外科');">甲乳外科</a></li>
						<li><a href="javascript:MyOnclick('2','0','腹壁疝外科');">腹壁疝外科</a></li>
						<li><a href="javascript:MyOnclick('3','0','消化道外科');">消化道外科</a>
							<ul>
								<li><a href="javascript:MyOnclick('1','1','胃、食道');">胃、食道</a></li>
								<li><a href="javascript:MyOnclick('2','1','小肠及肠系变');">小肠及肠系变</a></li>
								<li><a href="javascript:MyOnclick('3','1',代谢减重外科'');">代谢减重外科</a></li>
								<li><a href="javascript:MyOnclick('4','1','结直肠');">结直肠</a></li>
							</ul>
						</li>
						<li><a href="javascript:MyOnclick('4','0','肝胆胰脾外科');">肝胆胰脾外科</a></li>
						<li><a href="javascript:MyOnclick('5','0','泌尿外科');">泌尿外科</a></li>
						<li><a href="javascript:MyOnclick('6','0','妇科');">妇科</a></li>
						<li><a href="javascript:MyOnclick('7','0','胸外科');">胸外科</a></li>
						<li><a href="javascript:MyOnclick('8','0','骨科');">骨科</a></li>
						<li><a href="javascript:MyOnclick('9','0','神经外科');">神经外科</a></li>
					</ul>
				</div>
				
			</div>
		</nav>
</asp:Content>
