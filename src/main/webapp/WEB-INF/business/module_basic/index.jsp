<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../../layout/common.jsp"></jsp:include>

</head>
<body class="easyui-layout">
<div data-options="region:'west',split:true" title="功能导航" style="width: 200px; overflow: hidden;">
    <div class="easyui-panel" style="padding:5px">
        <ul id="tree_menu"></ul>
    </div>
</div>
<div id="tt" class="easyui-tabs" data-options="region:'center'"></div>

<script>
    $(function () {
        var tree_data = [{
            "id": 1,
            "text": "基础信息",
            "children": [{
                "id": 11,
                "text": "单位管理",
                "url": "${pageContext.request.contextPath}/moduleBasicCompanyController/index.action"
            }, {
                "id": 12,
                "text": "检测信息",
                "children": [{
                    "id": 121,
                    "text": "检测机构",
                    "url": "${pageContext.request.contextPath}/moduleBasicInstitutionController/index.action"
                }, {
                    "id": 122,
                    "text": "检测项目",
                    "url": "${pageContext.request.contextPath}/moduleBasicInspectItemController/index.action"
                }]
            }, {
                "id": 13,
                "text": "行政区划",
                "url": "${pageContext.request.contextPath}/moduleBasicAreaController/index.action"
            }]
        }];
        initUI();
        function initUI() {
            $('#tree_menu').tree({
//                    url:'tree_data1.json',
                data: tree_data,
//                    method:'get',
                animate: true,
                onClick: function (node) {
                    if (node.text && node.url) {
                        openTab(node.text, node.url);
                    }
                }
            });

        }

        function openTab(title, url) {
            var $tt = $('#tt');
            if (!$tt.tabs('exists', title)) {
                var $iframe = $('<iframe/>', {src: url, style: 'width:95%;height:95%;',scrolling:'no'});
                $tt.tabs('add', {
                    title: title,
                    content: $iframe,
                    closable: true,
                    fit:true,
                    plain:true
                });
            } else {
                $tt.tabs('select', title)
            }

        }
    });
</script>

</body>
</html>