<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="easyui-layout" style="width: 100%;height: 97%;">
    <div data-options="region:'west',split:false,closable:false,border:false,collapsible:false" title="桩号" style="width: 120px; overflow: hidden;">
        <div class="easyui-panel" data-options="border:false" style="padding:2px">
            <ul id="plan_data_tree_menu"></ul>
        </div>
    </div>
    <div class="easyui-tabs" data-options="region:'center',closable:false,border:true,collapsible:false" style="width: 100%;height: 97%; overflow: hidden;">
        <div title="原始记录">
            <table id="tb_source" class="easyui-datagrid" style="height: 98%;width: 100%;"
                   data-options="
       singleSelect:true,
       rownumbers:true,
       method:'get',
       fitColumns:true,
    ">
                <thead>
                <tr>
                    <th data-options="field:'prg'">工程</th>
                    <th data-options="field:'stzh'">桩号</th>
                    <th data-options="field:'devnb',align:'center'">设备编号</th>
                    <th data-options="field:'prs_str',align:'center'">压力</th>
                    <th data-options="field:'hzjc_str',align:'center'">荷载</th>
                    <th data-options="field:'wyjc_str',align:'center'">位移</th>
                    <th data-options="field:'gps',align:'center',formatter:function(obj,row){return row.lat+','+row.lng}">
                        GPS信息
                    </th>
                    <th data-options="field:'devstr',align:'center'">设备代号</th>
                    <th data-options="field:'time',align:'center'">数据上传时间</th>
                    <th data-options="field:'interval',align:'center'">时间间隔</th>
                    <th data-options="field:'qjx_str',align:'center'">倾角数据</th>
                    <th data-options="field:'ndsj_str',align:'center'">挠度数据</th>
                    <th data-options="field:'devst',align:'center'">设备状态</th>
                </tr>
                </thead>
            </table>
        </div>
        <div title="统计数据">
            <table id="tb_load" class="easyui-datagrid" style="height: 98%;width: 100%;"
                   data-options="
       singleSelect:true,
       rownumbers:true,
       method:'get',
       fitColumns:true,
    ">
                <thead>
                <tr>
                    <th data-options="field:'prg'">工程</th>
                    <th data-options="field:'stzh'">桩号</th>
                    <th data-options="field:'devnb',align:'center'">设备编号</th>
                    <th data-options="field:'prs_str',align:'center'">压力</th>
                    <th data-options="field:'avgPrs',align:'center'">平均压力</th>
                    <th data-options="field:'hzjc_str',align:'center'">荷载</th>
                    <th data-options="field:'avgHzjc',align:'center'">平均荷载</th>
                    <th data-options="field:'wyjc_str',align:'center'">位移</th>
                    <th data-options="field:'avgWyjc',align:'center'">平均位移</th>
                    <th data-options="field:'gps',align:'center',formatter:function(obj,row){return row.lat+','+row.lng}">
                        GPS信息
                    </th>
                    <th data-options="field:'devstr',align:'center'">设备代号</th>
                    <th data-options="field:'time',align:'center'">数据上传时间</th>
                    <th data-options="field:'interval',align:'center'">时间间隔</th>
                    <th data-options="field:'qjx_str',align:'center'">倾角数据</th>
                    <th data-options="field:'avgQjx',align:'center'">平均倾角数据</th>
                    <th data-options="field:'ndsj_str',align:'center'">挠度数据</th>
                    <th data-options="field:'avgNdsj',align:'center'">平均挠度数据</th>
                    <th data-options="field:'devst',align:'center'">设备状态</th>
                </tr>
                </thead>
            </table>
        </div>

        <div title="s-lgt曲线">
            <div id="slgt_chart" style="width: 50%; height: 400px;"></div>
        </div>
        <div title="s-lgQ曲线">
            <div id="slgQ_chart" style="width: 50%; height: 400px;"></div>
        </div>
        <div title="Q-s曲线">
            <div id="qs_chart" style="width: 50%; height: 400px"></div>
        </div>

    </div>

    <script>

        $(function () {
            init();
            function init() {
                $('#plan_data_tree_menu').tree({
                    url: '${pageContext.request.contextPath}/moduleInspectDataController/linkedKeys/${plan_id}.action',
                    method: 'get',
                    formatter: function (node) {
                        return node.stzh;
                    },
                    onClick: function (node) {
                        loadData(node.prg, node.stzh);
                    },
                    onLoadSuccess:function (node,data) {
                        console.log('success');
                    },
                    onLoadError:function () {
                        console.log(arguments);
                    }
                });
            }

            function loadData(prg, stzh) {
                $.get('${pageContext.request.contextPath}/moduleInspectDataController/query/' + prg + '/' + stzh + '.action', function (data) {
                    $('#tb_source').datagrid({'data': data.source});
                    $('#tb_load').datagrid({'data': data.source});

                    initChart0(data.chart0);
                    initChart1(data.chart1);
                    initChart2(data.chart2);

                }, 'json');
            }

            function initChart0(data){
                var tick = data.tick;
                var tickPositions = $.map(tick,function (val,key) {
                    return key;
                }).sort();
                $('#qs_chart').highcharts({
                    legend: {
                        enabled: false
                    },
                    credits: {
                        enabled: false
                    },
                    chart: {
                        marginLeft: 120
                    },

                    title: {
                        text: 'Q-s曲线'
                    },
                    xAxis: {
                        opposite: true,
                        lineWidth: 2,
                        min: 0,
                        title: {
                            text: 'Q (kN)',
                            align: 'high',
                            y: 70,
                            rotation: 0,
                            x: -20
                        },
                        tickPositions: tickPositions,
                        labels: {
                            formatter: function () {
                                return tick[this.value];
                            }
                        }
                    },
                    yAxis: {
                        reversed: true,
                        lineWidth: 2,
                        min: 0,
                        tickWidth: 1,
                        labels: {
                            step:1,
                            formatter: function () {
                                return this.value.toFixed(2);
                            }
                        },
                        title: {
                            text: 's (mm)',
                            align: 'low',
                            x: 70,
                            rotation: 0,
                            y: -20
                        }
                    }, plotOptions: {
                        series: {
                            marker: {
                                enabled: true
                            }
                        }
                    },
                    series: [{
                        data: data.data
                    }]
                });
            }
            function initChart1(data) {

                var tick = data.tick;
                var tickPositions = $.map(tick,function (val,key) {
                    return key;
                }).sort();
                var opts = {
                    dataLabels: {
                        enabled: true,
                        align: 'left',
                        style: {
                            fontWeight: 'bold'
                        },
                        verticalAlign: 'middle',
                        overflow: true,
                        crop: false,
                        formatter: function () {
                            return this.series.name + ' kN';
                        }
                    }
                }

                $.each(data.data,function (i,item) {
                    var index = item.data.length-1;
                    var last_p = item.data[index];
                    $.extend(last_p,opts);
                })

                $('#slgt_chart').highcharts({
                    legend: {
                        enabled: false
                    },
                    credits: {
                        enabled: false
                    },
                    chart: {
                        marginLeft: 120
                    },

                    title: {
                        text: 's-lgt曲线'
                    },

                    tooltip: {
                        pointFormat: '{series.name} kN: <b>{point.y}</b><br/>',
                        valueSuffix: ' mm',
                        shared: true
                    },

                    xAxis: {
                        opposite: true,
                        lineWidth: 2,
                        min: 0,
                        title: {
                            text: 't (min)',
                            align: 'high',
                            y: 70,
                            rotation: 0,
                            x: -20
                        },
                        tickPositions: tickPositions,
                        labels: {
                            formatter: function () {
                                return tick[this.value];
                            }
                        }
                    },

                    yAxis: {
                        reversed: true,
                        lineWidth: 2,
                        min: 0,
                        tickWidth: 1,
                        labels: {
                            step: 1,
                            formatter: function () {
                                return this.value.toFixed(2);
                            }
                        },
                        title: {
                            text: 's (mm)',
                            align: 'low',
                            x: 70,
                            rotation: 0,
                            y: -20
                        }
                    }, plotOptions: {
                        series: {
                            marker: {
                                enabled: true
                            }
                        }
                    },
                    series: data.data
                });
            }
            function initChart2(data) {
                var tick = data.tick;
                var tickPositions = $.map(tick,function (val,key) {
                    return key;
                }).sort();
                $('#slgQ_chart').highcharts({
                    legend: {
                        enabled: false
                    },
                    credits: {
                        enabled: false
                    },
                    chart: {
                        marginLeft: 120
                    },
                    title: {
                        text: 's-lgQ曲线'
                    },
                    xAxis: {
                        opposite: true,
                        lineWidth: 2,
                        min: 0,
                        title: {
                            text: 'Q (kN)',
                            align: 'high',
                            y: 70,
                            rotation: 0,
                            x: -20
                        },
                        tickPositions: tickPositions,
                        labels: {
                            formatter: function () {
                                return tick[this.value];
                            }
                        }
                    },
                    yAxis: {
                        reversed: true,
                        lineWidth: 2,
                        min: 0,
                        tickWidth: 1,
                        labels: {
                            step:1,
                            formatter: function () {
                                return this.value.toFixed(2);
                            }
                        },
                        title: {
                            text: 's (mm)',
                            align: 'low',
                            x: 70,
                            rotation: 0,
                            y: -20
                        }
                    }, plotOptions: {
                        series: {
                            marker: {
                                enabled: true
                            }
                        }
                    },
                    series: [{
                        type: 'line',
                        data: data.data
                    }]

                });
            }
        });
    </script>
</div>