<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jinjianchen
  Date: 2019/11/29
  Time: 12:48
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
        .button {
            font: bold 12.5px Arial;
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
        var flag=0;
        function all_select() {
            var de=document.getElementsByName("collegeSelectName");
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
        function deleSelect() {
            var flag=false;
            var de=document.getElementsByName("collegeSelectName");
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
        function check_school() {
            alert("Sorry！该学校不存在!");
        }
        function check_access(){
            var check=<%=session.getAttribute("access_user")%>;
            if (check == null){
                alert("对不起！请先登陆您的账号！");
                window.location.href="/login/user_login.jsp";
            }
        }
    </script>
</head>
<body onload="check_access();" background="../img/school.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%; background-attachment: fixed;">
<%
    String check=request.getParameter("check");
    if (check != null){
        if (check.equals("false")){
            out.println("<script>check_school();</script>");
        }
    }
%>
<div style="position: relative;left: 840px;top: 45px;">
    <form action="college!mohu_query" method="post" style="position: relative;left: 150px;">
        院校位置：<input type="text" name="college.place" style="display: inline-block;width: 75px;">
        院校分类：<input type="text" name="college.level" style="display: inline-block;width: 75px;">
        <input type="submit" value="修删信息">
    </form>
</div>
<p align="center" style="font-size: 20px;">您的院校信息信息如下：</p>
<form action="college!select_delete" method="post" onsubmit="return deleSelect();">
    <table cellpadding="0" border="0" align="center"style=" background-color: rgba(241, 253, 255, 0.6);border-radius: 5px">
        <tr>
            <td width="65" height="35"><a href="schools_insert.jsp" class="button">添加</a></td>
            <td width="200" height="25">院校姓名</td>
            <td width="110" height="25">院校位置</td>
            <td width="110" height="25">院校分类</td>
            <td width="110" height="25">院系</td>
            <td width="110" height="25">最低分数线</td>
            <td width="110" height="25">最高分数线</td>
            <td width="140" height="25"><a href="#" class="button" onclick="all_select();">全选</a>  /  <button type="submit">删除</button></td>
        </tr>
        <s:iterator value="#session.college_info">
        <tr>
            <td width="65" height="35"><input type="checkbox" name="collegeSelectName" value="<s:property value="college_name"/>"/></td>
            <td width="200" height="25"><s:property value="college_name"/></td>
            <td width="110" height="25"><s:property value="place"/></td>
            <td width="110" height="25"><s:property value="level"/></td>
            <td width="110" height="25"><s:property value="academy"/></td>
            <td width="110" height="25"><s:property value="min_score"/></td>
            <td width="110" height="25"><s:property value="max_score"/></td>
            <td width="140" height="25"><a href="college!delete?college.college_name=<s:property value="college_name"/>"><img src="../img/del.png" style="width: 20px; height: 20px"/></a></td>
        </tr>
        </s:iterator>
</body>
</table>
</form>
</html>