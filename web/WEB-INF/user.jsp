<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <%@include file="ctx.jsp" %>
    <script>
        var user_search_closed = true;
        var user_datagrid;
        $(function () {
            user_datagrid = $("#user_datagrid");
            user_datagrid.datagrid({
                fit: true, //表格宽高自适应
                striped: true, //表格隔行变色
                rownumbers: true, //显示行号
                fitColumns: true, //列宽度自适应
                pagination: true, //显示分页条组件
                singleSelect: true,//只允许选择一行
                checkOnSelect: false,
                selectOnCheck: false,
                url: window.ctx + '/user/datagrid', //加载表格数据的url
                idField: 'userid', //主键字段
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
                            field: 'userid',
                            title: '编号',
                            hidden: true
                        },
                        {
                            field: 'uname',
                            title: '昵称',
                            width: 100
                        },
                        {
                            field: 'dsname',
                            title: '第三方账号',
                            width: 100
                        },
                        {
                            field: 'age',
                            title: '年龄',
                            width: 100
                        },
                        {
                            field: 'sex',
                            title: '性别',
                            width: 100,
                            formatter: function (val, rowdata, index) {
                                if (rowdata.sex == 'M') {
                                    return "男";
                                } else if (rowdata.sex == 'F') {
                                    return "女";
                                } else {
                                    return "";
                                }
                            }
                        },
                        {
                            field: 'tel',
                            title: '电话',
                            width: 100
                        },
                        {
                            field: 'User_photo_path',
                            title: '头像',
                            width: 80,
                            formatter: function (value, row, index) {
                                return "<a target='_blank' href='" + value + "'><img width='100' height='50' src='" + value + "'/></a>";
                            }
                        }
                    ]
                ],
                toolbar: [
                    {
                        text: '删除',
                        iconCls: 'icon-no',
                        handler: user_datagrid_delete
                    }
                ]
            });
        });
        //删除用户
        function user_datagrid_delete(){
            var selected = user_datagrid.datagrid("getSelected");
            if (selected) {
                $.messager.confirm("警告", "确认删除该用户么，该操作不可恢复！", function (r) {
                    if (r) {
                        $.post(window.ctx + "/user/delete/" + selected.userid, function (data) {
                            defaultResultHolder(data, user_datagrid);
                        }, "json");
                    }
                });
            }else {
                $.messager.show({
                    title: '提示',
                    msg: "请选择要删除的用户...",
                    timeout: 2000
                });
            }
        }
        //搜索按钮事件
        function user_form_search_submit() {
            var params = $("#user_form_search").serializeForm();
            user_datagrid.datagrid("load", params);
        }
        //重置搜索事件
        function user_form_search_reset() {
            $("#user_form_search").form("reset");
            user_datagrid.datagrid("load", {});
        }
    </script>
    <style>
        #user_form_search td {
            text-align: right;
            padding: 3px 5px;
        }
        .tr {
            text-align: right;
        }
    </style>
</head>
<body>
<div id="user_layout" class="easyui-layout" data-options="fit:true,border:false">
    <div id="user_search" style="height:50px;overflow:hidden;"
         data-options="region:'north',border:false,collapsed:false,iconCls:'filter'">
        <form id="user_form_search" style="margin:10px">
            <table>
                <tr>
                    <td>昵称：</td>
                    <td><input name="uname" class="easyui-textBox"/></td>
                    <td>
                        <button class="easyui-linkbutton" type="button"
                                onclick="user_form_search_submit()">检索
                        </button>
                        <button class="easyui-linkbutton" type="button"
                                onclick="user_form_search_reset()">重置
                        </button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:false">
        <table id="user_datagrid"></table>
    </div>
</div>
</body>
</html>
