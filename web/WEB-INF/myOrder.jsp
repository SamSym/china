<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户预约管理</title>
    <%@include file="ctx.jsp" %>
    <script>
        var myOrder_search_closed = true;
        var myOrder_datagrid;
        $(function () {
            myOrder_datagrid = $("#myOrder_datagrid");
            myOrder_datagrid.datagrid({
                fit: true, //表格宽高自适应
                striped: true, //表格隔行变色
                rownumbers: true, //显示行号
                fitColumns: true, //列宽度自适应
                pagination: true, //显示分页条组件
                singleSelect: true,//只允许选择一行
                checkOnSelect: false,
                selectOnCheck: false,
                url: window.ctx + '/myOrder/datagrid', //加载表格数据的url
                idField: 'oid', //主键字段
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
                            field: 'oid',
                            title: '编号',
                            hidden: true
                        },
                        {
                            field: 'name',
                            title: '姓名',
                            width: 100
                        },
                        {
                            field: 'card',
                            title: '证件号码',
                            width: 100
                        },
                        {
                            field: 'tel',
                            title: '电话',
                            width: 100
                        },
                        {
                            field: 'email',
                            title: '邮箱',
                            width: 100
                        },
                        {
                            field: 'order_date',
                            title: '预约日期',
                            width: 100
                        },
                        {
                            field: 'order_time',
                            title: '预约时间',
                            width: 100
                        },
                        {
                            field: 'create_time',
                            title: '创建时间',
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
                        handler: myOrder_datagrid_delete
                    }
                ]
            });
        });
        //删除预约
        function myOrder_datagrid_delete(){
            var selected = myOrder_datagrid.datagrid("getSelected");
            if (selected) {
                $.messager.confirm("警告", "确认删除该预约么，该操作不可恢复！", function (r) {
                    if (r) {
                        $.post(window.ctx + "/myOrder/delete/" + selected.oid, function (data) {
                            defaultResultHolder(data, myOrder_datagrid);
                        }, "json");
                    }
                });
            }else {
                $.myOrderr.show({
                    title: '提示',
                    msg: "请选择要删除的预约...",
                    timeout: 2000
                });
            }
        }
    </script>
</head>
<body>
<table id="myOrder_datagrid"></table>
</body>
</html>
