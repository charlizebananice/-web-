<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022/11/30
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
    <title>订单</title>
    <script src="<c:url value="/webjars/jquery/3.5.1/jquery.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/webjars/bootstrap/4.6.1/css/bootstrap.min.css"/>"/>
    <script src="<c:url value="/webjars/bootstrap/4.6.1/js/bootstrap.min.js"/>"></script>

    <script src="https://unpkg.com/react@16/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js" crossorigin></script>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/deliveryManself">
        <img src="<c:url value="/static/assets/home.png"/>" width="30" height="30" class="d-inline-block align-top" alt="">
        配送员
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/deliveryorder">待接单 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-expanded="false">
                    我的配送
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/deliveringorder" >我的正在配送</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/orderhistory" >我的历史配送</a>
                    <div class="dropdown-divider"></div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link">当前状态：${deliveryMan.state}
                    <span class="sr-only">(current)</span></a>
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
            <a type="button" data-toggle="modal" data-target="#see_self-info${deliveryMan.deliveryManId}">欢迎您,${deliveryMan.deliveryManId}-${deliveryMan.deliveryManName} ></a>
            <img src="${pageContext.request.contextPath}/static/assets/login.png" width="30" height="30" type="button"
                 class="d-inline-block align-top" data-toggle="modal" data-target="#exampleModal${deliveryMan.deliveryManId}">
        </div>
    </div>
</nav>




<div class="col mb-4" margin: auto;>
    <div class = "form-group">
        <div>id :  ${deliveryMan.deliveryManId}</div>
        <div>name :  ${deliveryMan.deliveryManName}</div>
        <div>password :  ${deliveryMan.password}</div>
        <div>phoneNo :  ${deliveryMan.phoneNo}</div>
        <div>email :  ${deliveryMan.email}</div>



        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${deliveryMan.deliveryManId}">
            修改
        </button>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal${deliveryMan.deliveryManId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">修改管理员信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/deliveryManself/update/${deliveryMan.deliveryManId}" method="get">
                        <div class="form-group">
                            <label for="exampleInputEmail2">用户名</label>
                            <input type="text" class="form-control" id="exampleInputEmail2" name="deliveryManName" value="${deliveryMan.deliveryManName}" placeholder="${deliveryMan.deliveryManName}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword2">密码</label>
                            <input type="text" class="form-control" id="exampleInputPassword2" name="password" value="${deliveryMan.password}" placeholder="${deliveryMan.password}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail3">电话号码</label>
                            <input type="text" class="form-control" id="exampleInputEmail3" name="phoneNo" value="${deliveryMan.phoneNo}" placeholder="${deliveryMan.phoneNo}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail4">e-mail</label>
                            <input type="text" class="form-control" id="exampleInputEmail4" name="email" value="${deliveryMan.email}" placeholder="${deliveryMan.email}">
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

<%--页脚--%>
<ul class="nav fixed-bottom">
    <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/manager">manager</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/manager/order">Order</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/manager/deliveryMan">DeliveryMan</a>
    </li>
    <li class="nav-item pull-right">
        <a class="nav-link" href="https://github.com/charlizebananice/-web-">Github</a>
    </li>
</ul>
</body>
</html>
