<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();
		$('#roleIds').combotree({
			url : '<c:url value="/roleController/grantRoleTree"/>',
			parentField : 'pid',
			lines : true,
			panelHeight : '200',
			multiple : true,
			onLoadSuccess : function() {
				parent.$.messager.progress('close');
			},
			cascadeCheck : false,
			value : $.stringToList('${user.roleIds}')
		});
		$("#lockSymbol").val('${user.lockSymbol}');
		$('#form')
				.form(
						{
							url : '<c:url value="/userController/edit"/>',
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
								try{
									result = $.parseJSON(result);
									if (result.success) {
										parent.$.modalDialog.openner_dataGrid
												.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
										parent.$.modalDialog.handler
												.dialog('close');
										parent.$.messager.alert('提示', result.msg, 'info');
									} else {
										parent.$.messager.alert('错误',
												result.msg, 'error');
									}
								}
								catch(e)
								{
									
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
					<th>用户名</th>
					<td class="tdlabel">${user.name} <input name="id"
						type="hidden" value="${user.id}"></td>
				</tr>
				<tr>
					<th>所属角色</th>
					<td><select id="roleIds" name="roleIds"
						style="height: 29px;"></select></td>
				</tr>
				<tr>
                    <th>邮箱</th> 
                    <td>
                    <input name="email" type="text"
                        class="easyui-validatebox"
                        data-options="required:true,validType:['NO_SPACE','EMAIL']" maxlength="30" value="${user.email}"/>
                        </td>
                </tr>
				<c:if test="${sessionInfo.id =='0'}">
				<%-- <tr>
					<th>密码有效期</th>
					<td><input name="validdatetime" type="text"
						onFocus="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd',minDate:'%y-%M-{%d+1}'})"
						value="${user.validdatetime}" /></td>
				</tr> --%>
				<tr>
                    <th>密码有效期</th>
                    <td><input name="validdatetime" type="text"
                        onclick="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd'})"
                        value="${user.validdatetime}" /></td>
                </tr>
				</c:if>
				<tr>

					<th>锁定标志</th>
					<td><select id="lockSymbol" name="lockSymbol" class="easyui-combobox" data-options="required:true,panelHeight:'auto',editable: false" style="height: 29px;"><option
								value="0">未锁定</option>
							<option value="1">锁定</option>
					</select></td>
				</tr>
			</table>
		</form>
	</div>
</div>