<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>

<title>优惠信息管理</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if
	test="${fn:contains(sessionInfo.resourceList, '/favorableUserController/delete.action')}">
	<script type="text/javascript">
		$.canDelete = true;
	</script>
</c:if>
<script type="text/javascript">
	var favorableuserGrid;
	$(function() {
		favorableuserGrid = $("#favorableuserGrid")
				.datagrid(
						{
							url : "${pageContext.request.contextPath}/favorableUserController/datagrid.action",
							fit : true,
							fitColumns : true,
							border : false,
							pagination : true,
							idField : "id",
							pageSize : 10,
							pageList : [ 10, 20, 30, 40, 50 ],
							sortName : "createTime",
							sortOrder : "desc",
							checkOnSelect : true,
							selectOnCheck : false,
							singleSelect: true,
							nowrap : true,
							columns : [ [
									{
										field : 'seid',
										title : 'SEID',
										width : 200
									},
									{
										field : 'favouableName',
										title : '优惠名称',
										width : 200
									},
									{
										field : 'appName',
										title : '应用名称',
										width : 200
									},
									{
										field : 'remainTimes',
										title : '剩余使用次数',
										width : 200
									},
									{
										field : 'createTime',
										title : '创建时间',
										width : 200
									},
									{
										field : 'adminName',
										title : '操作管理员',
										width : 200
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
																'<img onclick="deleteFun(\'{0}\',\'{1}\',\'{2}\');" src="{3}" title="{4}"/>',
																row.favouableId,
																row.seid,
																row.appletId,
																'${pageContext.request.contextPath}/style/images/extjs_icons/delete.png',
																'删除优惠用户信息');
											}
											return str;
										}
									} ] ],
							toolbar : "#favouableuserToolbar",
							onLoadSuccess : function() {
								parent.$.messager.progress('close');
								$(this).datagrid('tooltip');
							}

						});
	});

	function deleteFun(favouableId, seid, appletId) {
		$.messager
				.confirm(
						'确认',
						'您确认要删除选中的信息吗？',
						function(r) {
							if (r) {
								parent.$.messager.progress({
									title : "提示",
									text : '数据处理中，请稍后....'
								});
								$
										.ajax({
											url : '${pageContext.request.contextPath}/favorableUserController/delete.action',
											data : {
												seid : seid,
												appletId : appletId,
												favouableId : favouableId
											},
											dataType : 'json',
											success : function(result) {
												if (result.success) {
													favorableuserGrid
															.datagrid('load');
												}
												parent.$.messager
														.progress('close');
												parent.$.messager.alert("提示",
														result.msg, 'info');
											}
										});
							}
						});

	}

	function addFun() {
		parent.$
				.modalDialog({
					title : "添加优惠用户信息",
					width : 480,
					height : 350,
					href : '${pageContext.request.contextPath}/favorableUserController/addPage.action',
					buttons : [ {
						text : '添加',
						handler : function() {
							parent.$.modalDialog.opener_dataGrid = favorableuserGrid;
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
		<div id="favouableuserToolbar" style="display: none;">

			<table>
				<tbody>
					<tr>
						<td>
							<form id="favouableuserSearchForm" method="post"
								class="form-inline">
								<input name="seid" type="text" class="easyui-textbox"
									placeholder="SEID可模糊查询" maxlength="20" /><input
                                    style="display: none;" type="text" />  <a
									href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom',plain:true"
									onclick="favorableuserGrid.datagrid('load',$.serializeObject($('#favouableuserSearchForm')));favorableuserGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">过滤</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom_out',plain:true"
									onclick="$('#favouableuserSearchForm input').val('');favorableuserGrid.datagrid('load',{});favorableuserGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">重置过滤</a>
							</form>
						</td>
					</tr>
					<tr>
						<td><c:if
								test="${fn:contains(sessionInfo.resourceList, '/favorableUserController/addPage.action')}">
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
			<table id="favorableuserGrid"></table>
		</div>
	</div>

</body>
</html>
