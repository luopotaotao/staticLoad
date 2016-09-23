<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
    $(function() {
        parent.$.messager.progress('close');
        addrequeired();
        $('#testZhifubaoImportForm')
                .form(
                        {
                            url : '${pageContext.request.contextPath}/testZhifubaoController/import.action',
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
                                    parent.$.messager.alert("错误", result.msg,
                                            "error");
                                }
                            }
                        });
    });
</script>
<div align="center">
	<form id="testZhifubaoImportForm" method="post"
		enctype="multipart/form-data">
		<table class="tableForm">
			<tr>
				<th>支付宝对账信息文件</th>
				<td><input type="file" name="testZhifubaoFile"
					class="easyui-validatebox" data-options="required:true" /></td>
			</tr>
			<tr>
				<td colspan="4"><strong>文件格式要求：</strong><br>
					1、只支持csv格式的文件，且文件大小不得大于16M.<br> </td>
			</tr>
		</table>
	</form>
</div>