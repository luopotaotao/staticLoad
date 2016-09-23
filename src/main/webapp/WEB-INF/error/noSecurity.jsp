<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
${msg}

<script type="text/javascript" charset="utf-8">

try{parent.$.messager.progress('close');}
catch(e){}
parent.$.messager.alert('操作提示','${msg}');
</script>