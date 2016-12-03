<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>用户日志信息</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if
	test="${fn:contains(sessionInfo.resourceSet, '/busiLogController/search')}">
	<script type="text/javascript">
        $.canSearch = true;
    </script>
</c:if>
<script type="text/javascript">
    var busiLogDataGrid;
    $(function() {
        busiLogDataGrid = $('#busiLogDataGrid')
                .datagrid(
                        {
                            url : '${pageContext.request.contextPath}/busiLogController/datagrid',
                            fit : true,
                            fitColumns : true,
                            border : false,
                            pagination : true,
                            idField : 'logId',
                            pageSize : 10,
                            pageList : [ 10, 20, 30, 40, 50 ],
                            sortName : 'createTime',
                            sortOrder : 'desc',
                            checkOnSelect : true,
                            selectOnCheck : false,
                            singleSelect: true,
                            nowrap : true,
                            columns : [ [
                                    {
                                        field : 'seTsmId',
                                        title : 'SE发行方标识',
                                        width : 200
                                    },
                                    
                                    {
                                        field : 'seid',
                                        title : 'SEID',
                                        width : 150
                                    },
                                    {
                                        field : 'instanceAid',
                                        title : '业务应用AID',
                                        width : 150
                                    },
                                    {
                                        field : 'orgTaskTypeStr',
                                        title : '业务类型',
                                        width : 120
                                    },
                                    {
                                        field : 'subTaskTypeStr',
                                        title : '操作类型',
                                        width : 120
                                    },
                                    /* {
                                        field : 'operResult',
                                        title : '操作结果',
                                        width : 150
                                    },
                                    {
                                        field : 'seExecuteSw',
                                        title : 'SE执行状态字',
                                        width : 150
                                    }, */
                                    {
                                        field : 'reqSrcStr',
                                        title : '请求来源',
                                        width : 120
                                    },
                                    /* {
                                        field : 'errorDesc',
                                        title : '错误描述',
                                        width : 150
                                    },
                                    {
                                        field : 'seqId',
                                        title : '业务流水号',
                                        width : 150
                                    }, */
                                    {
                                        field : 'createTime',
                                        title : '创建时间',
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
                                                                row.logId,
                                                                '<c:url value="/resources/jslib/jquery-easyui-1.3.6/themes/icons/search.png"/>',
                                                                '查看业务操作日志信息');
                                            }
                                            return str;
                                        }}] ],
                            toolbar : "#busiLogToolbar",
                            onLoadSuccess : function() {
                                parent.$.messager.progress('close');
                                $(this).datagrid('tooltip');
                            }
                        });

    });
    
    function detailFun(logId) {
        busiLogDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        parent.$
                .modalDialog({
                    title : "业务操作日志详情",
                    width : 520,
                    height : 420,
                    href : '${pageContext.request.contextPath}/busiLogController/search.action?id='
                            + logId
                });
    }

</script>
</head>
<body>
	<div class="easyui-layout" data-options="fit : true,border : false">
		<div id="busiLogToolbar" style="display: none;">
			<table>
				<tbody>
					<tr>
						<td>
							<form id="busiLogSearchForm" class="form-inline">
								<input name="seid" type="text" class="easyui-textbox"
									placeholder="SEID可模糊查询" /> 业务类型：<select id="orgTaskType"
									name="orgTaskType" style="width:150px;" class="easyui-combobox"
									data-options="panelHeight:'auto', editable: false">
									<option value="0">--请选择--</option>
									<option value="1">开卡</option>
									<option value="2">销卡</option>
									<option value="3">充值</option>
								</select> 操作类型：<select id="subTaskType" name="subTaskType"
									class="easyui-combobox" style="width:150px;"
									data-options="panelHeight:'auto', editable: false">
									<option value="0">--请选择--</option>
									<option value="1">安全域状态同步通知</option>
									<option value="2">应用下载</option>
									<option value="3">应用个人化</option>
									<option value="4">应用删除</option>
									<option value="5">应用下载和个人化</option>
									<option value="6">充值</option>
									<option value="7">退款</option>
								</select> 请求来源：<select id="reqSrc" name="reqSrc" class="easyui-combobox"
									style="width:150px;"
									data-options="panelHeight:'auto', editable: false">
									<option value="0">--请选择--</option>
									<option value="1">服务器</option>
									<option value="2">卡包客户端</option>
								</select><br /> 操作时间 <input type="text" name="createTimeStart"
									id="createTimeStart" class="Wdate"
									onclick="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})"
									readonly="readonly" style="width: 150px;" /> - <input
									type="text" name="createTimeEnd" class="Wdate"
									onclick="WdatePicker({readOnly:true,onpicked:function(dp) {},dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'createTimeStart\')}'})"
									readonly="readonly" style="width: 150px;" /> <a
									href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom',plain:true"
									onclick="busiLogDataGrid.datagrid('load',$.serializeObject($('#busiLogSearchForm')));busiLogDataGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">过滤</a>
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'zoom_out',plain:true"
									onclick="$('#busiLogSearchForm input').val('');busiLogDataGrid.datagrid('load',{});busiLogDataGrid.datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');">重置过滤</a>
							</form></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div data-options="region:'center',border:false">
			<table id="busiLogDataGrid"></table>
		</div>

	</div>
</body>
</html>