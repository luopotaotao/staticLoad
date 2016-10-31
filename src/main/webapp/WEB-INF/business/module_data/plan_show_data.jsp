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
       <!--url:'source_data.json',-->
       method:'get',
       fitColumns:true,
    ">
                <thead>
                <tr>
                    <th data-options="field:'prg'">工程</th>
                    <th data-options="field:'stzh'">桩号</th>
                    <th data-options="field:'devnb',align:'center'">设备编号</th>
                    <th data-options="field:'prs',align:'center'">压力</th>
                    <th data-options="field:'avg_prs',align:'center'">平均压力</th>
                    <th data-options="field:'hzjc',align:'center'">荷载</th>
                    <th data-options="field:'avg_hzjc',align:'center'">平均荷载</th>
                    <th data-options="field:'wyjc',align:'center'">位移</th>
                    <th data-options="field:'avg_wyjc',align:'center'">平均位移</th>
                    <th data-options="field:'gps',align:'center',formatter:function(obj,row){return row.lat+','+row.lng}">
                        GPS信息
                    </th>
                    <th data-options="field:'devstr',align:'center'">设备代号</th>
                    <th data-options="field:'time',align:'center'">数据上传时间</th>
                    <th data-options="field:'delay',align:'center'">时间间隔</th>
                    <th data-options="field:'qjx',align:'center'">倾角数据</th>
                    <th data-options="field:'avg_qjx',align:'center'">平均倾角数据</th>
                    <th data-options="field:'ndsj',align:'center'">挠度数据</th>
                    <th data-options="field:'avg_ndsj',align:'center'">平均挠度数据</th>
                    <th data-options="field:'devst',align:'center'">设备状态</th>
                </tr>
                </thead>
            </table>
        </div>
        <div title="统计数据">
            <table id="tb_load"></table>
        </div>
        <div title="Q-s曲线">
            <div id="qs_chart" style="width: 50%; height: 400px"></div>
        </div>
        <div title="s-lgt曲线">
            <div id="slgt_chart" style="width: 50%; height: 400px;"></div>
        </div>
        <div title="s-lgQ曲线">
            <div id="slgQ_chart" style="width: 50%; height: 400px;"></div>
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
                var fields = [
                    {key: 'prs', title: '1'},
                    {key: 'hzjc', title: '2'},
                    {key: 'wyjc', title: '3'},
                    {key: 'qjx', title: '4'},
                    {key: 'ndsj', title: '5'}
                ];
                $.get('${pageContext.request.contextPath}/moduleInspectDataController/query/' + prg + '/' + stzh + '.action', function (data) {
//                    var ret = filterData(data, fields);
//                    var source = ret.source;
//                    var statistic = ret.statistic;
//                    console.log(ret.statistic.columns);
                    $('#tb_source').datagrid({'data': data.source});
//                    $('#tb_load').datagrid({
//                        rownumbers: true,
//                        columns: statistic.columns,
//                        data: statistic.data,
//                        fitColumns: true
//                    });
                    initChart0(data.chart0);
                    initChart1(data.chart1);
                    initChart2(data.chart2);

                }, 'json');
            }

            /**
             * 处理原始数据,生成{source: data, statistic: statisticData};
             * @param data
             * @param fields
             * @returns {{source: *, statistic: ({columns, data}|*)}}
             */
            function filterData(data, fields) {
                if (data) {
                    var statistic = {};
                    var rows = data.rows;
                    if (rows && rows.length > 0) {
                        $.each(rows, function (i, item) {
                            if (!statistic.hasOwnProperty(item.setprs)) {
                                statistic[item.setprs] = [];
                            }
                            var avg_vals = {};
                            $.each(fields, function (j, field) {
                                var key = field.key;
                                var avg_val = avg(item[key]);
                                item['avg_' + key] = avg_val
                                avg_vals[item.setprs + key] = avg_val;
                            });
                            statistic[item.setprs].push(avg_vals);
                            var delay = null;
                            switch (i) {
                                case 0:
                                    delay = 0;
                                    break;
                                case item.length - 1:
                                    delay = null;
                                    break;
                                default:
                                    if (item.setprs == rows[i - 1].setprs) {
                                        delay = Math.round((new Date(item.time).getTime() - new Date(rows[i - 1].time).getTime()) / (1000 * 60));
                                    } else {
                                        delay = 0;
                                    }
                            }
                            item.delay = delay;
                        });
                        console.log(JSON.stringify(statistic));
                    }
                }
                return {source: data, statistic: generateStatisticInfo(statistic, fields)};
            }

            function avg(arr) {
                var sum = arr.reduce(function (a, b) {
                    return parseFloat(a) + parseFloat(b);
                });
                return sum / arr.length;
            }

            /**
             *
             * @param s
             * @param fields
             * @returns {{columns: *[], data: Array}}
             */
            function generateStatisticInfo(s, fields) {
                var columns = [[], []];
                var ret = [];
                $.each(s, function (key, arr) {
                    columns[0].push({title: key, colspan: fields.length});
                    $.each(fields, function (i, field) {
                        columns[1].push({title: field.title, field: key + field.key, width: 80});
                    })

                    for (var i = 0; i < arr.length; i++) {
                        ret[i] = ret[i] || {};
                        $.extend(ret[i], arr[i]);
                    }
                });
                return {columns: columns, data: ret}
            }

            function initChart0(data){
//                var data = [
//                    {x: 0, y: 0.00},
//                    {x: 340, y: 0.70},
//                    {x: 510, y: 1.42},
//                    {x: 680, y: 2.35},
//                    {x: 850, y: 3.39},
//                    {x: 1020, y: 4.51},
//                    {x: 1190, y: 5.78},
//                    {x: 1360, y: 6.95},
//                    {x: 1530, y: 8.17},
//                    {x: 1700, y: 9.47},
//                    {x: 1700, y: 9.47},
//                    {x: 1700, y: 9.47},
//                    {x: 1700, y: 9.47}];
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
                        data: data
                    }]
                });
            }
            function initChart1(data) {
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
//                var data = [{
//                    name: '340',
//                    data: [
//                        {x: 0, y: 0.50},
//                        {x: 5, y: 0.56},
//                        {x: 15, y: 0.60},
//                        {x: 30, y: 0.64},
//                        {x: 45, y: 0.66},
//                        {x: 60, y: 0.67},
//                        {x: 90, y: 0.70}
//                    ]
//                },
//                    {
//                        name: '510',
//                        data: [
//                            {x: 0, y: 1.22},
//                            {x: 5, y: 1.28},
//                            {x: 15, y: 1.31},
//                            {x: 30, y: 1.35},
//                            {x: 45, y: 1.38},
//                            {x: 60, y: 1.40},
//                            {x: 90, y: 1.42}
//                        ]
//                    },
//
//                    {
//                        name: '640',
//                        data: [
//                            {x: 0, y: 2.14},
//                            {x: 5, y: 2.19},
//                            {x: 15, y: 2.23},
//                            {x: 30, y: 2.27},
//                            {x: 45, y: 2.30},
//                            {x: 60, y: 2.33},
//                            {x: 90, y: 2.35}
//                        ]
//                    }
//                ];

                $.each(data,function (i,item) {
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
                        text: 'Q-s曲线'
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
                    series: data
                });
            }
            function initChart2(data) {
//                var data = [
//                    {y:0.00,x:0          },
//                    {y:0.70,x:2.531478917},
//                    {y:1.42,x:2.707570176},
//                    {y:2.35,x:2.832508913},
//                    {y:3.39,x:2.929418926},
//                    {y:4.51,x:3.008600172},
//                    {y:5.78,x:3.075546961},
//                    {y:6.95,x:3.133538908},
//                    {y:8.17,x:3.184691431},
//                    {y:9.47,x:3.230448921},
//                    {y:9.47,x:3.230448921},
//                    {y:9.47,x:3.230448921},
//                    {y:9.47,x:3.230448921}];
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
                        labels: {
                            formatter: function () {
                                return Math.pow(10,this.value).toFixed(0);
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
                        data: data
                    }]

                });
            }
        });
    </script>
</div>