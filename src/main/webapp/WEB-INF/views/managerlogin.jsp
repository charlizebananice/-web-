<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>管理员登录</title>
        <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/4.6.1/css/bootstrap.min.css" />--%>

        <script src="<c:url value="/webjars/jquery/3.5.1/jquery.min.js"/>"></script>
        <link rel="stylesheet" href="<c:url value="/webjars/bootstrap/4.6.1/css/bootstrap.min.css"/>"/>
        <script src="<c:url value="/webjars/bootstrap/4.6.1/js/bootstrap.min.js"/>"></script>

        <script src="https://unpkg.com/react@16/umd/react.development.js" crossorigin></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js" crossorigin></script>

        <script src="<c:url value="/static/like_button.js"/>"></script>
        <%--
                <link rel="stylesheet" href="/static/bootstrap-4.6.1-dist/css/bootstrap.min.css" rel="stylesheet"/>
        --%>
        <%--
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-p1KAotb3W9ndluCsqePPYnjRm3c6abdnIjo0tQwYUv83VsbsYd43RuofnFAaDo0E" crossorigin="anonymous">
        --%>
    </head>
    <body>

        <div id="like_button_container"></div>
        <div class="alert alert-primary" role="alert">
            A simple primary alert—check it out!
        </div>
        <div class="alert alert-primary" role="alert">
            A simple primary alert—check it out!
        </div>
        <div class="alert alert-secondary" role="alert">
            A simple secondary alert—check it out!
        </div>
        <div class="alert alert-success" role="alert">
            A simple success alert—check it out!
        </div>
        <div class="alert alert-danger" role="alert">
            A simple danger alert—check it out!
        </div>
        <div class="alert alert-warning" role="alert">
            A simple warning alert—check it out!
        </div>
        <div class="alert alert-info" role="alert">
            A simple info alert—check it out!
        </div>
        <div class="alert alert-light" role="alert">
            A simple light alert—check it out!
        </div>
        <div class="alert alert-dark" role="alert">
            A simple dark alert—check it out!
        </div>
        <div>
            账号：<input onChange={this.getUsername} /><br/>
            密码：<input onChange={this.getPassword} /><br/>
            <button>登录</button>
        </div>
        <%--<script src="${pageContext.request.contextPath}/webjars/jquery/3.5.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/webjars/bootstrap/4.6.1/js/bootstrap.min.js"></script>--%>

        <%--  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>--%>        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-E5Sj1saJVFNzWWK3YIJB4LEDEEVEGaOdfmCprPDkfWUo+xkb6Ep52Q1TMEtgcFwi" crossorigin="anonymous"></script>

    </body>
</html>
