<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>

<title>用户黑名单信息管理</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if
	test="${fn:contains(sessionInfo.resourceList, '/userBlackListController/delete.action')}">
	<script type="text/javascript">
		$.canDelete = true;
	</script>
</c:if>
<script type="text/javascript">
	var userBlackListGrid;
	$(function() {
		userBlackListGrid = $("#userBlackListGrid")
				.datagrid(
						{
							url : "${pageContext.request.contextPath}/userBlackListController/datagrid.action",
							fit : true,
							fitColumns : true,
							border : false,
							pagination : true,
							idField : "userId",
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
										field : 'userId',
										title : '用户标识',
										width : 150
									},
									{
										field : 'idTypeStr',
										title : '标识类型',
										width : 250
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
																row.userId,
																'${pageContext.request.contextPath}/style/images/extjs_icons/delete.png',
																'删除用户黑名单信息');
											}
											return str;
										}
									} ] ],
							toolbar : "#userBlackListToolbar",
							onLoadSuccess : function() {
								parent.$.messager.progress('close');

								$(this).datagrid('tooltip');
							}

						});
	});

	function addFun() {
		parent.$
				.modalDialog({
					title : "添加用户黑名单信息",
					width : 520,
					height : 250,
					href : '${pageContext.request.contextPath}/userBlackListController/addPage.action',
					buttons : [ {
						text : '添加',
						handler : function() {
							parent.$.modalDialog.opener_dataGrid = userBlackListGrid;
							var f = parent.$.modalDialog.handler.find('form');
							f.submit();
						}
					} ]
				});
	}


	function deleteFun(userId) {
		userBlackListGrid.datagrid('uncheckAll').datagrid('unselectAll')
				.datagrid('clearSelections');
		userBlackListGrid.datagrid('checkRow', userBlackListGrid.datagrid(
				'getRowIndex', userId));
		removeFun();
	}

	function removeFun() {
		var rows = userBlackListGrid.datagrid('getChecked');
		var userId = [];
		if (rows.length > 0) {
			var info = "";
			for ( var i = 0; i < rows.length; i++) {
				info = info + "【" + rows[i].userId + "】";
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
										userId.push(rows[i].userId);
									}
									$
											.ajax({
												url : '${pageContext.request.contextPath}/userBlackListController/delete.action',
												data : {
													ids : userId.join(',')
												},
												dataType : 'json',
												success : function(result) {
													if (result.success) {
														userBlackListGrid
																.datagrid('load');
														userBlackListGrid
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
		userBlackListGrid.datagrid('uncheckAll').datagrid('unselectAll')
				.datagrid('clearSelections');
		parent.$
				.modalDialog({
					title : "导入用户黑名单信息",
					width : 520,
					height : 350,
					href : '${pageContext.request.contextPath}/userBlackListController/importPage.action',
					buttons : [ {
						text : '导入',
						handler : function() {
							parent.$.modalDialog.opener_dataGrid = userBlackListGrid;
							var f = parent.$.modalDialog.handler.find('form');
							f.submit();
						}
					} ]
				});
	}
	
	function userBlackListSearchFun() {
       $('#userBlackListGrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
        $('#userBlackListGrid').datagrid('load', $.serializeObject($('#userBlackListSearchForm')));
        return false;
    }
    function userBlackListCleanFun() {
       $('#userBlackListGrid').datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
        $('#userBlackListSearchForm input').val('');
        $('#userBlackListGrid').datagrid('load', {});
    }
</script>

</head>

<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div id="userBlackListToolbar" style="display: none;">

			<table>
				<tbody>
					<tr>
						<td><form id="userBlackListSearchForm" method="post"
								class="form-inline">
								<input name="userId" type="text" class="easyui-textbox"
									placeholder="用户标识可模糊查询" /> <input style="display: none;"
									type="text" /> <a href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="iconCls:'zoom',plain:true"
									onclick="userBlackListSearchFun();">过滤</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom_out',plain:true"
									onclick="userBlackListCleanFun();">重置过滤</a>
							</form></td>
					</tr>
					<tr>
						<td><c:if
								test="${fn:contains(sessionInfo.resourceList, '/userBlackListController/addPage.action')}">
								<a onclick="addFun();" href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="plain:true,iconCls:'edit_add'">添加</a>
							</c:if> <c:if
								test="${fn:contains(sessionInfo.resourceList, '/userBlackListController/delete.action')}">
								<a onclick="removeFun();" href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="plain:true,iconCls:'delete'">批量删除</a>
							</c:if> <c:if
								test="${fn:contains(sessionInfo.resourceList, '/userBlackListController/importPage.action')}">
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
			<table id="userBlackListGrid"></table>
		</div>
	</div>

</body>
</html>
