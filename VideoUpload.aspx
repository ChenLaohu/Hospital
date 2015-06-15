<%@ Page Language="C#" MasterPageFile="~/Share.Master" AutoEventWireup="true" CodeBehind="VideoUpload.aspx.cs" Inherits="Hospital.VideoUpload" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/VideoUpload.css" />
    <link href="css/default.css" rel="stylesheet" type="text/css" />
    
    <script src="javascript/js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="javascript/swfupload/swfupload.js"></script>
    <script type="text/javascript" src="javascript/js/swfupload.queue.js"></script>
    <script type="text/javascript" src="javascript/js/swfupload.speed.js"></script>
    <script type="text/javascript" src="javascript/js/fileprogress.js"></script>
    <script type="text/javascript" src="javascript/js/filegroupprogress.js"></script>
    <script type="text/javascript" src="javascript/js/handlers.js"></script>
    <script>
        var upTmp = true;
        var swfu;
        $(function () {
            var settings = {
                flash_url: "javascript/swfupload/swfupload.swf",
                upload_url: "javascript/upload.aspx",
                //post_params: {
                //    "videoname": this.videoname.val(),
                //    "enname": this.enname.val(),
                //    "doctor": this.doctor.val(),
                //    "ssyy": this.ssyy.val(),
                //    "ssjj": this.ssjj.val(),
                //    "bpts": this.bpts.val(),
                //    "jybz": this.jybz.val(),
                //    "spsm": this.spsm.val()
                //},
                file_size_limit: "10000 MB",
                file_types: "*.*",
                file_types_description: "All Files",
                file_upload_limit: 1, //队列中上传个数  0表示无限视
                file_queue_limit: 0, //指定文件上传队列里最多能同时存放多少个文件
                custom_settings: {
                    progressTarget: "divprogresscontainer",
                    progressGroupTarget: "divprogressGroup",

                    //progress object
                    container_css: "progressobj",
                    icoNormal_css: "IcoNormal",
                    icoWaiting_css: "IcoWaiting",
                    icoUpload_css: "IcoUpload",
                    fname_css: "fle ftt",
                    state_div_css: "statebarSmallDiv",
                    state_bar_css: "statebar",
                    percent_css: "ftt",
                    href_delete_css: "ftt",

                    //sum object
                    /*
                    页面中不应出现以"cnt_"开头声明的元素
                    */
                    s_cnt_progress: "cnt_progress",
                    s_cnt_span_text: "fle",
                    s_cnt_progress_statebar: "cnt_progress_statebar",
                    s_cnt_progress_percent: "cnt_progress_percent",
                    s_cnt_progress_uploaded: "cnt_progress_uploaded",
                    s_cnt_progress_size: "cnt_progress_size"
                },
                debug: false,

                // Button settings
                button_image_url: "images/TestImageNoText_65x29.png",
                button_width: "90",
                button_height: "29",
                button_placeholder_id: "spanButtonPlaceHolder",
                button_text: '<span class="theFont" href="#">请选择视频！</span>',
                button_text_style: ".theFont { font-size: 12;color:#0068B7; }",
                button_text_left_padding: 12,
                button_text_top_padding: 3,
                button_action: SWFUpload.BUTTON_ACTION.SELECT_FILE,

                // The event handler functions are defined in handlers.js   事件定义
                file_queued_handler: fileQueued,    //加入队列成功触发的事件
                file_queue_error_handler: fileQueueError,   //加入队列失败触发的事件 (fileQueued or fileQueueError)
                upload_start_handler: uploadStart,  //在文件开始向服务端上传之前触发uploadStart事件，这个事件处理函数可以完成上传前的最后验证以及其他你需要的操作，例如添加、修改、删除post数据等。
                upload_progress_handler: uploadProgress,    //uploadProgress事件由flash控件定时触发，提供三个参数分别访问上传文件对象、已上传的字节数，总共的字节数。因此可以在这个事件中来定时更新页面中的UI元素，以达到及时显示上传进度的效果。
                upload_error_handler: uploadError,  //无论什么时候，只要上传被终止或者没有成功完成，那么uploadError事件都将被触发
                upload_success_handler: uploadSuccess,      //当文件上传的处理已经完成（这里的完成只是指向目标处理程序发送完了Files信息，只管发，不管是否成功接收），并且服务端返回了200的HTTP状态时，触发uploadSuccess事件
                upload_complete_handler: uploadComplete,    //当上传队列中的一个文件完成了一个上传周期，无论是成功(uoloadSuccess触发)还是失败(uploadError触发)，uploadComplete事件都会被触发，这也标志着一个文件的上传完成，可以进行下一个文件的上传了。
                file_dialog_complete_handler: fileDialogComplete    //当选择文件对话框关闭，并且所有选择文件已经处理完成（加入上传队列成功或者失败）时，此事件被触发，number of files selected是选择的文件数目，number of files queued是此次选择的文件中成功加入队列的文件数目。
            };
            swfu = new SWFUpload(settings);

        });


    </script>


    <script>

        $(document).ready(function () {
            $("#select2").hide();
            $("#select4").hide(); //医生之声 二级
            $("#select5").hide(); //医学课程 二级
        });

       
        $(function () {

            $('#select').change(function () {
                if ($(this).children('option:selected').val() == "3") {
                    $("#select2").show();//
                }
                else {
                    $("#select2").hide();
                }
            });
            $('#select3').change(function () {
                if ($(this).children('option:selected').val() == "00") {
                    $("#select").show();//
                    selectChange(); //提供三级选择
                    $("#select4").hide(); //医生之声 二级
                    $("#select5").hide(); //医学课程 二级
                }
                if($(this).children('option:selected').val() == "10") //医学课程
                {
                    $("#select2").hide();
                    $("#select4").hide(); //医生之声 二级
                    $("#select5").show(); //医学课程 二级
                    $("#select").hide();
                }
                if ($(this).children('option:selected').val() == "11") //医学课程
                {
                    $("#select2").hide();
                    $("#select4").show(); //医生之声 二级
                    $("#select5").hide(); //医学课程 二级
                    $("#select").hide();
                }
                    
            });

            //提供三级选择
            function selectChange()
            {
                $('#select').change(function () {
                    if ($(this).children('option:selected').val() == "3") {
                        $("#select2").show();
                    }
                    else
                        $("#select2").hide();
                });
            }

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


        function insertDeatilToSQL() {


            if ($("#divprogresscontainer").html() == "") {
                //alert($("#divprogresscontainer").html());
                alert("请先上传视频");
                return;
            }

            var videoname = $("#videoname").val();  //视频名称
            var doctor = $("#doctor").val();  //医生
            var ssyy = $("#ssyy").val(); //所属医院
            if (videoname == "") {
                alert("视频名称不能为空！");
                return;
            }
            if (doctor == "") {
                alert("医生不能为空！");
                return;
            }
            if (ssyy == "") {
                alert("所属医院不能为空！");
                return;
            }
            if (!upTmp) {
                alert("正在上传请稍等！");
                return;
            }
            
            if ($("#divprogresscontainer").html().indexOf('用户未验证') > 0) {
                alert("用户未进行审核,审核通过后才可以进行视频上传！")
                return;
            }
            if ($("#divprogresscontainer").html().indexOf('转换完成') < 0)
            {
                alert("请上传完后再提交！")
                return;
            }


            upTmp = false;

            var videoname = $("#videoname").val();
            var enname = $("#enname").val();
            var doctor = $("#doctor").val();
            var ssyy = $("#ssyy").val();
            var ssjj = $("#ssjj").val();
            var bpts = $("#bpts").val();
            var jybz = $("#jybz").val();
            var spsm = $("#spsm").val();
            var type = $("#select3").val();
            var sfyc = 0;
            var cc ="";

            if ($("input[name=sfyc]:checked").attr("value") == "1") {
                sfyc = 1;
            } else {//非原创
                cc = $("#cc").html();
            }

            var n = "0";  //0父类  1子类
            if (type == 00) {
                //type = $("#select2").val().replace(/3/, '');
                type = $("#select").val();
                if (type == 3)
                {
                    type = $("#select2").val().replace(/3/, '');
                    n = "1";
                    alert("3");
                }
                     
            }
            if (type == 11)
            {
                type = $("#select4").val().replace(/4/, '');
                n = "1";
            }
            if (type == 10) {
                type = $("#select5").val().replace(/5/, '');
                n = "1";
            }
             

            $.ajax({
                type: "post",
                url: "javascript/Upload.aspx/insertDeatilToSQL",
                data: "{videoname:'" + videoname + "',enname:'" + enname + "',doctor:'" + doctor + "',ssyy:'" + ssyy + "',ssjj:'" + ssjj + "',bpts:'" + bpts + "',jybz:'" + jybz + "',spsm:'" + spsm + "',type:'" + type + "',n:'" + n + "',sfyc:" + sfyc + ",cc:'"+cc+"'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var n = data.d;
                    //alert(n);
                    if (n == -1) {
                        alert("请登陆后再进行上传视频！");
                        window.location.href = "Login.aspx";
                    } else if (n == -2) {
                        alert("请上传视频后再进行提交！");
                    } else {
                        alert("上传成功！");
                        history.go(0);
                    }
                },
                error: function (err) {
                    alert(err);
                }
            });
            //alert("上传成功！");
            //history.go(0);
        }

        function check() {
            if ($("input[name=sfyc]:checked").attr("value") == "1") {
                $("#cc").attr("disabled", "");
            } else {
                $("#cc").removeAttr("disabled");
            }
        }

    </script>
	<style>
		.bt{height:20px; font-size:14px; font-weight:bold; line-height:25px;}
		.ts{line-height:25px; color:#666;}
		.kong{width:20px;}
		.bt1{font-size:20px; font-weight:bold; text-align:center;}
	    .nr span {margin-left:5px;}
	    .nr span b{color:red;}
	</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="content" style="margin-top: 30px;">
            <table>
				<tr><td class="bt1" colspan="4">视频上传</td></tr>
				<tr><td class="bt"></td></tr>
				<tr>
					<td class="bt">视频上传：</td>
					<td class="kong"></td>
					<td class="nr">
						<div id="swfu_container" style="margin: 0px 10px;">
						<div style="width: 100px;"><span id="spanButtonPlaceHolder"></span>&nbsp;</div>
						<div id="divprogresscontainer"></div>
                         <div style="display:none;" id="divprogressGroup"></div>
					</div>
					</td>
				</tr>
				<tr><td class="bt"></td></tr>
				<tr>
					<td class="bt">视频名称：</td>
					<td class="kong"></td>
					<td class="nr"><input class="reg_input" name="videoname" id="videoname" <%--onblur="checkusername(this.value);"--%> type="text" /><span><b>*</b>请输入视频的名称</span></td>
				</tr>
                <tr><td class="bt"></td></tr>
				<tr>
					<td class="bt">视频类别：</td>
					<td class="kong"></td>
					<td class="nr">
                        <select id="select3" name="select">
                          <option value ="00">手术视频</option>
                          <option value ="10">医学课程</option>
                          <option value="11">医生之声</option>
                        </select>
                        <select id="select" name="select">
                            <option value ="1">甲乳外科</option>
                          <option value ="2">腹壁疝外科</option>
                          <option value="3">消化道外科</option>
                          <option value="4">肝胆胰脾外科</option>
                            <option value="5">泌尿外科</option>
                            <option value="6">妇科</option>
                            <option value="7">胸外科</option>
                            <option value="8">骨科</option>
                            <option value="9">神经外科</option>
                            <option value="12">其他</option>
                        </select>
                        <select id="select2" name="select">
                          <option value ="31">胃、食道</option>
                          <option value ="32">小肠及肠系变</option>
                          <option value="33">代谢减重外科</option>
                          <option value="34">结直肠</option>
                        </select>
                        <select id="select4" name="select">
                            <option value ="410">医改政策</option>
                            <option value ="411">医患关系</option>
                          <option value ="45">其他</option>
                        </select>
                        <select id="select5" name="select">
                          <option value ="56">医学会议</option>
                            <option value ="57">医学英语</option>
                             <option value ="58">医学考试</option>
                            <option value ="59">其他</option>
                        </select>
					</td>
				</tr>
				<tr><td class="bt"></td></tr>
				<tr>
					<td class="bt">英文标题：</td>
					<td class="kong"></td>
					<td class="nr"><input class="reg_input"  id="enname" <%--onblur="checkusername(this.value);"--%> type="text" /><span>English Title</span></td>
				</tr>
				<tr><td class="bt"></td></tr>
				<tr>
					<td class="bt">主刀医生：</td>
					<td class="kong"></td>
					<td class="nr"><input class="reg_input" name="doctor" id="doctor" <%--onblur="checkusername(this.value);"--%> type="text" /><span><b>*</b>请输入主刀医生的姓名</span></td>
				</tr>
				<tr><td class="bt"></td></tr>
				<tr>
					<td class="bt">所属医院：</td>
					<td class="kong"></td>
					<td class="nr"><input class="reg_input" name="ssyy" id="ssyy" <%--onblur="checkusername(this.value);"--%> type="text" /><span><b>*</b>请输入所属医院名称</span></td>
				</tr>
				<tr><td class="bt"></td></tr>
				<tr>
					<td class="bt">患者简介：</td><!--手术简介 患者简介-->
					<td class="kong"></td>
					<td class="nr"><input class="reg_input" name="ssjj" id="ssjj" <%--onblur="checkusername(this.value);"--%> style="width:300px;" type="text" /></td>
				</tr>
				<tr><td class="bt"></td></tr>
				<tr>
					<td class="bt">关键字：</td><!--本片特色 关键字-->
					<td class="kong"></td>
					<td class="nr"><input class="reg_input" name="bpts" id="bpts" <%--onblur="checkusername(this.value);"--%> type="text" style="width:300px;" /></td>
				</tr>
				<tr><td class="bt"></td></tr>
				<tr>
					<td class="bt">简要步骤：</td>
					<td class="kong"></td>
					<td class="nr"> <textarea class="reg_input" name="jybz" id="jybz" <%--onblur="checkusername(this.value);"--%> style="height:100px; width:400px;" ></textarea ></td>
				</tr>
				<tr><td class="bt"></td></tr>
				<tr>
					<td class="bt">视频说明：</td>
					<td class="kong"></td>
					<td class="nr"> <textarea  class="reg_input" name="spsm" id="spsm" <%--onblur="checkusername(this.value);"--%>  style="height:100px; width:400px;"></textarea ></td>
				</tr>
				<tr><td class="bt"></td></tr>
                <tr>
					<td class="bt">是否原创</td>
					<td class="kong"></td>
					<td class="nr">
                        <div style="width: 100px;margin: auto;"><input type="radio" name="sfyc" value="1" onclick="check()" checked />原创<input type="radio" name="sfyc" value="0" onclick="check()" />非原创</div>
                        <textarea  class="reg_input" name="cc" id="cc"  style="height:100px; width:400px;" disabled></textarea >
					</td>
				</tr>
                </table>
                
            <div id="jieshao">
                凡发布的视频、图片、文字等内容若有侵权、色情、暴力等违反法律、法规的内容，视频上传者应负全责！
            </div>    
            <div class="f_reg_but">
                <a href="javascript:insertDeatilToSQL();"><img src="images/122.jpg" width="110" height="32" /></a>
            </div>
         
    

        </div>
    
</asp:Content>


