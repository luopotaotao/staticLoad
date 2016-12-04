<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>资源管理</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if test="${fn:contains(sessionInfo.resourceSet, '/resourceController/editPage')}">
	<script type="text/javascript">
		$.canEdit = true;
	</script>
</c:if>
<c:if test="${fn:contains(sessionInfo.resourceSet, '/resourceController/delete')}">
	<script type="text/javascript">
		$.canDelete = true;
	</script>
</c:if>
<script type="text/javascript">
	var treeGrid;
	$(function() {
		treeGrid = $('#treeGrid').treegrid({
			url : '<c:url value="/resourceController/treeGrid"/>',
			idField : 'id',
			treeField : 'name',
			parentField : 'pid',
			fit : true,
			fitColumns : true,
			rownumbers : true,
			border : false,
			frozenColumns : [ [ {
				title : '编号',
				field : 'id',
				width : 150,
				hidden : true
			} ] ],
			columns : [ [ {
				field : 'name',
				title : '资源名称',
				width : 200
			}, {
				field : 'url',
				title : '资源路径',
				width : 230
			}, {
				field : 'typeId',
				title : '资源类型ID',
				width : 150,
				hidden : true
			}, {
				field : 'typeName',
				title : '资源类型',
				width : 80
			}, {
				field : 'seq',
				title : '排序',
				width : 40
			}, {
				field : 'pid',
				title : '上级资源ID',
				width : 150,
				hidden : true
			}, {
				field : 'pname',
				title : '上级资源',
				width : 80
			}, {
				field : 'remark',
				title : '备注',
				width : 150
			}, {
				field : 'action',
				title : '操作',
				width : 50,
				formatter : function(value, row, index) {
					var str = '';
					if ($.canEdit) {
						str += $.formatString('<img onclick="editFun(\'{0}\');" src="{1}" title="修改"/>', row.id, '<c:url value="/resources/style/images/extjs_icons/pencil.png"/>');
					}
					str += '&nbsp;';
					if ($.canDelete) {
						str += $.formatString('<img onclick="deleteFun(\'{0}\');" src="{1}" title="删除"/>', row.id, '<c:url value="/resources/style/images/extjs_icons/delete.png"/>');
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
			parent.$.messager.confirm('提示', '您是否要删除当前资源？', function(b) {
				if (b) {
					parent.$.messager.progress({
						title : '提示',
						text : '数据处理中，请稍后....'
					});
					$.post('<c:url value="/resourceController/delete"/>', {
						id : node.id
					}, function(result) {
						if (result.success) {
							parent.$.messager.alert('提示', result.msg, 'info');
							treeGrid.treegrid('reload');
							parent.layout_west_tree.tree('reload');
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
				title : '修改资源',
				width : 330,
				height : 400,
				href : '<c:url value="/resourceController/editPage"/>?id=' + node.id,
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
			title : '添加资源',
			width : 330,
			height : 400,
			href : '<c:url value="/resourceController/addPage"/>',
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

</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<!-- <div data-options="region:'north',border:false" title="" style="height: 80px; overflow: hidden; padding: 5px;">
			<div class="well well-small">
				<span class="badge badge-important">提示</span>
				<p style="padding-left:30px; ">
					新添资源会添加到当前用户所属的所有角色中，请注意资源的分配！
				</p>
			</div>
		</div> -->
		<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
			<table id="treeGrid"></table>
		</div>
	</div>
 <div id="toolbar" style="display: none;">
		<c:if test="${fn:contains(sessionInfo.resourceSet, '/resourceController/addPage')}">
			<a onclick="addFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'edit_add'">添加</a>
		</c:if>
	</div> 
</body>
</html>