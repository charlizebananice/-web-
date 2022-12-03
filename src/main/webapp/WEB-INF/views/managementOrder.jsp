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
                        <a class="nav-link" href="${pageContext.request.contextPath}/manager/deliveryman/">配送员 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-expanded="false">
                            订单管理
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#searchManager">搜索订单</a>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#exampleModal">发布订单</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/ordersum">显示历史订单</a>
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
                    欢迎您，<%--${}--%>
                    <img src="${pageContext.request.contextPath}/static/assets/login.png" width="30" height="30" class="d-inline-block align-top">
                </div>
            </div>
        </nav>
        <!-- Button trigger modal -->
        <%--发布订单弹窗--%>
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
                                <input readonly="readonly" required="required" type="text" class="form-control" id="managerId" name="managerId" value="123">
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
        <%--搜索订单弹窗--%>
        <div class="modal fade" id="searchManager" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="">搜索管理员</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
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
                                <input required="required" type="text" class="form-control" id="inputPassword3" name="deliverymanName" placeholder="输入派送员姓名进行查找">
                            </div>
                            <button type="submit" class="btn btn-primary mb-2">查找</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%--<c:forEach var="order" items="${data}">
            <div>订单号 :  ${order.orderId}</div>
            <div>订单状态 :  ${order.state}</div>
            <div>费用 :  ${order.fee}</div>
            <div>接货地址 :  ${order.shippingAddress}</div>
            <div>配送地址 :  ${order.receiveAddress}</div>
            <div>管理员ID :  ${order.managerId}</div>
            <div>派送员ID :  ${order.deliverymanId}</div>
            <div></div>

            <form action="http://localhost:8080/_web__war/order/delete/${order.orderId}" method="get">

                <input type="submit" value="删除" />
            </form>
            <!-- Button trigger modal -->

        </c:forEach>--%>
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
                                <button type="submit" class="btn btn-secondary" data-dismiss="modal">删除</button>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${order.orderId}">
                                    修改
                                </button>
                            </form>
                                <%--修改订单信息--%>
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
                                            <form action="${pageContext.request.contextPath}/manager/order/update/${order.orderId}" method="get">
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
