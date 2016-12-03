<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>用户管理</title>
<jsp:include page="/inc.jsp"></jsp:include>

<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/userController/delete')}">
	<script type="text/javascript">
		$.canDelete = true;
	</script>
</c:if>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/userController/editPage')}">
	<script type="text/javascript">
		$.canEditUser = true;
	</script>
</c:if>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/userController/resetPwd')}">
	<script type="text/javascript">
		$.canEditPwd = true;
	</script>
</c:if>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/userController/dataGrid',
							fit : true,
							fitColumns : true,
							border : false,
							pagination : true,
							idField : 'id',
							pageSize : 10,
							pageList : [ 10, 20, 30, 40, 50 ],
							sortName : 'name',
							sortOrder : 'desc',
							checkOnSelect : true,
							selectOnCheck : true,
							singleSelect: true,
							nowrap : false,
							frozenColumns : [ [ {
								field : 'id',
								title : '编号',
								width : 150,
								hidden : true
							}, {
								field : 'name',
								title : '用户名',
								width : 80
							} ] ],
							columns : [ [
									{
										field : 'roleNames',
										title : '所属角色名称',
										width : 150
									},
									{
										field : 'createdatetime',
										title : '创建时间',
										width : 150,
										sortable : true
									},
									{
										field : 'lockSymbol',
										title : '状态',
										width : 150,
										sortable : true,
										formatter : function(value) {
											if (value == 0) {
												return '未锁定';
											} else if (value == 1) {
												return '已锁定';
											} else
												return value;
										}
									},
									{
										field : 'modifydatetime',
										title : '最后修改时间',
										width : 150,
										sortable : true
									},
									{
										field : 'validdatetime',
										title : '密码有效期',
										width : 150,
										sortable : true,
										formatter : function(value, row, index) {
											if (value == null || value == '') {
												return '无期限';
											} else {
												return value;
											}
										}
									},
									{
										field : 'action',
										title : '操作',
										width : 100,
										formatter : function(value, row, index) {
											var str = '';

											if ($.canEditUser) {
												str += $
														.formatString(
																'<img onclick="editFun(\'{0}\');" src="{1}" title="授权"/>',
																row.id,
																'<c:url value="/resources/style/images/extjs_icons/key.png"/>');
											}
											str += '&nbsp;';
											if ($.canEditPwd) {
												str += $
														.formatString(
																'<img onclick="editPwdFun(\'{0}\');" src="{1}" title="重置密码"/>',
																row.id,
																'<c:url value="/resources/style/images/extjs_icons/lock/lock_edit.png"/>');
											}
											str += '&nbsp;';
											if ($.canDelete) {
												str += $
														.formatString(
																'<img onclick="deleteFun(\'{0}\');" src="{1}" title="删除"/>',
																row.id,
																'<c:url value="/resources/style/images/extjs_icons/delete.png"/>');
											}
											if(row.id==0){
												str="系统用户";				
											}

											return str;
										}
									} ] ],
							toolbar : '#toolbar',
							onLoadSuccess : function() {
								$('#searchForm table').show();
								parent.$.messager.progress('close');
								$(this).datagrid('tooltip');
							}
						});
	});

	function editPwdFun(id) {
		/*dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
		parent.$
				.modalDialog({
					title : '修改用户密码',
					width : 350,
					height : 220,
					href : '${pageContext.request.contextPath}/userController/editPwdPage?id='
							+ id,
					buttons : [ {
						text : '修改',
						handler : function() {
							parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler.find('#form');
							f.submit();
						}
					} ]
				});*/
		parent.$.messager
                .confirm(
                        '提示',
                        '您是否要重置该用户密码？',
                        function(b) {
                            if (b) {
                                    parent.$.messager.progress({
                                        title : '提示',
                                        text : '数据处理中，请稍后....'
                                    });
                                    $
                                            .post(
                                                    '${pageContext.request.contextPath}/userController/resetPwd',
                                                    {
                                                        id : id
                                                    },
                                                    function(result) {
                                                        if (result.success) {
                                                            parent.$.messager
                                                                    .alert(
                                                                            '提示',
                                                                            result.msg,
                                                                            'info');
                                                        }else{
                                                          parent.$.messager.alert('错误',
                                                          result.msg, 'error');
                                                        }
                                                        parent.$.messager
                                                                .progress('close');
                                                    }, 'JSON');
                            }
                        });
		
	}

	function deleteFun(id) {
		if (id == undefined) {//点击右键菜单才会触发这个
			var rows = dataGrid.datagrid('getSelections');
			id = rows[0].id;
		} else {//点击操作里面的删除图标会触发这个
			dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
		}
		parent.$.messager
				.confirm(
						'提示',
						'您是否要删除当前用户？',
						function(b) {
							if (b) {
								var currentUserId = '${sessionInfo.id}';/*当前登录用户的ID*/
								if (currentUserId != id) {
									parent.$.messager.progress({
										title : '提示',
										text : '数据处理中，请稍后....'
									});
									$
											.post(
													'${pageContext.request.contextPath}/userController/delete',
													{
														id : id
													},
													function(result) {
														if (result.success) {
															parent.$.messager
																	.alert(
																			'提示',
																			result.msg,
																			'info');
															dataGrid
																	.datagrid('reload');
														}
														parent.$.messager
																.progress('close');
													}, 'JSON');
								} else {
									parent.$.messager.alert("提示", "不可以删除自己！", 'info');
								}
							}
						});
	}

	function batchDeleteFun() {
		var rows = dataGrid.datagrid('getChecked');
		var ids = [];
		if (rows.length > 0) {
			parent.$.messager
					.confirm(
							'确认',
							'您是否要删除当前选中的项目？',
							function(r) {
								if (r) {
									parent.$.messager.progress({
										title : '提示',
										text : '数据处理中，请稍后....'
									});
									var currentUserId = '${sessionInfo.id}';/*当前登录用户的ID*/
									var flag = false;
									var flag1 = false;
									for ( var i = 0; i < rows.length; i++) {
										if (currentUserId != rows[i].id) {
										    if(rows[i].id!=0){
											   ids.push(rows[i].id);
											}else{
											     flag1 = true;
											   }
										} else {
											flag = true;
										}
									}
									$
											.post(
													'${pageContext.request.contextPath}/userController/batchDelete',
													{
														ids : ids.join(',')
													},
													function(result) {
														if (result.success) {
															dataGrid
																	.datagrid('load');
															dataGrid
																	.datagrid(
																			'uncheckAll')
																	.datagrid(
																			'unselectAll')
																	.datagrid(
																			'clearSelections');
														}
														if (flag) {
														    parent.$.messager.alert("提示", "不可以删除自己！", 'info');														
														}
														else if (flag1) {
														    parent.$.messager.alert("提示", "不可以删除系统管理员！", 'info');														
														}  
														else {
															parent.$.messager
																	.alert(
																			'提示',
																			result.msg,
																			'info');
														}
														parent.$.messager
																.progress('close');
													}, 'json');
								}
							});
		} else {
			parent.$.messager.alert("提示", "请勾选要删除的记录", 'info');
		}
	}

	function addFun() {
		parent.$.modalDialog({
			title : '添加用户',
			width : 370,
			height : 220,
			href : '${pageContext.request.contextPath}/userController/addPage',
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#form');
					f.submit();
				}
			} ]
		});
	}

	function batchGrantFun() {
		var rows = dataGrid.datagrid('getChecked');
		var ids = [];
		for ( var i = 0; i < rows.length; i++) {
		        ids.push(rows[i].id);
			    if(rows[i].id==0){			   
			        parent.$.messager.alert("提示", "不可以给系统管理员授权", 'info');		
			        return;        
			    }
		}		
		if (rows.length > 0) {			
			   parent.$
					.modalDialog({
						title : '用户授权',
						width : 300,
						height : 200,
						href : '${pageContext.request.contextPath}/userController/grantPage.action?ids='
								+ ids.join(','),
						buttons : [ {
							text : '授权',
							handler : function() {
							  
								parent.$.modalDialog.openner_dataGrid = dataGrid;//因为授权成功之后，需要刷新这个dataGrid，所以先预定义好
								var f = parent.$.modalDialog.handler
										.find('#form');
								f.submit();								
							}
						} ]
					});
		 } else {
			   parent.$.messager.alert("提示", "请勾选要授权的记录", 'info');
	     }
	 
		
	}

	function editFun(id) {
		dataGrid.datagrid('unselectAll').datagrid('uncheckAll');
		parent.$
				.modalDialog({
					title : '修改用户',
					width : 370,
					height : 320,
					href : '${pageContext.request.contextPath}/userController/editPage.action?id='
							+ id,
					buttons : [ {
						text : '修改',
						handler : function() {
							parent.$.modalDialog.openner_dataGrid = dataGrid;//因为修改用户成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler.find('#form');
							f.submit();
						}
					} ]
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
								<input type="text" class="easyui-textbox" name="name"
									placeholder="用户名" maxlength="20"/> 创建时间 <input type="text"
									name="createdatetimeStart" class="Wdate"
									onclick="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd HH:mm:ss'})"
									readonly="readonly" style="width: 150px;" /> - <input
									type="text" name="createdatetimeEnd" class="Wdate"
									onclick="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd HH:mm:ss'})"
									readonly="readonly" style="width: 150px;" /> <a
									href="javascript:searchFun();" class="easyui-linkbutton"
									data-options="iconCls:'zoom',plain:true"
									onclick="dataGrid.datagrid('load',$.serializeObject($('#searchForm')));dataGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">过滤</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom_out',plain:true"
									onclick="$('#searchForm input').val('');dataGrid.datagrid('load',{});dataGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">重置过滤</a>
							</form></td>
					</tr>
					<tr>
						<td>
							<table>
								<tbody>
									<tr>
										<td><c:if
												test="${fn:contains(sessionInfo.resourceSet, '/userController/addPage')}">
												<a onclick="addFun();" href="javascript:void(0);"
													class="easyui-linkbutton"
													data-options="plain:true,iconCls:'edit_add'">添加</a>
											</c:if></td>
									</tr>
								</tbody>
							</table></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div data-options="region:'center',border:false">
			<table id="dataGrid">
			</table>
		</div>
	</div>
</body>
</html>