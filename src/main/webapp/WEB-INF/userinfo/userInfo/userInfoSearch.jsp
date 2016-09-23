<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {	   
		parent.$.messager.progress('close');
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false">
		<form id="userInfoSearchForm" method="post">
			<table class="tableForm">
				<tr>
					<th>SEID</th>
					<td class="tdlabel">${u.seid}</td>
					<th>SE发行方标识</th>
					<td class="tdlabel">${u.seTsmId}</td>
				</tr>
				<tr>
					<th>设备标识号</th>
					<td class="tdlabel">${u.deviceId}</td>
					<th>设备类型</th>
					<td class="tdlabel">${u.deviceTypeStr}</td>
				</tr>
				<tr>
					<th>CPLC值</th>
					<td class="tdlabel" colspan="3">${u.cplc}</td>
				</tr>
				<tr>
					<th>SE COS版本号</th>
					<td class="tdlabel">${u.seCosVer}</td>
					<th>SE芯片厂商代码</th>
					<td class="tdlabel">${u.seVendorId}</td>
				</tr>
				<tr>
					<th>手机号码</th>
					<td class="tdlabel">${u.msisdn}</td>
					<th>手机型号</th>
					<td class="tdlabel">${u.phoneModel}</td>
				</tr>
				<tr>
					<th>手机系统版本号</th>
					<td class="tdlabel">${u.phoneOsVer}</td>
					<th>手机类型</th>
					<td class="tdlabel">${u.phoneTypeStr}</td>
				</tr>
				<tr>
					<th>是否换卡</th>
					<td class="tdlabel">${u.isChanageCardStr}</td>
					<th>手机基带版本号</th>
					<td class="tdlabel">${u.basePhoneVersion}</td>
				</tr>
				<tr>
					<th>注册时间</th>
					<td class="tdlabel">${u.regTime}</td>
					<th>更新时间</th>
					<td class="tdlabel" colspan="3">${u.updateTime}</td>
				</tr>

			</table>
		</form>
	</div>
</div>
