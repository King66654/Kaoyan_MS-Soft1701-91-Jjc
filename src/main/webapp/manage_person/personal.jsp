<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/20
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <style type="text/css">
        .judge{
            position: relative;
            left: 0px;
        }
        .main{
            width: 400px;
            height: 560px;

            border: 1px solid #333333;
            position: absolute;
            top: 50px;
            left: 500px;
            border-radius: 10%;
            background-color: rgba(241, 253, 255, 0.6);
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        function check() {
            var pwd=document.getElementById("pwd").value;
            var name=document.getElementById("name").value;
            var sex0=document.getElementById("sex0").value;
            var sex1=document.getElementById("sex1").value;
            var race=document.getElementById("race").value;
            var birth=document.getElementById("birth").value;
            var email=document.getElementById("email").value;
            var mail_second=document.getElementById("mail_second").value;
            var tel=document.getElementById("tel").value;
            var province=document.getElementById("province").value;
            var city=document.getElementById("city").value;
            var area=document.getElementById("area").value;
            var place=area=document.getElementById("place").value;
            if (pwd=="" || name==""|| sex0==""|| sex1==""|| race==""|| birth==""|| email==""|| mail_second==""|| tel==""|| province==""|| city==""|| area==""|| place==""){
                alert("情将信息填写完整！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body onload="getProvince();test();place();" background="../img/per.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%; background-attachment: fixed;">
<%
    List<String> test = (ArrayList<String>)session.getAttribute("login_info");
    String login_name=test.get(0);
    String name=test.get(2);
    String sex=test.get(3);
    String race=test.get(4);
    String date=test.get(5);
    String[] time_array=date.split("/");
    String year=time_array[0];
    String month=time_array[1];
    String day=time_array[2];
    String date_test=year+'-'+month+'-'+day;
    String mail=test.get(6);
    String[] mail_array=mail.split("@");
    String mail_first=mail_array[0];
    String mail_second="@"+mail_array[1];
    String loc_p=test.get(7);
    String loc_c=test.get(8);
    String loc_d=test.get(9);
    String loc_detail=test.get(10);
    String tel=test.get(11);
%>
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
<center>
    <div class="main">
        <h1 style="text-align: center;font-size: 30px;font-family: 楷体">修改个人信息/<a href="password_update.jsp" style="text-decoration: none;">密码</a></h1>

            <form action="Register!update" method="post" onsubmit="return check();">
        <pre>
用 户 名：<input type="text" name="user.login_name" value="<%=login_name%>" id="username"style="width: 150px;"  readonly="readonly">

   密    码：<input id="pwd" type="password" name="user.password" value="" id="password" style="width: 150px;"> <i class="fa fa-eye" onclick="showhide();" id="eye"></i>

姓    名：<input id="name" type="text" name="user.name" value="<%=name%>" id="name" style="width: 150px;">

性    别：<input type="radio" id="sex0" name="user.sex" value="男" checked="checked" style="width: 55px;">男 <input type="radio" id="sex1" name="user.sex" value="女" style="width: 50px;">女

民    族：<input id="race" type="text" name="user.race" value="<%=race%>" id="race" style="width: 150px;">

出生日期：<input type="date" name="user.birth" value="<%=date_test%>" id="birth" style="width: 150px;">

        邮    箱：<input type="text" name="user.mail" value="<%=mail_first%>" id="email" style="width: 115px;"><select name="user.mail_after" id="mail_second" class="judge">
                <option value="@qq.com">@qq.com</option>
                <option value="@163.com">@163.com</option>
                <option value="@126.com">@126.com</option>
            </select>

电    话：<input type="text" name="user.tel" value="<%=tel%>" id="tel" style="width: 150px;">

用户住址：<select id="province" name="user.address_p" onchange="chooseProvince(this)" style="width: 150px;">
            <option value="<%=loc_p%>"><%=loc_p%></option>
          </select>

          <select id="city" name="user.address_c" onchange="chooseCity(this)" style="width: 150px;">
              <option value="<%=loc_c%>"><%=loc_c%></option>
          </select>

          <select id="area" name="user.address_d" style="width: 150px;">
              <option value="<%=loc_d%>"><%=loc_d%></option>
          </select>

详细地址：<input type="text" name="user.address_detail" value="<%=loc_detail%>" id="place" style="width: 150px;">
        </pre>
                    <div align="center">
                        <input type="submit" value="修改"  style="width: 70px;background-color: aquamarine"> <input type="reset" value="重置" style="width: 70px; background-color: red">
                    </div>

            </form>

    </div>
</center>
</body>
<script language="javascript" src="giao.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    function place() {
        document.getElementById("mail_second").value="<%=mail_second%>";
        var sex_test="<%=sex%>";
        if (sex_test.toString() == "女"){
            $("#sex0").removeAttr("checked");
            $("#sex1").attr("checked","checked");
        }else {
            $("#sex1").removeAttr("checked");
            $("#sex0").attr("checked","checked");
        }
    }
    function Tips() {
        var check="<%=session.getAttribute("info_false")%>";
        if (check != null) {
            if (check == "info_false") {
                alert("信息修改失败！\n注：密码错误！");
            }else if (check == "info_success"){
                alert("信息修改成功！");
            }
        }
    };
    function test(){
        setTimeout(Tips,1);
    };
</script>
</html>
