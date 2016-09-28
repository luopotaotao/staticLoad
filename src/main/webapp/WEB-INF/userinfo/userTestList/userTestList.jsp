<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>

<title>测试用户管理</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/userTestListController/delete.action')}">
	<script type="text/javascript">
		$.canDelete = true;
	</script>
</c:if>
<script type="text/javascript">
	var userTestListGrid;
	$(function() {
		userTestListGrid = $("#userTestListGrid")
				.datagrid(
						{
							url : "${pageContext.request.contextPath}/userTestListController/datagrid.action",
							fit : true,
							fitColumns : true,
							border : false,
							pagination : true,
							idField : "seId",
							pageSize : 10,
							pageList : [ 10, 20, 30, 40, 50 ],
							sortName : "createTime",
							sortOrder : "desc",
							checkOnSelect : true,
							selectOnCheck : false,
							nowrap : true,
							columns : [ [
									{
                                        field : 'id',
                                        title : '用户标识',
                                        width : 150,
                                        checkbox : true
                                    },
									{
										field : 'seId',
										title : 'SE标识',
										width : 150
									},
									{
										field : 'adminName',
										title : '操作管理员',
										width : 200
									},
									{
										field : 'createTime',
										title : '创建时间',
										width : 200,
										sortable : true
									},
									{
										field : 'action',
										title : '操作',
										width : 100,
										formatter : function(value, row, index) {
											var str = '';
											if ($.canDelete) {
												str += $
														.formatString(
																'<img onclick="deleteFun(\'{0}\');" src="{1}" title="{2}"/>',
																row.seId,
																'${pageContext.request.contextPath}/style/images/extjs_icons/delete.png',
																'删除测试用户信息');
											}
											return str;
										}
									} ] ],
							toolbar : "#userTestListToolbar",
							onLoadSuccess : function() {
								parent.$.messager.progress('close');

								$(this).datagrid('tooltip');
							}

						});
	});

	function addFun() {
		parent.$
				.modalDialog({
					title : "添加测试用户",
					width : 450,
					height : 150,
					href : '${pageContext.request.contextPath}/userTestListController/addPage.action',
					buttons : [ {
						text : '添加',
						handler : function() {
							parent.$.modalDialog.opener_dataGrid = userTestListGrid;
							var f = parent.$.modalDialog.handler.find('form');
							f.submit();
						}
					} ]
				});
	}


	function deleteFun(seId) {
		userTestListGrid.datagrid('uncheckAll').datagrid('unselectAll')
				.datagrid('clearSelections');
		userTestListGrid.datagrid('checkRow', userTestListGrid.datagrid(
				'getRowIndex', seId));
		removeFun();
	}

	function removeFun() {
		var rows = userTestListGrid.datagrid('getChecked');
		var seId = [];
		if (rows.length > 0) {
			var info = "";
			for ( var i = 0; i < rows.length; i++) {
				info = info + "【" + rows[i].seId + "】";
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
										seId.push(rows[i].seId);
									}
									$
											.ajax({
												url : '${pageContext.request.contextPath}/userTestListController/delete.action',
												data : {
													ids : seId.join(',')
												},
												dataType : 'json',
												success : function(result) {
													if (result.success) {
														userTestListGrid
																.datagrid('load');
														userTestListGrid
																.datagrid(
																		'uncheckAll')
																.datagrid(
																		'unselectAll')
																.datagrid(
																		'clearSelections');
													}
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

	function importFun() {
		userTestListGrid.datagrid('uncheckAll').datagrid('unselectAll')
				.datagrid('clearSelections');
		parent.$
				.modalDialog({
					title : "导入测试用户",
					width : 520,
					height : 350,
					href : '${pageContext.request.contextPath}/userTestListController/importPage.action',
					buttons : [ {
						text : '导入',
						handler : function() {
							parent.$.modalDialog.opener_dataGrid = userTestListGrid;
							var f = parent.$.modalDialog.handler.find('form');
							f.submit();
						}
					} ]
				});
	}
	
	function userTestListSearchFun() {
       $('#userTestListGrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
        $('#userTestListGrid').datagrid('load', $.serializeObject($('#userTestListSearchForm')));
        return false;
    }
    function userTestListCleanFun() {
       $('#userTestListGrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
        $('#userTestListSearchForm input').val('');
        $('#userTestListGrid').datagrid('load', {});
    }
</script>

</head>

<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div id="userTestListToolbar" style="display: none;">

			<table>
				<tbody>
					<tr>
						<td><form id="userTestListSearchForm" method="post"
								class="form-inline">
								<input name="seId" type="text" class="easyui-textbox"
									placeholder="SE标识可模糊查询" /> <input style="display: none;"
									type="text" /> <a href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="iconCls:'zoom',plain:true"
									onclick="userTestListSearchFun();">过滤</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom_out',plain:true"
									onclick="userTestListCleanFun();">重置过滤</a>
							</form></td>
					</tr>
					<tr>
						<td><c:if
								test="${fn:contains(sessionInfo.resourceSet, '/userTestListController/addPage.action')}">
								<a onclick="addFun();" href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="plain:true,iconCls:'edit_add'">添加</a>
							</c:if> <c:if
								test="${fn:contains(sessionInfo.resourceSet, '/userTestListController/delete.action')}">
								<a onclick="removeFun();" href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="plain:true,iconCls:'delete'">批量删除</a>
							</c:if> <c:if
								test="${fn:contains(sessionInfo.resourceSet, '/userTestListController/importPage.action')}">
								<a onclick="importFun();" href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="plain:true,iconCls:'import'">批量导入</a>
							</c:if></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div data-options="region:'center',border:false" title=""
			style="overflow: hidden;">
			<table id="userTestListGrid"></table>
		</div>
	</div>

</body>
</html>
