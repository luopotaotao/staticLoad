<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
${msg}
<script type="text/javascript" charset="utf-8">
try{
	parent.$.messager.alert('操作提示','您还没有登录或登录已超时，请重新登录！','info',function(){parent.location.href='${pageContext.request.contextPath}/';});
	parent.$.messager.progress('close');
	
}
catch(e){}
</script>