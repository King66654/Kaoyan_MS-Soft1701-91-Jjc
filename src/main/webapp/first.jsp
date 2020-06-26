<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/20
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        function check_access(){
            var check=<%=session.getAttribute("access_user")%>;
            if (check == null){
                alert("对不起！请先登陆您的账号！");
                window.location.href="/login/user_login.jsp";
            }
        }
        window.onload=function(){
            check_access();
            setInterval('countDown()',1000);
        };
        var sec=30;
        function countDown(){
            if(sec>0){
                num.innerHTML=sec--;
            }
            else{
                location="menu.html";
            }
        }
    </script>
    <style>
        .fly-panel-main{
            width: 1000px;
            height: 150px;
            position: absolute;
            top: 210px;
            left: 300px;
            font-size: 80px;
            font-family: 楷体;
            color: red;
        }
    </style>
</head>
<body background="img/sec.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%; background-attachment: fixed;">
<div class="fly-panel-main">
    <p class="fly-zanzhu">
        <span id="t_d">00天</span> <span id="t_h">00时</span> <span
            id="t_m">00分</span> <span id="t_s">00秒</span>
    </p>
</div>
<script>
    function GetRTime(){
        var EndTime= new Date('2020/12/22 00:00:00');
        var NowTime = new Date();
        var t =EndTime.getTime() - NowTime.getTime();
        var d=Math.floor(t/1000/60/60/24);
        var h=Math.floor(t/1000/60/60%24);
        var m=Math.floor(t/1000/60%60);
        var s=Math.floor(t/1000%60);

        document.getElementById("t_d").innerHTML = d + "天";
        document.getElementById("t_h").innerHTML = h + "时";
        document.getElementById("t_m").innerHTML = m + "分";
        document.getElementById("t_s").innerHTML = s + "秒";
    }
    setInterval(GetRTime,0);
</script>
</body>
</html>
