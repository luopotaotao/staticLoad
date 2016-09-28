<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>订单信息管理</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/ordersController/search.action')}">
	<script type="text/javascript">
        $.canSearch = true;
    </script>
</c:if>
<script type="text/javascript">
    var ordersDataGrid;
    $(function() {
        ordersDataGrid = $('#ordersDataGrid')
                .datagrid(
                        {
                            url : '${pageContext.request.contextPath}/ordersController/datagrid.action',
                            fit : true,
                            fitColumns : true,
                            border : false,
                            pagination : true,
                            idField : "orderId",
                            pageSize : 10,
                            pageList : [ 10, 20, 30, 40, 50 ],
                            sortName : "updateTime",
                            sortOrder : 'desc',
                            checkOnSelect : true,
                            selectOnCheck : false,
                            singleSelect: true,
                            nowrap : true,
                            columns : [ [
                                    {
                                        field : 'orderId',
                                        title : '订单编号',
                                        width : 200
                                    },
                                    
                                    {
                                        field : 'orderTypeStr',
                                        title : '订单类型',
                                        width : 150
                                    },
                                    {
                                        field : 'orderStatusStr',
                                        title : '订单状态',
                                        width : 150
                                    },
                                    {
                                        field : 'payWayStr',
                                        title : '支付渠道类型',
                                        width : 120
                                    },
                                    {
                                        field : 'updateTime',
                                        title : '更新时间',
                                        width : 150,
                                        sortable : true
                                    },
                                    {
                                        field : 'action',
                                        title : '操作',
                                        width : 80,
                                        formatter : function(value, row, index) {
                                            var str = '';
                                            if ($.canSearch) {
                                                str += $
                                                        .formatString(
                                                                '<img onclick="detailFun(\'{0}\');" src="{1}" title="{2}"/>',
                                                                row.orderId,
                                                                '${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/icons/search.png',
                                                                '查看订单信息');
                                            }
                                            return str;
                                        }}] ],
                            toolbar : "#ordersToolbar",
                            onLoadSuccess : function() {
                                parent.$.messager.progress('close');
                                $(this).datagrid('tooltip');
                            }
                        });

    });
    
    function detailFun(orderId) {
        ordersDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        parent.$
                .modalDialog({
                    title : "订单信息详情",
                    width : 800,
                    height : 500,
                    href : '${pageContext.request.contextPath}/ordersController/search.action?id='
                            + orderId
                });
    }

</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit : true,border : false">
		<div id="ordersToolbar" style="display: none;">
			<table>
				<tbody>
					<tr>
						<td>
							<form id="ordersSearchForm" class="form-inline">
								<input name="orderId" type="text" class="easyui-textbox"
									placeholder="订单编号可模糊查询" /> 订单类型：<select id="orderType"
									name="orderType" style="width:150px;" class="easyui-combobox"
									data-options="panelHeight:'auto', editable: false">
									<option value="0">--请选择--</option>
									<option value="1">开卡</option>
									<option value="2">充值</option>
								</select> 订单状态：<select id="orderStatus" name="orderStatus"
									class="easyui-combobox" style="width:150px;"
									data-options="panelHeight:'auto', editable: false">
									<option value="0">--请选择--</option>
									<option value="1">未支付</option>
									<option value="2">支付完成</option>
									<option value="3">充值成功</option>
									<option value="4">充值失败</option>
									<option value="5">充值异常</option>
									<option value="11">开卡成功</option>
									<option value="12">开卡失败</option>
									<option value="13">开卡异常</option>
								</select> 支付渠道：<select id="payWay" name="payWay" class="easyui-combobox"
									style="width:150px;"
									data-options="panelHeight:'auto', editable: false">
									<option value="0">--请选择--</option>
									<option value="1">支付宝</option>
									<option value="2">百度支付</option>
									<option value="3">微信支付</option>
									<option value="4">银联</option>
									<option value="5">第三方自有支付渠道</option>
								</select><br /> 交易时间 <input type="text" name="orderCreateTimeStart"
									id="orderCreateTimeStart" class="Wdate"
									onclick="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"
									readonly="readonly" style="width: 150px;" /> - <input
									type="text" name="orderCreateTimeEnd" class="Wdate"
									onclick="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'orderCreateTimeStart\')}'})"
									readonly="readonly" style="width: 150px;" /> <a
									href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom',plain:true"
									onclick="ordersDataGrid.datagrid('load',$.serializeObject($('#ordersSearchForm')));ordersDataGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">过滤</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom_out',plain:true"
									onclick="$('#ordersSearchForm input').val('');ordersDataGrid.datagrid('load',{});ordersDataGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">重置过滤</a>
							</form></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div data-options="region:'center',border:false">
			<table id="ordersDataGrid"></table>
		</div>

	</div>
</body>
</html>