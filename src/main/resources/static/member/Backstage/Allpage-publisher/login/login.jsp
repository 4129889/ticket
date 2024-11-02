<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NewView | Log in</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Backstage/plugins/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Backstage/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/dist/css/adminlte.min.css">

<style>
input:valid {
  background-color: #e8f0fe ;
}

</style>

</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#"><b>NewView</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">廠商後台</p>

				<form ACTION="<%=request.getContextPath()%>/pubuser/pubuser.do"
					method="post">

					<div class="input-group mb-3 ">

						<input type="text" class="form-control" name="pubAccount"
						required placeholder="帳號(請輸入3-16英數字)" pattern="[0-9A-z]{3,16}" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-edit"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3 ">

						<input type="password" class="form-control" name="pubPassword"
						required placeholder="密碼(請輸入3-16英數字)" pattern="[0-9A-z]{3,16}"/>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-8">
						</div>
						<!-- /.col -->
						<div class="col-4">
							<input type="hidden" name="action" value="login">
							<button type="submit" class="btn btn-primary btn-block">登入</button>
						</div>
						<!-- /.col -->
					</div>
				</form>


			</div>
			<!-- /.login-card-body -->
		</div>
	</div>
	<!-- /.login-box -->

	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/Backstage/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="<%=request.getContextPath()%>/Backstage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/Backstage/dist/js/adminlte.min.js"></script>
</body>
</html>
