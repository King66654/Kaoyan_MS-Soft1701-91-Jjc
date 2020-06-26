<%--
  Created by IntelliJ IDEA.
  User: jinjianchen
  Date: 2019/11/30
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function check() {
            var file1=document.getElementById("file1").value;
            var file2=document.getElementById("file2").value;
            var file3=document.getElementById("file3").value;
            if (file1!="" || file2!="" || file3!=""){
                return true;
            }
            alert("请至少上传一个文件！");
            return true;
        }
    </script>
</head>
<style type="text/css">
    .test{
        width:350px;
        height: 390px;
        margin: 0 auto;
        position: relative;
        top: 100px;
        border-radius: 10%;
        background-color: rgba(241, 253, 255, 0.6);
    }
</style>
<body background="../img/data.jpg" style="background-repeat:no-repeat ;background-size:100% 100%; background-attachment: fixed;overflow-x:hidden">
    <div class="test">
        <br/>
        <p align="center" style="font-size: 20px;">请选择您要上传的文件：(最多三个)</p>
        <form action="file_upload!upload" method="post" enctype="multipart/form-data" onsubmit="return check();">
                <legend align="center"></legend>
                <div align="center">
                    文件主题：<input type="text" name="file_title"/><br/><br/>
                    <input id="file1" type="file" name="file_exa" /><br/><br/>
                </div>
                <div align="center">
                    文件主题：<input type="text" name="file_title"/><br/><br/>
                    <input id="file2" type="file" name="file_exa"/><br/><br/>
                </div>
                <div align="center">
                    文件主题：<input type="text" name="file_title"/><br/><br/>
                    <input id="file3" type="file" name="file_exa"/><br/><br/>
                </div>
                <div align="center">
                    <input type="submit" value="上传文件">
                    <input type="reset" value="重置文件">
                    <input type="button" onclick="window.location.href = 'download.jsp'" value="返回" style="width: 70px;"/>
                </div>
        </form>
    </div>
</body>
<script type="text/javascript">
    function Tips() {
        var check="<%=session.getAttribute("upload_false")%>";
        if (check != null) {
            if (check == "up_false") {
                alert("文件上传失败！\nTips: 文件可能已存在");
            }
        }
    };
    window.onload = function(){
        setTimeout(Tips,1);
    };
</script>
</html>