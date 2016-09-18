<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>民窑资讯管理</title>
    <%@include file="ctx.jsp" %>
    <script>
        var myInfo_search_closed = true;
        var myInfo_datagrid;
        $(function () {
            myInfo_datagrid = $("#myInfo_datagrid");
            myInfo_datagrid.datagrid({
                fit: true, //表格宽高自适应
                striped: true, //表格隔行变色
                rownumbers: true, //显示行号
                fitColumns: true, //列宽度自适应
                pagination: true, //显示分页条组件
                singleSelect: true,//只允许选择一行
                checkOnSelect: false,
                selectOnCheck: false,
                url: window.ctx + '/myInfo/datagrid', //加载表格数据的url
                idField: 'mid', //主键字段
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
                            field: 'mid',
                            title: '编号',
                            hidden: true
                        },
                        {
                            field: 'msub',
                            title: '标题',
                            width: 100
                        },
                        {
                            field: 'photo_path',
                            title: '图片',
                            width: 80,
                            formatter: function (value, row, index) {
                                return "<a target='_blank' href='" + value + "'><img width='100' height='50' src='" + value + "'/></a>";
                            }
                        },
                        {
                            field: 'sort',
                            title: '排序',
                            width: 60
                        },
                        {
                            field: 'present',
                            title: '描述',
                            width: 100
                        },
                        {
                            field: 'detail',
                            title: '详情',
                            width: 150,
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
                        handler: myInfo_datagrid_add
                    },
                    '-',
                    {
                        text: '修改',
                        iconCls: 'icon-edit',
                        handler: myInfo_datagrid_update
                    },
                    '-',
                    {
                        text: '删除',
                        iconCls: 'icon-no',
                        handler: myInfo_datagrid_delete
                    }
                ]
            });
        });
        //添加资讯事件
        function myInfo_datagrid_add() {
            $("#myInfo_dialog_add").dialog("open");
            $("#myInfo_form_add").form("reset");
        }
        //修改资讯事件
        function myInfo_datagrid_update() {
            var selected = myInfo_datagrid.datagrid("getSelected");
            if (selected) {
                $("#myInfo_form_update").form("reset").form('load', selected);
                $("#myInfo_dialog_update").dialog("open");
            } else {
                $.messager.show({
                    title: '提示',
                    msg: "请选择要修改的资讯...",
                    timeout: 2000
                });
            }
        }
        //添加资讯表单提交
        function myInfo_form_add_submit() {
            $("#myInfo_form_add").form("submit", {
                url: window.ctx + "/myInfo/save",
                onSubmit: function () {
                    return $(this).form('enableValidation').form('validate');
                },
                success: function (data) {
                    $("#myInfo_dialog_add").dialog("close");
                    var result = $.parseJSON(data);
                    defaultResultHolder(result, myInfo_datagrid);
                }
            });
        }
        //编辑资讯表单提交
        function myInfo_form_update_submit() {
            $("#myInfo_form_update").form("submit", {
                url: window.ctx + "/myInfo/save",
                onSubmit: function () {
                    return $(this).form('enableValidation').form('validate');
                },
                success: function (data) {
                    $("#myInfo_dialog_update").dialog("close");
                    var result = $.parseJSON(data);
                    defaultResultHolder(result, myInfo_datagrid);
                }
            });
        }
        //删除资讯
        function myInfo_datagrid_delete(){
            var selected = myInfo_datagrid.datagrid("getSelected");
            if (selected) {
                $.messager.confirm("警告", "确认删除该资讯么，该操作不可恢复！", function (r) {
                    if (r) {
                        $.post(window.ctx + "/myInfo/delete/" + selected.mid, function (data) {
                            defaultResultHolder(data, myInfo_datagrid);
                        }, "json");
                    }
                });
            }else {
                $.messager.show({
                    title: '提示',
                    msg: "请选择要删除的资讯...",
                    timeout: 2000
                });
            }
        }
        //搜索按钮事件
        function myInfo_form_search_submit() {
            var params = $("#myInfo_form_search").serializeForm();
            myInfo_datagrid.datagrid("load", params);
        }
        //重置搜索事件
        function myInfo_form_search_reset() {
            $("#myInfo_form_search").form("reset");
            myInfo_datagrid.datagrid("load", {});
        }
    </script>
    <style>
        #myInfo_form_search td {
            text-align: right;
            padding: 3px 5px;
        }
        .tr {
            text-align: right;
        }
    </style>
</head>
<body>
<div id="myInfo_layout" class="easyui-layout" data-options="fit:true,border:false">
    <div id="myInfo_search" style="height:50px;overflow:hidden;"
         data-options="region:'north',border:false,collapsed:false,iconCls:'filter'">
        <form id="myInfo_form_search" style="margin:10px">
            <table>
                <tr>
                    <td>标题：</td>
                    <td><input name="msub" class="easyui-textBox"/></td>
                    <td>
                        <button class="easyui-linkbutton" type="button"
                                onclick="myInfo_form_search_submit()">检索
                        </button>
                        <button class="easyui-linkbutton" type="button"
                                onclick="myInfo_form_search_reset()">重置
                        </button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:false">
        <table id="myInfo_datagrid"></table>
    </div>
</div>

<div id="myInfo_dialog_add" class="easyui-dialog" title="添加资讯" style="width:350px;"
     data-options="modal:true,closed:true,buttons: [{text: '确定',handler: myInfo_form_add_submit},
                        {text: '取消',handler: function(){$('#myInfo_dialog_add').dialog('close')}}]">
    <form id="myInfo_form_add" method="post" enctype="multipart/form-data"
          class="easyui-form" data-options="novalidate:true"
          style="width:300px;margin: 10px 0 10px 30px">
        <table>
            <tr>
                <td class="tr">标题：</td>
                <td><input name="msub" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">图片：</td>
                <td><input name="photo_path_file" class="easyui-filebox"
                           data-options="required:true,validType:'file[\'jpg\',\'png\']'"></td>
            </tr>
            <tr>
                <td class="tr">排序：</td>
                <td><input name="sort" class="easyui-numberBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">描述：</td>
                <td><input name="present" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">详情：</td>
                <td><textarea name="detail" rows="4" cols="22"></textarea></td>
            </tr>
        </table>
    </form>
</div>

<div id="myInfo_dialog_update" class="easyui-dialog" title="编辑资讯" style="width:350px;"
     data-options="modal:true,closed:true,buttons: [{text: '确定',handler: myInfo_form_update_submit},
                        {text: '取消',handler: function(){$('#myInfo_dialog_update').dialog('close')}}]">
    <form id="myInfo_form_update" method="post" enctype="multipart/form-data"
          class="easyui-form" data-options="novalidate:true"
          style="width:300px;margin: 10px 0 0 30px">
        <input type="hidden" name="mid">
        <input type="hidden" name="photo_path">
        <table>
            <tr>
                <td class="tr">标题：</td>
                <td><input name="msub" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td></td>
                <td><span style="color: red">不上传则不修改</span></td>
            </tr>
            <tr>
                <td class="tr">图片：</td>
                <td><input name="photo_path_file" class="easyui-filebox"
                           data-options="validType:'file[\'jpg\',\'png\']'"></td>
            </tr>
            <tr>
                <td class="tr">排序：</td>
                <td><input name="sort" class="easyui-numberBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">描述：</td>
                <td><input name="present" class="easyui-textBox" data-options="required:true"></td>
            </tr>
            <tr>
                <td class="tr">详情：</td>
                <td><textarea name="detail" rows="4" cols="22"></textarea></td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
