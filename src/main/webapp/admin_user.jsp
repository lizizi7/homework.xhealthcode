<%--
  Created by IntelliJ IDEA.
  User: t1542
  Date: 2020/5/26
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="dao.UserDao" scope="request"/>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>用户 - 健康码管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <%@include file="header.jspf"%>
    <div class="container">
        <div class="header header-fixed">
            标题栏
        </div>
        <div class="section data-section">
            <div class="data-control">
                <div id="msg" class="msg-info">插入成功</div>
                <div class="data-control-box">
                    <button id="button-add">添加</button>
                    <button id="button-delete">删除</button>
                </div>
                <div id="div-data-inserted" class="data-inserted">
                    <label><input id="input-name" type="text" placeholder="请输入学院的名称"></label>
                    <button id="button-submit">提交</button>
                    <button id="button-cancel">撤销</button>
                </div>
            </div>
            <table class="table table-user-school">
                <thead>
                    <tr>
                        <td>&nbsp;&nbsp;</td>
                        <td>学院名</td>
                        <td>老师健康码简况</td>
                        <td>学生健康码简况</td>
                    </tr>
                </thead>
                <%--                    <tr class="table-selected">--%>
                <%--                        <td><label><input type="checkbox"></label></td>--%>
                <%--                        <td><label><input type="text" value="计算机科学与计算机学院"></label></td>--%>
                <%--                        <td>98 / No Initialized</td>--%>
                <%--                        <td>47 / No Initialized</td>--%>
                <%--                    </tr>--%>
                <%--                    <tr>--%>
                <%--                        <td><label><input type="checkbox"></label></td>--%>
                <%--                        <td><label><input type="text" value="信息工程学院"></label></td>--%>
                <%--                        <td>45 / No Initialized</td>--%>
                <%--                        <td>20 / No Initialized</td>--%>
                <%--                    </tr>--%>
                <tbody id="data-tbody">

                </tbody>
            </table>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/js/api_fetch.js"></script>
    <script src="${pageContext.request.contextPath}/js/tool.js"></script>
    <script src="${pageContext.request.contextPath}/js/table_adapter.js"></script>
    <script src="${pageContext.request.contextPath}/js/data_inputs.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin_user.js"></script>
</body>
</html>
