<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/23
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <STYLE>
        .admim{
            width: 300px;
            height: 300px;
            position: absolute;;
            top: 30%;
            left: 40%;

            background-color: blue;
            border-radius: 50%;
        }
        .input1{
            border: none;
            width: 180px;
            height: 30px;
            border-radius: 5px;
        }
    </STYLE>
    <script>
        var flag=1,flag2=1;
        window.onload=function(){
            setInterval(move,50);

        }
        function move(){
            var d=document.getElementById("box");
            var len=d.style.top.length;
            var len2=d.style.left.length;
            var value=parseInt(d.style.top.substring(0,len-2));
            var value2=parseInt(d.style.left.substring(0,len2-2));

            d.style.top=(value-5).toString()+"px";
            if(value==40)
            {
                d.style.top="670px";
                d.style.width="1px";
                d.style.height="1px";
                return ;
            }
            var len3=d.style.width.length;
            var len4=d.style.height.length;
            var value3=parseInt(d.style.width.substring(0,len3-2));
            var value4=parseInt(d.style.height.substring(0,len4-2));
            d.style.width=(value3+1).toString()+"px";
            d.style.height=(value4+1).toString()+"px";
            document.getElementById('width').value=(value3).toString();
            document.getElementById('height').value=(value4).toString();

        }
        function identify() {
            alert("对不起！登陆失败！\nTips: 身份验证失败或准备程序崩溃！");
        }
        function showhide(){
            var eye = document.getElementById("eye");
            var pwd = document.getElementById("password");
            if (pwd.type == "password") {
                pwd.type = "text";
                eye.className='fa fa-eye-slash'
            }else {
                pwd.type = "password";
                eye.className='fa fa-eye'
            }
        }
    </script>
</head>
<body bgcolor="#1e90ff">
<%
    String check=request.getParameter("check");
    if (check!=null){
        if (check.equals("false")){
            out.println("<script>identify();</script>");
        }
    }
%>
<br><br><br>
<h1 style="font-size: 30px;text-align:center;font-family: 楷体">管理员界面</h1>
<div class="admim"><br><br>
    <br><br><center>
        <form action="admin" method="post">
            <input type="text" name="admin.name" id="admin" value="" placeholder="管理员登录名" class="input1"><br><br>
             &nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="admin.password" id="password" value="" placeholder="管理员密码" class="input1"> <i class="fa fa-eye" onclick="showhide();" id="eye"></i><br><br>
            <div align="center">
                <input type="submit" value="管理员登录" style="border-radius: 5px"><br/><br/>
                <input type="button" value="返回" style="border-radius: 5px" onclick="window.location.href='../login/user_login.jsp'"/>
            </div>
        </form>
    </center>
</div>
<div id="box" style="width: 1px;height: 1px;border-radius: 50%;background-color: red;position: absolute; top: 670px; left: 1000px;"> </div>
</body>
</html>
