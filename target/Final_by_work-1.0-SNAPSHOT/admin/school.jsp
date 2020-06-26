<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 12875
  Date: 2019/12/23
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .main{
            width:600px;
            height: 500px;
            border-top-left-radius:50px ;
            border-bottom-left-radius: 50px;
            position: absolute;
            top: 20%;
            left: 30%;
            background-color: rgba(241, 253, 255, 0.6);
            overflow: auto;
        }
        .cent{
            width: 194px;
            height: 150px;
            float: left;
            text-align: center;
            font-family: 楷体;
            font-size: 20px;
            border:0 solid #000;
        }
        .cent:hover{
            background-color: #64e9ff
        }
        a{
            text-decoration: none;
        }
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
        .modalBox1 {
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
        .alertContent1 {
            width: 300px;
            height: 260px;
            background: #ffffff;
            border: 1px solid #333333;
            position: absolute;
            top: 20%;
            left: 40%;
            border-radius: 40px;
        }
        .alertContent1 p {
            border-bottom: 1px dashed #333333;
        }
        .alertContent {
            width: 300px;
            height: 260px;
            background: #ffffff;
            border: 1px solid #333333;
            position: absolute;
            top: 20%;
            left: 40%;
            border-radius: 40px;
        }
        .alertContent p {
            border-bottom: 1px dashed #333333;
        }
        .button {
            font: bold 13px Arial;
            text-decoration: none;
            background-color: #EEEEEE;
            color: #333333;
            padding: 4px 8px 4px 8px;
            border-top: 1px solid #CCCCCC;
            border-right: 1px solid #333333;
            border-bottom: 1px solid #333333;
            border-left: 1px solid #CCCCCC;
        }
        .input1{
            border: none;
            height: 30px;
            border-radius: 5px;
        }
    </style>
    <script type="text/javascript">
        function deleSelect() {
            var flag=false;
            var de=document.getElementsByName("select_college");
            for(var i=0;i<de.length;i++){
                if(de[i].checked){
                    flag= true;
                }
            }
            if(flag==false){
                alert("至少你要选择一个待删除记录");
                return false;
            }else{
                return true;
            }
        }
        var flag=0;
        function all_select() {
            var de=document.getElementsByName("select_college");
            if (flag == 0){
                for(var i=0;i<de.length;i++){
                    de[i].checked=true;
                }
                flag=1;
            }else{
                for(var i=0;i<de.length;i++){
                    de[i].checked=false;
                }
                flag=0;
            }
        }
    </script>
</head>
<body background="../img/school3.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%; background-attachment: fixed;">
<h1 style="text-align: center;font-family: 楷体;font-size:30px;position: relative;top: 38.5px;"><a href="infomation.jsp" style="color:#03a4ff;">用户</a><a href="#" style="color: white;font-size: 30px;">/学校</a></h1>
<div  style="position: relative;top:40px;left: 755px;">
    <form action="admin_school!mohu_query" method="post" style="position: relative;left: 15px;">
        <input type="text" name="mohu_name" class="input1"/>&nbsp;<input type="submit" value="搜索" class="input1" style="background-color: #03a4ff;width: 75px;"/>
        <input type="button" onclick="window.location.href = 'admin2.jsp'" value="返回" class="input1" style="width: 50px;"/>
    </form>
</div>
<div class="main" style="overflow-x: hidden;">
    <form action="admin_school!select_delete" onsubmit="return deleSelect();">
        <div style="width: 100%;height: 45px;">
            <div style="position: relative;left: 225px;top: 10px;">
                <button type="submit" style="width: 55px;height: 25px;">删除</button> / <a href="#" class="button" onclick="all_select();">全选</a></td>
            </div>
        </div>
        <s:iterator value="#session.school_info" status="st">
            <div class="cent" >
                <br>
                <a href="javascript:;" onclick="show_info(${st.index});"><s:property value="college"/></a><input type="checkbox" value="<s:property value="college"/>" name="select_college"/>
                <br>
                <br>
                <br>
                <a href="admin_school!delete?college.college_name=<s:property value="college"/>"> <img src="../img/delete2.png" style="height: 35px;width:35px;"></a>
            </div>
        </s:iterator>
    </form>
    <div class="cent"><a href="javascript:;" onclick="show_add();"><br><br>
        <div style="border-radius: 50%;  font-size: 170px;width: 100%;height: 100%; text-align: center">
            <img src="../img/update3.png" style="height: 75px;width:75px;">
        </div>
    </a></div>
</div>
<s:iterator value="#session.school_info" status="st">
    <div class="modalBox" id="${st.index}">
        <div class="overLay"></div>
        <div class="alertContent1">
            <h1 style="text-align: center; font-size: 20px;font-family: 楷体;" >修改学校信息</h1>
            <center>
                <form action="admin_school!update">
                    <input type="hidden" value="<s:property value="college"/>" name="old_name"/>
                    学校名称：<input type="text" name="college.college_name" value="<s:property value="college"/>"><br/><br/>
                    学校地址：<input type="text" name="college.place" value="<s:property value="place"/>"><br/><br/>
                    学校水平：<input type="text" name="college.level" value="<s:property value="level"/>"><br/><br/>
                    学校学院：<input type="text" name="college.academy" value="<s:property value="academy"/>"><br/><br/>
                    <div align="center">
                        <input type="submit" name="" value="修改">  <input type="reset" value="重置">
                        <a href="#" onclick="reset_info(${st.index})" class="button">取消</a>
                    </div>
                </form>
            </center>
        </div>
    </div>
</s:iterator>
<div class="modalBox1" id="best_add">
    <div class="overLay"></div>
    <div class="alertContent">
        <h1 style="text-align: center; font-size: 20px;font-family: 楷体;" >添加学校信息</h1>
        <center>
            <form action="admin_school!add" method="post">
                学校名称：<input type="text" name="college.college_name"><br><br>
                学校地址：<input type="text" name="college.place"><br><br>
                学校水平：<input type="text" name="college.level"><br><br>
                心仪专业：<input type="text" name="college.academy"><br><br>
                <div align="center">
                    <input type="submit" value="添加">  <input type="reset" value="重置">
                    <a href="#" class="button" onclick="reset_add();">取消</a>
                </div>
            </form>
        </center>
    </div>
</div>
<script>
    function show_info(num) {
        var divs=document.getElementById(num.toString());
        divs.style.display='block';
    }
    function reset_info(num) {
        var divs=document.getElementById(num.toString());
        divs.style.display = 'none';
    }
    function show_add() {
        var div=document.getElementById("best_add");
        div.style.display = 'block';
    }
    function reset_add() {
        var div=document.getElementById("best_add");
        div.style.display = 'none';
    }
</script>
</body>
</html>
