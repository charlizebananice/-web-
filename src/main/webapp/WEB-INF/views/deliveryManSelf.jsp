<%--
  Created by IntelliJ IDEA.
  User: zhy
  Date: 2022/11/30
  Time: 20:21
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
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/Deliveryorder" role="button">返回接单</a>

            <div>id :  ${deliveryMan.deliveryManId}</div>
            <div>name :  ${deliveryMan.deliveryManName}</div>
            <div>password :  ${deliveryMan.password}</div>
            <div>phoneNo :  ${deliveryMan.phoneNo}</div>
            <div>email :  ${deliveryMan.email}</div>
            <div></div>


            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${deliveryMan.deliveryManId}">
                修改
            </button>

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
    </body>
</html>
