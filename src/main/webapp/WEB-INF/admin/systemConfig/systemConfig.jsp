<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>

<title>系统参数配置</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/systemConfigController/editPage.action')}">
	<script type="text/javascript">
		$.canEdit = true;
	</script>
</c:if>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/systemConfigController/delete.action')}">
	<script type="text/javascript">
		$.canDelete = true;
	</script>
</c:if>
<script type="text/javascript">
	var systemConfigGrid;
	$(function() {
		systemConfigGrid = $("#systemConfigGrid")
				.datagrid(
						{
							url : "${pageContext.request.contextPath}/systemConfigController/datagrid.action",
							fit : true,
							fitColumns : true,
							border : false,
							pagination : true,
							idField : "confId",
							pageSize : 10,
							pageList : [ 10, 20, 30, 40, 50 ],
							sortName : "confName",
							sortOrder : "desc",
							checkOnSelect : true,
							selectOnCheck : false,
							singleSelect: true,
							nowrap : true,
							columns : [ [
									{
										field : 'confName',
										title : '参数名称',
										width : 200
									},
									{
										field : 'confContext',
										title : '参数内容',
										width : 200
									},
									{
										field : 'confDesc',
										title : '参数说明',
										width : 200
									},
									{
										field : 'adminName',
										title : '操作管理员',
										width : 100
									},
									{
										field : 'action',
										title : '操作',
										width : 100,
										formatter : function(value, row, index) {
											var str = '';
											if ($.canEdit) {
												str += $
														.formatString(
																'<img onclick="editFun(\'{0}\');" src="{1}" title="{2}"/>',
																row.confId,
																'${pageContext.request.contextPath}/style/images/extjs_icons/pencil.png',
																'修改系统参数');
											}
											str += "&nbsp;";
											if ($.canDelete) {
												str += $
														.formatString(
																'<img onclick="deleteFun(\'{0}\');" src="{1}" title="{2}"/>',
																row.confId,
																'${pageContext.request.contextPath}/style/images/extjs_icons/delete.png',
																'删除系统参数');
											}
											return str;
										}
									} ] ],
							toolbar : "#systemConfigToolbar",
							onLoadSuccess : function() {
								parent.$.messager.progress('close');
								$(this).datagrid('tooltip');
							}

						});
	});

	function editFun(id) {
		systemConfigGrid.datagrid('unselectAll').datagrid('uncheckAll');
		parent.$
				.modalDialog({
					title : "修改系统参数",
					width : 600,
					height : 350,
					href : '${pageContext.request.contextPath}/systemConfigController/editPage.action?id='
							+ id,
					buttons : [ {
						text : '修改',
						handler : function() {
							parent.$.modalDialog.opener_dataGrid = systemConfigGrid;
							var f = parent.$.modalDialog.handler.find('form');
							f.submit();
						}
					} ]
				});
	}

	function removeFun() {
		var rows = systemConfigGrid.datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			var info = "";
			for ( var i = 0; i < rows.length; i++) {
				info = info + "【" + rows[i].confName + "】";
			}
			$.messager
					.confirm(
							'确认',
							'您确认要删除' + info + '吗？',
							function(r) {
								if (r) {
									parent.$.messager.progress({
										title : "提示",
										text : '数据处理中，请稍后....'
									});
									for ( var i = 0; i < rows.length; i++) {
										ids.push(rows[i].confId);
									}
									$
											.ajax({
												url : '${pageContext.request.contextPath}/systemConfigController/delete.action',
												data : {
													ids : ids.join(',')
												},
												dataType : 'json',
												success : function(result) {
													if (result.success) {
														systemConfigGrid
																.datagrid('load');
														systemConfigGrid
																.datagrid(
																		'uncheckAll')
																.datagrid(
																		'unselectAll')
																.datagrid(
																		'clearSelections');
													}
													parent.$.messager
															.progress('close');
													parent.$.messager.alert(
															"提示", result.msg,
															'info');
												}
											});
								}
							});
		} else {
			parent.$.messager.alert("提示", "请勾选要删除的记录", 'info');
		}
	}

	function deleteFun(id) {
		systemConfigGrid.datagrid('uncheckAll').datagrid('unselectAll')
				.datagrid('clearSelections');
		systemConfigGrid.datagrid('checkRow', systemConfigGrid.datagrid(
				'getRowIndex', id));
		removeFun();
	}

	function addFun() {
		parent.$
				.modalDialog({
					title : "添加系统参数",
					width : 600,
					height : 250,
					href : '${pageContext.request.contextPath}/systemConfigController/addPage.action',
					buttons : [ {
						text : '添加',
						handler : function() {
							parent.$.modalDialog.opener_dataGrid = systemConfigGrid;
							var f = parent.$.modalDialog.handler.find('form');
							f.submit();
						}
					} ]
				});
	}
</script>

</head>

<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div id="systemConfigToolbar" style="display: none;">

			<table>
				<tbody>
					<tr>
						<td>
							<form id="systemConfigSearchForm" method="post"
								class="form-inline">
								<input name="confName" type="text" class="easyui-textbox"
									placeholder="参数名称可模糊查询" maxlength="25" /> <input
									style="display: none;" type="text" /> <a
									href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom',plain:true"
									onclick="systemConfigGrid.datagrid('load',$.serializeObject($('#systemConfigSearchForm')));systemConfigGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">过滤</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom_out',plain:true"
									onclick="$('#systemConfigSearchForm input').val('');systemConfigGrid.datagrid('load',{});systemConfigGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">重置过滤</a>
							</form></td>
					</tr>
					<tr>
						<td><c:if
								test="${fn:contains(sessionInfo.resourceSet, '/systemConfigController/addPage.action')}">
								<a onclick="addFun();" href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="plain:true,iconCls:'edit_add'">添加</a>
							</c:if></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div data-options="region:'center',border:false" title=""
			style="overflow: hidden;">
			<table id="systemConfigGrid"></table>
		</div>
	</div>

</body>
</html>
