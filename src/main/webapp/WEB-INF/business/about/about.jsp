<%--
  Created by IntelliJ IDEA.
  User: tt
  Date: 2016/12/2
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="dlg_about" class="easyui-dialog" style="width:100%;max-width:400px;padding:30px 60px;"
     data-options="
            title: '关于平台',
            closed: true,
            modal: true,
            draggable: false,
            buttons: [{
                text: '确定',
                handler: function(){
                    $('#dlg_about').dialog('close');
                }
            }]
        ">
    <i>智能无线静载荷检测云平台</i>
    <p>测试信息测试信息</p>
    <i id="about_dept_name"></i>
    <p id="about_dept_content"></p>
</div>
</body>
</html>
