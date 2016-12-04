<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();
		$('#userTestListAddForm')
				.form(
						{
							url : '<c:url value="/userTestListController/add',
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
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false"
		style="overflow:hidden">
		<form id="userTestListAddForm" method="post">
			<table class="tableForm">
				<tr>
					<th id="th">SE标识</th>
					<td><input name="seId" id="seId" type="text"
						class="easyui-validatebox"
						data-options="required:true,validType:['SEID']" maxlength="20" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

