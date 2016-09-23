<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>

<title>支付宝对账信息管理</title>
<jsp:include page="/inc.jsp"></jsp:include>

<c:if
	test="${fn:contains(sessionInfo.resourceList, '/testZhifubaoController/search.action')}">
	<script type="text/javascript">
		$.canSearch = true;
	</script>
</c:if>

<script type="text/javascript">
	var testZhifubaoGrid;
	$(function() {
		testZhifubaoGrid = $("#testZhifubaoGrid")
				.datagrid(
						{
							url : "${pageContext.request.contextPath}/testZhifubaoController/datagrid.action",
							fit : true,
							fitColumns : true,
							border : false,
							pagination : true,
							idField : "orderId",
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
										field : 'orderId',
										title : '商户订单号',
										width : 150
									},
									{
										field : 'accountSerial',
										title : '账务流水号',
										width : 150
									},
									{
										field : 'businessSerial',
										title : '业务流水号',
										width : 150
									},
									{
										field : 'tradeName',
										title : '商品名称',
										width : 150
									},
									{
										field : 'createTime',
										title : '创建时间',
										width : 150,
										sortable : true
									},
									{
										field : 'transactionChannel',
										title : '交易渠道',
										width : 150,
										sortable : true
									},
									{
										field : 'businessType',
										title : '业务类型',
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
																row.orderId,
																'${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/icons/search.png',
																'支付宝对账信息详情');
											}
											return str;
										}
									} ] ],
							toolbar : "#testZhifubaoToolbar",
							onLoadSuccess : function() {
								parent.$.messager.progress('close');

								$(this).datagrid('tooltip');
							}

						});
	});

	function detailFun(orderId) {
		testZhifubaoGrid.datagrid('unselectAll').datagrid('uncheckAll');
		parent.$
				.modalDialog({
					title : "支付宝对账信息详情",
					width : 500,
					height : 450,
					href : '${pageContext.request.contextPath}/testZhifubaoController/search.action?id='
							+ orderId
				});
	}

	function importFun() {
		testZhifubaoGrid.datagrid('uncheckAll').datagrid('unselectAll')
				.datagrid('clearSelections');
		parent.$
				.modalDialog({
					title : "导入支付宝对账信息",
					width : 520,
					height : 250,
					href : '${pageContext.request.contextPath}/testZhifubaoController/importPage.action',
					buttons : [ {
						text : '导入',
						handler : function() {
							parent.$.modalDialog.opener_dataGrid = testZhifubaoGrid;
							var f = parent.$.modalDialog.handler.find('form');
							f.submit();
						}
					} ]
				});
	}

	function testZhifubaoSearchFun() {
		$('#testZhifubaoGrid').datagrid('uncheckAll').datagrid('unselectAll')
				.datagrid('clearSelections');
		$('#testZhifubaoGrid').datagrid('load',
				$.serializeObject($('#testZhifubaoSearchForm')));
		return false;
	}
	function testZhifubaoCleanFun() {
		$('#testZhifubaoGrid').datagrid('uncheckAll').datagrid('unselectAll')
				.datagrid('clearSelections');
		$('#testZhifubaoSearchForm input').val('');
		$('#testZhifubaoGrid').datagrid('load', {});
	}
</script>

</head>

<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div id="testZhifubaoToolbar" style="display: none;">

			<table>
				<tbody>
					<tr>
						<td><form id="testZhifubaoSearchForm" method="post"
								class="form-inline">
								<input name="orderId" type="text" class="easyui-textbox"
									placeholder="商户订单号可模糊查询" /> <input style="display: none;"
									type="text" /> <a href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="iconCls:'zoom',plain:true"
									onclick="testZhifubaoSearchFun();">过滤</a> <a
									href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom_out',plain:true"
									onclick="testZhifubaoCleanFun();">重置过滤</a>
							</form></td>
					</tr>
					<tr>
						<td><c:if
								test="${fn:contains(sessionInfo.resourceList, '/testZhifubaoController/importPage.action')}">
								<a onclick="importFun();" href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="plain:true,iconCls:'import'">导入</a>
							</c:if></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div data-options="region:'center',border:false" title=""
			style="overflow: hidden;">
			<table id="testZhifubaoGrid"></table>
		</div>
	</div>

</body>
</html>
