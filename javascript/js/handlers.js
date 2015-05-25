//Download by http://www.codefans.net

function fileQueued(file) {
    try {
        //alert(swfu.flash_url);
        var p = new FileProgress(file, swfu.settings.custom_settings.progressTarget);
        fg_fileSizes += file.size;
        p.setShow(true);
    }
    catch (e) {
        this.debug(e);
    }
}

function fileDialogComplete() {
    //fg_fileSizes = 0;
    fg_uploads = 0;
    fg_object = new FileGroupProgress();
    fg_object.setFileCountSize(fg_fileSizes);
    swfu.startUpload();
}

function fileQueueError(file, errorCode, message) {
    try {
        if (errorCode === SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED) {
            alert("You have attempted to queue too many files.\n" + (message === 0 ? "You have reached the upload limit." : "You may select " + (message > 1 ? "up to " + message + " files." : "one file.")));
            return;
        }

        var progress = new FileProgress(file, swfu.settings.custom_settings.progressTarget);
        //progress.setError();
        progress.setShow(false);

        fg_fileSizes -= file.size;
        fg_object.setFileCountSize(fg_fileSizes);

        switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                //progress.setStatus("File is too big.");
                alert("文件大小超过限制!");
                this.debug("Error Code: File too big, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                break;
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                //progress.setStatus("Cannot upload Zero Byte files.");
                alert("不能上传0节字文件!");
                this.debug("Error Code: Zero byte file, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                break;
            case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
                //progress.setStatus("Invalid File Type.");
                alert("不允许上传文件类型的文件!");
                this.debug("Error Code: Invalid File Type, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                break;
            default:
                if (file !== null) {
                    progress.setStatus("Unhandled Error");
                }
                alert("未知错误!");
                this.debug("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                break;
        }
    } catch (ex) {
        this.debug(ex);
    }
}

//上传文件对象、已上传的字节数，总共的字节数
function uploadProgress(file, bytesLoaded, bytesTotal) {
    try {
        var percent = Math.ceil((bytesLoaded / bytesTotal) * 100);

        var progress = new FileProgress(file, swfu.settings.custom_settings.progressTarget);
        //progress.setProgress(percent);
        progress.setProgress(percent,file);

        //fg_uploads += bytesLoaded;

        fg_object.setUploadProgress(fg_uploads + bytesLoaded, fg_fileSizes);
    } catch (ex) {
        this.debug(ex);
    }
}

//上传错误提示
function uploadError(file, errorCode, message) {
    try {
        var progress = new FileProgress(file, swfu.settings.custom_settings.progressTarget);
        progress.setShow(false);
        fg_fileSizes -= file.size;
        fg_object.setFileCountSize(fg_fileSizes);

        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
                //progress.setStatus("Upload Error: " + message);
                alert("Upload Error:" + message);
                this.debug("Error Code: HTTP Error, File name: " + file.name + ", Message: " + message);
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
                //progress.setStatus("Upload Failed.");
                alert("上传失败!");
                this.debug("Error Code: Upload Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                break;
            case SWFUpload.UPLOAD_ERROR.IO_ERROR:
                //progress.setStatus("Server (IO) Error");
                alert("服务器IO错误!");
                this.debug("Error Code: IO Error, File name: " + file.name + ", Message: " + message);
                break;
            case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
                //progress.setStatus("Security Error");
                alert("服务器安装错误!");
                this.debug("Error Code: Security Error, File name: " + file.name + ", Message: " + message);
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
                //progress.setStatus("Upload limit exceeded.");
                alert("上传被限制执行!");
                this.debug("Error Code: Upload Limit Exceeded, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                break;
            case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
                //progress.setStatus("Failed Validation.  Upload skipped.");
                alert("文件无效,跳过该文件!");
                this.debug("Error Code: File Validation Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                break;
            case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
                //progress.setStatus("Cancelled");
                //alert("上传被终止!");
                //progress.setCancelled();
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
                //progress.setStatus("Stopped");
                //alert("上传被停止!");
                break;
            default:
                //progress.setStatus("Unhandled Error: " + errorCode);
                alert("未知异常,ErrorCode:" + errorCode);
                this.debug("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
                break;
        }
    } catch (ex) {
        this.debug(ex);
    }
}

// This event comes from the Queue Plugin
function queueComplete(numFilesUploaded) {
    /*var status = document.getElementById("divStatus");
    status.innerHTML = numFilesUploaded + " file" + (numFilesUploaded === 1 ? "" : "s") + " uploaded.";*/
}

//上传完成一个周期之后 就本次上传结束
function uploadComplete(file) {
    try {
        //fancybox
    //    $("a.example").fancybox({
    //});

    //$('.various').fancybox({
    //    'type': 'swf'
    //});
    //alert("OK");

        //swf.stratUpload();
    }
    catch (ex) {
        this.debug(ex);
    }
    }

//参数
function uploadStart(file) {
    try {
        /* I don't want to do any file validation or anything,  I'll just update the UI and
        return true to indicate that the upload should start.
        It's important to update the UI here because in Linux no uploadProgress events are called. The best
        we can do is say we are uploading.
        */
        var progress = new FileProgress(file, swfu.settings.custom_settings.progressTarget);
        progress.setUploadState(3, this.settings);

        //var JJDBH = document.getElementById("jjdbh").value;
        //var UserId = document.getElementById("UserId").value;

        //swfu.addPostParam("UserId", UserId);
        //swfu.addPostParam("JJDBH", JJDBH);

        //progress.toggleCancel(true, swfu);
    }
    catch (ex) { }

    return true;
}

//上传好了执行的 serverData:服务器返回的数据
//上传并显示页面
function uploadSuccess(file, serverData) {
    try {
        var progress = new FileProgress(file, swfu.settings.custom_settings.progressTarget);
        progress.setComplete(this.settings);
        fg_uploads += file.size;

        this.fileProgressElement = document.getElementById(file.id);
        this.fileProgressElement.id = serverData;
        this.fileSpan = this.fileProgressElement.childNodes[3]; //存放名称
        //this.fileSpan.href = mediaServerUrl + "Download.aspx?zjxxid=" + serverData;
        //this.fileSpan.href = "#";

        this.hrefSpan = this.fileProgressElement.childNodes[4];
        this.hrefControl = this.hrefSpan.childNodes[0];
        //this.hrefSpan.innerHTML = "<span tabindex='0' class='children' onfocus='smFocus(" + serverData + ",this)' style='margin:0 8px;'>暂无内容</span><a href='javascript:void(0);' onclick='deleteAtt(" + serverData + ")'>删除</a>";
        //this.hrefSpan.innerHTML = "<a href='javascript:void(0);' style='margin-left:8px;' onclick='deleteAtt(" + serverData + ")'>删除</a>";

    } catch (ex) {
        this.debug(ex);
    }
}

//删除
function deleteAtt(id) {
    $.fancybox.showActivity();

    $.ajax({
        url: "Proxy/Zjxx.asmx/del",
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        data: "{zjxxbh:'" + id + "'}",
        success: function (json) {
            $.fancybox.hideActivity();
            //alert(json.d);
            if (json.d.substr(0, 1) == "1") {
                $("#" + id).remove();
            }
            else
                alert(json.d.substr(2));
        },
        error: function (x, e) {
            $.fancybox.hideActivity();
            alert(x.responseText);
        }
    });

}


function addExplain(id,obj) {
    $.ajax({
        url: "Proxy/Zjxx.asmx/addExplain",
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        data: "{zjxxbh:'" + id + "',bz:'" + obj.value + "'}",
        success: function (json) {
        },
        error: function (x, e) {
            alert(x.responseText);
        }
    });

}


function smFocus(id,obj) {
    var content = obj.innerHTML;
    obj.innerHTML = "<input type='text' value='" + content + "' style='width:200px;' onblur='smBlur("+id+",this)'/>";
}

function smBlur(id,obj) {
    var content = obj.value;
    obj.parentElement.innerHTML = content;

    $.ajax({
        url: "Proxy/Zjxx.asmx/addExplain",
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        data: "{zjxxbh:'" + id + "',bz:'" + content + "'}",
        success: function (json) {
        },
        error: function (x, e) {
            alert(x.responseText);
        }
    });
}