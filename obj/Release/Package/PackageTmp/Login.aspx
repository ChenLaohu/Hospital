<%@ Page Language="C#" MasterPageFile="~/Share.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Hospital.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="css/Register.css" />
    <script src="http://apps.bdimg.com/libs/jquery/1.7.1/jquery.min.js"></script>
	
    	<script type="text/javascript">
    	    function Login() {
    	        var name = $("#name").val();  //用户名
    	        var pwd = $("#password").val(); //密码
    	        if (name == "") {
    	            alert("用户名不能为空");
    	            return;
    	        }
    	        if (pwd == "") {
    	            alert("密码不能为空");
    	            return;
    	        }
    	        $.ajax({
    	            type: "post",
    	            url: "/ashx/Register.ashx?act=login&name=" + name + "&pwd=" + pwd + "",// 跳转到 action 
    	            contentType: "application/json;charset=utf-8",
    	            dataType: "json",
    	            async: false, //默认为true 异步   
    	            success: function (result) {
    	                if (result == 1) {
    	                    document.location.href = "VideoUpload.aspx";
    	                    //history.go(-1);
    	                }
    	                else
    	                    alert("登录失败");

    	            },
    	            error: function (XMLHttpRequest, textStatus, errorThrown) {
    	                alert("XMLHttpRequest：" + XMLHttpRequest.readyState + ";;;textStatus：" + XMLHttpRequest.status + ";;;errorThrown：" + errorThrown);
    	            }

    	        });
    	    }
        </script>
        <script>
            document.onkeydown = function (event) {
                e = event ? event : (window.event ? window.event : null);
                if (e.keyCode == 13) {
                    Login();
                }
            }
        </script> 


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div id="top"><h1>用户登录</h1></div>

<div class="form-bak">
	<form method="post" action="#" onsubmit="adaptValue();">
		<div class="left">
			
			<div class="line" id="line_name">
				<div class="info">
					<strong>用户名</strong>
				</div>
				<div class="input">
					<input type="text" name="name" id="name" onblur="ISName();" onkeyup="ISName();" />
					<div class="none"><span></span></div>
				</div>
			</div>
			
			<div class="line" id="line_password">
				<div class="info">
					<strong>密码</strong>
				</div>
				<div class="input">
					<input type="password" name="password" id="password" onblur="v_password();" onkeyup="v_password();" />
					<div class="none"><span></span></div>
				</div>
			</div>
			
			
		</div>
		
		<div class="right">
			<input type="button" id="submit" value="登录" onclick="Login();"/>
			<div>忘记密码，<a href="Register.aspx">用户注册</a></div>
			<div>忘记密码，<a href="#">请联系管理员</a></div>
   
		</div>
	</form>
</div>





<div style="text-align:center;clear:both;">
</div>
</asp:Content>

