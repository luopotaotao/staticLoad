<%@ page language="java" pageEncoding="UTF-8"
         contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
        timeout1 = setInterval(monitoronline, 60000);
        function monitoronline() {
            $.ajax({
                url: "${pageContext.request.contextPath}/monitorController/monitoronline.action",
                timeout: 60000,
                success: function () {

                },
                error: function () {
                    if (count < 2) {
                        count++;
                        parent.$.messager.alert('操作提示', "请求服务器失败...");
                    }
                    else {
                        clearInterval(timeout1);
                        window.location = "${pageContext.request.contextPath}";
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
    function showUserInfo() {
        $.ajax({
            url:'${pageContext.request.contextPath}/userController/userInfo.action',
            type:'get',
            dataType:'json'
        }).done(function (ret) {
            $('#ff_user_info').form('load',ret);
            $('#dlg_user_info').dialog('open');
        }).fail(function () {
            $.messager.alert('提示','获取数据失败,请重新尝试或联系管理员!');
        });
    }
    <%--function showAbout() {--%>
        <%--$.ajax({--%>
            <%--url:'${pageContext.request.contextPath}/userController/platformInfo.action',--%>
            <%--type:'get',--%>
            <%--dataType:'json'--%>
        <%--}).done(function (ret) {--%>
            <%--$('#about_dept_name').text(ret.about_name);--%>
            <%--$('#about_dept_content').text(ret.about_content);--%>
            <%--$('#dlg_about').dialog('open');--%>
        <%--}).fail(function () {--%>
            <%--$.messager.alert('提示','获取数据失败,请重新尝试或联系管理员!');--%>
        <%--});--%>
    <%--}--%>
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
    function switchDept(id) {
        var base_url = '${pageContext.request.contextPath}/logo/';
        var href = 'userController/switchDept/' + id + '.action';
        $.ajax({
            url: href,
            type: 'get',
            dataType: 'json'
        }).done(function (ret) {
            if (ret.flag) {
                var logo = null;
                if(ret.logo){
                    logo = '<img src="'+base_url+ret.logo+'">'
                }else{
                    logo = '<h2 style="color:white;margin: 5px;">智能无线静荷载试验检测云平台</h2>';
                }
                $('#logo_div').empty().append(logo);
                openModule('${pageContext.request.contextPath}/moduleOverviewController/index.action');
            }
        }).fail(function () {
            $.messager.alert('提示', '操作失败，请重新尝试或联系管理员！');
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

<style type="text/css">
    .module_icon {
        width: 19px;
        height: 19px;
        /*vertical-align: -5px;*/
    }
</style>
<div style="background: rgb(38,150,203); height: 59px">
    <div id="logo_div" style="float: left;width: 36%;height: 59px;max-width: 460px;">
        <c:choose>
            <c:when test="${sessionInfo.dept.logo eq ''}"><h2 style="color:white;margin: 5px;">
                智能无线静荷载试验检测云平台</h2></c:when>
            <c:otherwise><img src="${pageContext.request.contextPath}/logo/${sessionInfo.dept.logo}"></c:otherwise>
        </c:choose>
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
            <li><a href="javascript:openModule('${pageContext.request.contextPath}/moduleBasicController/index.action')"
                   id="18"
                   class="menus"><img src="${pageContext.request.contextPath}/style/images/icons/icon_config.png"
                                      class="module_icon">平台设置</a>
            </li>
            <li><a href="javascript:openModule('${pageContext.request.contextPath}/userController/platformInfo.action')"
                   id="20"
                   class="menus"><img src="${pageContext.request.contextPath}/style/images/icons/icon_about.png"
                                      class="module_icon">关于平台</a>
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
                <a href="javascript:;" onclick="showUserInfo()"
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

<div id="dlg_user_info" class="easyui-dialog" style="width:100%;max-width:400px;padding:30px 60px;"
     data-options="
            title: '账号信息',
            closed: true,
            modal: true,
            draggable: false,
            //iconCls: 'icon-add',
            buttons: [{
            text: '确定',
            handler: null
            },{
            text: '重置密码',
            handler: null
            }]
        ">
    <form id="ff_user_info" class="easyui-form" method="post" data-options="novalidate:true"
          action="../${baseUrl}/post.action">
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="name" style="width:100%"
                   data-options="label:'账号:',editable:false">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="email" style="width:100%"
                   data-options="label:'Email:',editable:false">
        </div>

        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="password" style="width:100%"
                   data-options="label:'原始密码:',required:true">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="new_password" style="width:100%"
                   data-options="label:'新密码:',required:true" validType="length[4,32]" id="new_password" type="password">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="role" style="width:100%"
                   data-options="label:'确认密码:',required:true" type="password"
                   validType="equalTo['#new_password']" invalidMessage="两次输入密码不匹配">
        </div>
    </form>
</div>

