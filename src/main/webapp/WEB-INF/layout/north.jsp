<%@ page language="java" pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" charset="utf-8">
    $(function () {

        $('#bannerbg').css('background-color', '#b6c6f5');
        $('#bannerbg').css('background-image', 'url(style/themes/default.jpg)');
        $('#bannerbg').css('background-repeat', 'repeat-y');
        $('#logoimg').attr("src", "style/themes/opentsm_logo_d.png");
        $('#bannerbg').css('background-position', '50% 0%');
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


<div style="background: rgb(38,150,203); height: 79px">
    <div style="float: left;width: 36%;height: 79px;min-width: 460px;">
        <img src="style/images/icons/txt_logo.png" style="margin:18px 0px 0px 5px">
    </div>
    <div style="float: left;width: 38%;height: 79px;min-width: 500px;">

        <ul class="topul">

            <li><a href="javascript:;" id="16" class="menus"><img src="style/images/icons/icon_monitor.png"
                                                                  style="width: 19px;height: 19px;vertical-align: -5px;">安全监测</a>
            </li>

            <li><a href="javascript:;" id="19" class="menus"><img src="style/images/icons/icon_report.png"
                                                                  style="width: 19px;height: 19px;vertical-align: -5px;">方案报告</a>
            </li>

            <li><a href="javascript:;" id="15" class="menus"><img src="style/images/icons/icon_user.png"
                                                                  style="width: 19px;height: 19px;vertical-align: -5px;">用户管理</a>
            </li>
            <li><a href="javascript:;" id="18" class="menus"><img src="style/images/icons/icon_report.png"
                                                                  style="width: 19px;height: 19px;vertical-align: -5px;">基础信息</a>
            </li>

            <li><a href="javascript:;" id="6" class="menus"><img src="style/images/icons/icon_config.png"
                                                                 style="width: 19px;height: 19px;vertical-align: -5px;">平台设置</a>
            </li>

            <li><a href="javascript:;" id="1" class="menus onnav"><img src="style/images/icons/icon_about.png"
                                                                       style="width: 19px;height: 19px;vertical-align: -5px;">关于平台</a>
            </li>

        </ul>

    </div>
    <div style="float: right;width: 25%;height: 79px;">
        <div style="margin-top: 10px;text-align: right;margin-right: 5px;">

            <div>当前用户：北京联睿科科技有限公司</div>
            <c:if test="${sessionInfo.id != null}" ><div>${sessionInfo.name}</div></c:if>
            <div style="margin-top: 10px">
                上次登录2016-08-23 19:54:07
                <a href="javascript:;" onclick=""
                   style="color: white;"><img src="style/images/icons/icon_user_sm.png" style="width: 18px;height: 18px;vertical-align: -5px;">账号信息</a>&nbsp;
                <a href="javascript:;" onclick="logoutFun();" style="color: white;"><img src="style/images/icons/icon_logout.png"
                                                                                   style="width: 18px;height: 18px;vertical-align: -5px;">退出系统</a>
            </div>
        </div>
    </div>


</div>