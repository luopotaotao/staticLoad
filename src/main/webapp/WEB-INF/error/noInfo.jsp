<%@ page contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div>该条信息不存在,请刷新该页面</div>
<script type="text/javascript" charset="utf-8">
	try {
		$.modalDialog.handler.dialog('close');
		parent.$.messager.progress('close');
		$.messager.alert('错误', "该条信息不存在,请刷新该页面", 'error');
	} catch (e) {
	}
</script>