<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <style type="text/css">
        table{
            text-align: center;
        }
        a{
            text-decoration-line: none;
        }
        .div1 {
            width: 125px;
            height: 45px;
            overflow: hidden;
            cursor: pointer;
            transition: all 0.6s;
        }
        .div1:hover {
            transform: scale(1.6);
        }
        .button {
            font: bold 13px Arial;
            text-decoration: none;
            background-color: #EEEEEE;
            color: #333333;
            padding: 5px 7px 5px 7px;
            border-top: 1px solid #CCCCCC;
            border-right: 1px solid #333333;
            border-bottom: 1px solid #333333;
            border-left: 1px solid #CCCCCC;
        }
    </style>
    <script type="text/javascript">
        function check_access(){
            var check=<%=session.getAttribute("access_user")%>;
            if (check == null){
                alert("对不起！请先登陆您的账号！");
                window.location.href="/login/user_login.jsp";
            }
        }
    </script>
</head>
<body onload="check_access();" background="../img/data.jpg" style="background-repeat:no-repeat ;background-size:100% 100%; background-attachment: fixed;overflow-x:hidden">
<%
    String path="D:\\idea项目文件\\Struts2\\struts_test\\out\\artifacts\\struts_test_war_exploded\\File_store";
%>
<script type="text/javascript">
    function deleSelect() {
        var flag=false;
        var de=document.getElementsByName("fileSelectName");
        for(var i=0;i<de.length;i++){
            if(de[i].checked){
                flag= true;
            }
        }
        if(flag==false){
            alert("至少你要选择一个待删除记录");
            return false;
        }else{
            return true;
        }
    }
    var flag=0;
    function all_select() {
        var de=document.getElementsByName("fileSelectName");
        if (flag == 0){
            for(var i=0;i<de.length;i++){
                de[i].checked=true;
            }
            flag=1;
        }else{
            for(var i=0;i<de.length;i++){
                de[i].checked=false;
            }
            flag=0;
        }
    }
</script>
<h1 style="font-size: 20px;font-family: 楷体;text-align: center">您的资料如下：</h1>
<form action="select_file_delete" method="post" onsubmit="return deleSelect();">
    <table cellpadding="0" border="0" align="center" style="color:lightskyblue; background-color: rgba(241, 253, 255, 0.6);border-radius: 5px">
        <tr>
            <td height="35" width="50"><a href="upload.jsp" class="button">添加</a></td>
            <td height="35">文件名</td>
            <td height="35">文件主题</td>
            <td height="35">文件类型</td>
            <td height="35">文件大小</td>
            <td width="150" height="35">缩略图</td>
            <td width="140" height="35">音频播放</td>
            <td width="70" height="35"><a href="#" class="button" onclick="all_select();">全选</a></td>
            <td width="70" height="35"><button type="submit">删除</button></td>
        </tr>
        <s:iterator value="#session.file_info">
            <tr>
                <td width="50"><input type="checkbox" name="fileSelectName" value="<s:property value="filename"/>"/></td>
                <td height="50"><s:property value="filename"/></td>
                <td height="50"><s:property value="title"/></td>
                <td height="50"><s:property value="type"/></td>
                <td height="50"><s:property value="size"/></td>
                <td width="150" height="50"><img class="div1" onerror="this.src='${pageContext.request.contextPath}/img/error.jpg'"
                                                 src="/resource/<%=session.getAttribute("login_name")%>/<s:property value="filename"/>"/></td>
                    <%--<td width="150" height="50"><a href="/resource/<%=session.getAttribute("login_name")%>/<s:property value="filename"/>" target="_parent">播放</a></td>--%>
                <td width="70" height="50"><a href="" onclick=openNewWin("/resource/<%=session.getAttribute("login_name")%>/<s:property value="filename"/>")><img src="../img/view.png" style="width: 20px; height: 20px"/></a></td>
                <td width="70" height="50"><a href="file_download?fileName=<s:property value="filename"/>"><img src="../img/down.png" style="width: 20px; height: 20px"/></a></td>
                <td width="70" height="50"><a href="file_delete?fileName=<s:property value="filename"/>"><img src="../img/del.png" style="width: 20px; height: 20px"/></a></td>
            </tr>
        </s:iterator>
    </table>
</form>
<script type="text/javascript">
    function openNewWin(url)
    {
        var win=window.open(url,"","fullscreen=1")
        win.resizeTo(800,600)
        win.moveTo(600,75)
    }
</script>
</body>
</html>