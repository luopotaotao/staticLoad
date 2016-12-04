<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		addrequeired();
		//$("#img").attr("src", "authimg?now=" + new Date());
		parent.$.messager.progress('close');
		$('#editCurrentUserPwdForm')
				.form(
						{
							url : '<c:url value="/userController/editCurrentUserPwd"/>',
							onSubmit : function() {
								parent.$.messager.progress({
									title : '提示',
									text : '数据处理中，请稍后....'
								});
								var isValid = $(this).form('validate');
								if (!isValid) {
									parent.$.messager.progress('close');
								} else {

									var editpwdcode = $('#editpwdcode').val();
									if (editpwdcode.length < 4) {
										parent.$.messager.progress('close');
										parent.$.messager.alert('提示',
												"验证码长度应为4位!", 'info');
										return false;
									}
									var oldPwd = $('#oldPwd').val();
									var password = $('#password').val();
									var password2 = $('#password2').val();
									if (oldPwd != "") {
										$("#oldPwd").val(sha256_digest(oldPwd));
									}
									if (password != "") {
										var name = '${sessionInfo.name}';
										if (password.indexOf(name) != -1) {
											parent.$.messager.progress('close');
											parent.$.messager.alert('错误',
													'密码不允许包含用户名!', 'error');
											return false;
										}
										$("#password").val(
												sha256_digest(password));
									}

									if (password2 != "") {
										$("#password2").val(
												sha256_digest(password2));
									}
								}
								return isValid;
							},
							success : function(result) {
								parent.$.messager.progress('close');
								try {
									result = $.parseJSON(result);
									if (result.success) {
										parent.$.messager.alert('提示',
												result.msg, 'info');
										parent.$.modalDialog.handler
												.dialog('close');
									} else {
										parent.$.messager.alert('错误',
												result.msg, 'error');
										$("#oldPwd").val("");
										$("#password").val("");
										$("#password2").val("");
										$("#editpwdcode").val("");
										$("#img").attr("src",
												"authimg?now=" + new Date());
									}
								} catch (e) {
									parent.$.messager.alert("错误", result,
											"error");
									$("#img").attr("src",
											"authimg?now=" + new Date());
								}

							}
						});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden;">
		<c:if test="${sessionInfo.name == null}">
			<img
				src="<c:url value="/resources/style/images/blue_face/bluefaces_35.png"/>"
				alt="" />
			<div>登录已超时，请重新登录，然后再刷新本功能！</div>
			<script type="text/javascript" charset="utf-8">
				try {
					parent.$.messager.progress('close');
				} catch (e) {
				}
			</script>
		</c:if>
		<c:if test="${sessionInfo.name != null}">
			<form id="editCurrentUserPwdForm" method="post">
				<table class="tableForm">
					<tr>
						<th>用户名</th>
						<td class="tdlabel">${sessionInfo.name}</td>
						<!-- <input id="token" type="hidden" name="token" value="${sessionScope.token}"/> -->
					</tr>
					<tr>
						<th>原密码</th>
						<td><input name="oldPwd" id="oldPwd" type="password"
							placeholder="请输入原密码" class="easyui-validatebox"
							data-options="required:true"
							maxlength="20" autocomplete="off">
						</td>
					</tr>
					<tr>
						<th>新密码</th>
						<td><input name="pwd" id="password" type="password"
							placeholder="请输入新密码" class="easyui-validatebox"
							data-options="required:true,validType:['NO_SPACE','SETPWD']"
							maxlength="20" autocomplete="off">
						</td>
					</tr>
					<tr>
						<th>确认密码</th>
						<td><input name="rePwd" id="password2" type="password"
							placeholder="请再次输入新密码" class="easyui-validatebox"
							data-options="required:true" validType="EQUALTO['#password']"
							maxlength="20" autocomplete="off">
						</td>
					</tr>
					<tr>
						<th>验证码</th>
						<td><input type="text" id="editpwdcode" name="editpwdcode"
							maxlength="4" placeholder="验证码" style="width: 135px;"
							autocomplete="off" class="easyui-validatebox"
							data-options="validType:'NO_SPACE'" /> <img id="img"
							src="authimg?now=new Date()" title="Refresh verify code"
							align="absmiddle" style="cursor: pointer; height:25px;"
							onClick="this.src='authimg?now='+new Date()" />
						</td>
					</tr>
				</table>
			</form>
		</c:if>
	</div>
</div>