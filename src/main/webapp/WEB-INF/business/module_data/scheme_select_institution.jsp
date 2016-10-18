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
       data-options="singleSelect:false,url:'../moduleBasicInstitutionController/query.action',method:'get'">
    <thead>
    <tr>
        <th data-options="field: 'ck', checkbox: true"></th>
        <th data-options="field: 'id', title: 'ID', hidden: true"></th>
        <th data-options="field: 'code', title: '机构编号', width: 80"></th>
        <th data-options="field: 'name', title: '机构名称', width: 80, align: 'right'"></th>
        <th data-options="field: 'economy_typ', title: '经济性质', width: 80, align: 'right',
        formatter: function (val, row) {
        return {1: '性质1', 2: '性质2', 3: '性质3'}[val];
        }
        "></th>
        <th data-options="field: 'certificate_code', title: '资质证书编号', width: 80, align: 'right'"></th>
        <th data-options="field: 'register_type', title: '注册类型', width: 80, align: 'right',
        formatter: function (val, row) {
        return {1: '建设单位', 2: '施工单位', 3: '监理单位'}[val];
        }"></th>
    </tr>
    </thead>
</table>
