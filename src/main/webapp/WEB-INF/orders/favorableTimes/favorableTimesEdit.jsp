<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();

		/* $('#favouableId')
				.combobox(
						{
							url : '${pageContext.request.contextPath}/favorableController/combobox.action',
							valueField : 'favouableId',
							textField : 'favouableName',
							panelHeight : '200',
							editable : false,
							multiple : true,
							formatter : function(row) {
								return '<div class="item-text">'
										+ row.favouableName + '</div>';
							},
							onLoadSuccess : function() {
								var favouableId = '${f.favouableId}';
								if (favouableId != "") {
									var datas = favouableId.split(",");
									$("#favouableId").combobox("setValues",
											datas);
								}
							}
						}); */

		$('#favorableTimesEditForm')
				.form(
						{
							url : '${pageContext.request.contextPath}/favorableTimesController/edit.action',
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
								try {
									var result = $.parseJSON(result);
									if (result.success) {
										parent.$.modalDialog.opener_dataGrid
												.datagrid('reload');
										parent.$.modalDialog.handler
												.dialog("close");
										parent.$.messager.alert("提示",
												result.msg, "info");
									} else {
										parent.$.messager.alert("错误",
												result.msg, "error");
									}
								} catch (e) {

								}

							}
						});

	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false"
		style="overflow:hidden">
		<form id="favorableTimesEditForm" method="post">
			<table class="tableForm">
				<tr>
					<th>优惠名称</th>
					<td class="tdlabel"><input name="favouableTimesId"
						type="hidden" value="${f.favouableTimesId}" /> <input
						name="dataVerFlag" type="hidden" value="${f.dataVerFlag}" />
						${f.favouableName}</td>
				</tr>
				<tr>
					<th>优惠总数</th>
					<td><input name="favouableTimesTotalCount"
						id="favouableTimesTotalCount" type="text"
						value="${f.favouableTimesTotalCount}" maxlength="9"
						class="easyui-validatebox"
						data-options="required:true,validType:['NUM']" />
					</td>
				</tr>
				<tr>
					<th>剩余次数</th>
					<td><input name="remainTimes" id="remainTimes" type="text"
						value="${f.remainTimes}" maxlength="9" class="easyui-validatebox"
						data-options="required:true,validType:['NUM']" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

