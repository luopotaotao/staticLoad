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
				<th>SE发行方标识：</th>
				<td class="tdlabel">${b.seTsmId}</td>
			</tr>
			<tr>
				<th>SEID：</th>
				<td class="tdlabel">${b.seid}</td>
			</tr>
			<tr>
				<th>业务应用AID：</th>
				<td class="tdlabel">${b.instanceAid}</td>
			</tr>
			<tr>
				<th>业务类型：</th>
				<td class="tdlabel">${b.orgTaskTypeStr}</td>
			</tr>
			<tr>
				<th>操作类型：</th>
				<td class="tdlabel">${b.subTaskTypeStr}</td>
			</tr>
			<tr>
				<th>操作结果：</th>
				<td class="tdlabel">${b.operResult}</td>
			</tr>
			<tr>
				<th>SE执行状态字：</th>
				<td class="tdlabel">${b.seExecuteSw}</td>
			</tr>
			<tr>
				<th>请求来源：</th>
				<td class="tdlabel">${b.reqSrcStr}</td>
			</tr>
			<tr>
				<th>错误描述：</th>
				<td class="tdlabel">${b.errorDesc}</td>
			</tr>
			<tr>
				<th>业务流水号：</th>
				<td class="tdlabel">${b.seqId}</td>
			</tr>
			<tr>
				<th>创建时间：</th>
				<td class="tdlabel">${b.createTime}</td>
			</tr>
		</table>
	</form>
</div>