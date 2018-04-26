<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        html, body {
            height: 100%;
        }

        body {
            display: -ms-flexbox;
            display: -webkit-box;
            display: flex;
            -ms-flex-align: center;
            -ms-flex-pack: center;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: center;
            justify-content: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-control {
            margin-bottom: 10px;
        }

        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
    </style>
</head>
<body class="text-center">
<div class="form-signin">
    <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
    <h1 class="h3 mb-3 font-weight-normal">用户登入</h1>
    <label for="inputEmail" class="sr-only">Email address</label>
    <input type="email" name="userName" id="user_name" class="form-control" placeholder="请输入用户名" required="" autofocus="">
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" name="password" id="password" class="form-control" placeholder="请输入用户密码" required="">
    <button class="btn btn-lg btn-primary btn-block" onclick="login()" type="submit">登录</button>
    <p class="mt-5 mb-3 text-muted">© 2017-2018</p>
</div>
<!-- 全局js -->
	<script src="static/js/jquery.min.js?v=2.1.4"></script>
	<script src="static/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="static/js/plugins/layer/layer.min.js"></script>
	<!-- 第三方插件 -->
	<script type="text/javascript" src="static/js/plugins/pace/pace.min.js"></script>
	<!-- 自定义js -->
	<script type="text/javascript" src="static/js/my/login.js"></script>
</body>
</html>