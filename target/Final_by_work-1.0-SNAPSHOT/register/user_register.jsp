<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/20
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <style>
        form input{
            background-color:transparent;
        }
        form select{
            background-color: transparent;
        }
        .main{
            width: 400px;
            height: 595px;
            border: 1px solid #333333;
            border-radius: 10%;
            background-color: rgba(241, 253, 255, 0.4);
            position: relative;
            top: 20px;
        }
    </style>
    <script >
        function judge() {
            if(document.getElementById("username").value==""){
                alert("用户名不能为空");
                return false;
            }
            if (document.getElementById("password").value==""){
                alert("请输入密码！");
                return false;
            }
            if(document.getElementById("password").value!=document.getElementById("password1").value){
                alert("两次输入的密码不一致");
                return false;
            }
            if(document.getElementById("name").value==""){
                alert("姓名不能为空");
                return false;
            }
            if(document.getElementById("race").value==""){
                alert("民族不能为空");
                return false;
            }
            if(document.getElementById("birth").value==""){
                alert("出生日期不能为空");
                return false;
            }
            if(document.getElementById("email").value==""){
                alert("邮箱不能为空");
                return false;
            }
            var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*$");
            var email=document.getElementById("email").value;
            if(!reg.test(email)){
                alert("邮箱格式错误，请重新输入");
                return false;
            }
            if (document.getElementById("mail_second").value==""){
                alert("邮箱后缀格式错误，请重新选择");
                return false;
            }
            if(document.getElementById("tel").value==""){
                alert("手机号不能为空");
                return false;
            }
            var phone=document.getElementById("tel").value
            if(!(/^1[3456789]\d{9}$/.test(phone))){
                alert("手机号码有误，请重填");
                return false;
            }
            if(document.getElementById("province").value=="1" || document.getElementById("city").value=="2" || document.getElementById("area").value=="市辖区"){
                alert("地址选择有误！请重新选择！");
                return false;
            }
            if(document.getElementById("place").value==""){
                alert("详细地址不能为空");
                return false;
            }
            return true;
        }
    </script>
</head>
<body  background="../img/register.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%; background-attachment: fixed;" onload="getProvince()">
<script language="javascript" src="giao.js" type="text/javascript" charset="utf-8"></script>

<br>
<center>
<div class="main">
    <h2 align="center" style="font-family: 楷体;">个人信息注册</h2>
    <center>
        <form action="Register!res" method="post" onsubmit="return judge()">
        <pre>
用户  名：<input type="text" name="user.login_name" value="" id="username"style="width: 150px;" >

密    码：<input type="password" name="user.password" value="" id="password" style="width: 150px;">

确认密码：<input type="password" name="" value="" id="password1" style="width: 150px;">

姓    名：<input type="text" name="user.name" value="" id="name" style="width: 150px;">

性    别：<input type="radio" name="user.sex" value="男" checked="男" style="width: 55px;">男 <input type="radio" name="user.sex" value="女" style="width: 50px;">女

民    族：<input type="text" name="user.race" value="" id="race" style="width: 150px;">

出生日期：<input type="date" name="user.birth" value="" id="birth" style="width: 150px;">
<div style="position: relative;left: 12px;">
    邮    箱：<input type="text" name="user.mail" value="" id="email" style="width: 112px;"><select name="user.mail_after">
        <option value ="@qq.com">@qq.com</option>e
        <option value ="@163.com">@163.com</option>
        <option value="@126.com">@126.com</option>
    </select>
</div>
电    话：<input type="text" name="user.tel" value="" id="tel" style="width: 150px;">

用户住址：<select id="province" name="user.address_p"  onchange="chooseProvince(this)" id="p" style="width: 150px;">
                           <option value="1">请选择省</option>
          </select>

          <select id="city" name="user.address_c" onchange="chooseCity(this)" id="c" style="width: 150px;">
                            <option value="2">请选择市</option>
          </select>

          <select id="area" name="user.address_d" id="a" style="width: 150px;">
                    <option value="3">请选择区</option>
          </select>

详细地址：<input type="text" name="user.address_detail" value="" id="place" style="width: 150px;">
        </pre>
                <div align="center">
                    <input type="submit" value="注册"  style="width: 70px;background-color: aquamarine">   <input type="reset" value="重置" style="width: 70px; background-color: red">   <input type="button" onclick="window.location.href = '../login/user_login.jsp'" value="返回" style="width: 70px;"/>
                </div>
        </form>
    </center>
</div>
</center>
</body>
</html>
