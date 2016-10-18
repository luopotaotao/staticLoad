<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>智能无线静荷载试验检测云平台</title>
    <jsp:include page="../../layout/common.jsp"></jsp:include>
    <style type="text/css">
        .info_form_hidden {
            display: none;
        }
    </style>
</head>
<body class="easyui-layout">
<div data-options="region:'west',split:true" title="工程列表" style="width: 200px; overflow: hidden;">
    <div class="easyui-panel" style="padding:5px">
        <ul id="tree_menu"></ul>
    </div>
    <div id="project_mm_project" class="easyui-menu" style="width:120px;">
        <div class="menu_item" onclick="$.project.addProject()" data-options="iconCls:'icon-add'">新建工程</div>
        <div class="menu-sep"></div>
        <div class="menu_item" onclick="$.project.addScheme()" data-options="iconCls:'icon-add'">添加方案</div>
        <div class="menu_item_remove" onclick="$.project.remove()" data-options="iconCls:'icon-remove'">删除工程
        </div>
        <div class="menu-sep"></div>
        <div class="menu_item" onclick="$.project.expandNode()">展开</div>
        <div class="menu_item" onclick="">收起</div>
    </div>
    <div id="project_mm_scheme" class="easyui-menu" style="width:120px;">
        <div class="menu_item" onclick="$.project.addPlan()" data-options="iconCls:'icon-add'">添加计划</div>
        <div class="menu_item_remove" onclick="$.project.remove()" data-options="iconCls:'icon-remove'">删除方案</div>
        <div class="menu-sep"></div>
        <div class="menu_item" onclick="operate('expand')">展开</div>
        <div class="menu_item" onclick="operate('collapse')">收起</div>
    </div>
    <div id="project_mm_plan" class="easyui-menu" style="width:120px;">
        <div class="menu_item_remove" onclick="$.project.linkData()" data-options="iconCls:'icon-remove'">关联数据</div>
        <div class="menu_item_remove" onclick="$.project.remove()" data-options="iconCls:'icon-remove'">删除计划</div>
    </div>
</div>
<div id="tt" class="easyui-panel" data-options="region:'center'" style="width: 1000px;height: 500px">
    <div class="info_form_hidden">
        <form class="easyui-form" method="post" data-options="novalidate:true"
              action="${baseUrl}/post.action">

            <div style="margin-bottom:20px;display: none">
                <input class="easyui-textbox" name="id" style="width:500px" data-options="label:'工程编号:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="code" style="width:250px"
                       data-options="label:'工程编码:',labelAlign:'right',required:true">
                <input class="easyui-textbox" name="name" style="width:250px"
                       data-options="label:'工程名称:',labelAlign:'right'">
            </div>
            <div style="margin-bottom:20px">
                <select id="project_province_id" class="easyui-combobox" name="province.id" style="width:250px"
                        data-options="label:'所在省份:',
            labelAlign:'right',
            url:'${pageContext.request.contextPath}/moduleBasicAreaController/area/0.action',
            method:'get',
            valueField: 'id',
            textField: 'text',
            onSelect:function(rec){
                var $city = $('#project_city_id');
                $city.combobox('clear');
                $city.combobox('reload','${pageContext.request.contextPath}/moduleBasicAreaController/area/'+rec.id+'.action');
            }
            ">

                </select>
                <select id="project_city_id" class="easyui-combobox" name="city.id" style="width:250px"
                        data-options="label:'所在城市:',labelAlign:'right', method:'get',valueField: 'id',textField: 'text'">
                </select>
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="address" style="width:500px"
                       data-options="label:'具体地址:',labelAlign:'right'">
            </div>
            <div style="margin-bottom:20px;display: none">
                <input id="project_input_lat" class="easyui-textbox" name="lat" style="width:100%"
                       data-options="label:'纬度:'">
            </div>
            <div style="margin-bottom:20px;display: none">
                <input id="project_input_lng" class="easyui-textbox" name="lng" style="width:100%"
                       data-options="label:'经度:'">
            </div>
            <div style="margin-bottom:20px">
                <input id="project_select_coordinate" class="easyui-textbox" style="width:250px;height:32px;">
                <a id="view_map" class="easyui-linkbutton" style="width: 165px; height: 30px;margin-left:85px;"
                   data-options="iconCls:'icon-search',
            onClick:function () {
                var id = $('form').eq(0).find('input[name=\'id\']').val();
            top.openModule('${pageContext.request.contextPath}/moduleOverviewController/index.action?project_id='+id);
            }
">查看地图</a>
            </div>
            <div style="margin-bottom:20px">
                <input id="project_select_constructor" class="easyui-textbox select" name="constructor.id"
                       style="width:250px"
                       data-options="label:'建设单位:',labelAlign:'right',required:true,editable:false,buttonText:'选择',
                   buttonIcon:'icon-search'" url="${pageContext.request.contextPath}/moduleBasicCompanyController/partial.action">
                <input id="project_select_builder" class="easyui-textbox select" name="builder.id" style="width:250px"
                       data-options="label:'施工单位:',labelAlign:'right',required:true,editable:false,buttonText:'选择',
                   buttonIcon:'icon-search'" url="${pageContext.request.contextPath}/moduleBasicCompanyController/partial.action">

            </div>
            <div style="margin-bottom:20px">
                <input id="project_select_inspector" class="easyui-textbox select" name="inspector.id"
                       style="width:250px"
                       data-options="label:'监理单位:',labelAlign:'right',required:true,editable:false,buttonText:'选择',
                   buttonIcon:'icon-search'" url="${pageContext.request.contextPath}/moduleBasicCompanyController/partial.action">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="note" style="width:500px"
                       data-options="label:'备注信息:',labelAlign:'right'">
            </div>
        </form>
    </div>
    <div class="info_form_hidden">
        <form class="easyui-form" method="post" data-options="novalidate:true"
              action="${baseUrl}/post.action">
            <div style="margin-bottom:20px;display: none">
                <input class="easyui-textbox" name="id" style="width:500px" data-options="label:'编号:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="name" style="width:500px"
                       data-options="label:'方案名称:',labelAlign:'right',required:true">
            </div>
            <div style="margin-bottom:20px">
                <select class="easyui-combobox" data-options="editable:false,labelAlign:'right'" name="basement_lev"
                        label="低级基础设计等级:"
                        style="width:500px">
                    <option value="1">甲级</option>
                    <option value="2">乙级</option>
                    <option value="3">丙级</option>
                </select>
            </div>
            <div style="margin-bottom:20px">
                <select class="easyui-combobox" data-options="editable:false,labelAlign:'right'" name="safety_lev"
                        label="建筑安全等级:"
                        style="width:500px">
                    <option value="1">一级</option>
                    <option value="2">二级</option>
                    <option value="3">三级</option>
                </select>
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-numberbox" name="pile_count" style="width:500px"
                       data-options="label:'总桩数:',labelAlign:'right',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input id="project_scheme_institution" class="easyui-textbox select" name="institution.id"
                       style="width:500px"
                       data-options="label:'检测单位:',labelAlign:'right',required:true,editable:false,buttonText:'选择',
                   buttonIcon:'icon-search'" url="${pageContext.request.contextPath}/moduleInspectSchemeController/selectInstitution.action">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="code" style="width:500px"
                       data-options="label:'检测方案审批表:',labelAlign:'right',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="name" style="width:500px"
                       data-options="label:'检测方案附件:',labelAlign:'right'">
            </div>
            <div style="margin-bottom:20px">
                <div style="margin-bottom:20px">
                    <select id="inspectItem_id" class="easyui-combobox" name="inspectItem.id" style="width:500px"
                            data-options="label:'检测项目:',
            labelAlign:'right',
            url:'${pageContext.request.contextPath}/moduleBasicInspectItemController/comboList.action',
            method:'get',
            valueField: 'id',
            textField: 'name'
            ">
                    </select>
                </div>
            </div>
        </form>
    </div>
    <div class="easyui-tabs info_form_hidden" style="width:100%;height:100%;"
         data-options="onSelect:function(title,index){
            if(index==1){
                if(!$(this).data('inited')){
                try{
                    $(this).data('inited',true);
                    $('#project_scheme_plan_show_data_div').panel('refresh');
                    }catch(e){
                        console.log(e);
                    }
                }
            }
         }">
        <div title="检测计划" style="padding:20px">
            <form class="easyui-form" method="post" data-options="novalidate:true"
                  action="${baseUrl}/post.action">
                <div style="margin-bottom:20px;display: none">
                    <input class="easyui-textbox" name="id" style="width:500px"
                           data-options="label:'编号:',required:true">
                </div>
                <div style="margin-bottom:20px">
                    <input class="easyui-textbox" name="name" style="width:500px"
                           data-options="label:'计划名称:',labelAlign:'right',required:true">
                </div>
                <div style="margin-bottom:20px">
                    <input id="project_scheme_plan_inspector" class="easyui-textbox select-inspector"
                           name="inspector.id"
                           style="width:500px"
                           data-options="label:'检测负责人:',labelAlign:'right',required:true,editable:false,buttonText:'选择',
                   buttonIcon:'icon-search'">
                </div>
                <div style="margin-bottom:20px">
                    <input id="project_scheme_plan_equipment" class="easyui-textbox select" name="equipment.id"
                           style="width:500px"
                           data-options="label:'检测设备:',labelAlign:'right',required:true,editable:false,buttonText:'选择',
                   buttonIcon:'icon-search'" url="${pageContext.request.contextPath}/moduleInspectSchemeController/selectProject.action">
                </div>
                <div style="margin-bottom:20px">
                    <input name="start_time" style="width:500px" type="text" class="easyui-datebox"
                           data-options="label:'开始日期:',labelAlign:'right',required:true,editable:false">
                </div>
                <div style="margin-bottom:20px">
                    <input name="end_time" style="width:500px" type="text" class="easyui-datebox"
                           data-options="label:'结束日期:',labelAlign:'right',required:true,editable:false">
                </div>
                <div style="margin-bottom:20px">
                    <input id="project_scheme_plan_majorInspector" class="easyui-textbox select"
                           name="majorInspector.id"
                           style="width:500px"
                           data-options="label:'主检人:',labelAlign:'right',required:true,editable:false,buttonText:'选择',
                   buttonIcon:'icon-search'">
                </div>
                <div style="margin-bottom:20px">
                    <input id="project_scheme_plan_assistantInspector" class="easyui-textbox select"
                           name="assistantInspector.id" style="width:500px"
                           data-options="label:'副检人:',labelAlign:'right',required:true,editable:false,buttonText:'选择',
                   buttonIcon:'icon-search'">
                </div>

                <div style="margin-bottom:20px">
                    <div style="margin-bottom:20px">
                        <select id="inspect_method" class="easyui-combobox" name="inspectMethods" style="width:500px"
                                data-options="label:'检测项目:',
            labelAlign:'right',
            method:'get',
            valueField: 'id',
            textField: 'name'
            ">
                        </select>
                    </div>
                </div>
            </form>
        </div>
        <div id="project_scheme_plan_show_data_div" title="检测数据" data-options="closable:false" style="overflow:auto">
            <%--<jsp:include page="../module_data/plan_show_data.jsp"/>--%>
        </div>

    </div>
</div>

<script>
    $(function () {
        var baseUrl = '${pageContext.request.contextPath}/${baseUrl}';

        //初始化工程编辑内容
        $('#project_select_coordinate').textbox({
            label: '经度纬度:',
            labelAlign: 'right',
            buttonText: '选择',
            buttonAlign: 'right',
            buttonIcon: 'icon-search',
            prompt: '经纬度',
            editable: false,
            onClickButton: function () {
                var _this = this;
                selectCoordinate(function (data) {
                    var str_arr = [
                        data.lng,
                        data.lat
                    ];
                    $(_this).textbox('setText', str_arr.join(','));
                    $('#project_input_lat').textbox('setValue', data.lat);
                    $('#project_input_lng').textbox('setValue', data.lng);
                });
            }
        });
        var $tree_menu = $('#tree_menu');
        initUI();
        var project_id = ${project_id};
        function initUI() {
            $tree_menu.tree({
                url: '${pageContext.request.contextPath}/moduleProjectManageController/tree.action',
                method: 'get',
                idField: 'id',
                textField: 'name',
                animate: true,
                onSelect: function (node) {
                    showInfo(node.level, node);
                },
                onLoadSuccess:function (node, data) {
                    if($.isNumeric(project_id)){
                        var node = $('#tree_menu').tree('find',project_id);
                        $(this).tree('select',node.target);
                    }
                },
                onContextMenu: function (e, node) {
                    e.preventDefault();
                    $(this).tree('select', node.target);
                    if (node) {
                        var $mm = null;
                        switch (node.level) {
                                //工程节点
                            case 0:
                                $mm = $('#project_mm_project');
                                break;
                                //方案节点
                            case 1:
                                $mm = $('#project_mm_scheme');
                                break;
                                //计划节点
                            case 2:
                                $mm = $('#project_mm_plan');
                                break;
                        }
                        $mm.menu('show', {
                            left: e.pageX,
                            top: e.pageY
                        });
                    }
                }
            });

        }

        function addProject() {
            showAddDialog({
                title: '添加工程'
            }, '${pageContext.request.contextPath}/moduleProjectManageController/addProject.action');
        }

        function showProject(data) {
            $('#project_province_id').combobox('select', data.province.id);
            $('#project_city_id').combobox('select', data.city.id);
            $('#project_select_coordinate').textbox('setText', [data.lng, data.lat].join(','));
            setValues('project_select_', ['constructor', 'builder', 'inspector'], data);
        }

        function addScheme() {
            var node = getNode();
            showAddDialog({
                title: '添加方案',
                parent: {name: 'project.id', value: node.id}
            }, '${pageContext.request.contextPath}/moduleProjectManageController/addScheme.action');
        }

        function showScheme(data) {
            $('#project_scheme_institution').textbox('setText', data.institution ? data.institution.name : '');
        }

        function addPlan() {
            var node = getNode();
            debugger;
            showAddDialog({
                title: '添加计划',
                params: [{name: 'inspectScheme.id', value: node.id}, {
                    name: 'institution.id',
                    value: node.institution ? node.institution.id : null
                }]
            }, '${pageContext.request.contextPath}/moduleProjectManageController/addPlan.action');
        }


        function showPlan(data) {
            $('#project_scheme_plan_show_data_div').panel('refresh','${pageContext.request.contextPath}/moduleInspectPlanController/showData/'+data.id+'.action');
            if ($.isNumeric(data.start_time)) {
                data.start_time = new Date(data.start_time);
            }
            if ($.isNumeric(data.end_time)) {
                data.end_time = new Date(data.end_time);
            }
            setValues('project_scheme_plan_', ['assistantInspector', 'inspector', 'majorInspector', 'equipment'], data);
        }
        function linkData() {
            var node = getNode();
            var plan_id = node.id;
            var url = '${pageContext.request.contextPath}/moduleInspectPlanController/selectData/'+plan_id+'.action';
            selectChild(url, function (data) {
                console.log(JSON.stringify(data));
                $.ajax({
                    url:'${pageContext.request.contextPath}/moduleInspectDataController/linkData/'+plan_id+'.action',
                    type:'post',
                    dataType:'json',
                    data:JSON.stringify(data),
                    contentType: "application/json"
                }).done(function (ret) {
                    console.log(ret);
                    $('#project_scheme_plan_show_data_div').panel('refresh','${pageContext.request.contextPath}/moduleInspectPlanController/showData/'+plan_id+'.action');
                }).fail(function () {
                    $.messager.alert('提示','关联数据失败!');
                });
            });
        }
        function selectChild(url, callback) {
            var $doc = $(document);
            var height = screen.availHeight * 0.6, width = screen.availWidth * 0.6;
            var $div = $('<div/>', {'height': height, width: width});
            $div.dialog({
                title: '请选择',
                closed: false,
                cache: true,
                href: url,
                modal: true,
                buttons: [{
                    text: '确定',
                    handler: function () {
                        if (true || $.isFunction(callback)) {
                            var data = $div.find('#grid').datagrid('getChecked');
                            if (data && data.length > 0) {
                                console.log(data);
                                $div.dialog('close');
                                callback(data);
                            } else {
                                $.messager.alert('提示', '请选择数据!');
                            }
                        }
                    }
                }, {
                    text: '取消',
                    handler: function () {
                        $div.dialog('close');
                    }
                }]
            });
        }
        function setValues(prefix, keys, data) {
            $.each(keys, function (i, key) {
                if (data[key]) {
                    var $input = $(['#', prefix, key].join(''));
                    $input.textbox('setValue', data[key].id)
                    $input.textbox('setText', data[key].name);
                }
            });
        }

        function expandNode(project_id, scheme_id, plan_id) {

        }

        function showInfo(level, obj) {
            var $forms = $('.info_form_hidden');
            $forms.hide();
            var $target = $forms.eq(level);
            $target.css('display', 'block');
            $target.show();
            [showProject, showScheme, showPlan][level](obj);
            $target.form('load', obj);
            console.log(obj);

        }

        function openTab(title, url) {
            var $tt = $('#tt');
            if (!$tt.tabs('exists', title)) {
                var $iframe = $('<iframe/>', {src: url, style: 'width:95%;height:95%;', scrolling: 'no'});
                $tt.tabs('add', {
                    title: title,
                    content: $iframe,
                    closable: true,
                    fit: true,
                    plain: true
                });
            } else {
                $tt.tabs('select', title)
            }
        }

        function showAddDialog(options, url, callback) {
            var height = screen.availHeight * 0.6, width = screen.availWidth * 0.6;
            var $div = $('<div/>', {'height': height, width: width});
            $div.dialog({
                title: options.title,
                closed: false,
                cache: true,
                href: url,
                modal: true,
                buttons: [{
                    text: '确定',
                    handler: function () {
                        $.messager.progress();
                        var $form = $div.find('form');
                        $form.form('submit', {
                            onSubmit: function () {
                                var isValid = $form.form('enableValidation').form('validate');
                                if (!isValid) {
                                    $.messager.progress('close');
                                }
//                                return isValid;//TODO 验证有问题
                                return 1;
                            },
                            success: function (ret) {
                                $.messager.progress('close');
                                ret = $.parseJSON(ret);
                                if (ret && ret.flag) {
                                    $div.dialog('close');
                                    $.messager.alert('提示', '保存成功!');
                                    $('#tree_menu').tree('reload');
                                    if ($.isFunction(callback)) {
                                        callback(ret);
                                    }
                                }
                            }
                        });
                    }
                }, {
                    text: '取消',
                    handler: function () {
                        $div.dialog('close');
                    }
                }],
                onLoad: function () {
                    debugger;
                    if (options.params) {
                        var p = options.params;
                        p = $.isPlainObject(p) ? [p] : p;
                        $.each(p, function (i, item) {
                            $div.find('input[name="' + item.name + '"]').val(item.value);
                        });
                    }

                }
            });
        }

        function getNode() {
            return $tree_menu.tree('getSelected');
        }

        function remove() {
            var node = getNode();
            var msg = ['是否确认删除:', node.text, '?'].join('');
            var url = [
                '${pageContext.request.contextPath}/moduleProjectManageController/delete.action',
                '${pageContext.request.contextPath}/moduleInspectSchemeController/delete.action',
                '${pageContext.request.contextPath}/moduleInspectPlanController/delete.action'
            ][node.level];
            $.messager.confirm('提示', msg, function (r) {
                if (r) {
                    $.ajax({
                        url: url,
                        type: 'post',
                        dataType: 'json',
                        data: {ids: [node.id]}
                    }).done(function (ret) {
                        if (ret && ret.flag) {
                            $.messager.alert('提示', '删除成功!');
                            $('#tree_menu').tree('reload');
                        } else {
                            $.messager.alert('提示', '删除失败!');
                        }
                    }).fail(function () {
                        $.messager.alert('提示', '删除失败!');
                    });
                }
            });
        }

        $.extend({
            project: {
                addProject: addProject,
                showProject: showProject,
                addScheme: addScheme,
                showScheme: showScheme,
                addPlan: addPlan,
                showPlan: showPlan,
                linkData:linkData,
                expandNode: expandNode,
                remove: remove,
            }
        })
    });
</script>

</body>
</html>