<%@ page contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<% Exception e = (Exception)request.getAttribute("ex"); %>
<script type="text/javascript" charset="utf-8">

try{
	parent.$.messager.progress('close');
	parent.$.messager.alert('操作提示',"<b>发生错误: </b><br/><%= e.getClass().getSimpleName()%><br/>如频繁产生此错误，请联系管理员");
}
catch(e)
{}

</script>