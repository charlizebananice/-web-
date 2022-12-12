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
    <title>管理员</title>
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/webjars/bootstrap/4.6.1/css/bootstrap.min.css"/>"/>
    <script src="<c:url value="/webjars/bootstrap/4.6.1/js/bootstrap.min.js"/>"></script>
    <script src="https://unpkg.com/react@16/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js" crossorigin></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/manager">
        <img src="<c:url value="/static/assets/home.png"/>" width="30" height="30" class="d-inline-block align-top" alt="">
        管理员
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/order">Order <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/manager/deliveryman">配送员 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-expanded="false">
                    配送员管理
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#searchDeliveryman">搜索配送员</a>
                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#exampleModal">添加配送员</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/manager/deliveryman">显示全部的配送员</a>
                </div>
            </li>
            <%--<li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
                    Dropdown
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">配送员管理</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>--%>
        </ul>
        <div class="form-inline my-2 my-lg-0">
            欢迎您，${manager.managerId}-${manager.managerName}<%--${}--%>
            <img src="${pageContext.request.contextPath}/static/assets/login.png" width="30" height="30" class="d-inline-block align-top">

        </div>
    </div>
</nav>
<!-- Modal -->
<%--添加配送员弹窗--%>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">新增配送员</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/manager/deliveryman" method="post">
                    <div class="form-group">
                        <label for="exampleInputEmail1">用户名</label>
                        <input type="text" class="form-control" id="exampleInputEmail1" name="deliveryManName" placeholder="输入用户名">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">密码</label>
                        <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="输入密码">
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%--搜索管理员弹窗--%>
<div class="modal fade" id="searchDeliveryman" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">搜索配送员</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-inline mb-2" action="${pageContext.request.contextPath}/manager/deliveryman/id" method="get">
                    <div class="form-group mx-sm-3 mb-2">
                        <label for="inputPassword2" class="sr-only">Password</label>
                        <input required="required" type="number" class="form-control" id="inputPassword2" name="id" placeholder="输入id进行查找">
                    </div>
                    <button type="submit" class="btn btn-primary mb-2">查找</button>
                </form>
                <form class="form-inline mb-2" action="${pageContext.request.contextPath}/manager/deliveryman/name" method="get">
                    <div class="form-group mx-sm-3 mb-2">
                        <label for="inputPassword2" class="sr-only">Password</label>
                        <input required="required" type="text" class="form-control" id="inputPassword3" name="deliveryManName" placeholder="输入配送员姓名进行查找">
                    </div>
                    <button type="submit" class="btn btn-primary mb-2">查找</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%--管理员显示--%>
<div class="row row-cols-1 row-cols-md-4 mt-1 pl-1 pr-1"`>
    <c:forEach var="deliveryMan" items="${data}">
        <div class="col mb-4">
            <div class="card" style="width: 16rem;">
                <img src="${pageContext.request.contextPath}/static/assets/人物.png" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">id:  ${deliveryMan.deliveryManId}</h5>
                    <h5 class="card-title">name:  ${deliveryMan.deliveryManName}</h5>
                    <h5 class="card-title">password:  ${deliveryMan.password}</h5>
                    <form action="${pageContext.request.contextPath}/manager/deliveryman/delete/${deliveryMan.deliveryManId}" method="get">
                        <button type="submit" class="btn btn-secondary" data-dismiss="modal">删除</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${deliveryMan.deliveryManId}">
                            修改
                        </button>
                    </form>
                    <div class="modal fade" id="exampleModal${deliveryMan.deliveryManId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel2">修改配送员信息</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="${pageContext.request.contextPath}/manager/deliveryman/update/${deliveryMan.deliveryManId}" method="get">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">用户名</label>
                                            <input type="text" class="form-control" id="exampleInputEmail2" name="managerName" value="${deliveryMan.deliveryManName}" placeholder="${deliveryMan.deliveryManName}">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">密码</label>
                                            <input type="text" class="form-control" id="exampleInputPassword2" name="password" value="${deliveryMan.password}" placeholder="${deliveryMan.password}">
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
                </div>
            </div>
        </div>
    </c:forEach>
</div>
<%--页脚--%>
<ul class="nav fixed-bottom">
    <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/manager">manager</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/order">Order</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/deliveryMan">DeliveryMan</a>
    </li>
    <li class="nav-item pull-right">
        <a class="nav-link" href="https://github.com/charlizebananice/-web-">Github</a>
    </li>
</ul>
</body>
</html>
