<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>

<title>优惠信息管理</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/favorableController/editPage.action')}">
	<script type="text/javascript">
		$.canEdit = true;
	</script>
</c:if>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/favorableController/delete.action')}">
	<script type="text/javascript">
		$.canDelete = true;
	</script>
</c:if>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/favorableController/search.action')}">
	<script type="text/javascript">
        $.canSearch = true;
    </script>
</c:if>
<script type="text/javascript">
	var favorableGrid;
	$(function() {
		favorableGrid = $("#favorableGrid")
				.datagrid(
						{
							url : "${pageContext.request.contextPath}/favorableController/datagrid.action",
							fit : true,
							fitColumns : true,
							border : false,
							pagination : true,
							idField : "favouableId",
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
										field : 'favouableName',
										title : '优惠名称',
										width : 180
									},
									{
										field : 'favouableTypeStr',
										title : '优惠类型',
										width : 180
									},
									{
										field : 'favouableContent',
										title : '优惠内容',
										width : 180
									},
									{
                                        field : 'favouableThreshold',
                                        title : '优惠阈值',
                                        width : 180
                                    },
                                    {
                                        field : 'moneyTypeStr',
                                        title : '最低金额类型',
                                        width : 180
                                    },
									/*{
										field : 'favouableDesc',
										title : '优惠描述',
										width : 200
									},*/
									{
										field : 'startTime',
										title : '优惠开始时间',
										width : 200
									},
									{
										field : 'endTime',
										title : '优惠截止时间',
										width : 200
									},
									/* {
										field : 'pastFlgStr',
										title : '过期标识',
										width : 200
									},
									{
										field : 'adminName',
										title : '操作管理员',
										width : 200
									},
									{
										field : 'createTime',
										title : '创建时间',
										width : 200
									}, */
									/* {
										field : 'updateTime',
										title : '更新时间',
										width : 200
									}, */
									{
										field : 'action',
										title : '操作',
										width : 120,
										formatter : function(value, row, index) {
											var str = '';
											if ($.canEdit) {
												str += $
														.formatString(
																'<img onclick="editFun(\'{0}\');" src="{1}" title="{2}"/>',
																row.favouableId,
																'${pageContext.request.contextPath}/style/images/extjs_icons/pencil.png',
																'修改优惠信息');
											}
											str += "&nbsp;";
											if ($.canDelete) {
												str += $
														.formatString(
																'<img onclick="deleteFun(\'{0}\');" src="{1}" title="{2}"/>',
																row.favouableId,
																'${pageContext.request.contextPath}/style/images/extjs_icons/delete.png',
																'删除优惠信息');
											}
											str += "&nbsp;";
                                            if ($.canSearch) {
                                                str += $
                                                        .formatString(
                                                                '<img onclick="searchFun(\'{0}\');" src="{1}" title="{2}"/>',
                                                                row.favouableId,
                                                                '${pageContext.request.contextPath}/style/images/extjs_icons/search.png',
                                                                '查看优惠信息');
                                            }
											return str;
										}
									} ] ],
							toolbar : "#favouableToolbar",
							onLoadSuccess : function() {
								parent.$.messager.progress('close');
								$(this).datagrid('tooltip');
							}

						});
	});

	function editFun(id) {
		favorableGrid.datagrid('unselectAll').datagrid('uncheckAll');
		parent.$
				.modalDialog({
					title : "修改优惠信息",
					width : 480,
					height : 400,
					href : '${pageContext.request.contextPath}/favorableController/editPage.action?id='
							+ id,
					buttons : [ {
						text : '修改',
						handler : function() {
							parent.$.modalDialog.opener_dataGrid = favorableGrid;
							var f = parent.$.modalDialog.handler.find('form');
							f.submit();
						}
					} ]
				});
	}
	function searchFun(id) {
        favorableGrid.datagrid('unselectAll').datagrid('uncheckAll');
        parent.$
                .modalDialog({
                    title : "查看优惠信息",
                    width : 480,
                    height : 430,
                    href : '${pageContext.request.contextPath}/favorableController/search.action?id='
                            + id
                });
    }

	function removeFun() {
		var rows = favorableGrid.datagrid('getChecked');
		var favouableId = [];
		if (rows.length > 0) {
			var info = "选中的信息";
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
										favouableId.push(rows[i].favouableId);
									}
									$
											.ajax({
												url : '${pageContext.request.contextPath}/favorableController/delete.action',
												data : {
													id : favouableId.join(',')
												},
												dataType : 'json',
												success : function(result) {
													if (result.success) {
														favorableGrid
																.datagrid('load');
														favorableGrid
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
		favorableGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid(
				'clearSelections');
		favorableGrid.datagrid('checkRow', favorableGrid.datagrid(
				'getRowIndex', id));
		removeFun();
	}

	function addFun() {
		parent.$
				.modalDialog({
					title : "添加优惠信息",
					width : 480,
					height : 400,
					href : '${pageContext.request.contextPath}/favorableController/addPage.action',
					buttons : [ {
						text : '添加',
						handler : function() {
							parent.$.modalDialog.opener_dataGrid = favorableGrid;
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
		<div id="favouableToolbar" style="display: none;">

			<table>
				<tbody>
					<tr>
						<td>
							<form id="favouableSearchForm" method="post" class="form-inline">
								<input name="favouableName" type="text" class="easyui-textbox"
									placeholder="优惠名称可模糊查询" maxlength="10" /> <input
									style="display: none;" type="text" /> <a
									href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom',plain:true"
									onclick="favorableGrid.datagrid('load',$.serializeObject($('#favouableSearchForm')));favorableGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">过滤</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom_out',plain:true"
									onclick="$('#favouableSearchForm input').val('');favorableGrid.datagrid('load',{});favorableGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">重置过滤</a>
							</form></td>
					</tr>
					<tr>
						<td><c:if
								test="${fn:contains(sessionInfo.resourceSet, '/favorableController/addPage.action')}">
								<a onclick="addFun();" href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="plain:true,iconCls:'edit_add'">添加</a>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div data-options="region:'center',border:false" title=""
			style="overflow: hidden;">
			<table id="favorableGrid"></table>
		</div>
	</div>

</body>
</html>
