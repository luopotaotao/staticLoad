<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>

<title>用户信息</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/userInfoController/searchPage')}">
	<script type="text/javascript">
		$.canSearch = true;
	</script>
</c:if>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/userAppletInfoController/searchPage')}">
	<script type="text/javascript">
		$.canSearchApp = true;
	</script>
</c:if>

<script type="text/javascript">
	var userInfoGrid;
	$(function() {
		userInfoGrid = $("#userInfoGrid")
				.datagrid(
						{
							url : "${pageContext.request.contextPath}/userInfoController/datagrid",
							fit : true,
							fitColumns : true,
							border : false,
							pagination : true,
							idField : "seid",
							pageSize : 10,
							pageList : [ 10, 20, 30, 40, 50 ],
							sortName : "updateTime",
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
										field : 'seTsmId',
										title : 'SE发行方标识',
										width : 100
									},
									{
										field : 'deviceTypeStr',
										title : '设备类型',
										width : 100
									},
									{
										field : 'phoneTypeStr',
										title : '手机类型',
										width : 100
									},

									{
										field : 'isChanageCardStr',
										title : '是否换卡',
										width : 100
									},
									{
										field : 'updateTime',
										title : '更新时间',
										width : 120,
										sortable : true
									},
									{
										field : 'action',
										title : '操作',
										width : 80,
										formatter : function(value, row, index) {
											var str = '';
											str += "&nbsp;";
											if ($.canSearch) {
												str += $
														.formatString(
																'<img onclick="searchFun(\'{0}\', \'{1}\');" src="{2}" title="{3}"/>',
																row.seid,
																row.seTsmId,
																'<c:url value="/resources/style/images/extjs_icons/search.png"/>',
																'查看应用详情');
											}
											return str;
										}
									} ] ],
							toolbar : "#userInfoToolbar",
							view : detailview,
							detailFormatter : function(rowIndex, rowData) {
								return '<div style="padding:8px 2px 8px 2px"><table id="dddv-' + rowIndex + '"></table></div>';
							},
							onExpandRow : function(rowIndex, rowData) {
								$('#dddv-' + rowIndex)
										.datagrid(
												{
													url : '${pageContext.request.contextPath}/userAppletInfoController/datagrid.action?seid='
															+ rowData.seid
															+ '&seTsmId='
															+ rowData.seTsmId,
													fitColumns : true,
													idField : "instanceAid",
													singleSelect : true,
													checkOnSelect : true,
													selectOnCheck : false,
													loadMsg : '',
													height : 'auto',
													columns : [ [
															{
																field : 'instanceAid',
																title : "应用/安全域AID",
																width : 220
															},
															{
																field : 'appTypeStr',
																title : "应用类型",
																width : 120
															},
															{
																field : 'appletStatusStr',
																title : "应用/安全域状态",
																width : 120
															},
															{
																field : 'busiStatusStr',
																title : "业务状态",
																width : 120
															},
															{
																field : 'updateTime',
																title : "更新时间",
																width : 120
															},
															{
																field : 'action',
																title : "操作",
																width : 80,
																formatter : function(
																		value,
																		row,
																		index) {
																	var str = "";
																	str += "&nbsp;";
																	if ($.canSearchApp) {

																		str += $
																				.formatString(
																						'<img onclick="searchAppFun(\'{0}\',\'{1}\',\'{2}\');" src="{3}" title="{4}"/>',
																						row.seid,
																						row.seTsmId,
																						row.instanceAid,
																						'<c:url value="/resources/style/images/extjs_icons/search.png"/>',
																						'查看应用版本信息');
																	}
																	return str;
																}
															} ] ],
													onResize : function() {
														$('#userInfoGrid')
																.datagrid(
																		'fixDetailRowHeight',
																		rowIndex);
													},
													onLoadSuccess : function() {
														parent.$.messager
																.progress('close');
														setTimeout(
																function() {
																	$(
																			'#userInfoGrid')
																			.datagrid(
																					'fixDetailRowHeight',
																					rowIndex);
																}, 0);
														$(this).datagrid(
																'tooltip');
													}
												});
								$('#userInfoGrid').datagrid(
										'fixDetailRowHeight', rowIndex);
							},

							onLoadSuccess : function() {
								parent.$.messager.progress('close');
								$(this).datagrid('tooltip');
							}

						});
	});

	function searchFun(seid, seTsmId) {
		userInfoGrid.datagrid('unselectAll').datagrid('uncheckAll');
		parent.$
				.modalDialog({
					title : "查看详情",
					width : 820,
					height : 420,
					href : '${pageContext.request.contextPath}/userInfoController/searchPage.action?seid='
							+ seid + '&seTsmId=' + seTsmId,

				});
	}

	function searchAppFun(seid, seTsmId, instanceAid) {
		userInfoGrid.datagrid('unselectAll').datagrid('uncheckAll');
		parent.$
				.modalDialog({
					title : "查看详情",
					width : 550,
					height : 350,
					href : '${pageContext.request.contextPath}/userAppletInfoController/searchPage.action?seid='
							+ seid
							+ '&seTsmId='
							+ seTsmId
							+ '&instanceAid='
							+ instanceAid

				});
	}
</script>

</head>

<body>
	<div class="easyui-layout" data-options="fit:true,border:false">

		<div id="userInfoToolbar" style="display: none;">
			<table>
				<tbody>
					<tr>
						<td>
							<form id="userInfoSearchForm" method="post" class="form-inline">
								<input name="seid" type="text" class="easyui-textbox"
									placeholder="SEID可模糊查询" /> <input style="display: none;"
									type="text" /><a href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="iconCls:'zoom',plain:true"
									onclick="userInfoGrid.datagrid('load',$.serializeObject($('#userInfoSearchForm')));userInfoGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">过滤</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom_out',plain:true"
									onclick="$('#userInfoSearchForm input').val('');userInfoGrid.datagrid('load',{});userInfoGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">重置过滤</a>
							</form>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div data-options="region:'center',border:false" title=""
			style="overflow: hidden;">
			<table id="userInfoGrid"></table>
		</div>

	</div>

</body>
</html>
