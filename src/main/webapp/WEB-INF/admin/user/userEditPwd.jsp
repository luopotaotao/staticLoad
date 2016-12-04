<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
//无用页面
$(function() {
	parent.$.messager.progress('close');
	addrequeired();
	$('#form').form( {
		url : '<c:url value="/userController/editPwd"/>',
		onSubmit : function() {
			parent.$.messager.progress( {
				title : '提示',
				text : '数据处理中，请稍后....'
			});
			var isValid = $(this).form('validate');
			if (!isValid) {
				parent.$.messager.progress('close');
			} else {
			   
				var password = $('#password').val();
				var password2 = $('#password2').val();
				if (password != "") {
				   var name = '${user.name}';
                    if (password.indexOf(name)!=-1) {
                       parent.$.messager.progress('close');
                        parent.$.messager.alert('错误', '密码不允许包含用户名!', 'error');
                        return false;
                    }
					$("#password").val(hex_sha1(password));
				}
				if (password2 != "") {
					$("#password2").val(hex_sha1(password2));
				}
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
					<th>
						<input name="id" type="hidden" value="${user.id}">
						用户名
					</th>
					<td class="tdlabel">
						<input name="name" type="hidden" value="${user.name}">${user.name}
					</td>
				</tr>
				<tr>
					<th>
						密码
					</th>
					<td>
						<input id="password" name="pwd" type="password" placeholder="请输入密码"
							class="easyui-validatebox " data-options="required:true,validType:['NO_SPACE','SETPWD']" maxlength="20" autocomplete="off">
					</td>
				</tr>
				<tr>
					<th>
						确认密码
					</th>
					<td>
						<input type="password" id="password2" placeholder="请再次输入密码"
							class="easyui-validatebox" data-options="required:true" validType="EQUALTO['#password']" maxlength="20" autocomplete="off">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>