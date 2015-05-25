<%@ Page Language="C#"  MasterPageFile="~/Share.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Hospital.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="css/Register.css" />
		 <script src="http://apps.bdimg.com/libs/jquery/1.7.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/Register.js" ></script>
<script type="text/javascript">

    var bool = 0;

    function insertToSQL() {
        var email = $("#email").val();  //email
        var name = $("#name").val();  //用户名
        var pwd = $("#password").val(); //密码
        var repeat = $("#repeat").val();
        var qq = "";  //qq
        if (email == "") {
            alert("邮箱不能为空");
            return;
        }
        if (name == "") {
            alert("用户名不能为空");
            return;
        }
        if (pwd != repeat) {
            alert("密码不一致");
            return;
        }
        if (bool == 1) {
            alert("用户名已存在！");
            return;
        }

        $.ajax({
            type: "post",
            url: "/ashx/Register.ashx?act=insert&email=" + email + "&name=" + name + "&pwd=" + pwd + "&qq=" + qq + "",// 跳转到 action 
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false, //默认为true 异步   
            success: function (result) {
                if (result == 1) {
                    alert("注册成功");
                    document.location.href = "Register_Detaile.aspx?act=insertDetail";
                }
                else
                    alert("注册失败");

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("XMLHttpRequest：" + XMLHttpRequest.readyState + ";;;textStatus：" + XMLHttpRequest.status + ";;;errorThrown：" + errorThrown);
            }

        });
    }


    //判断用户名是否存在
    function ISName() {
        var name = $("#name").val();  //用户名
        $.ajax({
            type: "post",
            url: "/ashx/Register.ashx?act=isName&name=" + name + "",// 跳转到 action 
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false, //默认为true 异步   
            success: function (result) {
                //alert(result);
                if (result == 1) {
                    lineState("name", "error", "用户名已存在！");
                    flags[1] = false;
                    bool = 1;
                }
                else {
                    if (name != "") {
                        lineState("name", "error", "恭喜用户名可以使用！");
                        flags[1] = true;
                        bool = 0;
                    }

                }

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("XMLHttpRequest：" + XMLHttpRequest.readyState + ";;;textStatus：" + XMLHttpRequest.status + ";;;errorThrown：" + errorThrown);
            }

        });
    }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div id="top"><h1>用户注册</h1></div>

<div class="form-bak">
	<form method="post" action="#" onsubmit="adaptValue();">
		<div class="left">
			<div class="line" id="line_account">
				<div class="info">
					<strong>邮箱</strong>
					
				</div>
				<div class="input">
					<input type="text" name="email" id="email" onblur="v_account();" onkeyup="v_account();"/>
					<div class="none"><span></span></div>
				</div>
			</div>
			
			<div class="line" id="line_name">
				<div class="info">
					<strong>用户名</strong>
					<span class="tips">只能由数字、文字或下划线组成<br />最多32个字符</span>
				</div>
				<div class="input">
					<input type="text" name="name" id="name" onblur="ISName();" onkeyup="ISName();" />
					<div class="none"><span></span></div>
				</div>
			</div>
			
			<div class="line" id="line_password">
				<div class="info">
					<strong>密码</strong>
					<span class="tips">6至16个字符</span>
				</div>
				<div class="input">
					<input type="password" name="password" id="password" onblur="v_password();" onkeyup="v_password();" />
					<div class="none"><span></span></div>
				</div>
			</div>
			
			<div class="line" id="line_repeat">
				<div class="info">
					<strong>确认密码</strong>
					<span class="tips">再次输入密码</span>
				</div>
				<div class="input">
					<input type="password" name="repeat" id="repeat" onblur="v_repeat();" onkeyup="v_repeat();" />
					<div class="none"><span></span></div>
				</div>
			</div>
		</div>
		
		<div class="right">
			<input type="button" id="submit" value="完成注册" onclick="insertToSQL();" disabled="disabled"/>
			<div class="readagreement-wrap" onclick="onReadAgreementClick();">
				<input type="checkbox" name="agree" id="agree" onchange="v_submitbutton();" />
				同意《<a id="readagreement" href="#agreement" onclick="showAgreement();" title="查看用户使用协议">用户使用协议</a>》
			</div>
			<div>已经拥有账号，<a href="Login.aspx">直接登录</a></div>
			<div>忘记密码，<a href="#">请联系管理员</a></div>
   
		</div>
	</form>
</div>

<div id="agreement" class="agreement" style="display:none;">
	<h1>用户使用协议</h1>
	<iframe src=""></iframe>
    <a href="#" onclick="agree();">同意</a>
	<a href="#" class="backtotop" >返回顶部</a>
</div>



<div style="text-align:center;clear:both;">

</div>
</asp:Content>
