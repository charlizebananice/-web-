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
    发布订单
</button>
<a class="btn btn-primary" href="http://localhost:8080/_web__war/manager/" role="button">查看管理员</a>
<a class="btn btn-primary" href="http://localhost:8080/_web__war/manager/deliveryMan/" role="button">查看派送员</a>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">发布订单</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="http://localhost:8080/_web__war/manager/order/" method="post">
                    <div class="form-group">
                        <label for="fee">费用</label>
                        <input required="required" type="number" class="form-control" id="fee" name="fee" placeholder="输入费用">
                    </div>
                    <div class="form-group">
                        <label for="shippingAddress">接货地址</label>
                        <input required="required" type="text" class="form-control" id="shippingAddress" name="shippingAddress" placeholder="输入接货地址">
                    </div>
                    <div class="form-group">
                        <label for="receiveAddress">配送地址</label>
                        <input required="required" type="text" class="form-control" id="receiveAddress" name="receiveAddress" placeholder="输入配送地址">
                    </div>
                    <div class="form-group">
                        <label for="managerId">管理员ID</label>
                        <input readonly="readonly" required="required" type="text" class="form-control" id="managerId" name="managerId" value="518">
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
<form class="form-inline mb-2" action="http://localhost:8080/_web__war/manager/order/id" method="get">
    <div class="form-group mx-sm-3 mb-2">
        <label for="inputPassword2" class="sr-only">Password</label>
        <input required="required" type="number" class="form-control" id="inputPassword2" name="id" placeholder="输入id进行查找">
    </div>
    <button type="submit" class="btn btn-primary mb-2">查找</button>
</form>
<form class="form-inline mb-2" action="http://localhost:8080/_web__war/manager/order/name" method="get">
    <div class="form-group mx-sm-3 mb-2">
        <label for="inputPassword2" class="sr-only">Password</label>
        <input required="required" type="text" class="form-control" id="inputPassword3" name="deliverymanName" placeholder="输入派送员姓名或地址">
    </div>
    <button type="submit" class="btn btn-primary mb-2">查找</button>
</form>
<c:forEach var="order" items="${data}">
    <div>订单号 :  ${order.orderId}</div>
    <div>订单状态 :  ${order.state}</div>
    <div>费用 :  ${order.fee}</div>
    <div>接货地址 :  ${order.shippingAddress}</div>
    <div>配送地址 :  ${order.receiveAddress}</div>
    <div>管理员ID :  ${order.managerId}</div>
    <div>派送员ID :  ${order.deliverymanId}</div>
    <div></div>

    <form action="http://localhost:8080/_web__war/manager/order/delete/${order.orderId}" method="get">

        <input type="submit" value="删除" />

    </form>
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${order.orderId}">
        修改
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal${order.orderId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">修改订单信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="http://localhost:8080/_web__war/manager/order/update/${order.orderId}" method="get">
                        <div class="form-group">
                            <label for="state1">状态</label>
                            <input required="required" type="number" class="form-control" id="state1" name="state" placeholder="更改订单状态" value="${order.state}">
                        </div>
                        <div class="form-group">
                            <label for="fee">费用</label>
                            <input required="required" type="number" class="form-control" id="fee1" name="fee" placeholder="输入费用" value="${order.fee}">
                        </div>
                        <div class="form-group">
                            <label for="shippingAddress">接货地址</label>
                            <input required="required" type="text" class="form-control" id="shippingAddress1" name="shippingAddress" placeholder="输入接货地址" value="${order.shippingAddress}">
                        </div>
                        <div class="form-group">
                            <label for="receiveAddress">配送地址</label>
                            <input required="required" type="text" class="form-control" id="receiveAddress1" name="receiveAddress" placeholder="输入配送地址" value="${order.receiveAddress}">
                        </div>
                        <div class="form-group">
                            <label for="managerId">管理员ID</label>
                            <input readonly="readonly" required="required" type="text" class="form-control" id="managerId1" name="managerId" value="518" value="${order.managerId}">
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
