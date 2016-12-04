<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		addrequeired();
		$('#iconCls').combobox({
			data : $.iconData,
			formatter : function(v) {
				return $.formatString('<span class="{0}" style="display:inline-block;vertical-align:middle;width:16px;height:16px;"></span>{1}', v.value, v.value);
			},
			value : '${resource.iconCls}'
		});

		$('#pid').combotree({
			url : '<c:url value="/resourceController/tree"/>',
			parentField : 'pid',
			lines : true,
			value : '${resource.pid}',
			onLoadSuccess : function() {
				parent.$.messager.progress('close');
			}
		});

		$('#form').form({
			url : '<c:url value="/resourceController/edit"/>',
			onSubmit : function() {
				parent.$.messager.progress({
					title : '提示',
					text : '数据处理中，请稍后....'
				});
				var isValid = $(this).form('validate');
				if (!isValid) {
					parent.$.messager.progress('close');
				}
				return isValid;
			},
			success : function(result) {
					parent.$.messager.progress('close');
					result = $.parseJSON(result);
					if (result.success) {
						parent.$.modalDialog.openner_treeGrid.treegrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_treeGrid这个对象，是因为resource.jsp页面预定义好了
						parent.layout_west_tree.tree('reload');
						parent.$.modalDialog.handler.dialog('close');
						parent.$.messager.alert('提示', result.msg, 'info');
					}
					else{
						parent.$.messager.alert('错误', result.msg, 'error');
					}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden;">
		<form id="form" method="post">
			<table class="tableForm">
				<tr>
					<th>资源名称</th>
					<td><input name="id" type="hidden" value="${resource.id}">
						<input name="name" type="text" placeholder="请输入资源名称"
						class="easyui-validatebox"
						data-options="required:true,validType:'NO_SPACE'" maxlength="18"
						value="${resource.name}"></td>
				</tr>
				<tr>
					<th>资源路径</th>
					<td><input name="url" type="text" placeholder="请输入资源路径"
						class="easyui-validatebox" data-options="validType:'NO_SPACE'"
						maxlength="100" value="${resource.url}"></td>
				</tr>
				<tr>
					<th>资源类型</th>
					<td><select name="typeId" class="easyui-combobox"
						data-options="editable:false,panelHeight:'auto'">
							<c:forEach items="${resourceTypeList}" var="resourceType">
								<option value="${resourceType.id}"
									<c:if test="${resourceType.id == resource.typeId}">selected="selected"</c:if>>${resourceType.name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>排序</th>
					<td><input name="seq" type="text" style="width: 219px"
						value="${resource.seq}" placeholder="请输入1-100整数"
						class="easyui-numberbox"
						data-options="required:true,validType:'NO_SPACE',min:1,max:100"
						maxlength="3">
				</tr>
				<tr>
					<th>上级资源</th>
					<td><select id="pid" name="pid"></td>
				</tr>
				<tr>
					<th>菜单图标</th>
					<td><input id="iconCls" name="iconCls"
						data-options="editable:false" /></td>
				</tr>
				<tr>
					<th>备注</th>
					<td><textarea name="remark" style="width: 215px; height: 90px"
							rows="" cols="" maxlength="90">${resource.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>
