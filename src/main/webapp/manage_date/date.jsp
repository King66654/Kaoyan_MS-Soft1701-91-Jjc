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
            height: 235px;
            background: #ffffff;
            border: 1px solid #333333;
            position: absolute;
            top: 200px;
            left: 500px;
            border-radius: 10%;
            background-color: rgba(241, 253, 255, 0.6);
        }
    </style>
    <script type="text/javascript">
        function deleSelect() {
            var flag=false;
            var de=document.getElementsByName("selectDateName");
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
            var de=document.getElementsByName("selectDateName");
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
        function mohu_check() {
            var year=document.getElementById("mohu_year").value;
            var month=document.getElementById("mohu_month").value;
            if (year=="" && month!=""){
                alert("请输入确切的查询条件！");
                return false;
            }
            return true;
        }
        function var_check(num) {
            var old_date=document.getElementById("old_date"+num.toString()).value;
            var new_date=document.getElementById("new_date"+num.toString()).value;
            var new_thing=document.getElementById("new_thing"+num.toString()).value;
            if (old_date=="" || new_date=="" || new_thing==""){
                alert("请勿遗漏信息！");
                return false;
            }
            document.getElementById(num).submit();
        }
    </script>
</head>
<body background="../img/dates.jpg" style="background-repeat:no-repeat ;background-size:100% 110%; background-attachment: fixed; overflow: hidden">
<div style="position: relative;left: 800px;top: 53px;">
    <form action="date_operation!mohuQuery" method="post" onsubmit="return mohu_check();" style="position: relative;left: 150px">
        日程时间：20<input id="mohu_year" type="text" name="year" style="display: inline-block;width:45px;">年
        <input type="text" id="mohu_month" name="month" style="display: inline-block;width: 45px">月&nbsp;&nbsp;
        <input type="submit" value="修删日程">
    </form>
</div>
<p align="center" style="font-size: 22px;">您的日程安排如下：</p>
<form action="date_operation!select_delete" method="post" onsubmit="return deleSelect();">
    <table cellpadding="0" border="0" align="center"  style="background: rgba(241, 253, 255, 0.6);border-radius: 5px">
        <tr>
            <td width="50" height="35"><a href="date_insert.jsp" class="button">添加</a></td>
            <td width="110" height="35">日程日期</td>
            <td width="300" height="35">日程内容</td>
            <td width="70" height="35"><button type="submit">删除</button></td>
            <td width="70" height="35"><a href="#" class="button" onclick="all_select();">全选</a></td>
        </tr>
        <s:iterator value="#session.date_info" status="st">
            <tr>
                <td width="50" height="35"><input type="checkbox" name="selectDateName" value="<s:property value="date"/>@<s:property value="thing"/>"/></td>
                <td width="110" height="35"><s:property value="date"/></td>
                <td width="300" height="35"><s:property value="thing"/></td>
                <td width="70" height="35"><a href="date_operation!delete?date.thing=<s:property value="thing"/>&date.date=<s:property value="date"/>"><img src="../img/del.png" style="width: 20px; height: 20px"/></a></td>
                <td width="70" height="35"><a class="trigger" href="javascript:;" onclick="show(${st.index+1});"><img src="../img/update.png" style="width: 20px; height: 20px"/></a></td>
            </tr>
        </s:iterator>
    </table>
</form>
<s:iterator value="#session.date_info" status="st">
    <div class="modalBox">
        <div class="overLay"></div>
        <div class="alertContent"><center>
            <h2>修改信息</h2>
            <form id="${st.index}" action="date_operation!update" method="post" >

<pre>
原日程时间：<input id="old_date${st.index}" type="date" name="old_date" value="<s:property value="date"/>" onfocus="this.blur();" style="width: 180px"/>
<input type="hidden" name="old_thing" value="<s:property value="thing"/>"  onfocus="this.blur();"style="width: 180px"/>
新日程内容：<input id="new_date${st.index}" type="date" name="date.date" value=""style="width: 180px"/>

新日程内容：<input id="new_thing${st.index}" type="text" name="date.thing" value=""style="width: 180px"/>
                    <div align="center">
<button type="button" onclick='return var_check(${st.index});'>提交</button>   <button type="button" onclick='document.getElementById(${st.index}).reset();'>重置</button>  <a class="button" onclick="reset_test(${st.index+1});">取消</a>
                    </div>
</pre>
            </form>
</pre>
        </center>
        </div>
    </div>
</s:iterator>
<script type="text/javascript">
    function show(num) {
        var modal = document.getElementsByClassName("modalBox")[num-1];
        modal.style.display = 'block';
    }
    function reset_test(num) {
        var modal = document.getElementsByClassName("modalBox")[num-1];
        modal.style.display = 'none';
    }
</script>
</body>
</html>