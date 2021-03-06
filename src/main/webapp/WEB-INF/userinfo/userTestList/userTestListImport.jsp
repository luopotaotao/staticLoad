<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();
		$('#userTestListImportForm')
				.form(
						{
							url : '<c:url value="/userTestListController/import',
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
									parent.$.modalDialog.opener_dataGrid
											.datagrid('reload');
									parent.$.modalDialog.handler
											.dialog("close");
									parent.$.messager.alert("错误", result.msg,
											"error");
								}
							}
						});
	});
</script>
<div align="center">
	<form id="userTestListImportForm" method="post"
		enctype="multipart/form-data">
		<table class="tableForm">
			<tr>
				<th>测试用户信息文件</th>
				<td><input type="inspect_file" name="userTestListFile"
					class="easyui-validatebox" data-options="required:true" />
				</td>
			</tr>
			<tr>
				<td colspan="4"><strong>文件格式要求：</strong><br>
					1、只支持TXT文本格式的文件，且文件大小不得大于30M.<br> 2、文件内容为一行一条记录.<br>
					3、每行为一条记录<br> 4、每条记录SE标识位数不能超过20位.<br> 
					例如：<br> 123456789012<br>
				</td>
			</tr>
		</table>
	</form>
</div>