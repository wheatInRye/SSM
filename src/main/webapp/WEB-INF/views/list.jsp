<%--
  Created by IntelliJ IDEA.
  User: 冯庆
  Date: 2018/7/31
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath }/static/js/jquery-1.12.4.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <%--标题--%>
        <div class="row">
            <div class="col-xs-12">
                <h2>SSM_CRUD</h2>
            </div>
        </div>
        <%--按钮--%>
        <div class="row">
            <div class="col-xs-12 col-xs-offset-10">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-warning">删除</button>
            </div>
        </div>
         <br>

         <%--员工信息--%>
        <div class="row">
            <div class="col-xs-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>department</th>
                        <th>操作</th>
                    </tr>

                    <%--遍历pageInfo中员工信息--%>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-xs">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-warning btn-xs">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>


        <%--页码信息--%>
        <div class="row">
            <div>当前第 ${pageInfo.pageNum}页,总共${pageInfo.pages}页</div>
            <div class="col-xs-12 col-xs-offset-8">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath }/emps?pn=1">首页</a>
                            </c:if>
                        </li>
                        <li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <a href="${pageContext.request.contextPath }/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </c:if>

                        </li>
                        <c:forEach items="${pageInfo.navigatepageNums }" var="page">
                            <c:if test="${page == pageInfo.pageNum}">
                                <li class="active"><a href="#">${page}</a></li>
                            </c:if>
                            <c:if test="${page != pageInfo.pageNum}">
                                <li ><a href="${pageContext.request.contextPath }/emps?pn=${page}">${page}</a></li>
                            </c:if>
                        </c:forEach>
                        <li>
                            <c:if test="${pageInfo.hasNextPage}">
                                <a href="${pageContext.request.contextPath }/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </c:if>
                        </li>
                        <li>
                            <c:if test="${pageInfo.hasNextPage}">
                                <a href="${pageContext.request.contextPath }/emps?pn=${pageInfo.pages}">末页</a>
                            </c:if>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
