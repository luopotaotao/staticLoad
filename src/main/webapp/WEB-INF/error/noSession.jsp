<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<script>
    setTimeout(function () {
        top.location = '${pageContext.request.contextPath}';
    }, 2000);
</script>
${msg}
<a href="javascript:top.location=${pageContext.request.contextPath}">如页面没有自动跳转,清点击这里</a>
<%--<script type="text/javascript" charset="utf-8">--%>
<%--try{--%>
<%--top.$.messager.alert('操作提示','您还没有登录或登录已超时，请重新登录！','info',function(){window.location.href='<c:url value="/';});--%>
<%--top.$.messager.progress('close');--%>
<%----%>
<%--}--%>
<%--catch(e){}--%>
<%--</script>--%>
</html>