<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
	});
</script>
<div align="center">
	<form id="searchForm" method="post">
		<table class="tableForm">
			<tr>
				<th>登录用户名：</th>
				<td class="tdlabel">${userlog.adminName}</td>
			</tr>
			<tr>
				<th>资源名称：</th>
				<td class="tdlabel">${userlog.text}</td>
			</tr>
			<tr>
				<th>资源URL：</th>
				<td class="tdlabel">${userlog.url}</td>
			</tr>
			<tr>
				<th>用户IP信息：</th>
				<td class="tdlabel">${userlog.userIp}</td>
			</tr>
			<tr>
				<th>操作表单内容：</th>
				<td class="tdlabel" style="width:300px;color:red">${userlog.formContentStr}</td>
			</tr>
			<tr>
				<th>操作时间：</th>
				<td class="tdlabel">${userlog.createTime}</td>
			</tr>
		</table>
	</form>
</div>