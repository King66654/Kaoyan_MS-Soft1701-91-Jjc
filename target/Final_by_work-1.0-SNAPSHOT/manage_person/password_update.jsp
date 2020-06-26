<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/20
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript">
        function check() {
            var old_pwd=document.getElementById("pwd").value;
            var new_name=document.getElementById("new_name").value;
            var pwd=document.getElementById("pwd_first").value;
            var pwd_again=document.getElementById("pwd_second").value;
            if (old_pwd=="" || new_name=="" || pwd=="" || pwd_again==""){
                alert("请将信息填写完整！");
                return false;
            }
            if (pwd == pwd_again){
                return true;
            }else{
                alert("请保证输入密码一致！");
                return false;
            }
        }
        function exit_test() {
            var check=<%=session.getAttribute("exit")%>;
            if (check == true){
                window.top.location.href="${pageContext.request.contextPath}/login/user_login.jsp";
            }
        }
        function Tips() {
            var check=<%=session.getAttribute("safe_check")%>;
            if (check != null) {
                if (check == false) {
                    alert("安全信息修改失败！");
                }
            }
        };
        function test(){
            setTimeout(Tips,1);
        };
    </script>
    <style>
        .main{
            width: 400px;
            height: 300px;

            border: 1px solid #333333;
            position: absolute;
            top: 50px;
            left: 500px;
            border-radius: 10%;
            background-color: rgba(241, 253, 255, 0.6);
        }
    </style>
</head>
<body background="../img/per.jpg" style="background-repeat:no-repeat ;background-size:100% 100%; background-attachment: fixed;" onload="exit_test();test();">
<script type="text/javascript">
    function showhide(){
        var eye = document.getElementById("eye");
        var pwd = document.getElementById("pwd");
        if (pwd.type == "password") {
            pwd.type = "text";
            eye.className='fa fa-eye-slash'
        }else {
            pwd.type = "password";
            eye.className='fa fa-eye'
        }
    }
</script>
<div class="main">
    <h1 style="text-align: center;font-size: 30px;font-family: 楷体">修改<a href="personal.jsp" style="text-decoration: none;">个人信息</a>/密码</h1>
    <center>
        <form action="safe" method="post" onsubmit="return check();">

            <pre>
   密码验证：<input type="password" name="old_pwd" value="" id="pwd"> <i class="fa fa-eye" onclick="showhide();" id="eye"></i>

新用户名：<input type="text" name="user.login_name" value="" id="new_name">

  新密码：<input type="password" name="user.password" id="pwd_first" value="">

确认密码：<input type="password" name="" id="pwd_second" value="">
            </pre>
                <div align="center">
                    <input type="submit" value="确认" style="width: 50px">&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="重置" style="width: 50px;">
                </div>

        </form>
    </center>
</div>
</body>
</html>
