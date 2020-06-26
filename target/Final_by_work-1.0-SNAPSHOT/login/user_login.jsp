<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/20
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>考研小助手</title>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <script>
        function check() {
            var login_name=document.getElementById('username').value;
            var pwd01=document.getElementById('password').value;
            var len=login_name.length;
            var len_pwd=pwd01.length;
            if (len<4 || len >10){
                alert("请将用户名限制在4-10位！");
                return false;
            }
            if (len_pwd<5 || len_pwd>10){
                alert("请将密码限制在5-10位！");
                return false;
            }
            return true;
        }

    </script>
    <style>
        .login{
            width: 300px;
            height: 310px;
            background-color: rgba(241, 253, 255, 0.4);
            border-radius: 10%;
            opacity: 1;
        }
        .body1{
            opacity: 1;
        }
        .input1{
            border: none;
            width: 180px;
            height: 30px;
            border-radius: 5px;
        }
        .down{
            width: 120px;
            height: 30px;
            border: none;
            border-radius: 5px;
            background-color: #76c4ff;
            color: white;
        }
    </style>
</head>
<body class="body1" background="../img/log.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%; background-attachment: fixed;">
<br>
<h1 align="center" style="font-family: 黑体; font-size: 50px; color: #cceeff;">Welcome</h1>
<br>
<center>
       <div class="login">
           <br>
           <h1 style="font-family: 楷体;font-size: 20px; text-align: center">考研规划小助手</h1>
           <form action="login" method="post" onsubmit="return check();">
                   <br/>
                   <table>
                       <tr>
                           <td style="height: 37px;width: 30px"><img src="../img/use.png" style="height: 25px; width: 25px"></td>
                           <td style="height: 37px"><input type="text" name="user.login_name" id="username" value="" placeholder="请限制在4-10位." class="input1"></td>
                       </tr>
                       <tr>
                           <td style="height: 37px;width: 30px"><img src="../img/passwd.png" style="height: 25px; width: 25px"></td>
                           <td style="height: 37px"><input type="password" name="user.password" id="password" value="" placeholder="请限制在5-10位." class="input1">
                               <i class="fa fa-eye" onclick="showhide();" id="eye"></i>
                           </td>
                       </tr>
                   </table>
                   <br/>
                   <div align="center">
                       &nbsp;&nbsp;<input type="submit" value="登 录" class="input1" style="font-family: 黑体;font-weight: 700; background-color: #0c56ff;color: white"><br><br>
                       <input type="button" value="注册" class="down" onclick="window.location.href = '../register/user_register.jsp'" />
                       <input type="button" value="Admin" class="down"  onclick="window.location.href = '../admin/admin2.jsp'"/>
                   </div>
           </form>
       </div>

</center>
<script>
    var eye = document.getElementById("eye");
    var pwd = document.getElementById("password");
    function showhide(){
        if (pwd.type == "password") {
            pwd.type = "text";
            eye.className='fa fa-eye-slash'
        }else {
            pwd.type = "password";
            eye.className='fa fa-eye'
        }
    }
</script>
</body>
</html>
