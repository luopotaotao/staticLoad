<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>智能无线静荷载试验检测云平台</title>
</head>
<body>

<div id="index_layout">
    <div data-options="region:'north'"
         style="height: 59px; overflow: hidden;background:#b6c6f5 url('<c:url value="/resources/style/themes/default.jpg"/>') repeat-y"
         id="bannerbg">
        <jsp:include page="./WEB-INF/layout/north.jsp"></jsp:include>
    </div>

    <div data-options="region:'center'" style="overflow: hidden;width: 100%;height: 100%">
        <iframe id="panel_main" style="height: 100%;width: 100%;" scrolling="no"
                src="<c:url value="/baseController/portal/index"/>"></iframe>
    </div>


    <div data-options="region:'south',border:false"
         style="height: 15px; overflow: hidden;">
        <jsp:include page="./WEB-INF/layout/south.jsp"></jsp:include>
    </div>
</div>

<div id="index_tabsMenu" style="width: 120px; display: none;">
    <div title="refresh" data-options="iconCls:'reload'">刷新</div>
    <div class="menu-sep"></div>
    <div title="close" data-options="iconCls:'delete'">关闭</div>
    <div title="closeOther" data-options="iconCls:'delete'">关闭其他</div>
    <div title="closeAll" data-options="iconCls:'delete'">关闭所有</div>
</div>
<jsp:include page="inc.jsp"></jsp:include>
<script type="text/javascript">
    var index_tabs;
    var index_tabsMenu;
    var index_layout;
    $(function () {
        index_layout = $('#index_layout').layout({
            fit: true
        });


        index_tabs = $('#index_tabs').tabs({
            fit: true,
            border: false,
            onContextMenu: function (e, title) {
                e.preventDefault();
                index_tabsMenu.menu('show', {
                    left: e.pageX,
                    top: e.pageY
                }).data('tabTitle', title);
            },
            tools: [{
                iconCls: 'reload',
                handler: function () {
                    var href = index_tabs.tabs('getSelected').panel('options').href;
                    if (href) {/*说明tab是以href方式引入的目标页面*/
                        var index = index_tabs.tabs('getTabIndex', index_tabs.tabs('getSelected'));
                        index_tabs.tabs('getTab', index).panel('refresh');
                    } else {/*说明tab是以content方式引入的目标页面*/
                        var panel = index_tabs.tabs('getSelected').panel('panel');
                        var frame = panel.find('iframe');
                        try {
                            if (frame.length > 0) {
                                for (var i = 0; i < frame.length; i++) {
                                    frame[i].contentWindow.document.write('');
                                    frame[i].contentWindow.close();
//									frame[i].src = frame[i].src;
                                }
                                if (navigator.userAgent.indexOf("MSIE") > 0) {// IE特有回收内存方法
                                    try {
                                        CollectGarbage();
                                    } catch (e) {
                                    }
                                }
                            }
                        } catch (e) {
                        }
                    }
                }
            }, {
                iconCls: 'cancel',
                handler: function () {
                    var index = index_tabs.tabs('getTabIndex', index_tabs.tabs('getSelected'));
                    var tab = index_tabs.tabs('getTab', index);
                    if (tab.panel('options').closable) {
                        index_tabs.tabs('close', index);
                    } else {
                        $.messager.alert('提示', '[' + tab.panel('options').title + ']不可以被关闭！', 'error');
                    }
                }
            }]
        });

        index_tabsMenu = $('#index_tabsMenu').menu({
            onClick: function (item) {
                var curTabTitle = $(this).data('tabTitle');
                var type = $(item.target).attr('title');

                if (type === 'refresh') {
                    index_tabs.tabs('getTab', curTabTitle).panel('refresh');
                    return;
                }

                if (type === 'close') {
                    var t = index_tabs.tabs('getTab', curTabTitle);
                    if (t.panel('options').closable) {
                        index_tabs.tabs('close', curTabTitle);
                    }
                    return;
                }

                var allTabs = index_tabs.tabs('tabs');
                var closeTabsTitle = [];

                $.each(allTabs, function () {
                    var opt = $(this).panel('options');
                    if (opt.closable && opt.title != curTabTitle && type === 'closeOther') {
                        closeTabsTitle.push(opt.title);
                    } else if (opt.closable && type === 'closeAll') {
                        closeTabsTitle.push(opt.title);
                    }
                });

                for (var i = 0; i < closeTabsTitle.length; i++) {
                    index_tabs.tabs('close', closeTabsTitle[i]);
                }
            }
        });
    });
</script>
</body>
</html>