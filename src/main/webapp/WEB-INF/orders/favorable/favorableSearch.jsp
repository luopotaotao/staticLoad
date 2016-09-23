<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();
		$("#favouableType").val("${favorable.favouableType}");
		$("#pastFlg").val("${favorable.pastFlg}");
		$("#startTime").val("${favorable.startTime}".substring(0, 19));
		$("#endTime").val("${favorable.endTime}".substring(0, 19));

	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false"
		style="overflow:hidden">
		<form id="favorableSearchForm" method="post">
			<table class="tableForm">
				<tr>
					<th style="width: 100px;">优惠名称</th>
					<td class="tdlabel">${favorable.favouableName}</td>
				</tr>
				<tr>
					<th style="width: 100px;">优惠类型</th>
					<td class="tdlabel">${favorable.favouableTypeStr}</td>
				</tr>
				<tr>
					<th style="width: 100px;">优惠阈值</th>
					<td class="tdlabel">${favorable.favouableThreshold}</td>
				</tr>
				<tr>
					<th style="width: 100px;">最低金额类型</th>
					<td class="tdlabel">${favorable.moneyTypeStr}</td>
				</tr>
				<tr>
					<th style="width: 100px;">优惠内容</th>
					<td class="tdlabel">${favorable.favouableContent}</td>
				</tr>
				<tr>
					<th style="width: 100px;">优惠描述</th>
					<td class="tdlabel">${favorable.favouableDesc}</td>

				</tr>
				<tr>
					<th style="width: 100px;">优惠开始时间</th>
					<td class="tdlabel">${favorable.startTime}</td>

				</tr>
				<tr>
					<th style="width: 100px;">优惠截止时间</th>
					<td class="tdlabel">${favorable.endTime}</td>

				</tr>
				<tr>
					<th style="width: 100px;">过期标志</th>
					<td class="tdlabel">${favorable.pastFlgStr}</td>
				</tr>
				<tr>
					<th style="width: 100px;">创建时间</th>
					<td class="tdlabel">${favorable.createTime}</td>
				</tr>
				<tr>
					<th style="width: 100px;">更新时间</th>
					<td class="tdlabel">${favorable.updateTime}</td>
				</tr>
				<tr>
					<th style="width: 100px;">操作管理员</th>
					<td class="tdlabel">${favorable.adminName}</td>
				</tr>
			</table>
		</form>
	</div>
</div>

