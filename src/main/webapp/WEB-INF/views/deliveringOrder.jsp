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




<div class="row row-cols-1 row-cols-md-4 mt-1 pl-1 pr-1"`>
    <c:forEach var="order" items="${data}">
        <div class="col mb-4">
            <div class="card" style="width: 16rem;">
                    <%--
                                                <img src="${pageContext.request.contextPath}/static/assets/人物.png" class="card-img-top" alt="...">
                    --%>
                <div class="card-body">
                    <h5 class="card-title">订单号 :  ${order.orderId}</h5>
                    <h5 class="card-title">订单状态 :  ${order.state}</h5>
                    <h5 class="card-title">费用 :  ${order.fee}</h5>
                    <h5 class="card-title">接货地址 :  ${order.shippingAddress}</h5>
                    <h5 class="card-title">配送地址 :  ${order.receiveAddress}</h5>
                    <h5 class="card-title">管理员ID :  ${order.managerId}</h5>
                    <h5 class="card-title">派送员ID :  ${order.deliverymanId}</h5>

                    <form action="${pageContext.request.contextPath}/manager/order/delete/${order.orderId}" method="get">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${order.orderId}">
                            完成订单
                        </button>
                    </form>
                        <%--修改订单信息--%>
                    <div class="modal fade" id="exampleModal${order.orderId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel2">订单信息</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="${pageContext.request.contextPath}/deliveringorder/update1/${order.orderId}" method="get">
                                        <div class="form-group">
                                            <label >状态</label>
                                            <div class="form-control">${order.state}</div>
                                        </div>
                                        <div class="form-group">
                                            <label >费用</label>
                                            <div class="form-control">${order.fee}</div>
                                        </div>
                                        <div class="form-group">
                                            <label >接货地址</label>
                                            <div class="form-control">${order.shippingAddress}</div>
                                        </div>
                                        <div class="form-group">
                                            <label >配送地址</label>
                                            <div class="form-control">${order.receiveAddress}</div>
                                        </div>
                                        <div class="form-group">
                                            <label >管理员ID</label>
                                            <div class="form-control">${order.managerId}</div>
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
