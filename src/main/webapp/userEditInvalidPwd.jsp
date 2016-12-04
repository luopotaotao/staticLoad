<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>雷森TSM可信服务管理平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache" />    
<meta http-equiv="Cache-Control" content="no-cache" />

<jsp:include page="inc.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
	    addrequeired();
		parent.$.messager.progress('close');
		$('#editInvalidPwdForm').form({
			url : '<c:url value="/userController/editInvalidPwd',
			onSubmit : function() {
				//parent.$.messager.progress({
				//	title : '提示',
				//	text : '数据处理中，请稍后....'
				//});
				var isValid = $(this).form('validate');
				if (!isValid) {
					//parent.$.messager.progress('close');
				}
				else
				{
				    var editpwdcode = $('#editpwdcode').val();
                    if (editpwdcode.length < 4) {
                        parent.$.messager.alert('提示', "验证码长度应为4位!", 'info');
                        return false;
                    }
					var oldPwd = $('#oldPwd').val();
					var password = $('#password').val();
					var password2 = $('#password2').val();
					
					if (password != "") {
					    var name = $('#name').val();
	                    if (password.indexOf(name)!=-1) {
	                       // parent.$.messager.progress('close');
	                        parent.$.messager.alert('错误', '密码不允许包含用户名!', 'error');
	                        return false;
	                    }
						 $("#password").val(sha256_digest(password));
					}
					if (oldPwd != "") {
                        $("#oldPwd").val(sha256_digest(oldPwd));
                    }
					if (password2 != "") {
						$("#password2").val(sha256_digest(password2));
					} 					
				}
				return isValid;
			},
			success : function(result) {
				parent.$.messager.progress('close');
				try{
					result = $.parseJSON(result);
					if (result.success) {
						parent.$.messager.alert('提示', result.msg, 'info');
						//parent.$.modalDialog.handler.dialog('close');
					} else {
						parent.$.messager.alert('错误', result.msg, 'error');
						
					}
					
                }
                catch(e)
                {
                    parent.$.messager.alert("错误", result, "error");
                }
                $("#name").val("");
                $("#oldPwd").val("");
                $("#password").val("");
                $("#password2").val("");
                $("#editpwdcode").val("");
                $("#img").attr("src", "authimg?now=" + new Date());
			}
		});
	});
</script>
</head>
<body>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
			<form id="editInvalidPwdForm" method="post" autocomplete="off">
				<table align="center" >
					<tr>
						<th>用户名</th>
						<td><input id="name" name="name" type="text" maxlength="20" placeholder="请输入用户名"
                        class="easyui-validatebox" data-options="required:true,validType:['NO_SPACE','LOGINNAME']" value="" autocomplete="off"/>
                        <!-- <input id="token" type="hidden" name="token" value="${sessionScope.token}" /> --></td>
					</tr>
					<tr>
						<th>原密码</th>
						<td><input name="oldPwd" id="oldPwd" type="password" placeholder="请输入原密码" class="easyui-validatebox" data-options="required:true,validType:['NO_SPACE','SETPWD']" maxlength="20" autocomplete="off"></td>
					</tr>
					<tr>
						<th>新密码</th>
						<td><input name="pwd" id="password" type="password" placeholder="请输入新密码" class="easyui-validatebox" data-options="required:true,validType:['NO_SPACE','SETPWD']" maxlength="20" autocomplete="off"></td>
					</tr>
					<tr>
						<th>确认密码</th>
						<td><input name="rePwd" id="password2" type="password" placeholder="请再次输入新密码" class="easyui-validatebox" data-options="required:true" validType="EQUALTO['#password']" maxlength="20" autocomplete="off">
						</td>
					</tr>
					<tr>
                        <th>验证码</th>
                        <td>
                         <input type="text" id="editpwdcode" name="editpwdcode"
                        maxlength="4" placeholder="验证码" style="width: 135px;" autocomplete="off"
                        class="easyui-validatebox" data-options="validType:'NO_SPACE'" />
                        <img id="img" src="authimg?now=new Date()"
                        title="Refresh verify code" align="absmiddle"
                        style="cursor: pointer; height:25px;"
                        onClick="this.src='authimg?now='+new Date()" /></td>
                    </tr>
					<tr style="text-align:center">
                        <td colspan="2"><input type="submit" value="修改"></td>
                    </tr>
                    <tr  style="text-align:center">
                        <td colspan="2"><a href="<c:url value="/admin_login_backup.jsp">登录</a></td>
                    </tr>
				</table>
			</form>
	</div>
</div>
</body>
</html>