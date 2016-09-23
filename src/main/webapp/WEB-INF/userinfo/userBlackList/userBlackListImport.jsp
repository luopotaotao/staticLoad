<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();
		$('#userBlackListImportForm')
				.form(
						{
							url : '${pageContext.request.contextPath}/userBlackListController/import.action',
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
	<form id="userBlackListImportForm" method="post"
		enctype="multipart/form-data">
		<table class="tableForm">
			<tr>
				<th>用户标识类型</th>
				<td><select name="idType" class="easyui-combobox"
					data-options="required:true,panelHeight:'auto', editable: false">
						<option value="1" selected="selected">SEID</option>
						<option value="2">手机号</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>用户黑名单信息文件</th>
				<td><input type="file" name="userBlackListFile"
					class="easyui-validatebox" data-options="required:true" />
				</td>
			</tr>
			<tr>
				<td colspan="4"><strong>文件格式要求：</strong><br>
					1、只支持TXT文本格式的文件，且文件大小不得大于30M.<br> 2、文件内容为一行一条记录.<br>
					3、每行为一条记录<br> 4、每条记录SEID/MISDN位数不能超过50位.<br>
					例如：<br> 123456789<br>
				</td>
			</tr>
		</table>
	</form>
</div>