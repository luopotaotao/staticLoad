<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>智能无线静荷载试验检测云平台</title>
    <jsp:include page="../../layout/common.jsp"></jsp:include>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jslib/resumable.js" type="text/javascript"
            charset="utf-8"></script>
</head>
<body>

<div class="easyui-panel" style="width:30%">
    <input class="easyui-searchbox"
           data-options="prompt:'请输入公司名称',searcher:function(val){$('#dg').datagrid('load',{name:encodeURIComponent(val)});}"
           style="width:100%">
</div>

<table id="dg" style="width:100%"></table>
<div id="dlg_edit" style="width:100%;max-width:400px;padding:30px 60px;">
    <form id="ff" class="easyui-form" method="post" data-options="novalidate:true" action="${baseUrl}/post.action">
        <div style="margin-bottom:20px;display: none">
            <input class="easyui-textbox" name="id" style="width:100%" data-options="label:'记录编号:',required:true">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="name" style="width:100%"
                   data-options="label:'公司名称:',required:true">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="note" style="width:100%"
                   data-options="label:'备注信息:'">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" id="dept_logo" name="logo" style="width:100%"
                   data-options="label:'logo:'">
        </div>
        <div style="margin-bottom:20px">

            <div class="resumable-progress">
                <table>
                    <tr>
                        <td width="100%">
                            <div class="progress-container">
                                <div class="progress-bar"></div>
                            </div>
                        </td>
                        <td class="progress-text" nowrap="nowrap"></td>
                        <td class="progress-pause" nowrap="nowrap">
                            <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img
                                    src="${pageContext.request.contextPath}/style/images/resume.png" title="恢复"/></a>
                            <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img
                                    src="${pageContext.request.contextPath}/style/images/pause.png" title="暂停"/></a>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
        <div id="img_div" style="margin-bottom:20px;height: 100px;overflow: hidden">
            <img id="img" src="${pageContext.request.contextPath}/logo/blank.png"/>
        </div>
    </form>
    <input id="fileName">
    <button id="btn_save">保存</button>
    <div class="resumable-error">
        抱歉,您的浏览器版本过低,不支持文件上传!
    </div>
</div>
<div id="details"></div>

<script type="text/javascript">
    $(function () {
        var baseUrl = '/';
        $('#dg').datagrid({
            url: '../${baseUrl}/query.action',
            method: 'get',
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
                            remove($.map(rows, function (row) {
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
                {field: 'id', title: 'ID', hidden: true},
                {field: 'name', title: '公司名称', width: 80},
                {
                    field: 'logo', title: '公司Logo', width: 80, align: 'right',
                    formatter: function (val, row) {
                        return '<img src="${pageContext.request.contextPath}/logo/'+val+'">';
                    }
                },
                {
                    field: 'null', title: '操作', width: 80, align: 'right',
                    formatter: function (val, row) {
                        var str_arr = [
                            '<a href="javascript:manageTUsers(',
                            row['id'],
                            ');">账号管理</a>'
                        ];
                        return str_arr.join('');
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
            title: "添加公司",
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
            var $ff = $('#ff');
            if (data) {
                $ff.form('load', data);
                $ff.form({url: 'put.action'});
            } else {
                $ff.form({url: 'post.action'});
            }
            $('#dlg_edit').dialog('open');
        }

        function submitForm() {
            $.messager.progress();
            $('#ff').form('submit', {
                onSubmit: function () {
                    var isValid = $(this).form('validate');
                    if (!isValid) {
                        $.messager.progress('close');
                    }
                    return isValid;	
                },
                success: function (data) {
                    $.messager.progress('close');
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
                $('#dg').datagrid('reload');
            }
            $('#ff').form('clear');
            $('#dlg_edit').dialog('close');
        }

        function remove(ids) {
            $.ajax({
                url: '../${baseUrl}/delete.action',
                data: {ids: ids},
                type: 'post',
                dataType: 'json'
            }).done(function (ret) {
                if (ret && ret.flag) {
                    $.messager.alert('提示', '删除成功!');
                    $('#dg').datagrid('reload');
                } else {
                    $.messager.alert('提示', ret, msg || '删除失败!');
                }
            }).fail(function () {
                $.messager.alert('提示', '删除失败!');
            });
        }
    });
    function openDialog(title,href){
        $('#details').dialog({
            title: title,
            width: $('body').width()*0.8,
            height: $(document).height(),
            closed: false,
            cache: false,
            href: href,
            modal: true
        });
    }


    function manageTUsers(id) {
        var href = '../moduleConfigUserController/index/'+id+'.action';
        openDialog('账号管理',href);
    }


    //EditDialog
    var r = new Resumable({
        target: '../fileController/upload.action',
        chunkSize: 1 * 1024 * 1024,
        simultaneousUploads: 4,
        testChunks: true,
        throttleProgressCallbacks: 1,
        method: "octet"
    });
    // Resumable.js isn't supported, fall back on a different method
    if (!r.support) {
        $('.resumable-error').show();
    } else {
        // Show a place for dropping/selecting files
        $('.resumable-drop').show();
        $.each($('.resumable-drop'),function (i,item) {
            debugger
            r.assignDrop(item);
        });
        $.each($('.resumable-browse'),function (i,item) {
            debugger
            r.assignBrowse(item);
        });
//            r.assignDrop($('.resumable-drop')[0]);
            r.assignBrowse($('#img_div')[0]);

        // Handle file add event
        r.on('fileAdded', function (file) {
            // Show progress pabr
            $('.resumable-progress, .resumable-list').show();
            // Show pause, hide resume
            $('.resumable-progress .progress-resume-link').hide();
            $('.resumable-progress .progress-pause-link').show();
            // Add the file to the list
//                $('.resumable-list').append('<li class="resumable-file-' + file.uniqueIdentifier + '">Uploading <span class="resumable-file-name"></span> <span class="resumable-file-progress"></span>');
//                $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);
            // Actually start the upload
            r.upload();
        });
        r.on('pause', function () {
            // Show resume, hide pause
            $('.resumable-progress .progress-resume-link').show();
            $('.resumable-progress .progress-pause-link').hide();
        });
        r.on('complete', function () {
            // Hide pause/resume when the upload has completed
            $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();
        });
        r.on('fileSuccess', function (file, message) {
            message = $.parseJSON(message);
            $('#dept_logo').textbox('setValue',message.url);
            $('#img').attr('src', '${pageContext.request.contextPath}/tmp/' + message.url);
            console.log('完成:' + message);
            // Reflect that the file upload has completed
            $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').html('(completed)');
        });
        r.on('fileError', function (file, message) {
            // Reflect that the file upload has resulted in error
            $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').html('(file could not be uploaded: ' + message + ')');
        });
        r.on('fileProgress', function (file) {
            // Handle progress for both the file and the overall upload
            $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').html(Math.floor(file.progress() * 100) + '%');
            $('.progress-bar').css({width: Math.floor(r.progress() * 100) + '%'});
        });
    }
    $('#btn_save').on('click', function () {
        $.ajax({
            url: '../fileController/save.action',
            type: 'post',
            dataType: 'json',
            data: {fileName:$('#fileName').val()}
        }).done(function (ret) {
            if(ret.flag){
                console.log('保存成功');
            }else{
                console.log("保存失败");
            }
        }).fail(function () {
            console.log("保存失败");
        });
    })

</script>
</body>
</html>