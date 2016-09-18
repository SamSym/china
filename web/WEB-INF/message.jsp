<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户留言管理</title>
    <%@include file="ctx.jsp" %>
    <script>
        var message_search_closed = true;
        var message_datagrid;
        $(function () {
            message_datagrid = $("#message_datagrid");
            message_datagrid.datagrid({
                fit: true, //表格宽高自适应
                striped: true, //表格隔行变色
                rownumbers: true, //显示行号
                fitColumns: true, //列宽度自适应
                pagination: true, //显示分页条组件
                singleSelect: true,//只允许选择一行
                checkOnSelect: false,
                selectOnCheck: false,
                url: window.ctx + '/message/datagrid', //加载表格数据的url
                idField: 'meid', //主键字段
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
                            field: 'meid',
                            title: '编号',
                            hidden: true
                        },
                        {
                            field: 'sname',
                            title: '昵称',
                            width: 100
                        },
                        {
                            field: 'photo',
                            title: '头像',
                            width: 100,
                            formatter: function (value, row, index) {
                                return "<a target='_blank' href='" + value + "'><img width='100' height='50' src='" + value + "'/></a>";
                            }
                        },
                        {
                            field: 'content',
                            title: '内容',
                            width: 200,
                            formatter: function (value, row, index) {
                                return "<span class='easyui-tooltip' title='" + value + "'>" + value + "</span>";
                            }
                        },
                        {
                            field: 'create_time',
                            title: '留言时间',
                            width: 100,
                            formatter: function (value, row, index) {
                                return new Date(value).format("yyyy-MM-dd HH:mm");
                            }
                        }
                    ]
                ],
                toolbar: [
                    {
                        text: '删除',
                        iconCls: 'icon-no',
                        handler: message_datagrid_delete
                    }
                ]
            });
        });
        //删除留言
        function message_datagrid_delete(){
            var selected = message_datagrid.datagrid("getSelected");
            if (selected) {
                $.messager.confirm("警告", "确认删除该留言么，该操作不可恢复！", function (r) {
                    if (r) {
                        $.post(window.ctx + "/message/delete/" + selected.meid, function (data) {
                            defaultResultHolder(data, message_datagrid);
                        }, "json");
                    }
                });
            }else {
                $.messager.show({
                    title: '提示',
                    msg: "请选择要删除的留言...",
                    timeout: 2000
                });
            }
        }
    </script>
</head>
<body>
<table id="message_datagrid"></table>
</body>
</html>
