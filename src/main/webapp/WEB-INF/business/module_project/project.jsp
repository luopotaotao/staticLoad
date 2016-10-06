<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>模板支撑智能安全监测系统</title>
    <jsp:include page="../../layout/common.jsp"></jsp:include>
</head>
<body style="width:100%">

<div class="easyui-panel" style="width:30%">
    <input class="easyui-searchbox"
           data-options="prompt:'请输入单位名称',menu:'#mm',searcher:function(val,typ){$('#dg').datagrid('load',{typ:typ,name:val});}"
           style="width:100%">
    <div id="mm">
        <div data-options="name:'0'">全&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部</div>
        <div data-options="name:'1'">建设单位</div>
        <div data-options="name:'2'">施工单位</div>
        <div data-options="name:'3'">监理单位</div>
    </div>
</div>

<table id="dg" style="width:100%"></table>
<div id="dlg_edit" style="width:80%;max-width:800px;padding:10px 60px;">
    <form id="ff" class="easyui-form" method="post" data-options="novalidate:true" action="${baseUrl}/post.action">
        <div style="margin-bottom:20px;display: none">
            <input class="easyui-textbox" name="id" style="width:100%" data-options="label:'企业编号:',required:true">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="code" style="width:45%"
                   data-options="label:'工程编码:',labelAlign:'right',required:true">
            <input class="easyui-textbox" name="name" style="width:45%"
                   data-options="label:'工程名称:',labelAlign:'right'">
        </div>
        <div style="margin-bottom:20px">
            <select id="province_id" class="easyui-combobox" name="province.id" style="width:45%"
                    data-options="label:'所在省份:',
            labelAlign:'right',
            url:'/moduleBasicAreaController/area/0.action',
            method:'get',
            valueField: 'id',
            textField: 'text',
            onSelect:function(rec){
                var $city = $('#city_id');
                $city.combobox('clear');
                $city.combobox('reload','/moduleBasicAreaController/area/'+rec.id+'.action');
            }
            ">

            </select>
            <select id="city_id" class="easyui-combobox" name="city.id" style="width:45%"
                    data-options="label:'所在城市:',labelAlign:'right', method:'get',valueField: 'id',textField: 'text'">
            </select>
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="address" style="width:90%"
                   data-options="label:'具体地址:',labelAlign:'right'">
        </div>
        <div style="margin-bottom:20px;display: none">
            <input id="input_lat" class="easyui-textbox" name="lat" style="width:100%"
                   data-options="label:'纬度:'">
        </div>
        <div style="margin-bottom:20px;display: none">
            <input id="input_lng" class="easyui-textbox" name="lng" style="width:100%"
                   data-options="label:'经度:'">
        </div>
        <div style="margin-bottom:20px">
            <input id="select_coordinate" class="easyui-textbox" style="width:45%;height:32px;">
            <input class="easyui-textbox select" name="constructor_id" style="width:45%"
                   data-options="label:'建设单位:',labelAlign:'right',required:true,editable:false,buttonText:'选择',
                   buttonIcon:'icon-search'" url="/moduleBasicCompanyController/partial.action">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox select" name="builder_id" style="width:45%"
                   data-options="label:'施工单位:',labelAlign:'right',required:true,editable:false,buttonText:'选择',
                   buttonIcon:'icon-search'" url="/moduleBasicCompanyController/partial.action">

            <input class="easyui-textbox select" name="inspector_id" style="width:45%"
                   data-options="label:'监理单位:',labelAlign:'right',required:true,editable:false,buttonText:'选择',
                   buttonIcon:'icon-search'" url="/moduleBasicCompanyController/partial.action">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="note" style="width:90%"
                   data-options="label:'备注信息:',labelAlign:'right'">
        </div>
    </form>
</div>
<div id="selectCoordinateDiv">
    <div id="map_div"></div>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/baiduMap/map_api.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/baiduMap/AreaRestriction_min.js"></script>
<script>
    console.log('init');
    $(window).on('resize', function () {
        $('#div_map').width(document.body.clientWidth).height(document.body.clientHeight);
    });
    $(function () {
        var map = initializeMap();
        $.extend({
            BaiduMap: {
                getCoordinate: function () {
                    var markers = map.getOverlays();
                    return markers && markers.length > 0 ? markers[0] : null;
                },
                center:function(cityName){
                    map.centerAndZoom(cityName, 9);
                }
            }

        });
        function initializeMap() {
            var $div = $('#map_div');
            var height = Math.floor($(document).height() * 0.81);
            var width = Math.floor($(document).width() * 0.69);
            $div.height(height).width(width);

            var map = new BMap.Map('map_div');
            map.centerAndZoom("银川", 5);
//            map.centerAndZoom(point, 12);                 // 初始化地图，设置中心点坐标和地图级别
            map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
            map.enableContinuousZoom(); //启用地图惯性拖拽，默认禁用
            var controls = [
                new BMap.OverviewMapControl(),//添加默认缩略地图控件
                new BMap.OverviewMapControl({isOpen: true, anchor: BMAP_ANCHOR_TOP_RIGHT}), //右上角，打开
                new BMap.NavigationControl(),//添加默认缩略地图控件
                new BMap.NavigationControl({
                    anchor: BMAP_ANCHOR_BOTTOM_LEFT,
                    type: BMAP_NAVIGATION_CONTROL_PAN
                }),//左下角，仅包含平移按钮
                new BMap.NavigationControl({
                    anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
                    type: BMAP_NAVIGATION_CONTROL_ZOOM
                }),//右下角，仅包含缩放按钮
                new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP, BMAP_HYBRID_MAP]})//2D图，卫星图
            ];
            $.each(controls, function (i, item) {
                map.addControl(item);
            });
            map.addEventListener("click", function (e) {
                var allOverlay = map.getOverlays();
                $.each(allOverlay, function (i, item) {
                    map.removeOverlay(item);
                });
                var marker = new BMap.Marker(e.point);  // 创建标注

                map.addOverlay(marker);
                marker.setAnimation(BMAP_ANIMATION_BOUNCE);
            });
            return map;
        }
    })
    ;
</script>

<script type="text/javascript">
    $(function () {
        var baseUrl = '/';
        $('#dg').datagrid({
            url: '${baseUrl}/query.action',
            method: 'get',
            title: '单位管理',
            iconCls: 'icon-save',
//            width: 700,
            height: $('body').height(),
            fitColumns: true,
            singleSelect: false,
            pagination: true,
            pageSize: 10,
            toolbar: [{
                text: '添加',
                iconCls: 'icon-add',
                handler: function () {
                    showEditDialog();
                }
            }, {
                text: '编辑',
                iconCls: 'icon-edit',
                handler: function () {
                    var rows = $('#dg').datagrid('getChecked');
                    if (!rows || !rows.length) {
                        $.messager.alert('提示', '请选择要编辑的行!');
                        return;
                    }
                    if (rows.length > 1) {
                        $.messager.alert('提示', '只能选择一行进行编辑!');
                        return;
                    } else {
                        showEditDialog(rows[0]);
                    }
                }
            }, {
                text: '删除',
                iconCls: 'icon-remove',
                handler: function () {
                    var rows = $('#dg').datagrid('getChecked');
                    if (!rows || !rows.length) {
                        $.messager.alert('提示', '请选择要删除的行!');
                        return;
                    }
                    $.messager.confirm('提示', '是否确定删除这' + rows.length + '条数据?', function (r) {
                        if (r) {
                            remove($.map(rows, function (row) {
                                return row.id;
                            }), function () {
                                $('#dg').datagrid('reload');
                            });
                        }
                    });
                }
            }],
            columns: [[
                {field: 'ck', checkbox: true},
                {field: 'id', title: 'ID', hidden: true},
                {field: 'code', title: '工程编码', width: 80},
                {field: 'name', title: '工程名称', width: 80},
                {field: 'province_id', title: '所在省份id', width: 80},
                {field: 'city_id', title: '所在市id', width: 80},
                {field: 'address', title: '具体地址', width: 80},
                {field: 'lat', title: '纬度', width: 80},
                {field: 'lng', title: '经度', width: 80},
                {field: 'constructor_id', title: '建设单位', width: 80},
                {field: 'builder_id', title: '施工单位', width: 80},
                {field: 'inspector_id', title: '监理单位', width: 80}

            ]],
            onHeaderContextMenu: function (e, field) {
                e.preventDefault();
                if (!$.cmenu) {
                    createColumnMenu();
                }
                $.cmenu.menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            }
        });

        function createColumnMenu() {
            $.cmenu = $('<div/>').appendTo('body');
            $.cmenu.menu({
                onClick: function (item) {
                    if (item.iconCls == 'icon-ok') {
                        $('#dg').datagrid('hideColumn', item.name);
                        $.cmenu.menu('setIcon', {
                            target: item.target,
                            iconCls: 'icon-empty'
                        });
                    } else {
                        $('#dg').datagrid('showColumn', item.name);
                        $.cmenu.menu('setIcon', {
                            target: item.target,
                            iconCls: 'icon-ok'
                        });
                    }
                }
            });
            var fields = $('#dg').datagrid('getColumnFields');
            for (var i = 0; i < fields.length; i++) {
                var field = fields[i];
                var col = $('#dg').datagrid('getColumnOption', field);
                $.cmenu.menu('appendItem', {
                    text: col.title,
                    name: field,
                    iconCls: 'icon-ok'
                });
            }
        }

//        $('#province_id').combobox({
//            textField:'id',
//            textField:'text',
//            label:'所在省份:',
//            labelAlign:'right',
//            url:'/moduleBasicAreaController/area/0.action',
//            method:'get',
//            onSelect:function(rec){
//                console.log(rec);
//                $('#city_id').combobox('reload','/moduleBasicAreaController/area/'+rec.id+'.action');
//            }
//
//        });
//        $('#city_id').combobox({
//            label:'所在省份:',
//            labelAlign:'right',
//            url:'/moduleBasicAreaController/area/2.action',
//            method:'get',
//            onSelect:function(rec){
//                console.log(rec);
//                $('#city_id').combobox('reload','/moduleBasicAreaController/area/'+rec.id+'.action');
//            }
//
//        });
        $('input.select').textbox({
            onClickButton: function () {
                var _this = this;
                var url = $(this).attr('url');
                selectChild(url, function (data) {
                    var names = [];
                    var ids = [];
                    $.each(data, function (i, item) {
                        ids.push(item.id);
                        names.push(item.name);
                    });
                    $(_this).textbox('setValue', ids);
                    $(_this).textbox('setText', names);
                });
            }
        });

        function selectChild(url, callback) {
            var $doc = $(document);
            var height = screen.availHeight*0.6, width = screen.availWidth*0.6;
            var $div = $('<div/>', {'height':height, width:width});
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

        $('#select_coordinate').textbox({
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
                        ',',
                        data.lat
                    ];
                    $(_this).textbox('setText', str_arr.join(''));
                    $('#input_lat').textbox('setValue', data.lat);
                    $('#input_lng').textbox('setValue', data.lng);
                });
            }
        });
        function selectCoordinate(callback) {
            var currentCity = $('#city_id').combobox('getText');
            $.BaiduMap.center(currentCity);
            var height = Math.floor($(document).height() * 0.93);
            var width = Math.floor($(document).width() * 0.7);
            var $div = $('#selectCoordinateDiv');
            $div.dialog({
                title: '请选择',
                closed: false,
                cache: false,
//                href: '/moduleProjectManageController/selectCoordinate.action',
                modal: true,
                buttons: [{
                    text: '确定',
                    handler: function () {
                        if (true || $.isFunction(callback)) {
                            var marker = $.BaiduMap.getCoordinate();
                            if (marker) {
                                $div.dialog('close');
                                callback(marker.M);
                                // TODO set 经纬度
                            } else {
                                $.messager.alert('提示', '请点击选择坐标!');
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

        $('#dlg_edit').dialog({
            title: "添加工程",
            closed: true,
            modal: true,
            draggable: false,
            iconCls: 'icon-add',
            buttons: [{
                text: '保存',
                iconCls: 'icon-ok',
                handler: submitForm
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: closeEditDialog
            }]
        })

        function showEditDialog(data) {
            var $ff = $('#ff');
            if (data) {
                $ff.form('load', data);
                $ff.form({url: 'put.action'});
            } else {
                $ff.form({url: 'post.action'});
            }
            $('#dlg_edit').dialog('open');
        }

        function submitForm() {
            $.messager.progress();	// display the progress bar
            $('#ff').form('submit', {
                onSubmit: function () {
                    var isValid = $(this).form('validate');
                    if (!isValid) {
                        $.messager.progress('close');	// hide progress bar while the form is invalid
                    }
                    return isValid;	// return false will stop the form submission
                },
                success: function (data) {
                    $.messager.progress('close');	// hide progress bar while submit successfully
//                    {
//                        "success": true,
//                            "message": "Message sent successfully."
//                    }
                    data = $.parseJSON(data);
                    if (data.flag) {
                        $.messager.alert('提示', '保存成功!');
                        closeEditDialog(true);
                    } else {
                        $.messager.alert('提示', data.message || '保存失败,请检查网络连接或者权限!');
                    }
                }
            });
        }

        function closeEditDialog(needRefresh) {
            if (needRefresh) {
                $('#dg').datagrid('reload');
            }
            $('#ff').form('clear');
            $('#dlg_edit').dialog('close');
        }

        function remove(ids) {
            $.ajax({
                url: '${baseUrl}/delete.action',
                data: {ids: ids},
                type: 'post',
                dataType: 'json'
            }).done(function (ret) {
                if (ret && ret.flag) {
                    $.messager.alert('提示', '删除成功!');
                    $('#dg').datagrid('reload');
                } else {
                    $.messager.alert('提示', ret, msg || '删除失败!');
                }
            }).fail(function () {
                $.messager.alert('提示', '删除失败!');
            });
        }
    });

</script>
</body>
</html>