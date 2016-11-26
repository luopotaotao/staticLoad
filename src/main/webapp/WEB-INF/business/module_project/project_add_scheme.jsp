<%--
  Created by IntelliJ IDEA.
  User: tt
  Date: 2016/10/12
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="width:100%;max-width:600px;padding:30px 60px;">
    <form id="ff" class="easyui-form" method="post" data-options="novalidate:true" action="${pageContext.request.contextPath}/moduleInspectSchemeController/post.action">
        <div style="margin-bottom:20px;display: none">
            <input class="easyui-textbox" name="id" style="width:100%" data-options="label:'编号:'">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="name" style="width:100%" data-options="label:'方案名称:',required:true">
        </div>
        <div style="margin-bottom:20px;display: none">
            <input name="project.id" style="width:100%">
        </div>
        <div style="margin-bottom:20px">
            <select class="easyui-combobox" data-options="editable:false,labelAlign:'right'" name="basement_lev"
                    label="低级基础设计等级:"
                    style="width:100%">
                <option value="1">甲级</option>
                <option value="2">乙级</option>
                <option value="3">丙级</option>
            </select>
        </div>
        <div style="margin-bottom:20px">
            <select class="easyui-combobox" data-options="editable:false,labelAlign:'right'" name="safety_lev"
                    label="建筑安全等级:"
                    style="width:100%">
                <option value="1">一级</option>
                <option value="2">二级</option>
                <option value="3">三级</option>
            </select>
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-numberbox" name="pile_count" style="width:100%"
                   data-options="label:'总桩数:',labelAlign:'right',required:true">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox select" name="institution.id" style="width:100%"
                   data-options="label:'检测单位:',labelAlign:'right',required:true,editable:false,buttonText:'选择',
                   buttonIcon:'icon-search'" url="${pageContext.request.contextPath}/moduleInspectSchemeController/selectInstitution.action">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="code" style="width:100%"
                   data-options="label:'检测方案审批表:',labelAlign:'right',required:true">
        </div>
        <div style="margin-bottom:20px">
            <input class="easyui-textbox" name="attachement" style="width:100%"
                   data-options="label:'检测方案附件:',labelAlign:'right'">
        </div>
        <div style="margin-bottom:20px">
            <div style="margin-bottom:20px">
                <select id="inspectItem_id" class="easyui-combobox" name="inspectItem.id" style="width:100%"
                        data-options="label:'检测项目:',
            labelAlign:'right',
            url:'${pageContext.request.contextPath}/moduleBasicInspectItemController/comboList.action',
            method:'get',
            valueField: 'id',
            textField: 'name'
            ">
                </select>
            </div>
        </div>
    </form>
</div>

<script>
    $(function () {
        $('input.select').textbox({
            onClickButton: function () {
                var _this = this;
                var url = $(this).attr('url');
                selectChild(url, function (data) {
                    var names = [];
                    var ids = [];
                    $.each(data, function (i, item) {
                        ids.push(item.id);
                        names.push(item.name);
                    });
                    $(_this).textbox('setValue', ids);
                    $(_this).textbox('setText', names);
                });
            }
        });

        function selectChild(url, callback) {
            var $doc = $(document);
            var height = screen.availHeight * 0.6, width = screen.availWidth * 0.6;
            var $div = $('<div/>', {'height': height, width: width});
            $div.dialog({
                title: '请选择',
                closed: false,
                cache: true,
                href: url,
                modal: true,
                buttons: [{
                    text: '确定',
                    handler: function () {
                        if (true || $.isFunction(callback)) {
                            var data = $div.find('#grid').datagrid('getChecked');
                            if (data && data.length > 0) {
                                $div.dialog('close');
                                callback(data);
                            } else {
                                $.messager.alert('提示', '请选择数据!');
                            }
                        }
                    }
                }, {
                    text: '取消',
                    handler: function () {
                        $div.dialog('close');
                    }
                }]
            });
        }
    });
</script>