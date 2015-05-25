<%@ Page Language="C#" MasterPageFile="~/Share.Master" AutoEventWireup="true" CodeBehind="Register_Detaile.aspx.cs" Inherits="Hospital.Register_Detaile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link rel="stylesheet" href="css/Register_Detaile.css" />
     <script src="http://apps.bdimg.com/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="js/ajaxfileupload.js" type="text/javascript"></script>
   <script type="text/javascript">
       var imgUrl = "";
       $(function () {
           $("#img1").hide();
           $(":button").click(function () {
               ajaxFileUpload();
           })
       })
       //图片上传
       function ajaxFileUpload() {
           $.ajaxFileUpload
           (
               {
                   url: '/ashx/UploadFilesImage.ashx', //用于文件上传的服务器端请求地址
                   secureuri: false, //一般设置为false
                   fileElementId: 'file1', //文件上传空间的id属性  <input type="file" id="file" name="file" />
                   dataType: 'json', //返回值类型 一般设置为json
                   success: function (data, status)  //服务器成功响应处理函数
                   {
                       $("#img1").show();
                       $("#img1").attr("src", data.imgurl);
                       imgUrl = data.imgurl;
                       if (typeof (data.error) != 'undefined') {
                           if (data.error != '') {
                               alert(data.error);
                           } else {
                               //alert(data.msg);
                           }
                       }
                   },
                   error: function (data, status, e)//服务器响应失败处理函数
                   {
                       alert(e);
                   }
               }
           )
           return false;
       }

       window.onload = function () {

       }

       //性别选择
       function my() {
           var sex = "";
           var sex_obj = document.getElementsByName('rb_Sex');
           for (var i = 0; i < sex_obj.length; i++) {
               if (sex_obj[i].checked) {
                   sex = sex_obj[i].value;
                   break;
               }
           }
           return sex;
       }

       function insertDeatilToSQL() {
           var UserName = $("#UserName").val();  //真实姓名
           var sex = my();  //性别
           var ssyy = $("#ssyy").val(); //所属医院
           var depart = $("#depart").val(); //所属科室
           var phone = $("#phone").val(); //联系电话


           $.ajax({
               type: "post",
               url: "/ashx/Register.ashx?act=insertDetail&name=" + UserName + "&sex=" + sex + "&ssyy=" + ssyy + "&ssks=" + depart + "&phone=" + phone + "&img=" + imgUrl + "",// 跳转到 action 
               contentType: "application/json;charset=utf-8",
               dataType: "json",
               async: false, //默认为true 异步   
               success: function (result) {
                   if (result == 1) {
                       alert("信息填写成功！");
                   }
                   else
                       alert("信息填写失败！");

               },
               error: function (XMLHttpRequest, textStatus, errorThrown) {
                   alert("XMLHttpRequest：" + XMLHttpRequest.readyState + ";;;textStatus：" + XMLHttpRequest.status + ";;;errorThrown：" + errorThrown);
               }

           });


       }


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="content">
            <dl>
                <dt class="f14 b">用户基本信息</dt>
                <dd><span class="title" style="float:left;">头像：</span>
                    <input type="file" id="file1" name="file"  />
                    <input type="button" id="update" value="上传" />
                </dd>
                <dd style="padding-top:15px; text-align:center;">
                    
                    <img id="img1" alt="上传成功啦" width="100" height="100" src="" />
                </dd>
                <dd><span class="title">真实姓名：</span><input class="reg_input" name="UserName" id="UserName" onblur="checkusername(this.value);" type="text" /><span id="t_UserNameTip1" class="onshow"></span></dd>
                <dd><span class="title">性别：</span><input type="radio" id="Sex_Man" name="rb_Sex" value="男" checked="checked" /><label for="Sex_Man"> 男</label>
                                                    <input type="radio" id="Sex_Woman" name="rb_Sex" value="女" /><label for="Sex_Woman"> 女</label>　
              </dd>
			  <dd><span class="title">所属医院：</span><input class="reg_input" name="ssyy" id="ssyy" onblur="checkusername(this.value);" type="text" /><span id="t_UserNameTip2" class="onshow"></span></dd>
			   <dd><span class="title">所属科室：</span>
			   <select id="depart" name="depart">
					  <option value ="01"></option>
					  <option value ="02">胃肠外科</option>
					  <option value="03">肝胆胰脾外科</option>
					  <option value="04">甲乳外科</option>
					  <option value="05">心胸外科</option>
					  <option value="06">泌尿外科</option>
					  <option value="07">神经外科</option>
					  <option value="08">骨科</option>
					  <option value="09">口腔科</option>
					  <option value="10">五官科</option>
					  <option value="11">内科</option>
					  <option value="12">外科</option>
					  <option value="13">妇科</option>
					  <option value="14">放射科</option>
					  <option value="15">儿科</option>
					  <option value="16">皮肤科</option>
				</select>
			   <span id="UserNameTip" class="onshow"></span>
			   </dd>
			    <dd><span class="title">联系电话：</span><input class="reg_input" name="phone" id="phone" onblur="checkusername(this.value);" type="text" /><span id="t_UserNameTip3" class="onshow"></span></dd>
            </dl>
            <div class="f_reg_but">
                <a href="javascript:insertDeatilToSQL();"><img src="images/122.jpg" width="110" height="32" /></a>
            </div>
         <div class="f_reg_but" style="margin-bottom:10px;">
             <span class="clew_txt">如果您已有帐号，可<a href="Login.aspx">直接登录</a></span>
         </div>
    

        </div>
</asp:Content>

