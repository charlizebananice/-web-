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
        <%--banner--%>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/deliveryman">
                <img src="<c:url value="/static/assets/home.png"/>" width="30" height="30"
                     class="d-inline-block align-top" alt="">
                配送员
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/deliveryman/deliveryorder">待接单<span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/manager/deliveryman/">我的配送 <span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                           data-toggle="dropdown" aria-expanded="false">
                            管理员管理
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#" data-toggle="modal"
                               data-target="#searchManager">搜索管理员</a>
                            <a class="dropdown-item" href="#" data-toggle="modal"
                               data-target="#exampleModal">添加管理员</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/manager">显示全部的管理员</a>
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
                    <a type="button" data-toggle="modal" data-target="#see_self-info${deliveryMan.deliveryManId}">欢迎您,${deliveryMan.deliveryManId}-${deliveryMan.deliveryManName} </a>
                    <img src="${pageContext.request.contextPath}/static/assets/login.png" width="30" height="30" type="button"
                         class="d-inline-block align-top" data-toggle="modal" data-target="#exampleModal${deliveryMan.deliveryManId}">
                </div>
                <!-- Modal -->
                <%--查看个人信息--%>
                <div class="modal fade" id="see_self-info${deliveryMan.deliveryManId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" >管理员个人信息</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label for="">用户名</label>
                                        <input type="text" class="form-control"  name="deliveryManName" value="${deliveryMan.deliveryManName}" read="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label for="">手机号</label>
                                        <input required="required" type="text" class="form-control" name="phoneNo" placeholder="输入手机号">
                                    </div>
                                    <div class="form-group">
                                        <label for="">邮箱</label>
                                        <input required="required" type="email" class="form-control" name="email" placeholder="输入邮箱">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <%--修改个人信息--%>
                <div class="modal fade" id="exampleModal${deliveryMan.deliveryManId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="">修改管理员信息</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="http://localhost:8080/_web__war/manager/deliveryMan/update/${deliveryMan.deliveryManId}" method="get">
                                    <div class="form-group">
                                        <label for="">用户名</label>
                                        <input type="text" class="form-control" id="exampleInputEmail2" name="deliveryManName" value="${deliveryMan.deliveryManName}" placeholder="${deliveryMan.deliveryManName}">
                                    </div>
                                    <div class="form-group">
                                        <label for="">密码</label>
                                        <input type="password" class="form-control" id="exampleInputPassword2" name="password" value="${deliveryMan.password}" placeholder="${deliveryMan.password}">
                                    </div>
                                    <div class="form-group">
                                        <label for="">手机号</label>
                                        <input required="required" type="text" class="form-control" id="exampleInputEmail4" name="phoneNo" placeholder="输入手机号">
                                    </div>
                                    <div class="form-group">
                                        <label for="">邮箱</label>
                                        <input required="required" type="email" class="form-control" id="exampleInputPassword4" name="email" placeholder="输入邮箱">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <%--<!-- Button trigger modal -->
        <a class="btn btn-primary"
           href="http://localhost:8080/Intra_cityDistributionManagementSystem_war/deliveryManself"
           role="button">个人信息及修改</a>
        <a class="btn btn-primary" href="http://localhost:8080/Intra_cityDistributionManagementSystem_war/orderhistory"
           role="button">我的历史订单</a>
        <!-- Modal -->

        <form class="form-inline mb-2"
              action="http://localhost:8080/Intra_cityDistributionManagementSystem_war/Deliveryorder/id" method="get">
            <div class="form-group mx-sm-3 mb-2">
                <label for="inputPassword2" class="sr-only">Password</label>
                <input required="required" type="number" class="form-control" id="inputPassword2" name="id"
                       placeholder="输入id进行查找">
            </div>
            <button type="submit" class="btn btn-primary mb-2">查找</button>
        </form>
        <form class="form-inline mb-2"
              action="http://localhost:8080/Intra_cityDistributionManagementSystem_war/Deliveryorder/name" method="get">
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
            <button type="button" class="btn btn-primary" data-toggle="modal"
                    data-target="#exampleModal${order.orderId}">
                接单
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal${order.orderId}" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel2">订单信息</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="http://localhost:8080/Intra_cityDistributionManagementSystem_war/Deliveryorder/update/${order.orderId}"
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
        </c:forEach>--%>
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
