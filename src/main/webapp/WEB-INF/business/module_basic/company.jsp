<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>模板支撑智能安全监测系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/style/laserCoreCss.css">
    <link id="easyuiTheme" rel="stylesheet"
          href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/default/easyui.css" type="text/css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript"
            charset="utf-8"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/jquery.easyui.min.js"
            charset="utf-8"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jslib/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js"
            charset="utf-8"></script>

</head>
<body>

<table id="dg"></table>
<div id="dlg_edit" style="width:100%;max-width:400px;padding:30px 60px;">
    <form id="ff" class="easyui-form" method="post" data-options="novalidate:true">
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="id" style="width:100%" data-options="label:'企业编号:',required:true">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="name" style="width:100%"
                   data-options="label:'企业名称:',required:true">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-numberbox" name="money" style="width:100%"
                   data-options="label:'注册资金:',required:true">
        </div>
        <div style="margin-bottom:20px">
            <select class="easyui-combobox" name="typ" label="企业类型" style="width:100%">
                <option value="1">类型1</option>
                <option value="2">类型2</option>
                <option value="3">类型3</option>
            </select>
        </div>
    </form>
</div>
<script type="text/javascript">
    $(function () {
        $('#dg').datagrid({
            url: 'company.json',
            method: 'get',
            title: '公司管理',
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
                            remove($.map(rows, function (i, row) {
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
                {field: 'id', title: 'ID', width: 80},
                {field: 'name', title: '公司名称', width: 120},
                {field: 'money', title: '注册资金', width: 80, align: 'right'},
                {
                    field: 'typ', title: '公司类型', width: 80, align: 'right', formatter: function (val, row) {
                    return {1: '类型1', 2: '类型2', 3: '类型3'}[val];
                }
                }
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

        $('#dlg_edit').dialog({
            title: "添加企业",
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
            if (data) {
                $('#ff').form('load', data);
                $('#dlg_edit').dialog({url: 'edit'});
            } else {
                $('#dlg_edit').dialog({url: 'add'});
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

                    if (data.flag) {
                        $.messager.alert('提示', '保存成功!');
                        closeEditDialog();
                    } else {
                        $.messager.alert('提示', data.message || '保存失败,请检查网络连接或者权限!');
                    }
                }
            });
        }

        function closeEditDialog() {
            $('#ff').form('clear');
            $('#dlg_edit').dialog('close');
        }

        function remove(ids) {
            $.ajax({
                url: '',//TODO url
                data: ids,
                type: 'post',
                dataType: 'json'
            }).done(function (ret) {
                if (ret && ret.flag) {
                    $.messager.alert('提示', '删除成功!');
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