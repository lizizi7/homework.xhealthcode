<%@ page import="enums.RoleType" %><%--
  Created by IntelliJ IDEA.
  User: t1542
  Date: 2020/6/3
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" type="dao.UserDao" scope="request"/>
<jsp:useBean id="path" type="dao.PathDao" scope="request"/>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>班级 - 健康码管理系统</title>
    <%@include file="scripts.jspf"%>
</head>
<body>
    <%@ include file="header.jspf"%>
    <div class="container">
<%--        <div class="header header-fixed">--%>
<%--            标题栏--%>
<%--        </div>--%>
        <div class="section data-section">
            <div class="navigator">
                <div class="navigator-first">
                    <a href="${pageContext.servletContext.contextPath}/admin/college">学校</a>
                    <span>/</span>
                    <a href="${pageContext.servletContext.contextPath}/admin/college?page=profession&college=${college.id}">${college.name}</a>
                    <span>/</span>
                    <a href="${pageContext.servletContext.contextPath}/admin/college?page=xclass&profession=${profession.id}">${profession.name}</a>
                </div>
                <div class="navigator-second">

                </div>
            </div>
            <div class="data-control" <% if(user.getAdminType() != RoleType.SYSTEM) {%> hidden <%}%>>
                <div id="msg" class="msg-info">插入成功</div>
                <div class="data-control-box">
                    <button id="button-add">添加</button>
                    <button id="button-delete">删除</button>
                </div>
                <div id="div-data-inserted" class="data-inserted">
                    <label><input id="input-name" type="text" placeholder="请输出班级的名称"></label>
                    <button id="button-submit">提交</button>
                    <button id="button-cancel">撤销</button>
                </div>
            </div>
            <table class="table table-user-school">
                <thead>
                <tr>
                    <td>&nbsp;&nbsp;</td>
                    <td>  </td>
                    <td>学院名</td>
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

    <script>
        professionId = ${path.professionId};
        locator = new Locator(-1, 0, 'profession', professionId);
        locator.college = '${path.college}';
        locator.collegeId = ${path.collegeId};
        locator.profession = '${path.profession}';
        locator.professionId = ${path.professionId};
    </script>
    <script src="${pageContext.servletContext.contextPath}/js/admin_xclass.js"></script>
</body>
</html>
