<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/20
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title></title>
  <style>
    body {
      font-family: "微软雅黑";
      padding: 0px;
      margin: 0px;
    }
    a {
      text-decoration: none;
      color: #333;
    }
    .trigger {
      display: inline-block;
      margin: 100px 400px;
    }
    /*----------模态框样式开始-----------*/
    .modalBox {
      display: none;
    }
    .overLay {
      position: fixed;/*这里的定位方式使用fixed能保证遮罩层百分百的覆盖整个窗口*/
      width: 100%;
      height: 100%;
      top: 0;
      left: 0;
      opacity: 0.5;
      background-color: #000000;
    }
    .alertContent {
      width: 300px;
      height: 400px;
      background: #ffffff;
      border: 1px solid #333333;
      position: absolute;
      top: 200px;
      left: 500px;
    }
    .alertContent p {
      border-bottom: 1px dashed #333333;
    }
  </style>
</head>
<body>
<a class="trigger" href="javascript:;">点我 点我！！！</a>
<div class="modalBox">
  <div class="overLay"></div>
  <div class="alertContent">
      <a href="" onclick="reset()"> 取消</a>
    <center>
    <form action="" method="post">

        学校名称：<input type="text" name="" value=""><br><br>
        学校地址：<input type="text" name="" value=""><br><br>
        学校水平：<input type="text" name="" value=""><br><br>
        学校学院：<input type="text" name="" value=""><br><br>
        心仪专业：<input type="text" name="" value=""><br><br>
        分数  线：<input type="text" name="" value=""><br><br>
        <input type="submit" name="" value="添加">

    </form>
    </center>
  </div>
</div>
<script>
  var trigger = document.getElementsByTagName("a")[0];
  var modal = document.getElementsByClassName("modalBox")[0];
  trigger.onclick = function (){
    modal.style.display = 'block';
  }
</script>
</body>
</html>
