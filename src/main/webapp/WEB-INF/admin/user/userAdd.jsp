<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();
		$('#form').form({
			url : '${pageContext.request.contextPath}/userController/add.action',
			onSubmit : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				} else {

					/*var password = $('#password').val();
					var password2 = $('#password2').val();
					if (password != "")
					{
					
					    var name = $("#name").val();
					    if (password.indexOf(name)!=-1) {
					        parent.$.messager.progress('close');
					        parent.$.messager.alert('错误', '密码不允许包含用户名!', 'error');
					        return false;
					    }
						$("#password").val(hex_sha1(password));
					}
					if (password2 != "")
					{
						$("#password2").val(hex_sha1(password2));
					}*/
				}
				return isValid;
			},
			success : function(result) {
				parent.$.messager.progress('close');
				result = $.parseJSON(result);
				if (result.success) {
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
					parent.$.messager.alert('提示', result.msg, 'info');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
					//$('#password').val('');
					//$('#password2').val('');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden;">
		<form id="form" method="post">
			<table class="tableForm">
				<tr>
					<th>用户名</th>
					<td><input name="id" type="hidden" value="${user.id}">
						<input id="name" name="name" type="text" maxlength="20"
						placeholder="请输入用户名" class="easyui-validatebox"
						data-options="required:true,validType:['LOGINNAME']"
						value="" autocomplete="off"></td>
				</tr>
				<tr>
					<th>邮箱</th>
					<td><input name="email" type="text" class="easyui-validatebox"
						data-options="required:true,validType:'email'"
						maxlength="30" /></td>
				</tr>
				<c:if test="${sessionInfo.id =='0'}">
					<tr>
						<th>密码有效期</th>
						<td><input name="validdatetime" type="text"
							onclick="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd',minDate:'%y-%M-{%d+1}'})" />
						</td>
					</tr>
				</c:if>
			</table>
		</form>
	</div>
</div>