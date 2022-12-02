<%--
  Created by IntelliJ IDEA.
  User: zhy
  Date: 2022/12/1
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
    <head>
        <title></title>
        <script src="<c:url value="/webjars/jquery/3.5.1/jquery.min.js"/>"></script>
        <link rel="stylesheet" href="<c:url value="/webjars/bootstrap/4.6.1/css/bootstrap.min.css"/>"/>
        <script src="<c:url value="/webjars/bootstrap/4.6.1/js/bootstrap.min.js"/>"></script>

        <script src="https://unpkg.com/react@16/umd/react.development.js" crossorigin></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js" crossorigin></script>

        <script src="<c:url value="/static/like_button.js"/>"></script>
    </head>
    <body>
        <!-- Button trigger modal -->

        <a class="btn btn-primary" href="http://localhost:8080/Intra_cityDistributionManagementSystem_war/Deliveryorder" role="button">返回接单</a>
        <!-- Modal -->


        <c:forEach var="order" items="${data}">
            <div>订单号 :  ${order.orderId}</div>
            <div>订单状态 :  ${order.state}</div>
            <div>费用 :  ${order.fee}</div>
            <div>接货地址 :  ${order.shippingAddress}</div>
            <div>配送地址 :  ${order.receiveAddress}</div>
            <div>管理员ID :  ${order.managerId}</div>
            <div>派送员ID :  ${order.deliverymanId}</div>
            <div></div>


            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${order.orderId}">
                退单
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal${order.orderId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">订单信息</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="http://localhost:8080/Intra_cityDistributionManagementSystem_war/orderhistory/update2/${order.orderId}" method="get">
                                <div class="form-group">
                                    <label >状态</label>
                                    <div>${order.state}</div>
                                </div>
                                <div class="form-group">
                                    <label >费用</label>
                                    <div>${order.fee}</div>
                                </div>
                                <div class="form-group">
                                    <label >接货地址</label>
                                    <div>${order.shippingAddress}</div>

                                </div>
                                <div class="form-group">
                                    <label >配送地址</label>
                                    <div>${order.receiveAddress}</div>
                                </div>
                                <div class="form-group">
                                    <label >管理员ID</label>
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



            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1${order.orderId}">
                完成订单
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal1${order.orderId}" tabindex="-1" role="dialog" aria-labelledby="exampleModal1Label" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel2">订单信息</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="http://localhost:8080/Intra_cityDistributionManagementSystem_war/orderhistory/update1/${order.orderId}" method="get">
                                <div class="form-group">
                                    <label >状态</label>
                                    <div>${order.state}</div>
                                </div>
                                <div class="form-group">
                                    <label >费用</label>
                                    <div>${order.fee}</div>
                                </div>
                                <div class="form-group">
                                    <label >接货地址</label>
                                    <div>${order.shippingAddress}</div>

                                </div>
                                <div class="form-group">
                                    <label >配送地址</label>
                                    <div>${order.receiveAddress}</div>
                                </div>
                                <div class="form-group">
                                    <label >管理员ID</label>
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
    </body>
</html>

