<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		var data = eval("(" + '${userResources}' + ")");
		$('#userResources').tree({
			data : data,
			parentField : 'pid',
			onLoadSuccess : function() {
				parent.$.messager.progress('close');
				if (data.length < 1) {
					$('#userResources').append('<div style="text-align:center; height:300px; line-height:300px"><div style="font-weight:bold"><img src="<c:url value="/resources/style/images/blue_face/bluefaces_35.png"/>" alt="您没有任何权限" />您没有任何权限</div></div>');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="">
		<ul id="userResources"></ul>
	</div>
</div>