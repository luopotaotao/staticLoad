<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();
		var confId = '${config.confId}';
		$('#systemConfigEditForm')
				.form(
						{
							url : '${pageContext.request.contextPath}/systemConfigController/edit.action',
							onSubmit : function() {
								parent.$.messager.progress({
									title : "提示",
									text : "数据处理中，请稍后...."
								});
								var isValid = $(this).form('validate');
								
								if (confId == 'MAIL_NOTIFICATION') {
                                    if ($("#confContext").val() != 0
                                            && $("#confContext").val() != 1) {
                                        parent.$.messager.alert("提示",
                                                "参数内容必须为1或0！", "info");
                                        isValid = false;
                                    }
                                } else if (confId == 'REMAINING_LOGINS') {
                                    var g = /^[1-9]*[1-9][0-9]*$/;
                                    if (!g.test($("#confContext").val())) {
                                        parent.$.messager.alert("提示",
                                                "参数内容必须为正整数(最大为5)！", "info");
                                        isValid = false;
                                    }
                                    if ($("#confContext").val() > 5) {
                                        parent.$.messager.alert("提示",
                                                "参数内容必须为正整数(最大为5)！", "info");
                                        isValid = false;
                                    }
                                } else if (confId == 'TO_ADDRESS') { //账户锁定后邮件接收人邮箱                  
                                    var reg = /^(?:\w+\.?)*\w+@(?:\w+\.)*\w+$/;
                                    var confContext = $("#confContext").val();
                                    var result = confContext.split(",");
                                    for ( var i = 0; i < result.length; i++) {
                                        if (!reg.test(result[i])) {
                                            parent.$.messager.alert("提示", "邮箱【"
                                                    + result[i] + "】格式不正确！",
                                                    "info");
                                            isValid = false;
                                            break;
                                        }
                                    }
                                } else if (confId == 'OPERATE_TIMEOUT') {
                                    var g = /^[1-9]*[1-9][0-9]*$/;
                                    if (!g.test($("#confContext").val())) {
                                        parent.$.messager.alert("提示",
                                                "参数内容必须为正整数(最大为180)！", "info");
                                        isValid = false;
                                    }
                                    if ($("#confContext").val() > 180) {
                                        parent.$.messager.alert("提示",
                                                "参数内容必须为正整数(最大为180)！", "info");
                                        isValid = false;
                                    }
                                }
								
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
		<form id="systemConfigEditForm" method="post">
			<table class="tableForm">
				<tr>
					<th style="width: 100px;">参数标识</th>
					<td class="tdlabel"><input name="confId" type="hidden"
						value="${s.confId}" /><input name="dataVerFalg" type="hidden"
						value="${s.dataVerFalg}" />${s.confId}</td>
				</tr>
				<tr>
					<th style="width:100px;">参数名称</th>
					<td class="tdlabel">${s.confName}</td>
				</tr>
				<tr>
					<th style="width:100px;">参数内容</th>
					<td colspan="4"><input name="confContext" id="confContext"
						type="text" class="easyui-validatebox"
						data-options="required:true,validType:'NO_SPACE'"
						style="width: 400px;" maxlength="200" value="${s.confContext}" />
					</td>
				</tr>
				<tr>
					<th style="width:100px;">参数说明</th>
					<td colspan="4" class="tdlabel">${s.confDesc}</td>
				</tr>
			</table>
		</form>
	</div>
</div>
