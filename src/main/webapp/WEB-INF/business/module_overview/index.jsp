<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>模板支撑智能安全监测系统</title>
    <jsp:include page="../../layout/common.jsp"></jsp:include>

    <script type="text/javascript" src="${pageContext.request.contextPath}/jslib/baiduMap/map_api.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jslib/baiduMap/AreaRestriction_min.js"></script>

</head>
<body class="easyui-layout">
<div data-options="region:'west',split:true" title="工程分布" style="width: 200px; overflow: hidden;">
    <div class="easyui-panel" style="padding:5px">
        <ul id="tree_menu"></ul>
    </div>
</div>
<div id="tt" class="easyui-panel" data-options="region:'center'">
    <div id="div_map" style="width: 500px;height: 500px"></div>
</div>

<script>
    $(function () {
        var baseUrl = '${baseUrl}';
        var tree_data = [{
            "id": 1,
            "text": "基础信息",
            "url": '/moduleOverviewController/index.action'
        }];

        initUI();
        function initUI() {
            $('#tree_menu').tree({
                url: '/moduleOverviewController/queryOverviews.action',
                method: 'get',
                textField:'name',
                animate: true,
                onClick: function (node) {
                    removeAllOverlays();
                    if (node.count) {
                        getProjectsAndShow(node.id);
                    }
                },
                formatter:function(node){
                    var str_arr = [node.text,' (',node.count,')'];
                    return str_arr.join('');
                }
            });

        }

        function getProjectsAndShow(area_id) {
            var url = '/moduleOverviewController/' + area_id + '/queryProjects.action';
            $.getJSON(url, function (ret) {
                showMarkers(ret,function (marker) {
                    var template = '<p>工程名称:{name}</p><p>工程编码:{code}</p><p>地址:{city}{address}</p>';
                    var info = marker.info;
                    map.centerAndZoom(marker.M, 11);
                    showInfo(marker.M, template, {name:info.name||'',code:info.code||'',city:info.city?(info.city.text||''):'',address:info.address||''});
                });
            });
        }

        var map = initializeMap();
        $.extend({
            Map: {
                instance: map,
                center: center,
                showMarkers: function (markers) {
                    showMarkers(markers, function (marker) {
                        showInfo(point, '<p>:name</p>', {name: JSON.stringify(marker)});
                    });
                },
                showInfo: showInfo
            }

        });
//        var points = [new BMap.Point(113.272,23.134),
//
//            new BMap.Point(113.299,23.124),
//            new BMap.Point(113.251,23.130),
//            new BMap.Point(113.323,23.089),
//            new BMap.Point(113.317,23.128),
//            new BMap.Point(113.232,23.095)];
//
//        var markers = points.map(function(p){return {point:p};});
//
//        $.Map.showMarkers(markers);
        function initializeMap() {
            var map = new BMap.Map("div_map");
//            var point = new BMap.Point(113.276, 23.117);
            map.centerAndZoom("西安", 4);
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
            return map;
        }


        function center() {
            map.centerAndZoom("西安", 4);
        }

        //显示markers,挂载点击事件,同时设置地图显示范围
        function showMarkers(markers, callback) {
            if ($.isArray(markers)) {
                var max_lat = 0, max_lng = 0,
                        min_lat = 91, min_lng = 181;

                $.each(markers, function (i, item) {
                    max_lat = item.lat > max_lat ? item.lat : max_lat;
                    max_lng = item.lng > max_lng ? item.lng : max_lng;
                    min_lat = item.lat < min_lat ? item.lat : min_lat;
                    min_lng = item.lng < min_lng ? item.lng : min_lng;

                    var point = new BMap.Point(item.lng,item.lat);
                    var marker = new BMap.Marker(point);  // 创建标注
                    marker.info = item;
                    map.addOverlay(marker);
                    if ($.isFunction(callback)) {
                        marker.addEventListener("click", function () {
                            callback(marker);
                        });
                    }
                });
//                var lng_span = max_lng - min_lng;
//                var lat_span = max_lat - min_lat;
//                var sw = new BMap.Point(min_lng - lng_span * 0.2, min_lat - lat_span * 0.2);
//                var ne = new BMap.Point(max_lng + lng_span * 0.2, max_lat + lat_span * 0.2);
//                var b = new BMap.Bounds(sw, ne);
//                try {
//                    BMapLib.AreaRestriction.setBounds(map, b);
//                } catch (e) {
//                    alert(e);
//                }
            }
        }

        /**
         * 显示信息窗口
         * @param point 信息窗口点坐标,例如 point = new BMap.Point(116.417854,39.921988)
         * @param template 信息窗口模板,其中要替换的字符串以 :key 的形式 ,例如 <p>:name</p>
         * @param info 要替换的数据json对象,例如 {name:'XXX工程'}
         */
        function showInfo(point, template, info) {
            if ($.isPlainObject(info)) {
                $.each(info, function (key, val) {
                    template = template.replace(new RegExp('{' + key+'}', 'g'), val);
                });
            }
            var infoWindow = new BMap.InfoWindow(template);
            map.openInfoWindow(infoWindow, point);
        }

        function removeAllOverlays() {
            var allOverlay = map.getOverlays();
            $.each(allOverlay,function (i,item) {
                map.removeOverlay(item);
            });
        }
    });
</script>

</body>
</html>