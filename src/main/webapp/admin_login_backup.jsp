<%@ page contentType="text/html; charset=UTF-8"%>
<%
    HttpSession s = request.getSession();
    s.setMaxInactiveInterval(300);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>雷森运营支撑管理平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-cache" />

<jsp:include page="inc.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/style/admin_login.css"
	rel="stylesheet" type="text/css" />
<%--<script type="text/javascript"--%>
	<%--src="${pageContext.request.contextPath}/jslib/extBrowser.js"></script>--%>
<script type="text/javascript" charset="utf-8">
    $(function() {
        var formParam = {
            url : '${pageContext.request.contextPath}/userController/login.action',
            onSubmit : function() {
                if (!$(this).form('validate')) {
                } else {
                    var verifycode = $('#verifycode').val();
                    if (verifycode.length < 4) {
                        $("#message").show();
                        $("#message").html("验证码长度应为4位!");
                        return false;
                    }

                    var pwd = $("#pwd").val();
                    if (pwd != "") {
                        $("#pwd").val(sha256_digest(pwd));
                    }
                }
                return $(this).form('validate');
            },
            success : function(result) {
                try {
                    var r = $.parseJSON(result);
                    if (r.success) {
                        //登录成功跳转
                        window.location.href = "index.jsp";
                    } else {
                        //显示错误信息
                        $("#message").show();
                        if(r.msg=='false'){
                          $("#message").html("你的密码已超期，请<a target='_blank' href="+'${pageContext.request.contextPath}'+"/userEditInvalidPwd.jsp>修改密码</a>");
                        }else{
                         $("#message").html(r.msg);
                        }
                        $("#name").val("");
                        $("#pwd").val("");
                        $("#verifycode").val("");
                        $("#img").attr("src", "authimg?now=" + new Date());
                    }
                } catch (e) {
                    $.messager.alert('操作提示', result);
                }
            }
        };
        $('#user_login_loginInputForm').form(formParam);
    })
</script>
</head>

<body>



	<div class="Main">
		<div class="login_box">
			<form class="contact_form" id="user_login_loginInputForm"
				autocomplete="off" method="post" name="contact_form">
				<ul class="input_box" style="height:200px;padding-left:670px;padding-right:20px">
					<li>用户名：<input type="text" id="name" name="name"
						autocomplete="off" maxlength="20" placeholder="请输入用户名"
						class="easyui-validatebox" data-options="required:true" />
					</li>
					<li>密&nbsp;&nbsp;&nbsp;码：<input type="password" id="pwd"
						autocomplete="off" name="pwd" maxlength="20" placeholder="请输入密码"
						class="easyui-validatebox" data-options="required:true" />
					</li>
					<li>验证码：<input type="text" id="verifycode" name="verifycode"
						maxlength="4" placeholder="验证码" style="width: 110px;"
						autocomplete="off" class="easyui-validatebox" /> <img id="img"
						src="authimg?now=new Date()" title="Refresh verify code"
						align="absmiddle" style="cursor: pointer; height:25px;"
						onClick="this.src='authimg?now='+new Date()" />
					</li>

					<li>
						<button class="submit" type="submit">登录</button></li>
					<li><div id="message"
							style="display: none; color:red;text-align:center;padding-left:-20px"></div>
					</li>
				</ul>

			</form>
		</div>
	</div>

</body>
</html>
