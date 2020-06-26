<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/20
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .test{
            position: relative;
            top: 75px;
            width: 300px;
            background-color: rgba(241, 253, 255, 0.8);
            border-radius: 10%;
        }
    </style>
</head>
<script type="text/javascript">
    function input_check() {
        var name_value=document.getElementById("name").value;
        var tel_value=document.getElementById("tel").value;
        var mail_value=document.getElementById("mail").value;
        var address_value=document.getElementById("address").value;
        var sex0=document.getElementById("sex0").value;
        var sex1=document.getElementById("sex1").value;
        if (name_value == "" || tel_value=="" || mail_value=="" || address_value==""){
            alert("请将信息填写完整！");
            return false;
        }else{
            if (sex0=="" && sex1==""){
                alert("请将信息填写完整！");
                return false;
            }else {
                return true;
            }
        }
    }
</script>
<body background="../img/firends2.jpg" style=" background-repeat:no-repeat ;background-size:100% 98%; background-attachment: fixed;overflow-x:hidden">
<center>
<div class="test">
    <br/>
    <h1 style="text-align: center; font-size: 20px;font-family: 宋体;" >添加研友信息</h1>

        <form action="communication!add" method="post" onsubmit="return input_check();">

    <pre>
  研友姓名：<input id="name" type="text" name="friends.name" value=""><br><br>
  研友电话：<input id="tel" type="text" name="friends.tel" value=""><br><br>
  研友性别：<input id="sex0" type="radio" name="friends.sex" value="男" checked="男" style="width: 55px;">男 <input id="sex1" type="radio" name="friends.sex" value="女" style="width: 55px;">女<br><br>
  研友邮箱：<input id="mail" type="text" name="friends.mail" value=""><br><br>
  研友住址：<input id="address" type="text" name="friends.address" value="">
    </pre>
                <div align="center" style="position: relative;top: -10px;">
                    <input type="submit" value="添加" style="width: 70px" >  <input type="reset" value="重置" style="width: 70px">
                    <input type="button" onclick="window.location.href = 'friends.jsp'" value="返回" style="width: 70px;"/>
                </div>
        </form>

</div>
</center>
</body>
</html>
