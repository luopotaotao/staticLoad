<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();
		$('#favorableAddForm')
				.form(
						{
							url : '${pageContext.request.contextPath}/favorableController/add.action',
							onSubmit : function() {
								parent.$.messager.progress({
									title : "提示",
									text : "数据处理中，请稍后...."
								});
								var isValid = $(this).form('validate');
								if (!isValid) {
									parent.$.messager.progress('close');
								}
								return isValid;
							},
							success : function(result) {
								parent.$.messager.progress('close');
								var result = $.parseJSON(result);
								if (result.success) {
									parent.$.modalDialog.opener_dataGrid
											.datagrid('reload');
									parent.$.modalDialog.handler
											.dialog("close");
									parent.$.messager.alert("提示", result.msg,
											"info");
								} else {
									parent.$.messager.alert("错误", result.msg,
											"error");
								}

							}
						});

		$("#favouableType").combobox({
			onChange : function(n) {
				//1:立减
				if (n == 1) {
					$('#span').html("单位：分");
				} else {
					$('#span').html("单位：%");
				}
			}
		});

	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false"
		style="overflow:hidden">
		<form id="favorableAddForm" method="post">
			<table class="tableForm">
				<tr>
					<th style="width: 100px;">优惠名称</th>
					<td><input name="favouableName" type="text"
						class="easyui-validatebox"
						data-options="required:true,validType:['NO_SPACE']" maxlength="50" />
					</td>
				</tr>
				<tr>
					<th style="width: 100px;">优惠类型</th>
					<td><select name="favouableType" id="favouableType"
						data-options="panelHeight:'auto',required:true,editable: false"
						class="easyui-combobox">
							<option value="1">满减</option>
							<option value="2">折扣</option>
					</select></td>
				</tr>
				<tr>
					<th style="width: 100px;">优惠阈值</th>
					<td><input name="favouableThreshold" type="text"
						id="favouableThreshold" class="easyui-validatebox"
						data-options="required:true,validType:['NUM']" maxlength="9"><span>单位：分</span>
					</td>
				</tr>
				<tr>
					<th style="width: 100px;">最低金额类型</th>
					<td><select name="moneyType" id="moneyType"
						data-options="panelHeight:'auto',required:true,editable: false"
						class="easyui-combobox">
							<option value="1">充值金额</option>
							<option value="2">消费金额</option>
					</select></td>
				</tr>
				<tr>
					<th style="width: 100px;">优惠内容</th>
					<td><input name="favouableContent" type="text"
						id="favouableContent" class="easyui-validatebox"
						data-options="required:true,validType:['NUMNOZERO']" maxlength="6"><span
						id="span">单位：分</span></td>
				</tr>
				<tr>
					<th style="width: 100px;">优惠描述</th>
					<td><input name="favouableDesc" type="text"
						class="easyui-validatebox" data-options="required:true"
						maxlength="500">
					</td>

				</tr>
				<tr>
					<th style="width: 100px;">优惠开始时间</th>
					<td><input name="startTime" type="text"
						class="Wdate easyui-validatebox" id="startTime"
						onclick="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'endTime\')}'})"
						readonly="readonly" data-options="required:true">
					</td>

				</tr>
				<tr>
					<th style="width: 100px;">优惠截止时间</th>
					<td><input name="endTime" type="text"
						class="Wdate easyui-validatebox" id='endTime'
						onclick="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startTime\') || \'%y-%M-%d\'}'})"
						readonly="readonly" data-options="required:true">
					</td>

				</tr>
				<!-- <tr>
					<th style="width: 100px;">过期标志</th>
					<td><select name="pastFlg"
						data-options="panelHeight:'auto',required:true,editable: false"
						class="easyui-combobox">
							<option value="0">未过期</option>
							<option value="1">过期</option>
					</select>
					</td>
				</tr> -->
			</table>
		</form>
	</div>
</div>

