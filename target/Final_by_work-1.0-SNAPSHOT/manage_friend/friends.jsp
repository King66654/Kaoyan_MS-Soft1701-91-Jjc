<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: jinjianchen
  Date: 2019/11/29
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        table{
            text-align: center;

        }
        a{
            text-decoration-line: none;
            text-decoration-color: darkmagenta;
        }
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
            height: 328px;
            background: #ffffff;
            border: 1px solid #333333;
            position: absolute;
            top: 150px;
            left: 500px;
            border-radius: 10%;
            background-color: rgba(241, 253, 255, 0.6);
        }
        .button {
            font: bold 13px Arial;
            text-decoration: none;
            background-color: #EEEEEE;
            color: #333333;
            padding: 5px 7px 5px 7px;
            border-top: 1px solid #CCCCCC;
            border-right: 1px solid #333333;
            border-bottom: 1px solid #333333;
            border-left: 1px solid #CCCCCC;
        }
    </style>
    <script type="text/javascript">
        function deleSelect() {
            var flag=false;
            var de=document.getElementsByName("studentSelectName");
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
            var de=document.getElementsByName("studentSelectName");
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
        function check_var(num) {
            var name=document.getElementById("name"+num.toString()).value;
            var tel=document.getElementById("tel"+num.toString()).value;
            if (isNaN(tel)){
                alert("电话字段必须为数值型！");
                return false;
            }
            var mail=document.getElementById("mail"+num.toString()).value;
            var address=document.getElementById("address"+num.toString()).value;
            var sex0=document.getElementById("sex0"+num.toString()).value;
            var sex1=document.getElementById("sex1"+num.toString()).value;
            if (name=="" || tel=="" || mail=="" || address=="" || sex0=="" || sex1==""){
                alert("请勿遗漏信息！");
                return false;
            }
            document.getElementById(num).submit();
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body background="../img/friend3.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%; background-attachment: fixed;overflow-x:hidden" bgcolor="white">
<form id="first" action="communication!mohuQuery" method="post" style="position: relative;top: 55px;left: 935px;">
    <p style="color: white">研友姓名：<input type="text" name="mohu_name" style="display: inline-block;"><input type="submit" value="查询"></p>

</form>
<p align="center" style="font-size: 25px;color: white">考研之路你我他</p>
<form id="second" action="communication!select_delete_friends" method="post" onsubmit="return deleSelect();">
    <table cellpadding="0" border="0" align="center" style="color: white;">
        <tr bgcolor="#23f5ff" style="">
            <td width="65" height="35"><a href="friends_insert.jsp" class="button">添加</a></td>
            <td width="110" height="25">联系人姓名</td>
            <td width="120" height="25">联系电话</td>
            <td width="145" height="25">性别</td>
            <td width="175" height="25">邮箱</td>
            <td width="175" height="25">住址</td>
            <td width="70" height="25"><button type="submit">删除</button></td>
            <td width="70" height="25"><a href="#" class="button" onclick="all_select();">全选</a></td>
        </tr>
        <s:iterator var="studentItem" value="#session.friend_info" status="st">
            <tr >
                <td width="65" height="35" bgcolor="#23f5ff"><input type="checkbox" name="studentSelectName" value="<s:property value="name"/>"/></td>
                <td width="110" height="35"><s:property value="name"/></td>
                <td width="120" height="35"><s:property value="tel"/></td>
                <td width="145" height="35"><s:property value="sex"/></td>
                <td width="175" height="35"><s:property value="mail"/></td>
                <td width="175" height="35"><s:property value="address"/></td>
                <td width="70" height="25"><a href="communication!delete?friends.name=<s:property value="name"/>"><img src="../img/delete.png" style="width: 20px; height: 20px"/></a></td>
                <td width="70" height="25"><a class="trigger" href="javascript:;" onclick="show('<s:property value="sex"/>${st.index}');"><img src="../img/update1.png" style="width: 20px; height: 20px"/></a></td>
            </tr>
        </s:iterator>
    </table>
</form>
<s:iterator var="studentItem" value="#session.friend_info" status="st">
    <div class="modalBox">
        <div class="overLay"></div>
        <div class="alertContent"><center>
            <h2>修改信息</h2>
            <form id="${st.index}" action="communication!update" method="post" >
<pre>
<input type="hidden" name="old_name" value="<s:property value="name"/>" onfocus=this.blur(); />
 研友姓名：    <input id="name${st.index}" type="text" name="friends.name" value="<s:property value="name"/>"/>

 研友电话：    <input id="tel${st.index}" type="text" name="friends.tel" value="<s:property value="tel"/>"/>

研友性别：    <input type="radio" id="sex0${st.index}" name="friends.sex" value="男" checked="checked" style="width: 53px;">男 <input type="radio" id="sex1${st.index}" name="friends.sex" value="女" style="width: 53px;">女

 研友邮箱：    <input id="mail${st.index}" type="text" name="friends.mail" value="<s:property value="mail"/>"/>

 研友地址：    <input id="address${st.index}" type="text" name="friends.address" value="<s:property value="address"/>"/>
          <div align="center">
<button type="button" onclick='return check_var(${st.index});'>提交</button>  <button type="button" onclick='document.getElementById(${st.index}).reset();'>重置</button>   <a class="button" onclick="reset_test(${st.index+1});">取消</a>
          </div>
</pre>
            </form>
        </center>
        </div>
    </div>
</s:iterator>
<script type="text/javascript">
    function show_block(count) {
        var modal = document.getElementsByClassName("modalBox")[count];
        modal.style.display = 'block';
    }
    function show(num) {
        var sex=num[0];
        var count=num.substring(1,num.length);
        show_block(parseInt(count));
        if (sex.toString() == "女"){
            document.getElementById("sex0"+count).checked=false;
            document.getElementById("sex1"+count).checked=true;
        }else {
            document.getElementById("sex1"+count).checked=false;
            document.getElementById("sex0"+count).checked=true;
        }
    }
    function reset_test(num) {
        var modal = document.getElementsByClassName("modalBox")[num-1];
        modal.style.display = 'none';
    }
</script>
</body>
</html>
