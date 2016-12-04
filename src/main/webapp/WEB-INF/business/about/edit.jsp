<%--
  Created by IntelliJ IDEA.
  User: tt
  Date: 2016/12/2
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>智能无线静荷载试验检测云平台</title>
    <link rel="stylesheet" href="<c:url value="/resources/jslib/markdown/simplemde.min.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/jslib/markdown/simplemde.min.js"/>"></script>
    <jsp:include page="../../layout/common.jsp"></jsp:include>
</head>
<body style="background: rgb(247, 250, 255);">
<div style="height: 30%;">
    <button id="about_btn_save"> 保存</button>
    <textarea>
        ${about}
    </textarea>
</div>

<script>
    $(function () {
        var simplemde = new SimpleMDE();
        $('#about_btn_save').bind('click', save);
        function save() {
            $.messager.confirm('系统提示', '是否确认提交?', function (r) {
                if (r) {
                    $.messager.progress({
                        title:"系统提示",
                        text: "保存中..."
                    });
                    $.ajax({
                                url: '<c:url value="/about/post"/>',
                                type: 'post',
                                dataType: 'json',
                                data: {
                                    content: simplemde.value()
                                }
                            }
                    ).done(function (ret) {

                        if (ret.msg) {
                            $.messager.alert('系统提示', '保存成功!');
                        }
                    }).fail(function () {
                        $.messager.alert('系统提示', '保存失败!请重新尝试或联系管理员!');
                    }).complete(function () {
                        $.messager.progress("close");
                    })
                }
            })
        }
    })
    ;

</script>
</body>
</html>
