<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="width:100%">

    <div class="easyui-panel" style="width:30%">
        <input class="easyui-searchbox"
               data-options="prompt:'请输入姓名',searcher:function(val,typ){$('#dg_inspector').datagrid('load',{typ:typ,name:encodeURIComponent(val)});}"
               style="width:100%">
    </div>

    <table id="dg_inspector" style="width:100%"></table>
    <div id="dlg_inspector_edit" class="easyui-dialog" style="width:100%;max-width:400px;padding:30px 60px;"
            data-options="
            //title: '添加人员',
            closed: true,
            modal: true,
            draggable: false,
            //iconCls: 'icon-add',
            buttons: [{
            text: '保存',
            iconCls: 'icon-ok',
            handler: $.submitInspectorForm
            }, {
            text: '取消',
            iconCls: 'icon-cancel',
            handler: $.closeInspectorEditDialog
            }]
        ">
        <form id="ff_inspector" class="easyui-form" method="post" data-options="novalidate:true" action="../${baseUrl}/post.action">
            <div style="margin-bottom:20px;display: none">
                <input class="easyui-textbox" name="id" style="width:100%" data-options="label:'企业编号:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="name" style="width:100%"
                       data-options="label:'姓名:',required:true">
            </div>
            <div style="margin-bottom:20px">
                <select class="easyui-combobox" data-options="editable:false" name="gender" label="性别:"
                        style="width:100%">
                    <option value="1">男</option>
                    <option value="0">女</option>
                </select>
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="note" style="width:100%"
                       data-options="label:'备注:'">
            </div>
            <div style="margin-bottom:20px;display: none;">
                <input id="inspector_institution_id" class="easyui-textbox" name="institution_id" style="width:100%"
                       data-options="label:'所属机构id:',required:true">
            </div>
        </form>
    </div>
    <script type="text/javascript">
        $(function () {
            var institution_id = '${institution_id}';
            var baseUrl = '${pageContext.request.contextPath}/${baseUrl}';
            $('#dg_inspector').datagrid({
                url: '../${baseUrl}/${institution_id}/query.action',
                method: 'get',
//                title: '人员管理',
//                iconCls: 'icon-save',
//            width: 700,
                height: $('body').height(),
                fitColumns: true,
                singleSelect: false,
                pagination: false,
                fitColumns: true,
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
                        var rows = $('#dg_inspector').datagrid('getChecked');
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
                        var rows = $('#dg_inspector').datagrid('getChecked');
                        if (!rows || !rows.length) {
                            $.messager.alert('提示', '请选择要删除的行!');
                            return;
                        }
                        $.messager.confirm('提示', '是否确定删除这' + rows.length + '条数据?', function (r) {
                            if (r) {
                                remove($.map(rows, function (row) {
                                    return row.id;
                                }), function () {
                                    $('#dg_inspector').datagrid('reload');
                                });
                            }
                        });
                    }
                }],
                columns: [[
                    {field: 'ck', checkbox: true},
                    {field: 'id', title: 'ID', hidden: true},
                    {field: 'name', title: '姓名'},
                    {
                        field: 'gender', title: '性别', formatter: function (val) {
                        return val == 1 ? '男' : '女';
                    }
                    },
                    {field: 'note', title: '备注'}
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
                            $('#dg_inspector').datagrid('hideColumn', item.name);
                            $.cmenu.menu('setIcon', {
                                target: item.target,
                                iconCls: 'icon-empty'
                            });
                        } else {
                            $('#dg_inspector').datagrid('showColumn', item.name);
                            $.cmenu.menu('setIcon', {
                                target: item.target,
                                iconCls: 'icon-ok'
                            });
                        }
                    }
                });
                var fields = $('#dg_inspector').datagrid('getColumnFields');
                for (var i = 0; i < fields.length; i++) {
                    var field = fields[i];
                    var col = $('#dg_inspector').datagrid('getColumnOption', field);
                    $.cmenu.menu('appendItem', {
                        text: col.title,
                        name: field,
                        iconCls: 'icon-ok'
                    });
                }
            }

//            $('#dlg_inspector_edit').dialog({
//                title: "添加人员",
//                closed: true,
//                modal: true,
//                draggable: false,
//                iconCls: 'icon-add',
//                buttons: [{
//                    text: '保存',
//                    iconCls: 'icon-ok',
//                    handler: submitForm
//                }, {
//                    text: '取消',
//                    iconCls: 'icon-cancel',
//                    handler: closeEditDialog
//                }]
//            })

            function showEditDialog(data) {
                var $ff = $('#ff_inspector');
                if (data) {
                    $ff.form('load', data);
                    $ff.form({url: '../${baseUrl}/put.action'});
                } else {
                    $ff.form({url: '../${baseUrl}/post.action'});
                }
                $('#inspector_institution_id').textbox('setValue', institution_id);
                $('#dlg_inspector_edit').dialog('open');
            }


            function submitForm() {
                $.messager.progress();	// display the progress bar
                $('#ff_inspector').form('submit', {
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
                        data = $.parseJSON(data);
                        if (data.flag) {
                            $.messager.alert('提示', '保存成功!');
                            closeEditDialog(true);
                        } else {
                            $.messager.alert('提示', data.message || '保存失败,请检查网络连接或者权限!');
                        }
                    }
                });
            }

            function closeEditDialog(needRefresh) {
                if (needRefresh) {
                    $('#dg_inspector').datagrid('reload');
                }
                $('#ff_inspector').form('clear');
                $('#dlg_inspector_edit').dialog('close');
            }
            $.submitInspectorForm = submitForm;
            $.closeInspectorEditDialog = closeEditDialog;
            function remove(ids) {
                $.ajax({
                    url: '../${baseUrl}/delete.action',
                    data: {ids: ids},
                    type: 'post',
                    dataType: 'json'
                }).done(function (ret) {
                    if (ret && ret.flag) {
                        $.messager.alert('提示', '删除成功!');
                        $('#dg_inspector').datagrid('reload');
                    } else {
                        $.messager.alert('提示', ret, msg || '删除失败!');
                    }
                }).fail(function () {
                    $.messager.alert('提示', '删除失败!');
                });
            }
        });

    </script>
</div>
