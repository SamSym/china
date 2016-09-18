<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>藏品介绍管理</title>
    <%@include file="ctx.jsp" %>
    <script>
        var collection_search_closed = true;
        var collection_datagrid;
        $(function () {
            collection_datagrid = $("#collection_datagrid");
            collection_datagrid.datagrid({
                fit: true, //表格宽高自适应
                striped: true, //表格隔行变色
                rownumbers: true, //显示行号
                fitColumns: true, //列宽度自适应
                pagination: true, //显示分页条组件
                singleSelect: true,//只允许选择一行
                checkOnSelect: false,
                selectOnCheck: false,
                url: window.ctx + '/collection/datagrid', //加载表格数据的url
                idField: 'cid', //主键字段
                pageSize: 20, //每页显示行
                pageList: [10, 20, 30, 50, 100],//选择每页选择行数列表
                loadMsg: '数据正在加载,请稍后...', //ajax加载时的提示信息
                loadFilter: function(data){
                    return {
                        total: data.totalRow,
                        rows: data.list
                    };
                },
                columns: [
                    [
                        {
                            field: 'cid',
                            title: 'ID',
                            hidden: true
                        },
                        {
                            field: 'c_no',
                            title: '编号',
                            width: 80
                        },
                        {
                            field: 'cname',
                            title: '名称',
                            width: 100
                        },
                        {
                            field: 'collection_photo_path',
                            title: '图片',
                            width: 80,
                            formatter: function (value, row, index) {
                                var url = ctx + "/upload/" + value;
                                return "<a target='_blank' href='" + url + "'><img width='100' height='50' src='" + url + "'/></a>";
                            }
                        },
                        {
                            field: 'collection_cd',
                            title: '朝代',
                            width: 80
                        },
                        {
                            field: 'c_weight',
                            title: '重量',
                            width: 60
                        },
                        {
                            field: 'zs',
                            title: '推荐指数',
                            width: 60
                        },
                        {
                            field: 'display',
                            title: '所在展厅',
                            width: 80
                        },
                        {
                            field: 'c_js',
                            title: '介绍',
                            width: 130,
                            formatter: function (value, row, index) {
                                return "<span class='easyui-tooltip' title='" + value + "'>" + value + "</span>";
                            }
                        },
                        {
                            field: 'create_time',
                            title: '添加时间',
                            width: 100,
                            formatter: function (value, row, index) {
                                return new Date(value).format("yyyy-MM-dd HH:mm");
                            }
                        }
                    ]
                ],
                toolbar: [
                    { //工具条
                        text: '添加',
                        iconCls: 'icon-add',
                        handler: collection_datagrid_add
                    },
                    '-',
                    {
                        text: '修改',
                        iconCls: 'icon-edit',
                        handler: collection_datagrid_update
                    },
                    '-',
                    {
                        text: '删除',
                        iconCls: 'icon-no',
                        handler: collection_datagrid_delete
                    }
                ]
            });
        });
        //添加藏品事件
        function collection_datagrid_add() {
            $("#collection_dialog_add").dialog("open");
            $("#collection_form_add").form("reset");
        }
        //修改藏品事件
        function collection_datagrid_update() {
            var selected = collection_datagrid.datagrid("getSelected");
            if (selected) {
                $("#collection_form_update").form("reset").form('load', selected);
                $("#collection_dialog_update").dialog("open");
            } else {
                $.messager.show({
                    title: '提示',
                    msg: "请选择要修改的藏品...",
                    timeout: 2000
                });
            }
        }
        //添加藏品表单提交
        function collection_form_add_submit() {
            $("#collection_form_add").form("submit", {
                url: window.ctx + "/collection/save",
                onSubmit: function () {
                    return $(this).form('enableValidation').form('validate');
                },
                success: function (data) {
                    $("#collection_dialog_add").dialog("close");
                    var result = $.parseJSON(data);
                    defaultResultHolder(result, collection_datagrid);
                }
            });
        }
        //编辑藏品表单提交
        function collection_form_update_submit() {
            $("#collection_form_update").form("submit", {
                url: window.ctx + "/collection/save",
                onSubmit: function () {
                    return $(this).form('enableValidation').form('validate');
                },
                success: function (data) {
                    $("#collection_dialog_update").dialog("close");
                    var result = $.parseJSON(data);
                    defaultResultHolder(result, collection_datagrid);
                }
            });
        }
        //删除藏品
        function collection_datagrid_delete(){
            var selected = collection_datagrid.datagrid("getSelected");
            if (selected) {
                $.messager.confirm("警告", "确认删除该藏品么，该操作不可恢复！", function (r) {
                    if (r) {
                        $.post(window.ctx + "/collection/delete/" + selected.cid, function (data) {
                            defaultResultHolder(data, collection_datagrid);
                        }, "json");
                    }
                });
            }else {
                $.messager.show({
                    title: '提示',
                    msg: "请选择要删除的藏品...",
                    timeout: 2000
                });
            }
        }
        //搜索按钮事件
        function collection_form_search_submit() {
            var params = $("#collection_form_search").serializeForm();
            collection_datagrid.datagrid("load", params);
        }
        //重置搜索事件
        function collection_form_search_reset() {
            $("#collection_form_search").form("reset");
            collection_datagrid.datagrid("load", {});
        }
    </script>
    <style>
        #collection_form_search td {
            text-align: right;
            padding: 3px 5px;
        }
        .tr {
            text-align: right;
        }
    </style>
</head>
<body>
<div id="collection_layout" class="easyui-layout" data-options="fit:true,border:false">
    <div id="collection_search" style="height:50px;overflow:hidden;"
         data-options="region:'north',border:false,collapsed:false,iconCls:'filter'">
        <form id="collection_form_search" style="margin:10px">
            <table>
                <tr>
                    <td>编号：</td>
                    <td><input name="c_no" class="easyui-textBox"/></td>
                    <td>名称：</td>
                    <td><input name="cname" class="easyui-textBox"/></td>
                    <td>朝代：</td>
                    <td><input name="collection_cd" class="easyui-textBox"/></td>
                    <td>所在展厅：</td>
                    <td><input name="display" class="easyui-textBox"/></td>
                    <td>
                        <button class="easyui-linkbutton" type="button"
                                onclick="collection_form_search_submit()">检索
                        </button>
                        <button class="easyui-linkbutton" type="button"
                                onclick="collection_form_search_reset()">重置
                        </button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:false">
        <table id="collection_datagrid"></table>
    </div>
</div>

<div id="collection_dialog_add" class="easyui-dialog" title="添加藏品" style="width:350px;"
     data-options="modal:true,closed:true,buttons: [{text: '确定',handler: collection_form_add_submit},
                        {text: '取消',handler: function(){$('#collection_dialog_add').dialog('close')}}]">
    <form id="collection_form_add" method="post" enctype="multipart/form-data"
          class="easyui-form" data-options="novalidate:true"
          style="width:300px;margin: 10px 0 10px 30px">
        <table>
            <tr>
                <td class="tr">编号：</td>
                <td><input name="c_no" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">名称：</td>
                <td><input name="cname" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">图片：</td>
                <td><input name="collection_photo_path_file" class="easyui-filebox"
                           data-options="required:true,validType:'file[\'jpg\',\'png\']'"></td>
            </tr>
            <tr>
                <td class="tr">朝代：</td>
                <td><input name="collection_cd" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">重量：</td>
                <td><input name="c_weight" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">推荐指数：</td>
                <td><input name="zs" class="easyui-numberBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">所在展厅：</td>
                <td><input name="display" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">介绍：</td>
                <td><textarea name="c_js"  rows="4" cols="22"></textarea></td>
            </tr>
        </table>
    </form>
</div>

<div id="collection_dialog_update" class="easyui-dialog" title="编辑藏品" style="width:350px;"
     data-options="modal:true,closed:true,buttons: [{text: '确定',handler: collection_form_update_submit},
                        {text: '取消',handler: function(){$('#collection_dialog_update').dialog('close')}}]">
    <form id="collection_form_update" method="post" enctype="multipart/form-data"
          class="easyui-form" data-options="novalidate:true"
          style="width:300px;margin: 10px 0 0 30px">
        <input type="hidden" name="cid">
        <input type="hidden" name="collection_photo_path">
        <table>
            <tr>
                <td class="tr">编号：</td>
                <td><input name="c_no" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">名称：</td>
                <td><input name="cname" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td></td>
                <td><span style="color: red">不上传则不修改</span></td>
            </tr>
            <tr>
                <td class="tr">图片：</td>
                <td><input name="collection_photo_path_file" class="easyui-filebox"
                           data-options="validType:'file[\'jpg\',\'png\']'"></td>
            </tr>
            <tr>
                <td class="tr">朝代：</td>
                <td><input name="collection_cd" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">重量：</td>
                <td><input name="c_weight" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">推荐指数：</td>
                <td><input name="zs" class="easyui-numberBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">所在展厅：</td>
                <td><input name="display" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">介绍：</td>
                <td><textarea name="c_js"  rows="4" cols="22"></textarea></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
