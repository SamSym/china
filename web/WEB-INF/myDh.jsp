<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>民窑导航管理</title>
    <%@include file="ctx.jsp" %>
    <script>
        var myDh_search_closed = true;
        var myDh_datagrid;
        $(function () {
            myDh_datagrid = $("#myDh_datagrid");
            myDh_datagrid.datagrid({
                fit: true, //表格宽高自适应
                striped: true, //表格隔行变色
                rownumbers: true, //显示行号
                fitColumns: true, //列宽度自适应
                pagination: true, //显示分页条组件
                singleSelect: true,//只允许选择一行
                checkOnSelect: false,
                selectOnCheck: false,
                url: window.ctx + '/myDh/datagrid', //加载表格数据的url
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
                            field: 'did',
                            title: '编号',
                            hidden: true
                        },
                        {
                            field: 'dname',
                            title: '展厅名',
                            width: 100
                        },
                        {
                            field: 'd_sname',
                            title: '次展厅名',
                            width: 100
                        },
                        {
                            field: 'zt_photo_path',
                            title: '展厅分布图',
                            width: 100,
                            formatter: function (value, row, index) {
                                return "<a target='_blank' href='" + value + "'><img width='100' height='50' src='" + value + "'/></a>";
                            }
                        }
                    ]
                ],
                toolbar: [
                    { //工具条
                        text: '添加',
                        iconCls: 'icon-add',
                        handler: myDh_datagrid_add
                    },
                    '-',
                    {
                        text: '修改',
                        iconCls: 'icon-edit',
                        handler: myDh_datagrid_update
                    },
                    '-',
                    {
                        text: '删除',
                        iconCls: 'icon-no',
                        handler: myDh_datagrid_delete
                    }
                ]
            });
        });
        //添加导航事件
        function myDh_datagrid_add() {
            $("#myDh_dialog_add").dialog("open");
            $("#myDh_form_add").form("reset");
        }
        //修改导航事件
        function myDh_datagrid_update() {
            var selected = myDh_datagrid.datagrid("getSelected");
            if (selected) {
                $("#myDh_form_update").form("reset").form('load', selected);
                $("#myDh_dialog_update").dialog("open");
            } else {
                $.messager.show({
                    title: '提示',
                    msg: "请选择要修改的导航...",
                    timeout: 2000
                });
            }
        }
        //添加导航表单提交
        function myDh_form_add_submit() {
            $("#myDh_form_add").form("submit", {
                url: window.ctx + "/myDh/save",
                onSubmit: function () {
                    return $(this).form('enableValidation').form('validate');
                },
                success: function (data) {
                    $("#myDh_dialog_add").dialog("close");
                    var result = $.parseJSON(data);
                    defaultResultHolder(result, myDh_datagrid);
                }
            });
        }
        //编辑导航表单提交
        function myDh_form_update_submit() {
            $("#myDh_form_update").form("submit", {
                url: window.ctx + "/myDh/save",
                onSubmit: function () {
                    return $(this).form('enableValidation').form('validate');
                },
                success: function (data) {
                    $("#myDh_dialog_update").dialog("close");
                    var result = $.parseJSON(data);
                    defaultResultHolder(result, myDh_datagrid);
                }
            });
        }
        //删除导航
        function myDh_datagrid_delete(){
            var selected = myDh_datagrid.datagrid("getSelected");
            if (selected) {
                $.messager.confirm("警告", "确认删除该导航么，该操作不可恢复！", function (r) {
                    if (r) {
                        $.post(window.ctx + "/myDh/delete/" + selected.did, function (data) {
                            defaultResultHolder(data, myDh_datagrid);
                        }, "json");
                    }
                });
            }else {
                $.messager.show({
                    title: '提示',
                    msg: "请选择要删除的导航...",
                    timeout: 2000
                });
            }
        }
        //搜索按钮事件
        function myDh_form_search_submit() {
            var params = $("#myDh_form_search").serializeForm();
            myDh_datagrid.datagrid("load", params);
        }
        //重置搜索事件
        function myDh_form_search_reset() {
            $("#myDh_form_search").form("reset");
            myDh_datagrid.datagrid("load", {});
        }
    </script>
    <style>
        #myDh_form_search td {
            text-align: right;
            padding: 3px 5px;
        }
        .tr {
            text-align: right;
        }
    </style>
</head>
<body>
<div id="myDh_layout" class="easyui-layout" data-options="fit:true,border:false">
    <div id="myDh_search" style="height:50px;overflow:hidden;"
         data-options="region:'north',border:false,collapsed:false,iconCls:'filter'">
        <form id="myDh_form_search" style="margin:10px">
            <table>
                <tr>
                    <td>展厅名：</td>
                    <td><input name="dname" class="easyui-textBox"/></td>
                    <td>次展厅名：</td>
                    <td><input name="d_sname" class="easyui-textBox"/></td>
                    <td>
                        <button class="easyui-linkbutton" type="button"
                                onclick="myDh_form_search_submit()">检索
                        </button>
                        <button class="easyui-linkbutton" type="button"
                                onclick="myDh_form_search_reset()">重置
                        </button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:false">
        <table id="myDh_datagrid"></table>
    </div>
</div>

<div id="myDh_dialog_add" class="easyui-dialog" title="添加导航" style="width:350px;"
     data-options="modal:true,closed:true,buttons: [{text: '确定',handler: myDh_form_add_submit},
                        {text: '取消',handler: function(){$('#myDh_dialog_add').dialog('close')}}]">
    <form id="myDh_form_add" method="post" enctype="multipart/form-data"
          class="easyui-form" data-options="novalidate:true"
          style="width:300px;margin: 10px 0 10px 30px">
        <table>
            <tr>
                <td class="tr">展厅名：</td>
                <td><input name="dname" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">次展厅名：</td>
                <td><input name="d_sname" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">图片：</td>
                <td><input name="zt_photo_path_file" class="easyui-filebox"
                           data-options="required:true,validType:'file[\'jpg\',\'png\']'"></td>
            </tr>
        </table>
    </form>
</div>

<div id="myDh_dialog_update" class="easyui-dialog" title="编辑导航" style="width:350px;"
     data-options="modal:true,closed:true,buttons: [{text: '确定',handler: myDh_form_update_submit},
                        {text: '取消',handler: function(){$('#myDh_dialog_update').dialog('close')}}]">
    <form id="myDh_form_update" method="post" enctype="multipart/form-data"
          class="easyui-form" data-options="novalidate:true"
          style="width:300px;margin: 10px 0 0 30px">
        <input type="hidden" name="did">
        <input type="hidden" name="zt_photo_path">
        <table>
            <tr>
                <td class="tr">展厅名：</td>
                <td><input name="dname" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">次展厅名：</td>
                <td><input name="d_sname" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td></td>
                <td><span style="color: red">不上传则不修改</span></td>
            </tr>
            <tr>
                <td class="tr">图片：</td>
                <td><input name="zt_photo_path_file" class="easyui-filebox"
                           data-options="validType:'file[\'jpg\',\'png\']'"></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
