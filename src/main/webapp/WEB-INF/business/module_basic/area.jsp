<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>模板支撑智能安全监测系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/laserCoreCss.css">
    <link id="easyuiTheme" rel="stylesheet"
          href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/default/easyui.css" type="text/css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript"
            charset="utf-8"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/jquery.easyui.min.js"
            charset="utf-8"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"
            charset="utf-8"></script>

</head>
<body style="width:100%">

<div class="easyui-panel" style="padding:5px;width: 500px;height: 500px">
    <ul id="tt" class="easyui-tree" data-options="url:'${pageContext.request.contextPath}/moduleBasicAreaController/query/1.action',method:'get',animate:true,dnd:false,
				onDblClick: function(node){
					$(this).tree('beginEdit',node.target);
				},
				onContextMenu: function(e,node){
					e.preventDefault();
					$(this).tree('select',node.target);
					$('#mm').menu('show',{
						left: e.pageX,
						top: e.pageY
					});
				}"></ul>
</div>
<div id="mm" class="easyui-menu" style="width:120px;">
    <div onclick="append()" data-options="iconCls:'icon-add'">Append</div>
    <div onclick="removeit()" data-options="iconCls:'icon-remove'">Remove</div>
    <div class="menu-sep"></div>
    <div onclick="expand()">Expand</div>
    <div onclick="collapse()">Collapse</div>
</div>
<script type="text/javascript">
    function append() {
        var t = $('#tt');
        var node = t.tree('getSelected');
        t.tree('append', {
            parent: (node ? node.target : null),
            data: [{
                text: 'new item1'
            }, {
                text: 'new item2'
            }]
        });
    }
    function removeit() {
        var node = $('#tt').tree('getSelected');
        $('#tt').tree('remove', node.target);
    }
    function collapse() {
        var node = $('#tt').tree('getSelected');
        $('#tt').tree('collapse', node.target);
    }
    function expand() {
        var node = $('#tt').tree('getSelected');
        $('#tt').tree('expand', node.target);
    }
    function confirm(callback){
        $.
    }
</script>
</body>
</html>