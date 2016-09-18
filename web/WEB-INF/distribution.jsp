<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>遗产分布管理</title>
    <%@include file="ctx.jsp" %>
    <script>
        var distribution_search_closed = true;
        var distribution_datagrid;
        $(function () {
            distribution_datagrid = $("#distribution_datagrid");
            distribution_datagrid.datagrid({
                fit: true, //表格宽高自适应
                striped: true, //表格隔行变色
                rownumbers: true, //显示行号
                fitColumns: true, //列宽度自适应
                pagination: true, //显示分页条组件
                singleSelect: true,//只允许选择一行
                checkOnSelect: false,
                selectOnCheck: false,
                url: window.ctx + '/distribution/datagrid', //加载表格数据的url
                idField: 'disid', //主键字段
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
                            field: 'disid',
                            title: '编号',
                            hidden: true
                        },
                        {
                            field: 'disname',
                            title: '名称',
                            width: 100
                        },
                        {
                            field: 'disphoto_path',
                            title: '图片',
                            width: 100,
                            formatter: function (value, row, index) {
                                var url = ctx + "/upload/" + value;
                                return "<a target='_blank' href='" + url + "'><img width='100' height='50' src='" + url + "'/></a>";
                            }
                        },
                        {
                            field: 'describes',
                            title: '描述',
                            width: 150,
                            formatter: function (value, row, index) {
                                return "<span class='easyui-tooltip' title='" + value + "'>" + value + "</span>";
                            }
                        }
                    ]
                ],
                toolbar: [
                    { //工具条
                        text: '添加',
                        iconCls: 'icon-add',
                        handler: distribution_datagrid_add
                    },
                    '-',
                    {
                        text: '修改',
                        iconCls: 'icon-edit',
                        handler: distribution_datagrid_update
                    },
                    '-',
                    {
                        text: '删除',
                        iconCls: 'icon-no',
                        handler: distribution_datagrid_delete
                    }
                ]
            });
        });
        //添加遗产事件
        function distribution_datagrid_add() {
            $("#distribution_dialog_add").dialog("open");
            $("#distribution_form_add").form("reset");
        }
        //修改遗产事件
        function distribution_datagrid_update() {
            var selected = distribution_datagrid.datagrid("getSelected");
            if (selected) {
                $("#distribution_form_update").form("reset").form('load', selected);
                $("#distribution_dialog_update").dialog("open");
            } else {
                $.messager.show({
                    title: '提示',
                    msg: "请选择要修改的遗产...",
                    timeout: 2000
                });
            }
        }
        //添加遗产表单提交
        function distribution_form_add_submit() {
            $("#distribution_form_add").form("submit", {
                url: window.ctx + "/distribution/save",
                onSubmit: function () {
                    return $(this).form('enableValidation').form('validate');
                },
                success: function (data) {
                    $("#distribution_dialog_add").dialog("close");
                    var result = $.parseJSON(data);
                    defaultResultHolder(result, distribution_datagrid);
                }
            });
        }
        //编辑遗产表单提交
        function distribution_form_update_submit() {
            $("#distribution_form_update").form("submit", {
                url: window.ctx + "/distribution/save",
                onSubmit: function () {
                    return $(this).form('enableValidation').form('validate');
                },
                success: function (data) {
                    $("#distribution_dialog_update").dialog("close");
                    var result = $.parseJSON(data);
                    defaultResultHolder(result, distribution_datagrid);
                }
            });
        }
        //删除遗产
        function distribution_datagrid_delete(){
            var selected = distribution_datagrid.datagrid("getSelected");
            if (selected) {
                $.messager.confirm("警告", "确认删除该遗产么，该操作不可恢复！", function (r) {
                    if (r) {
                        $.post(window.ctx + "/distribution/delete/" + selected.disid, function (data) {
                            defaultResultHolder(data, distribution_datagrid);
                        }, "json");
                    }
                });
            }else {
                $.messager.show({
                    title: '提示',
                    msg: "请选择要删除的遗产...",
                    timeout: 2000
                });
            }
        }
        //搜索按钮事件
        function distribution_form_search_submit() {
            var params = $("#distribution_form_search").serializeForm();
            distribution_datagrid.datagrid("load", params);
        }
        //重置搜索事件
        function distribution_form_search_reset() {
            $("#distribution_form_search").form("reset");
            distribution_datagrid.datagrid("load", {});
        }
    </script>
    <style>
        #distribution_form_search td {
            text-align: right;
            padding: 3px 5px;
        }
        .tr {
            text-align: right;
        }
    </style>
</head>
<body>
<div id="distribution_layout" class="easyui-layout" data-options="fit:true,border:false">
    <div id="distribution_search" style="height:50px;overflow:hidden;"
         data-options="region:'north',border:false,collapsed:false,iconCls:'filter'">
        <form id="distribution_form_search" style="margin:10px">
            <table>
                <tr>
                    <td>名称：</td>
                    <td><input name="disname" class="easyui-textBox"/></td>
                    <td>
                        <button class="easyui-linkbutton" type="button"
                                onclick="distribution_form_search_submit()">检索
                        </button>
                        <button class="easyui-linkbutton" type="button"
                                onclick="distribution_form_search_reset()">重置
                        </button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:false">
        <table id="distribution_datagrid"></table>
    </div>
</div>

<div id="distribution_dialog_add" class="easyui-dialog" title="添加遗产" style="width:350px;"
     data-options="modal:true,closed:true,buttons: [{text: '确定',handler: distribution_form_add_submit},
                        {text: '取消',handler: function(){$('#distribution_dialog_add').dialog('close')}}]">
    <form id="distribution_form_add" method="post" enctype="multipart/form-data"
          class="easyui-form" data-options="novalidate:true"
          style="width:300px;margin: 10px 0 10px 30px">
        <table>
            <tr>
                <td class="tr">名称：</td>
                <td><input name="disname" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">图片：</td>
                <td><input name="disphoto_path_file" class="easyui-filebox"
                           data-options="required:true,validType:'file[\'jpg\',\'png\']'"></td>
            </tr>
            <tr>
                <td class="tr">描述：</td>
                <td><textarea name="describes" rows="4" cols="22"></textarea></td>
            </tr>
        </table>
    </form>
</div>

<div id="distribution_dialog_update" class="easyui-dialog" title="编辑遗产" style="width:350px;"
     data-options="modal:true,closed:true,buttons: [{text: '确定',handler: distribution_form_update_submit},
                        {text: '取消',handler: function(){$('#distribution_dialog_update').dialog('close')}}]">
    <form id="distribution_form_update" method="post" enctype="multipart/form-data"
          class="easyui-form" data-options="novalidate:true"
          style="width:300px;margin: 10px 0 0 30px">
        <input type="hidden" name="disid">
        <input type="hidden" name="disphoto_path">
        <table>
            <tr>
                <td class="tr">标题：</td>
                <td><input name="disname" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td></td>
                <td><span style="color: red">不上传则不修改</span></td>
            </tr>
            <tr>
                <td class="tr">图片：</td>
                <td><input name="disphoto_path_file" class="easyui-filebox"
                           data-options="validType:'file[\'jpg\',\'png\']'"></td>
            </tr>
            <tr>
                <td class="tr">描述：</td>
                <td><textarea name="describes" rows="4" cols="22"></textarea></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
