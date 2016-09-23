<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();
		$('#favorableuserAddForm')
				.form(
						{
							url : '${pageContext.request.contextPath}/favorableUserController/add.action',
							onSubmit : function() {
								parent.$.messager.progress({
									title : "提示",
									text : "数据处理中，请稍后...."
								});
								var isValid = $(this).form('validate');
								if (!isValid) {
									parent.$.messager.progress('close');
								}
								return isValid;
							},
							success : function(result) {
								parent.$.messager.progress('close');
								var result = $.parseJSON(result);
								if (result.success) {
									parent.$.modalDialog.opener_dataGrid
											.datagrid('reload');
									parent.$.modalDialog.handler
											.dialog("close");
									parent.$.messager.alert("提示", result.msg,
											"info");
								} else {
									parent.$.messager.alert("错误", result.msg,
											"error");
								}

							}
						});

		$('#favouableId')
				.combobox(
						{
							url : '${pageContext.request.contextPath}/favorableController/combobox.action',
							valueField : 'favouableId',
							textField : 'favouableName',
							editable : false,
							formatter : function(row) {
								return '<div class="item-text">'
										+ row.favouableName + '</div>';
							},
							onLoadSuccess : function() {
								var data = $("#favouableId")
										.combobox("getData");
								if (data.length > 0) {
									$("#favouableId").combobox("setValue", "");
								}
							}
						});
		$('#appletId')
				.combobox(
						{
							url : '${pageContext.request.contextPath}/appletController/combobox.action',
							valueField : 'appletId',
							textField : 'appName',
							editable : false,
							formatter : function(row) {
								return '<div class="item-text">' + row.appName
										+ '</div>';
							},
							onLoadSuccess : function() {
								var data = $("#appletId").combobox("getData");
								if (data.length > 0) {
									$("#appletId").combobox("setValue", "");
								}
							}
						});

	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false"
		style="overflow:hidden">
		<form id="favorableuserAddForm" method="post">
			<table class="tableForm">
				<tr>
					<th style="width: 100px;">SEID</th>
					<td><input name="seid" type="text" class="easyui-validatebox"
						data-options="required:true,validType:['NO_SPACE','SEID']"
						maxlength="20" /></td>
				</tr>
				<tr>
					<th style="width: 100px;">优惠名称</th>
					<td><input id="favouableId" name="favouableId"
						class="easyui-combobox"
						data-options="required:true,panelHeight:'200',editable: false">
					</td>
				</tr>
				<tr>
					<th style="width: 100px;">应用名称</th>
					<td><input id="appletId" name="appletId"
						class="easyui-combobox"
						data-options="required:true,panelHeight:'200',editable: false">
					</td>
				</tr>
				<tr>
					<th style="width: 100px;">剩余使用次数</th>
					<td><input name="remainTimes" type="text"
						class="easyui-validatebox"
						data-options="required:true,validType:['NUMNOZERO']" maxlength="5">
					</td>

				</tr>
			</table>
		</form>
	</div>
</div>

