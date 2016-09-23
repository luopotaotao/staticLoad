<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false">
		<form id="userAppletInfoSearchForm" method="post">
			<table class="tableForm">
				<tr>
					<th>应用/安全域AID</th>
					<td class="tdlabel">${u.instanceAid}</td>
				</tr>
				<tr>
					<th>应用类型</th>
					<td class="tdlabel">${u.appTypeStr}</td>
				</tr>
				<tr>
					<th>应用/安全域状态</th>
					<td class="tdlabel">${u.appletStatusStr}</td>
				</tr>
				<tr>
					<th>业务状态</th>
					<td class="tdlabel">${u.busiStatusStr}</td>
				</tr>
				<tr>
					<th>应用版本号</th>
					<td class="tdlabel">${u.appVersion}</td>
				</tr>
				<tr>
					<th>业务卡号</th>
					<td class="tdlabel">${u.busiCardNo}</td>
				</tr>
				<tr>
                    <th>是否在SP注册</th>
                    <td class="tdlabel">${u.spSignStr}</td>
                </tr>
				<tr>
					<th>创建时间</th>
					<td class="tdlabel">${u.createTime}</td>
				</tr>
				<tr>
					<th>更新时间</th>
					<td class="tdlabel">${u.updateTime}</td>
				</tr>
			</table>
		</form>
	</div>
</div>
