<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>角色管理</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if test="${fn:contains(sessionInfo.resourceList, '/roleController/editPage.action')}">
	<script type="text/javascript">
		$.canEdit = true;
	</script>
</c:if>
<c:if test="${fn:contains(sessionInfo.resourceList, '/roleController/delete.action')}">
	<script type="text/javascript">
		$.canDelete = true;
	</script>
</c:if>
<c:if test="${fn:contains(sessionInfo.resourceList, '/roleController/grantPage.action')}">
	<script type="text/javascript">
		$.canGrant = true;
	</script>
</c:if>
<script type="text/javascript">
	var treeGrid;
	$(function() {
		treeGrid = $('#treeGrid').treegrid({
			url : '${pageContext.request.contextPath}/roleController/treeGrid.action',
			idField : 'id',
			treeField : 'name',
			parentField : 'pid',
			fit : true,
			fitColumns : true,
			border : false,
			nowrap : true,
			frozenColumns : [ [ {
				title : '编号',
				field : 'id',
				width : 150,
				hidden : true
			}, {
				field : 'name',
				title : '角色名称',
				width : 150
			} ] ],
			columns : [ [ 
			/*	{field : 'seq',
				title : '排序',
				width : 40
			}, */{
				field : 'resourceIds',
				title : '拥有资源',
				width : 250,
				formatter : function(value, row) {
					if (value) {
						return row.resourceNames;
					}
					return '';
				}
			}, {
				field : 'resourceNames',
				title : '拥有资源名称',
				width : 80,
				hidden : true
			}, {
				field : 'remark',
				title : '备注',
				width : 150
			}, {
				field : 'action',
				title : '操作',
				width : 70,
				formatter : function(value, row, index) {
					var str = '';
					if ($.canEdit) {
						str += $.formatString('<img onclick="editFun(\'{0}\');" src="{1}" title="修改"/>', row.id, '${pageContext.request.contextPath}/style/images/extjs_icons/pencil.png');
					}
					str += '&nbsp;';
					if ($.canGrant) {
						str += $.formatString('<img onclick="grantFun(\'{0}\');" src="{1}" title="授权"/>', row.id, '${pageContext.request.contextPath}/style/images/extjs_icons/key.png');
					}
					str += '&nbsp;';
					//0为超管角色；3为密钥管理员角色
					if(row.id !=3)
					{
						if ($.canDelete) {
							str += $.formatString('<img onclick="deleteFun(\'{0}\');" src="{1}" title="删除"/>', row.id, '${pageContext.request.contextPath}/style/images/extjs_icons/delete.png');
						}
					}
					if(row.id==0)
					{
						str="系统用户";
					}
					return str;
				}
			} ] ],
			toolbar : '#toolbar',
			onLoadSuccess : function() {
				parent.$.messager.progress('close');

				$(this).treegrid('tooltip');
			}
		});
	});

	function deleteFun(id) {
		if (id != undefined) {
			treeGrid.treegrid('select', id);
		}
		var node = treeGrid.treegrid('getSelected');
		if (node) {
			parent.$.messager.confirm('提示', '您是否要删除当前角色？', function(b) {
				if (b) {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					$.post('${pageContext.request.contextPath}/roleController/delete.action', {
						id : node.id
					}, function(result) {
						if (result.success) {
							parent.$.messager.alert('提示', result.msg, 'info');
							treeGrid.treegrid('reload');
						}
						parent.$.messager.progress('close');
					}, 'JSON');
				}
			});
		}
	}

	function editFun(id) {
		if (id != undefined) {
			treeGrid.treegrid('select', id);
		}
		var node = treeGrid.treegrid('getSelected');
		if (node) {
			parent.$.modalDialog({
				title : '修改角色',
				width : 330,
				height : 250,
				href : '${pageContext.request.contextPath}/roleController/editPage.action?id=' + node.id,
				buttons : [ {
					text : '修改',
					handler : function() {
						parent.$.modalDialog.openner_treeGrid = treeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
						var f = parent.$.modalDialog.handler.find('#form');
						f.submit();
					}
				} ]
			});
		}
	}

	function addFun() {
		parent.$.modalDialog({
			title : '添加角色',
			width : 330,
			height : 250,
			href : '${pageContext.request.contextPath}/roleController/addPage.action',
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_treeGrid = treeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#form');
					f.submit();
				}
			} ]
		});
	}


	function grantFun(id) {
		if (id != undefined) {
			treeGrid.treegrid('select', id);
		}
		var node = treeGrid.treegrid('getSelected');
		if (node) {
			parent.$.modalDialog({
				title : '角色授权',
				width : 600,
				height : 500,
				href : '${pageContext.request.contextPath}/roleController/grantPage.action?id=' + node.id,
				buttons : [ {
					text : '授权',
					handler : function() {
						parent.$.modalDialog.openner_treeGrid = treeGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
						var f = parent.$.modalDialog.handler.find('#form');
						f.submit();
					}
				} ]
			});
		}
	}
</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
			<table id="treeGrid"></table>
		</div>
	</div>
	<div id="toolbar" style="display: none;">
		<c:if test="${fn:contains(sessionInfo.resourceList, '/roleController/addPage.action')}">
			<a onclick="addFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'edit_add'">添加</a>
		</c:if>
	</div>
</body>
</html>