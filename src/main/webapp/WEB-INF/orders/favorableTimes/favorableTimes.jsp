<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>

<title>优惠剩余次数信息管理</title>
<jsp:include page="/inc.jsp"></jsp:include>
<c:if
	test="${fn:contains(sessionInfo.resourceList, '/favorableTimesController/editPage.action')}">
	<script type="text/javascript">
        $.canEdit = true;
    </script>
</c:if>
<c:if
	test="${fn:contains(sessionInfo.resourceList, '/favorableTimesController/delete.action')}">
	<script type="text/javascript">
        $.canDelete = true;
    </script>
</c:if>
<script type="text/javascript">
    var favorableTimesGrid;
    $(function() {
        favorableTimesGrid = $("#favorableTimesGrid")
                .datagrid(
                        {
                            url : "${pageContext.request.contextPath}/favorableTimesController/datagrid.action",
                            fit : true,
                            fitColumns : true,
                            border : false,
                            pagination : true,
                            idField : "favouableTimesId",
                            pageSize : 10,
                            pageList : [ 10, 20, 30, 40, 50 ],
                            sortName : "updateTime",
                            sortOrder : "desc",
                            checkOnSelect : true,
                            selectOnCheck : false,
                            singleSelect: true,
                            nowrap : true,
                            columns : [ [
                                    {
                                        field : 'favouableName',
                                        title : '优惠名字',
                                        width : 200
                                    },
                                    {
                                        field : 'favouableTimesTotalCount',
                                        title : '优惠总数',
                                        width : 150
                                    },
                                    {
                                        field : 'remainTimes',
                                        title : '剩余次数',
                                        width : 150
                                    },
                                    {
                                        field : 'adminName',
                                        title : '操作管理员',
                                        width : 120
                                    },
                                    {
                                        field : 'updateTime',
                                        title : '修改时间',
                                        width : 170
                                    },
                                    {
                                        field : 'action',
                                        title : '操作',
                                        width : 100,
                                        formatter : function(value, row, index) {
                                            var str = '';
                                            if ($.canEdit) {
                                                str += $
                                                        .formatString(
                                                                '<img onclick="editFun(\'{0}\');" src="{1}" title="{2}"/>',
                                                                row.favouableTimesId,
                                                                '${pageContext.request.contextPath}/style/images/extjs_icons/pencil.png',
                                                                '修改优惠剩余次数信息');
                                            }
                                            str += "&nbsp;";
                                            if ($.canDelete) {
                                                str += $
                                                        .formatString(
                                                                '<img onclick="deleteFun(\'{0}\');" src="{1}" title="{2}"/>',
                                                                row.favouableTimesId,
                                                                '${pageContext.request.contextPath}/style/images/extjs_icons/delete.png',
                                                                '删除优惠剩余次数信息');
                                            }
                                            return str;
                                        }
                                    } ] ],
                            toolbar : "#favorableTimesToolbar",
                            onLoadSuccess : function() {
                                parent.$.messager.progress('close');
                                $(this).datagrid('tooltip');
                            }

                        });
    });

    function editFun(id) {
        favorableTimesGrid.datagrid('unselectAll').datagrid('uncheckAll');
        parent.$
                .modalDialog({
                    title : "修改优惠剩余次数信息",
                    width : 500,
                    height : 250,
                    href : '${pageContext.request.contextPath}/favorableTimesController/editPage.action?id='
                            + id,
                    buttons : [ {
                        text : '修改',
                        handler : function() {
                            parent.$.modalDialog.opener_dataGrid = favorableTimesGrid;
                            var f = parent.$.modalDialog.handler.find('form');
                            f.submit();
                        }
                    } ]
                });
    }

    function deleteFun(id) {
        $.messager
                .confirm(
                        '确认',
                        '您确认要删除选中的信息吗？',
                        function(r) {
                            if (r) {
                                parent.$.messager.progress({
                                    title : "提示",
                                    text : '数据处理中，请稍后....'
                                });
                                $
                                        .ajax({
                                            url : '${pageContext.request.contextPath}/favorableTimesController/delete.action',
                                            data : {
                                                id : id
                                            },
                                            dataType : 'json',
                                            success : function(result) {
                                                if (result.success) {
                                                    favorableTimesGrid
                                                            .datagrid('load');
                                                    favorableTimesGrid
                                                            .datagrid(
                                                                    'uncheckAll')
                                                            .datagrid(
                                                                    'unselectAll')
                                                            .datagrid(
                                                                    'clearSelections');
                                                }
                                                parent.$.messager
                                                        .progress('close');
                                                parent.$.messager.alert("提示",
                                                        result.msg, 'info');
                                            }
                                        });
                            }
                        });
    }

    function addFun() {
        parent.$
                .modalDialog({
                    title : "添加优惠剩余次数信息",
                    width : 500,
                    height : 250,
                    href : '${pageContext.request.contextPath}/favorableTimesController/addPage.action',
                    buttons : [ {
                        text : '添加',
                        handler : function() {
                            parent.$.modalDialog.opener_dataGrid = favorableTimesGrid;
                            var f = parent.$.modalDialog.handler.find('form');
                            f.submit();
                        }
                    } ]
                });
    }
</script>

</head>

<body>
	<div class="easyui-layout" data-options="fit:true,border:false">
		<div id="favorableTimesToolbar" style="display: none;">

			<table>
				<tbody>
					<tr>
						<td><c:if
								test="${fn:contains(sessionInfo.resourceList, '/favorableTimesController/addPage.action')}">
								<a onclick="addFun();" href="javascript:void(0);"
									class="easyui-linkbutton"
									data-options="plain:true,iconCls:'edit_add'">添加</a>
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div data-options="region:'center',border:false" title=""
			style="overflow: hidden;">
			<table id="favorableTimesGrid"></table>
		</div>
	</div>

</body>
</html>
