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
				<th>商户订单号：</th>
				<td class="tdlabel">${t.orderId}</td>
			</tr>
			<tr>
				<th>账务流水号：</th>
				<td class="tdlabel">${t.accountSerial}</td>
			</tr>
			<tr>
				<th>业务流水号：</th>
				<td class="tdlabel">${t.businessSerial}</td>
			</tr>
			<tr>
				<th>商品名称：</th>
				<td class="tdlabel">${t.tradeName}</td>
			</tr>
			<tr>
				<th>对方账号：</th>
				<td class="tdlabel">${t.consumer}</td>
			</tr>
			<tr>
				<th>发生时间：</th>
				<td class="tdlabel">${t.createTime}</td>
			</tr>
			<tr>
				<th>收入金额：</th>
				<td class="tdlabel">${t.incomeStr}&nbsp;&nbsp;&nbsp;&nbsp;(单位：元)</td>
			</tr>
			<tr>
				<th>支出金额：</th>
				<td class="tdlabel">${t.expenditureStr}&nbsp;&nbsp;&nbsp;&nbsp;(单位：元)</td>
			</tr>
			<tr>
				<th>账户余额：</th>
				<td class="tdlabel">${t.remainStr}&nbsp;&nbsp;&nbsp;&nbsp;(单位：元)</td>
			</tr>
			<tr>
				<th>交易渠道：</th>
				<td class="tdlabel">${t.transactionChannel}</td>
			</tr>
			<tr>
				<th>业务类型：</th>
				<td class="tdlabel">${t.businessType}</td>
			</tr>
			<tr>
				<th>备注：</th>
				<td class="tdlabel">${t.memo}</td>
			</tr>
		</table>
	</form>
</div>