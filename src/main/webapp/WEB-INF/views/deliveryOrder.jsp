<%--
  Created by IntelliJ IDEA.
  User: zhy
  Date: 2022/12/5
  Time: 14:54
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
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script src="https://unpkg.com/react@16/umd/react.development.js" crossorigin></script>
    <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js" crossorigin></script>

    <script src="<c:url value="/static/like_button.js"/>"></script>
</head>
<script type="text/javascript">

        document.getElementById("button1").style.display="";

</script>
<body>
<%--banner--%>

<!-- Button trigger modal -->
<a class="btn btn-primary"
   href="http://localhost:8080/Intra_cityDistributionManagementSystem_war/deliveryManself"
   role="button">个人信息及修改</a>



<div>id :  ${deliveryMan.deliveryManId}</div>
<div>name :  ${deliveryMan.deliveryManName}</div>
<div>password :  ${deliveryMan.password}</div>
<div>phoneNo :  ${deliveryMan.phoneNo}</div>
<div>email :  ${deliveryMan.email}</div>
<div>state :  ${deliveryMan.state}</div>
<div></div>



<form class="form-inline mb-2"
      action="http://localhost:8080/Intra_cityDistributionManagementSystem_war/orderhistory" method="get">

    <button type="submit" class="btn btn-primary mb-2">查找我的历史订单</button>
</form>
<!-- Modal -->

<form class="form-inline mb-2"
      action="http://localhost:8080/Intra_cityDistributionManagementSystem_war/deliveryorder/id" method="get">
    <div class="form-group mx-sm-3 mb-2">
        <label for="inputPassword2" class="sr-only">Password</label>
        <input required="required" type="number" class="form-control" id="inputPassword2" name="id"
               placeholder="输入id进行查找">
    </div>
    <button type="submit" class="btn btn-primary mb-2">查找</button>
</form>
<form class="form-inline mb-2"
      action="http://localhost:8080/Intra_cityDistributionManagementSystem_war/deliveryorder/name" method="get">
    <div class="form-group mx-sm-3 mb-2">
        <label for="inputPassword2" class="sr-only">Password</label>
        <input required="required" type="text" class="form-control" id="inputPassword3" name="deliverymanName"
               placeholder="输入派送员姓名或地址">
    </div>
    <button type="submit" class="btn btn-primary mb-2">查找</button>
</form>
<c:forEach var="order" items="${data}">
    <div>订单号 : ${order.orderId}</div>
    <div>订单状态 : ${order.state}</div>
    <div>费用 : ${order.fee}</div>
    <div>接货地址 : ${order.shippingAddress}</div>
    <div>配送地址 : ${order.receiveAddress}</div>
    <div>管理员ID : ${order.managerId}</div>
    <div>派送员ID : ${order.deliverymanId}</div>
    <div></div>

    <!-- Button trigger modal -->
    <button type="button" id="button1" class="btn btn-primary" data-toggle="modal"
            data-target="#exampleModal${order.orderId}">
        接单
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal${order.orderId}" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel3">订单信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="http://localhost:8080/Intra_cityDistributionManagementSystem_war/deliveryorder/update/${order.orderId}"
                          method="get">
                        <div class="form-group">
                            <label>状态</label>
                            <div>${order.state}</div>
                        </div>
                        <div class="form-group">
                            <label>费用</label>
                            <div>${order.fee}</div>
                        </div>
                        <div class="form-group">
                            <label>接货地址</label>
                            <div>${order.shippingAddress}</div>

                        </div>
                        <div class="form-group">
                            <label>配送地址</label>
                            <div>${order.receiveAddress}</div>
                        </div>
                        <div class="form-group">
                            <label>管理员ID</label>
                            <div>${order.managerId}</div>
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
