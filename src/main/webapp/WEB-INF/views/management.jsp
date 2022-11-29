<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/11/28
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
    <title>Title</title>
    <script src="<c:url value="/webjars/jquery/3.5.1/jquery.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/webjars/bootstrap/4.6.1/css/bootstrap.min.css"/>"/>
    <script src="<c:url value="/webjars/bootstrap/4.6.1/js/bootstrap.min.js"/>"></script>

    <script src="https://unpkg.com/react@16/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js" crossorigin></script>

    <script src="<c:url value="/static/like_button.js"/>"></script>
</head>
<body>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
    新增管理员
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">新增管理员</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="http://localhost:8080/_web__war/manager/" method="post">
                    <div class="form-group">
                        <label for="exampleInputEmail1">用户名</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" name="managerName" placeholder="输入用户名">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">密码</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="输入密码">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<form class="form-inline mb-2" action="http://localhost:8080/_web__war/manager/id" method="get">
    <div class="form-group mx-sm-3 mb-2">
        <label for="inputPassword2" class="sr-only">Password</label>
        <input required="required" type="number" class="form-control" id="inputPassword2" name="id" placeholder="输入id进行查找">
    </div>
    <button type="submit" class="btn btn-primary mb-2">查找</button>
</form>
<form class="form-inline mb-2" action="http://localhost:8080/_web__war/manager/name" method="get">
    <div class="form-group mx-sm-3 mb-2">
        <label for="inputPassword2" class="sr-only">Password</label>
        <input required="required" type="text" class="form-control" id="inputPassword3" name="managerName" placeholder="输入管理员姓名进行查找">
    </div>
    <button type="submit" class="btn btn-primary mb-2">查找</button>
</form>
<c:forEach var="manager" items="${data}">
    <div>id :  ${manager.managerId}</div>
    <div>name :  ${manager.managerName}</div>
    <div>password :  ${manager.password}</div>
    <div></div>

    <!--这里应发送delete请求-->
    <form action="http://localhost:8080/_web__war/manager/delete/${manager.managerId}" method="get">

        <input type="submit" value="删除" />

    </form>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${manager.managerName}">
        修改
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal${manager.managerName}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">修改管理员信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="http://localhost:8080/_web__war/manager/update/${manager.managerId}" method="get">
                        <div class="form-group">
                            <label for="exampleInputEmail1">用户名</label>
                            <input type="text" class="form-control" id="exampleInputEmail2" name="managerName" value="${manager.managerName}" placeholder="${manager.managerName}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">密码</label>
                            <input type="text" class="form-control" id="exampleInputPassword2" name="password" value="${manager.password}" placeholder="${manager.password}">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</body>
</html>
