<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>

<title>注册用户统计</title>
<jsp:include page="/inc.jsp"></jsp:include>
<script type="text/javascript">
	parent.$.messager.progress('close');
	var chart;
	$(function() {
		chart = new Highcharts.Chart({
			chart : {
				renderTo : 'userRegStatistics',
				type : 'column'
			},
			exporting : {
				enabled : false
			},

			credits : {
				enabled : false
			},
			title : {
				text : '注册用户统计',
				style : {
					"color" : "#333333",
					"font-size" : "20px",
					"font-weight" : "bold"
				},
			},
			xAxis : {
				labels : {
					style : {
						"color" : "#333333",
						"font-size" : "12px",
						"font-weight" : "bold"
					}
				},
			},
			yAxis : {
				title : {
					text : '人数',
					rotation : 0,
					align : "high",
					style : {
						"color" : "#333333",
						"font-size" : "12px",
						"font-weight" : "bold"
					},

				},
				plotLines : [ {
					value : 0,
					width : 1,
					color : '#808080'
				} ]
			},
			tooltip : {
				valueSuffix : '人',
				headerFormat: '<span style="font-size:10px">{point.key}</span><table>', 
				pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' + '<td style="padding:0"><b>{point.y:.1f} 人</b></td></tr>', 
				footerFormat: '</table>', 
				shared: true, 
				useHTML: true
			},
			plotOptions: { column: { pointPadding: 0.1, borderWidth: 0 } },
			legend : {
				layout : 'horizontal',
				align : 'center',
				verticalAlign : 'bottom',
				borderWidth : 0,
				enabled : false
			},
			series : [{ /* name: 'ANDROID', data: [] },{ name: 'IOS', data: []  */}]
		});
		search_userRegStatistics();
		$('#userRegStatisticsSearch').click(function() {
			search_userRegStatistics();
		});
		$('#userRegStatisticsClean').click(function() {
			$("#userRegStatisticsSearchform")[0].reset();
			search_userRegStatistics();
		});

	});
	function search_userRegStatistics() {
		chart.xAxis[0].setCategories();
		chart.series[0].setData();
		var regTimeStart = $("#regTimeStart").val();
		var regTimeEnd = $("#regTimeEnd").val();
		if (regTimeStart == "" && regTimeEnd == "") {
			chart.setTitle(null, {
				text : ""
			});
		} else {
			chart.setTitle(null, {
				text : "时间：  " + regTimeStart + " 至 " + regTimeEnd
			});
		}
		$
				.ajax({
					data : $.serializeObject($('#userRegStatisticsSearchform')),
					url : "${pageContext.request.contextPath}/userRegStatisticsController/userRegStatistics.action",
					method : "post",
					dataType : "json",
					async : false,
					success : function(data) {
						var operTypeArray = new Array();
						var numArray = new Array();
						//var numArrayI = new Array();
						for ( var i = 0; i < data.length; i++) {
							numArray.push(data[i].num);
							if (data[i].deviceType == 1) {
								operTypeArray.push("手机终端");
							} else if (data[i].deviceType == 2) {
								operTypeArray.push("手环");
							} else if (data[i].deviceType == 3) {
								operTypeArray.push("手表");
							} else if (data[i].deviceType == 4) {
								operTypeArray.push("SIM_SWP");
							}
							

						}

						chart.xAxis[0].setCategories(operTypeArray);
						chart.series[0].setData(numArray);
					}
				});
	}
</script>
</head>

<body>
	<div class="easyui-layout" data-options="fit : true,border : false">
		<div data-options="region:'north',border:false"
			style="height: 135px; overflow: hidden;" align="center">
			<form id="userRegStatisticsSearchform" method="post"
				style="margin: 0px; padding: 0px">
				<table class="tableForm">
					<tr>
						<th>注册时间</th>
						<td><input id="regTimeStart" name="regTimeStart" type="text"
							onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'regTimeEnd\')}'})" />
							至 <input id="regTimeEnd" name="regTimeEnd" type="text"
							onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'regTimeStart\')}'})" />
							<a href="javascript:void(0)" class="easyui-linkbutton"
							data-options="iconCls:'zoom',plain:true"
							id="userRegStatisticsSearch">过滤条件</a> <a
							href="javascript:void(0);" class="easyui-linkbutton"
							data-options="iconCls:'zoom',plain:true"
							id="userRegStatisticsClean">清空条件</a></td>
					</tr>
				</table>
			</form>
		</div>
		<div data-options="region:'center',border:false">
			<div id="userRegStatistics"
				style="text-align: center; height: 320px;"></div>
		</div>
	</div>
</body>
</html>