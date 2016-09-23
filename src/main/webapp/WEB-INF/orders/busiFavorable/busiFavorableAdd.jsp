<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();

		$('#appletId')
				.combobox(
						{
							url : '${pageContext.request.contextPath}/appletController/combobox.action',
							valueField : 'appletId',
							textField : 'appName',
							panelHeight : '200',
							editable : false,
							formatter : function(row) {
								return '<div class="item-text">' + row.appName
										+ '</div>';
							},
							onLoadSuccess : function() {
								var data = $("#appletId").combobox("getData");
								if (data.length > 0) {
									$("#appletId").combobox("select", "");
								}
							}
						});
						
	
	   $('#seTsmId')
                .combobox(
                        {
                            url : '${pageContext.request.contextPath}/seTsmInfoController/combobox.action',
                            valueField : 'seiTsmId',
                            textField : 'seiTsmName',
                            panelHeight : '200',
                            editable : false,
                            formatter : function(row) {
                                return '<div class="item-text">' + row.seiTsmName
                                        + '</div>';
                            },
                            onLoadSuccess : function() {
                                var data = $("#seTsmId").combobox("getData");
                                if (data.length > 0) {
                                    $("#seTsmId").combobox("select", "");
                                }
                            }
                        });

		$('#favouableId')
				.combobox(
						{
							url : '${pageContext.request.contextPath}/favorableController/combobox.action',
							valueField : 'favouableId',
							textField : 'favouableName',
							panelHeight : '200',
							editable : false,
							formatter : function(row) {
								return '<div class="item-text">'
										+ row.favouableName + '</div>';
							},
							onLoadSuccess : function() {
								var data = $("#favouableId")
										.combobox("getData");
								if (data.length > 0) {
									$("#favouableId").combobox("select", "");
								}
							}
						});

		$('#busiIssueAddForm')
				.form(
						{
							url : '${pageContext.request.contextPath}/busiFavorableController/add.action',
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
								try {
									var result = $.parseJSON(result);
									if (result.success) {
										parent.$.modalDialog.opener_dataGrid
												.datagrid('reload');
										parent.$.modalDialog.handler
												.dialog("close");
										parent.$.messager.alert("提示",
												result.msg, "info");
									} else {
										parent.$.messager.alert("错误",
												result.msg, "error");
									}
								} catch (e) {

								}

							}
						});

	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false"
		style="overflow:hidden">
		<form id="busiIssueAddForm" method="post">
			<table class="tableForm">
				<tr>
					<th>应用名称</th>
					<td><input name="appletId" id="appletId" type="text"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>优惠名称</th>
					<td><input name="favouableId" id="favouableId" type="text"
						data-options="required:true" />
					</td>
				</tr>
				<tr>
                    <th>SE发行方</th>
                    <td><input name="seTsmId" id="seTsmId" type="text"
                        data-options="required:true" />
                    </td>
                </tr>
				<!-- <tr>
					<th>优惠码</th>
					<td><input name="favouableCode" type="text"
						class="easyui-validatebox"
						data-options="required:true,validType:['NO_SPACE','NUM_STR']"
						maxlength="40" /></td>
				</tr>
				<tr>
					<th>过期标志</th>
					<td><select id="pastFlg" name="pastFlg" style="width:220px;"
						class="easyui-combobox"
						data-options="panelHeight:'auto', editable: false">
							<option value="0">未过期</option>
							<option value="1">过期</option>
					</select>
					</td>
				</tr> -->
				<tr>
					<th>用户对象标识</th>
					<td><select id="targetUserFalg" name="targetUserFalg"
						style="width:220px;" class="easyui-combobox"
						data-options="panelHeight:'auto', editable: false">
							<option value="1">部分用户</option>
							<option value="2" selected="selected">全网用户</option>
					</select></td>
				</tr>
				<tr>
					<th>业务优惠类型</th>
					<td><select id="busiFavouableType" name="busiFavouableType"
						style="width:220px;" class="easyui-combobox"
						data-options="panelHeight:'auto', editable: false">
							<option value="1">开卡</option>
							<option value="2">充值</option>
					</select></td>
				</tr>
			</table>
		</form>
	</div>
</div>

