<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/21
  Time: 9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function check() {
            var name=document.getElementById("name").value;
            var address=document.getElementById("address").value;
            var level=document.getElementById("level").value;
            var academy=document.getElementById("academy").value;
            var min=document.getElementById("min").value;
            var max=document.getElementById("max").value;
            if (name=="" || address==""|| level==""|| academy==""){
                alert("请将信息填写完整！");
                return false;
            }
            if (isNaN(min) || isNaN(max)){
                alert("分数线请输入数字！");
                return false;
            }else{
                var min=parseInt(min);
                var max=parseInt(max);
                if (min>=max){
                    alert("数字请输入正确的范围！");
                    return false;
                }
                return true;
            }
        }
    </script>
    <style>
        .main{
            width: 300px;
            height: 360px;
            background: #ffffff;
            border: 1px solid #333333;
            position: absolute;
            top: 50px;
            left: 500px;
            border-radius: 10%;
            background-color: rgba(241, 253, 255, 0.6);
        }
    </style>
</head>
<body  background="../img/school2.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%; background-attachment: fixed;">
<div class="main">
    <h2 style="text-align: center;font-family: 楷体;">添加心仪院校</h2>
    <center>
        <form action="college!add" method="post" onsubmit="return check();">

            <pre>
  学校名称：<input id="name" type="text" name="college.college_name" value=""><br><br>
  学校地址：<input id="address"  type="text" name="college.place" value=""><br><br>
  学校水平：<input id="level" type="text" name="college.level" value=""><br><br>
  学校学院：<input id="academy" type="text" name="college.academy" value=""><br><br>
  分 数 线：<input id="min" type="text" name="college.min_score" value="" style="width: 65px;">  ~  <input id="max" type="text" name="college.max_score" value="" style="width: 65px;">
            </pre>
                <div align="center">
                    <input type="submit" name="" value="添加">&nbsp;&nbsp;&nbsp;
                    <input type="reset" name="" value="重置">&nbsp;&nbsp;&nbsp;
                    <input type="button" onclick="window.location.href = 'school.jsp'" value="返回" />
                </div>

        </form>
    </center>
</div>
</body>
</html>
