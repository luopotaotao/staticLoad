<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>用户日志信息</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/userlogController/search.action')}">
	<script type="text/javascript">
		$.canSearch = true;
	</script>
</c:if>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/userlogController/datagrid.action',
							fit : true,
							fitColumns : true,
							border : false,
							pagination : true,
							idField : 'userLogId',
							pageSize : 10,
							pageList : [ 10, 20, 30, 40, 50 ],
							sortName : 'createTime',
							sortOrder : 'desc',
							checkOnSelect : true,
							selectOnCheck : false,
							singleSelect: true,
							nowrap : false,
							frozenColumns : [ [ {
								field : 'adminName',
								title : '管理员用户名',
								width : 140
							} ] ],
							columns : [ [
									{
										field : 'text',
										title : '操作资源名称',
										width : 200
									},

									{
										field : 'userIp',
										title : '操作资源IP',
										width : 150
									},
									{
										field : 'createTime',
										title : '操作时间',
										width : 150,
										sortable : true
									},
									{
										field : 'action',
										title : '操作',
										width : 100,
										formatter : function(value, row, index) {
											var str = '';
											if ($.canSearch) {
												str += $
														.formatString(
																'<img onclick="detailFun(\'{0}\');" src="{1}" title="{2}"/>',
																row.userLogId,
																'${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/icons/search.png',
																'查看系统操作日志信息');
											}
											return str;
										}
									} ] ],
							toolbar : "#toolbar",
							onLoadSuccess : function() {
								parent.$.messager.progress('close');
								$(this).datagrid('tooltip');
							}
						});

		$('#adminName')
				.combobox(
						{
							url : '${pageContext.request.contextPath}/userlogController/combobox.action',
							valueField : 'adminName',
							textField : 'adminName',
							editable : false,
							formatter : function(row) {
								return '<div class="item-text">'
										+ row.adminName + '</div>';
							},
							onLoadSuccess : function() {
								parent.$.messager.progress('close');
							}
						});
	});

	function detailFun(id) {
		dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
		parent.$
				.modalDialog({
					title : "系统日志详情",
					width : 520,
					height : 350,
					href : '${pageContext.request.contextPath}/userlogController/search.action?id='
							+ id
				});
	}
</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit : true,border : false">
		<div id="toolbar" style="display: none;">
			<table>
				<tbody>
					<tr>
						<td>
							<form id="searchForm" class="form-inline">
								管理员：<input name="adminName" id="adminName" value="全部"
									data-options="editable:false"maxlength="20" /> 操作时间 <input type="text"
									name="createTimeStart" id="createTimeStart" class="Wdate"
									onclick="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"
									readonly="readonly" style="width: 150px;" /> - <input
									type="text" name="createTimeEnd" class="Wdate"
									onclick="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'createTimeStart\')}'})"
									readonly="readonly" style="width: 150px;" /> <a
									href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom',plain:true"
									onclick="dataGrid.datagrid('load',$.serializeObject($('#searchForm')));dataGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">过滤</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom_out',plain:true"
									onclick="$('#searchForm input').val('');dataGrid.datagrid('load',{});dataGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">重置过滤</a>
							</form></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div data-options="region:'center',border:false">
			<table id="dataGrid"></table>
		</div>

	</div>
</body>
</html>