<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();
		$('#systemConfigAddForm')
				.form(
						{
							url : '<c:url value="/systemConfigController/add"/>',
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
		<form id="systemConfigAddForm" method="post">
			<table class="tableForm">
				<tr>
					<th style="width: 100px;">参数标识</th>
					<td><input name="confId" type="text"
						class="easyui-validatebox"
						data-options="required:true,validType:['NO_SPACE','UPPERSTR_UNDERLINE']" maxlength="50" />
					</td>
				</tr>
				<tr>
					<th style="width:100px;">参数名称</th>
					<td><input name="confName" type="text"
						class="easyui-validatebox"
						data-options="required:true,validType:'NO_SPACE'" maxlength="50" />
					</td>
				</tr>
				<tr>
					<th style="width:100px;">参数内容</th>
					<td colspan="4"><input name="confContext" type="text"
						class="easyui-validatebox"
						data-options="required:true,validType:'NO_SPACE'"
						style="width: 400px;" maxlength="200" /></td>
				</tr>
				<tr>
					<th style="width:100px;">参数说明</th>
					<td colspan="4"><input name="confDesc" type="text"
						class="easyui-validatebox" style="width: 400px;" maxlength="200" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

