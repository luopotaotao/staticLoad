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
				<th>订单编号：</th>
				<td class="tdlabel">${orders.orderId}</td>
				<th>卡片交易序号：</th>
				<td class="tdlabel">${orders.cardTradeNo}</td>
			</tr>
			<tr>
				<th>客户交易流水号：</th>
				<td class="tdlabel" colspan=3>${orders.paymentSn}</td>
			</tr>
			<tr>
				<th>业务方订单号：</th>
				<td class="tdlabel">${orders.lxrbusinessSn}</td>
				<th>实际交易金额：</th>
				<td class="tdlabel">${orders.chargeMoney}&nbsp;&nbsp;&nbsp;&nbsp;(单位：分)</td>
			</tr>
			<tr>
				<th>原交易金额：</th>
				<td class="tdlabel">${orders.orgChargeMoney}&nbsp;&nbsp;&nbsp;&nbsp;(单位：分)</td>
				<th>开卡费：</th>
				<td class="tdlabel">${orders.openCardMoney}&nbsp;&nbsp;&nbsp;&nbsp;(单位：分)</td>
			</tr>
			<tr>

				<th>最后一条交易记录：</th>
				<td class="tdlabel" colspan=3>${orders.lastTradeRecord}</td>
			</tr>
			<tr>
				<th>订单类型：</th>
				<td class="tdlabel">${orders.orderTypeStr}</td>
				<th>订单状态：</th>
				<td class="tdlabel">${orders.orderStatusStr}</td>
			</tr>
			<tr>
				<th>卡号：</th>
				<td class="tdlabel">${orders.cardNo}</td>
				<th>优惠券编号：</th>
				<td class="tdlabel">${orders.favouableId}</td>
			</tr>
			<tr>
				<th>SEID：</th>
				<td class="tdlabel">${orders.seId}</td>
				<th>SE发行方标识：</th>
				<td class="tdlabel">${orders.seiTsmId}</td>
			</tr>
			<tr>
				<th>应用名称：</th>
				<td class="tdlabel">${orders.appName}</td>
				<th>支付渠道类型：</th>
				<td class="tdlabel">${orders.payWayStr}</td>
			</tr>
			<tr>
				<th>支付通知时间：</th>
				<td class="tdlabel">${orders.noticerTime}</td>
				<th>交易创建时间：</th>
				<td class="tdlabel">${orders.orderCreateTime}</td>
			</tr>
			<tr>
				<th>更新时间：</th>
				<td class="tdlabel">${orders.updateTime}</td>
			</tr>
			<tr>
				<th>创建时间：</th>
				<td class="tdlabel">${orders.createTime}</td>
			</tr>
		</table>
	</form>
</div>