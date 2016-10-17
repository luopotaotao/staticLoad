<%@ page language="java" pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/laserCoreCss.css">
<link id="easyuiTheme" rel="stylesheet"
      href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/default/easyui.css" type="text/css">
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-1.11.3.js" type="text/javascript"
        charset="utf-8"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/jquery.easyui.min.js"
        charset="utf-8"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"
        charset="utf-8"></script>
<%--<style type="text/css">--%>
<%--#bannerbg{--%>
<%--background-color: #b6c6f5;--%>
<%--background-image:url(${pageContext.request.contextPath}/style/themes/default.jpg);--%>
<%--background-repeat:repeat-y;--%>
<%----%>
<%--}--%>
<%--</style>--%>
<script type="text/javascript" charset="utf-8">
    $(function () {

        <%--$('#bannerbg').css('background-color', '#b6c6f5');--%>
        <%--$('#bannerbg').css('background-image', 'url(${pageContext.request.contextPath}/style/themes/default.jpg)');--%>
        <%--$('#bannerbg').css('background-repeat', 'repeat-y');--%>
        <%--$('#logoimg').attr("src", "${pageContext.request.contextPath}/style/themes/opentsm_logo_d.png");--%>
        <%--$('#bannerbg').css('background-position', '50% 0%');--%>

        var count = 0;
        var timeout1;
        monitoronline();
        timeout1 = setInterval(monitoronline, 10000);
        function monitoronline() {
            $.ajax({
                url: "${pageContext.request.contextPath}/monitorController/monitoronline.action",
                timeout: 10000,
                success: function () {

                },
                error: function () {
                    if (count < 2) {
                        count++;
                        parent.$.messager.alert('操作提示', "请求服务器失败...");

                    }
                    else {
                        clearInterval(timeout1);
                        window.location = "/";
                    }
                }
            })
        }
        openModule('${pageContext.request.contextPath}/moduleOverviewController/index.action');
    });

    function logoutFun() {
        $.messager
                .confirm(
                        '操作提醒',
                        "您确定要退出本系统？",
                        function (c) {
                            if (c) {
                                $
                                        .ajax({
                                            url: '${pageContext.request.contextPath}/userController/logout.action',
                                            type: 'POST',
                                            timeout: 1000,
                                            success: function (result) {
                                                location.href = '${pageContext.request.contextPath}/';
                                            },
                                            error: function () {
                                                location.href = '${pageContext.request.contextPath}/';
                                            }
                                        });
                            }
                        });
    }

    function editCurrentUserPwd() {
        parent.$
                .modalDialog({
                    title: '修改密码',
                    width: 330,
                    height: 280,
                    href: '${pageContext.request.contextPath}/userController/editCurrentUserPwdPage.action',
                    buttons: [{
                        text: '修改',
                        handler: function () {
                            var f = parent.$.modalDialog.handler
                                    .find('#editCurrentUserPwdForm');
                            f.submit();
                        }
                    }]
                });
    }

    function currentUserResource() {
        parent.$
                .modalDialog({
                    title: '我可以访问的资源',
                    width: 300,
                    height: 350,
                    href: '${pageContext.request.contextPath}/userController/currentUserResourcePage.action'
                });
    }
    function openModule(url) {
        var $iframe = $('#panel_main');
        var old_url = $iframe.attr('src');
        if (old_url != url) {
            $iframe.attr('src', url);
        }
    }

</script>
<%--<img id="logoimg" src="style/themes/default.jpg"--%>
<%--style="min-width:681px;cursor:default" />--%>
<%--<div id="sessionInfoDiv"--%>
<%--style="position: absolute; right: 0px; top: 15px;">--%>
<%--<c:if test="${sessionInfo.id != null}" >[<strong>${sessionInfo.name}</strong>]，欢迎你！您使用[<strong>${sessionInfo.ip}</strong>]IP登录！</c:if>--%>
<%--</div>--%>
<%--<div style="position: absolute; right: 0px; bottom: 0px;">--%>
<%--<a href="#" class="easyui-menubutton"--%>
<%--data-options="menu:'#layout_north_kzmbMenu',iconCls:'cog'">控制面板</a> <a--%>
<%--href="javascript:void(0)" onclick="logoutFun()"--%>
<%--class="easyui-linkbutton" data-options="iconCls:'exit',plain:true">退出</a>--%>
<%--</div>--%>
<%--<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">--%>
<%--<div onclick="editCurrentUserPwd();" data-options="iconCls:'lock_edit'">修改密码</div>--%>
<%--<div onclick="currentUserResource();" data-options="iconCls:'user'">我的权限</div>--%>
<%--</div>--%>

<style type="text/css">
    .module_icon {
        width: 19px;
        height: 19px;
        /*vertical-align: -5px;*/
    }
</style>
<div style="background: rgb(38,150,203); height: 59px">
    <div style="float: left;width: 36%;height: 59px;min-width: 460px;">
        <%--<img src="${pageContext.request.contextPath}/style/images/icons/txt_logo.png"--%>
             <%--style="margin:8px 0px 0px 5px">--%>
        <h2 style="color:white;margin: 5px;">智能无线静荷载试验检测云平台</h2>
    </div>
    <div style="float: left;width: 48%;height: 59px;min-width: 500px;">

        <ul class="topul">
            <li>
                <a href="javascript:openModule('${pageContext.request.contextPath}/moduleOverviewController/index.action');"
                   id="16" class="menus"><img
                        src="${pageContext.request.contextPath}/style/images/icons/icon_monitor.png"
                        class="module_icon">工程概览</a>
            </li>

            <li>
                <a href="javascript:openModule('${pageContext.request.contextPath}/moduleProjectController/index.action');"
                   id="19" class="menus"><img
                        src="${pageContext.request.contextPath}/style/images/icons/icon_report.png"
                        class="module_icon">工程管理</a>
            </li>
            <%--<li><a href="javascript:openModule('${pageContext.request.contextPath}/moduleInspectDataController/index.action');"--%>
                   <%--id="1" class="menus onnav"><img--%>
                    <%--src="${pageContext.request.contextPath}/style/images/icons/icon_about.png"--%>
                    <%--class="module_icon">检测信息</a>--%>
            <%--</li>--%>
            <%--<li><a href="javascript:;" id="15" class="menus"><img--%>
                    <%--src="${pageContext.request.contextPath}/style/images/icons/icon_user.png"--%>
                    <%--class="module_icon">用户管理</a>--%>
            <%--</li>--%>
            <li><a href="javascript:openModule('${pageContext.request.contextPath}/moduleBasicController/index.action')"
                   id="18"
                   class="menus"><img src="${pageContext.request.contextPath}/style/images/icons/icon_report.png"
                                      class="module_icon">基础信息</a>
            </li>

            <li><a href="javascript:;" id="6" class="menus"><img
                    src="${pageContext.request.contextPath}/style/images/icons/icon_config.png"
                    class="module_icon">平台设置</a>
            </li>



        </ul>

    </div>
    <div style="float: right;width: 15%;height: 59px;">
        <div style="margin-top: 10px;text-align: right;margin-right: 5px;">

            <div>当前用户：
                <c:if test="${sessionInfo.id != null}">
                    ${sessionInfo.name}
                </c:if>
            </div>

            <div style="margin-top: 10px">
                <a href="javascript:;" onclick=""
                   style="color: white;"><img
                        src="${pageContext.request.contextPath}/style/images/icons/icon_user_sm.png"
                        style="width: 18px;height: 18px;vertical-align: -5px;">账号信息</a>&nbsp;
                <a href="javascript:;" onclick="logoutFun();" style="color: white;"><img
                        src="${pageContext.request.contextPath}/style/images/icons/icon_logout.png"
                        style="width: 18px;height: 18px;vertical-align: -5px;">退出系统</a>
            </div>
        </div>
    </div>


</div>
