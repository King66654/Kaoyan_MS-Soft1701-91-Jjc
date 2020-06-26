<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/20
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .box1{
            width: 100%;
            height: 35%;
            background: url("../img/reg.gif") no-repeat;  //在这里可以进行更改
        }
        .title{
            font-family: 楷体;
            font-style: oblique;
            font-size: 80px;
            width: 100%;
            height: 65%;
            text-align: center;
            line-height: 120px;
        }
        a{
            text-decoration: none;
        }
        .box{
            width:14.281%;
            height: 100%;
            float: left;
            font-size: 30px;
            font-family: 楷体;
            text-align: center;
            line-height: 80px;
        }
        .box:hover{
            background-color:#ffae2e;
        }
        .head1{
            width: 10%;
            height: 100%;
            float: left;
            dashed: #000;
            background-color: white;
            border-top-left-radius: 50px;
            border: none;
        }
    </style>
</head>
<!-- background-color: aliceblue;-->
<body bgcolor="#ffae2e">

<div class="head1" >
    <div class="title">考研之路</div>
    <div class="box1"></div>
</div>
<div style="width: 90%; height: 100%;float: left; border-top-right-radius: 50px">
    <div style="width: 100%; height: 10%; background-color: antiquewhite; border-top-right-radius: 50px">
        <div class="box" > <a href="../first.jsp" target="down">首页</a></div>
        <div class="box" > <a href="../manage_friend/friends.jsp" target="down" >研友</a></div>
        <div class="box"> <a href="../manage_date/date.jsp" target="down" >日程规划</a></div>
        <div class="box"><a href="../manage_file/download.jsp" target="down"  >资料</a></div>
        <div class="box"> <a href="../manage_college/school.jsp" target="down" >院校信息查询</a></div>
        <div class="box"> <a href="../manage_person/personal.jsp" target="down">个人信息</a></div>
        <div class="box" style="position: relative;top:-5px;left: -5px;"> <div style="width: 100%;height: 10px;"></div>
            <a href="../login/user_login.jsp" target="_parent">
            <img src="../img/home_user.png" style="height:25px;width: 25px;"><font style="font-size: 20px;position: relative;top: -6px;">    <%=session.getAttribute("login_name")%></font></a>
        </div>
    </div>
    <div style="width: 100%; height: 90%;border: black;border-radius: 5px;border: 0px;">
        <iframe src="../first.jsp" name="down"  height="100%" width="100%" frameborder="0"></iframe>
    </div>
</div>
</body>
</html>
