<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/20
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .test{
            position: relative;
            top: 75px;
            width: 300px;
            height: 225px;
            background-color: rgba(241, 253, 255, 0.4);
            border-radius: 10%;

        }
    </style>
    <script type="text/javascript">
        function add_info_check() {
            var date_check=document.getElementById("date_check").value;
            var thing_check=document.getElementById("thing_check").value;
            if (date_check=="" || thing_check==""){
                alert("请将信息填写完整！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body background="../img/dates.jpg" style="background-repeat:no-repeat ;background-size:100% 110%; background-attachment: fixed;overflow: hidden;" >
<center>
<div class="test">
    <br/>
    <h2 style="width: 100%;text-align: center;">添加日程安排</h2>
        <form action="date_operation!add" method="post" onsubmit="return add_info_check();">
            <pre>
日  期：<input id="date_check" type="date" name="date.date" value="" style="width: 150px">

事  件：<input id="thing_check" type="text" name="date.thing" value="" style="width: 150px">
            </pre>
                <div align="center">
                    <input type="submit" value="添加" style="width: 80px" >
                    <input type="reset" value="重置" style="width: 80px">
                    <input type="button" onclick="window.location.href = 'date.jsp'" value="返回" style="width: 70px;"/>
                </div>
        </form>
</div>
</center>
</body>
</html>
