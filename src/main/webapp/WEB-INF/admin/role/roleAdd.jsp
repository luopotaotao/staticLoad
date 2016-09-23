<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();	
		
		$('#form').form({
			url : '${pageContext.request.contextPath}/roleController/add.action',
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
					parent.$.modalDialog.openner_treeGrid.treegrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_treeGrid这个对象，是因为role.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
					parent.$.messager.alert('提示', result.msg, 'info');
				}else {
						parent.$.messager.alert("错误", result.msg, "error");
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;">
		<form id="form" method="post">
			<table class="tableForm">
				<tr>
					<th>角色名称</th>
					<td>
						<input name="id" type="hidden" value="${role.id}" />
						<input name="seq" type="hidden" value="200">
						<input name="name" type="text" placeholder="请输入角色名称" class="easyui-validatebox" data-options="required:true,validType:['HANZI_ZIMU_SHUZI']" maxlength="15" value="">
					</td>

				</tr>
				
				<tr>
					<th>备注</th>
					<td ><textarea name="remark" style="width:215px;height:60px;" maxlength="90"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>