<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/23
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .main{
            width:600px;
            height: 500px;
            border-top-left-radius:50px ;
            border-bottom-left-radius: 50px;
            position: absolute;
            top: 18%;
            left: 30%;
            background-color: rgba(241, 253, 255, 0.6);

        }
        .cent{
            width: 194px;
            height: 150px;
            float: left;
            text-align: center;
            font-family: 楷体;
            font-size: 20px;
            border:0 solid #000;
        }
        .cent:hover{
            background-color: #0c12ff;
        }
        a{
            text-decoration: none;
        }
        body {
            font-family: "微软雅黑";
            padding: 0px;
            margin: 0px;
        }
        a {
            text-decoration: none;
            color: #333;
        }
        /*----------模态框样式开始-----------*/
        .modalBox {
            display: none;
        }
        .overLay {
            position: fixed;/*这里的定位方式使用fixed能保证遮罩层百分百的覆盖整个窗口*/
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            opacity: 0.5;
            background-color: #000000;
        }
        .alertContent {
            width: 300px;
            height: 250px;
            background: #ffffff;
            border: 1px solid #333333;
            position: absolute;
            top: 200px;
            left: 675px;
            border-radius: 20px;
        }
        .alertContent p {
            border-bottom: 1px dashed #333333;
        }
        .button {
            font: bold 13px Arial;
            text-decoration: none;
            background-color: #EEEEEE;
            color: #333333;
            padding: 4px 20px 4px 20px;
            border-top: 1px solid #CCCCCC;
            border-right: 1px solid #333333;
            border-bottom: 1px solid #333333;
            border-left: 1px solid #CCCCCC;
        }
        .input1{
            border: none;
            height: 30px;
            border-radius: 5px;
        }
    </style>
    <script type="text/javascript">
        function check_pwd() {
            var pwd=document.getElementById("pwd").value;
            var pwd_again=document.getElementById("pwd_again").value;
            if (pwd_again != pwd){
                alert("对不起！两次密码输入不一致！");
                return false;
            }else{
                return true;
            }
        }
        function deleSelect() {
            var flag=false;
            var de=document.getElementsByName("select_user");
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
            var de=document.getElementsByName("select_user");
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
</head>
<body onload="getProvince();" background="../img/user3.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%; background-attachment: fixed;overflow: hidden">
<br>
<h1 style="text-align: center;font-family: 楷体;font-size:30px;color: white">用户/<a href="school.jsp" style="color: #03a4ff;">学校</a></h1>
<div style="position: relative;left: 745px;">
    <form action="admin_operation!mohu_query" method="post" style="position: relative;left: 25px;">
        <input type="text" name="mohu_name" class="input1"/>&nbsp;<input type="submit" value="修删用户"  class="input1"style="background-color: #03a4ff;width: 75px;"/>
        <input type="button" onclick="window.location.href = 'admin2.jsp'" value="返回"  class="input1"style="width: 50px;"/>
    </form>
</div>
<div class="main">
    <form action="admin_operation!select_delete" id="select_user_delete" onsubmit="return deleSelect();" >
        <div style="width: 100%;height: 45px;">
            <div style="position: relative;left: 225px;top: 10px;">
                <button type="submit" style="width: 65px;height: 25px;">删除</button> / <a href="#" class="button" onclick="all_select();">全选</a></td>
            </div>
        </div>
        <s:iterator value="#session.user_info" status="st">
            <div class="cent">
                <br>
                <a href="javascript:;" onclick="show(${st.index});"><s:property value="login_name"/></a><input type="checkbox" value="<s:property value="login_name"/>" name="select_user"/>
                <br>
                <br>
                <a href="admin_operation!delete?user.login_name=<s:property value="login_name"/>">del</a>
            </div>
        </s:iterator>
    </form>
</div>
    <s:iterator value="#session.user_info" status="st">
        <div id="${st.index}" class="modalBox">
            <div class="overLay"></div>
            <div class="alertContent">
                <h1 style="text-align: center; font-size: 20px;font-family: 楷体;" >修改用户信息</h1>
                <center>
                    <form action="admin_operation!update" method="post" onsubmit="return check_pwd();">
        <pre>
用 户 名(旧)：<input type="text" name="old_name" value="<s:property value="login_name"/>" style="width: 150px;" readonly="readonly">

用 户 名：<input type="text" name="user.login_name" value="<s:property value="login_name"/>" id="username"style="width: 150px;">

密    码：<input type="text" name="user.password" value="<s:property value="password"/>" id="pwd" style="width: 150px;">

新 密 码：<input type="text" name="" value="" id="pwd_again" style="width: 150px;">
        </pre>
        <div align="center">
            <input type="submit" value="修改"  style="width: 70px;background-color: #0bff12"/>
            <input type="reset" value="重置" style="width: 70px; background-color: red"/>
            <a class="button" onclick="reset_test(${st.index});">取消</a>
        </div>
                    </form>
                </center>
            </div>
        </div>
    </s:iterator>
<script language="javascript" src="giao.js" type="text/javascript" charset="utf-8"></script>
<script>
    function show(id) {
        var divs=document.getElementById(id.toString());
        divs.style.display = 'block';
    }
    function reset_test(id) {
        var divs=document.getElementById(id.toString());
        divs.style.display = 'none';
    }
</script>
</body>
</html>
