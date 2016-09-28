<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>

<title>业务发布信息管理</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/busiFavorableController/editPage.action')}">
	<script type="text/javascript">
		$.canEdit = true;
	</script>
</c:if>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/busiFavorableController/delete.action')}">
	<script type="text/javascript">
		$.canDelete = true;
	</script>
</c:if>
<script type="text/javascript">
	var busiFavorableGrid;
	$(function() {
		busiFavorableGrid = $("#busiFavorableGrid")
				.datagrid(
						{
							url : "${pageContext.request.contextPath}/busiFavorableController/datagrid.action",
							fit : true,
							fitColumns : true,
							border : false,
							pagination : true,
							idField : "bfId",
							pageSize : 10,
							pageList : [ 10, 20, 30, 40, 50 ],
							sortName : "updateTime",
							sortOrder : "desc",
							checkOnSelect : true,
							selectOnCheck : false,
							singleSelect: true,
							nowrap : true,
							columns : [ [
									/* {
										field : 'bfId',
										title : '优惠标识',
										width : 150
									}, */
									{
										field : 'appName',
										title : '应用名称',
										width : 150
									},
									{
                                        field : 'seTsmName',
                                        title : 'SE发行方名称',
                                        width : 150
                                    },
									/* {
										field : 'favouableCode',
										title : '优惠CODE',
										width : 150
									},  */
									{
										field : 'favouableName',
										title : '优惠名称',
										width : 120
									},
									/* {
										field : 'pastFlgStr',
										title : '过期标志',
										width : 100
									}, */
									{
										field : 'targetUserFalgStr',
										title : '用户对象标识',
										width : 100
									},
									{
										field : 'busiFavouableTypeStr',
										title : '业务优惠类型',
										width : 100
									},
									{
										field : 'adminName',
										title : '操作管理员',
										width : 120
									},
									{
										field : 'updateTime',
										title : '修改时间',
										width : 170
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
																row.bfId,
																'${pageContext.request.contextPath}/style/images/extjs_icons/pencil.png',
																'修改业务优惠关联信息');
											}
											str += "&nbsp;";
											if ($.canDelete) {
												str += $
														.formatString(
																'<img onclick="deleteFun(\'{0}\');" src="{1}" title="{2}"/>',
																row.bfId,
																'${pageContext.request.contextPath}/style/images/extjs_icons/delete.png',
																'删除业务优惠关联信息');
											}
											return str;
										}
									} ] ],
							toolbar : "#busiFavorableToolbar",
							onLoadSuccess : function() {
								parent.$.messager.progress('close');
								$(this).datagrid('tooltip');
							}

						});
	});

	function editFun(id) {
		busiFavorableGrid.datagrid('unselectAll').datagrid('uncheckAll');
		parent.$
				.modalDialog({
					title : "修改业务优惠关联信息",
					width : 500,
					height : 250,
					href : '${pageContext.request.contextPath}/busiFavorableController/editPage.action?id='
							+ id,
					buttons : [ {
						text : '修改',
						handler : function() {
							parent.$.modalDialog.opener_dataGrid = busiFavorableGrid;
							var f = parent.$.modalDialog.handler.find('form');
							f.submit();
						}
					} ]
				});
	}

	function deleteFun(id) {
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
											url : '${pageContext.request.contextPath}/busiFavorableController/delete.action',
											data : {
												id : id
											},
											dataType : 'json',
											success : function(result) {
												if (result.success) {
													busiFavorableGrid
															.datagrid('load');
													busiFavorableGrid
															.datagrid(
																	'uncheckAll')
															.datagrid(
																	'unselectAll')
															.datagrid(
																	'clearSelections');
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
					title : "添加业务优惠关联信息",
					width : 500,
					height : 250,
					href : '${pageContext.request.contextPath}/busiFavorableController/addPage.action',
					buttons : [ {
						text : '添加',
						handler : function() {
							parent.$.modalDialog.opener_dataGrid = busiFavorableGrid;
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
		<div id="busiFavorableToolbar" style="display: none;">

			<table>
				<tbody>
					<!-- <tr>
						<td>
							<form id="busiFavorableSearchForm" method="post"
								class="form-inline">
								<input name="bfId" type="text" class="easyui-textbox"
									placeholder="优惠标识可模糊查询" /> <input style="display: none;"
									type="text" /> <a href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="iconCls:'zoom',plain:true"
									onclick="busiFavorableGrid.datagrid('load',$.serializeObject($('#busiFavorableSearchForm')));">过滤</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom_out',plain:true"
									onclick="$('#busiFavorableSearchForm input').val('');busiFavorableGrid.datagrid('load',{});">重置过滤</a>
							</form></td>
					</tr> -->
					<tr>
						<td><c:if
								test="${fn:contains(sessionInfo.resourceSet, '/busiFavorableController/addPage.action')}">
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
			<table id="busiFavorableGrid"></table>
		</div>
	</div>

</body>
</html>
