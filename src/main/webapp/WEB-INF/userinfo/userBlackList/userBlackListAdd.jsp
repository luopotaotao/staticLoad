<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
    src="<c:url value="/resources/jslib/jquery.radio.js"/>"
    charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		parent.$.messager.progress('close');
		addrequeired();
		$('#userBlackListAddForm')
				.form(
						{
							url : '<c:url value="/userBlackListController/add',
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
	});
	
	function change() {
        var val = $("#type").radio("getValue")['idType'];
        if (val == '1') {
            $('#th').html("SEID");
            $('#userId').val("");
        } else {
            $('#th').html("MISDN");
            $('#userId').val("");
        }
    }
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false"
		style="overflow:hidden">
		<form id="userBlackListAddForm" method="post">
			<table class="tableForm">
				<tr>
                    <th>用户标识类型</th>
                    <td class="tdlabel"><div class="easyui-radio" id="type" onclick="change();">
                            <input id="r1" type="radio" checked="checked"
                                name="idType" value="1" label="SEID" /> <input id="r2"
                                type="radio" name="idType" value="2" label="手机号" />
                        </div>
                    </td>
                </tr>
				<tr>
                    <th id="th">SEID</th>
                    <td><input name="userId" type="text" id="userId"
                        class="easyui-validatebox" data-options="required:true"
                        validType="SEIDorMISDN['idType']" maxlength="50"/></td>
                </tr>
			</table>
		</form>
	</div>
</div>

