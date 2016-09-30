<%--
  Created by IntelliJ IDEA.
  User: taotao
  Date: 2016/9/30
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table id="grid" class="easyui-datagrid" style="width:100%;height:100%"
       data-options="singleSelect:false,url:'/moduleBasicCompanyController/query.action',method:'get'">
    <thead>
    <tr>
        <th data-options="field: 'ck', checkbox: true"></th>
        <th data-options="field:'id',width:80">Item ID</th>
        <th data-options="field:'name',width:100">Product</th>
        <th data-options="field:'money',width:80,align:'right'">List Price</th>
        <th data-options="field:'typ',width:80,align:'right'">Unit Cost</th>

        <th data-options="field: 'ck', checkbox: true"></th>
        <th data-options="field: 'id', title: 'ID', hidden:true"></th>
        <th data-options="field: 'name', title: '公司名称', width: 120"></th>
        <th data-options="field: 'contacts', title: '联系人', width: 80, align: 'right'"></th>
        <th data-options="field: 'tel', title: '电话号码', width: 80, align: 'right'"></th>
       <th data-options="field: 'typ', title: '公司类型', width: 80, align: 'right',
           formatter: function (val, row) {
            return {1: '建设单位',2:'施工单位',3:'监理单位'}[val];
            }
        "></th>
    </tr>
    </thead>
</table>
