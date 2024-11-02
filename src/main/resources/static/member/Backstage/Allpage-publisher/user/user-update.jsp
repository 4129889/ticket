<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.tha103.newview.pubuser.model.*"%>
<%@ page import="com.tha103.newview.pubuser.service.*"%>

<%
PubUserVO pubuserVO = (PubUserVO) request.getAttribute("pubuserVO");
//EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>


<!DOCTYPE html>
<html >

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NEW VIEW | Backstage</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Backstage/plugins/fontawesome-free/css/all.min.css">
<!-- daterange picker -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Backstage/plugins/daterangepicker/daterangepicker.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Backstage/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Backstage/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Backstage/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/select2/css/select2.min.css">
<!-- Bootstrap4 Duallistbox -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Backstage/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
<!-- BS Stepper -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Backstage/plugins/bs-stepper/css/bs-stepper.min.css">
<!-- dropzonejs -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Backstage/plugins/dropzone/min/dropzone.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/dist/css/adminlte.min.css">



</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<jsp:include page="../template/nav.jsp" flush="true">
			<jsp:param name="name0" value="peter0" />
		</jsp:include>

		<jsp:include page="../template/aside.jsp" flush="true">
			<jsp:param name="name0" value="peter0" />
		</jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>修改使用者</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/pub-index.jsp">後台首頁</a></li>
								<li class="breadcrumb-item active">權限管理</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Default box -->
				<div class="container-fluid">
					<div class="card" class="container-fluid">
						<form METHOD="post" action="<%=request.getContextPath()%>/pubuser/pubuser.do" style="padding: 30px 0px;">
							<div class="col-md-10 offset-md-1">
								<div class="form-group">
									<label for="pubUserID">使用者編號：</label> 
									<label name="pubUserID" class="badge badge-warning"/><%=pubuserVO.getPubUserID()%></label> 
								</div>
								<div class="form-group">
									<label for="pubNickname">使用者暱稱：</label> 
									<input type="text" class="form-control" name="pubNickname" value="<%=pubuserVO.getPubNickname()%>"/>
								</div>
								<div class="form-group">
									<label for="pubAccount">使用者帳號：</label> 
									<input type="text" class="form-control" name="pubAccount" value="<%=pubuserVO.getPubAccount()%>" />
								</div>
								<div class="form-group">
									<label for="pubPassword">使用者密碼：</label> 
									<input type="text" class="form-control" name="pubPassword" value="<%=pubuserVO.getPubPassword()%>"/>
								</div>								
								<div class="form-group">
									<label for="pubAuthority">使用權限：</label> 
									<select name="pubAuthority" class="form-control" style="width: 100%;">
										<option value="1" ${pubuserVO.pubAuthority == '1' ? 'selected' : ''}>最高權限</option>
										<option value="2" ${pubuserVO.pubAuthority == '2' ? 'selected' : ''}>一般權限</option>
									</select>
								</div>
			
								<div class="form-group">
									<input type="submit" class="btn btn-primary" value="送出">
									<input type="hidden" name="action" value="update">
									<input type="hidden" name="pubUserID" value="<%=pubuserVO.getPubUserID() %>">
									<input type="hidden" name="pubID" value="${sessionScope.pubID}">
									<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>">
									<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>">
								</div>
							</div>
						</form>
					</div>
				</div>
			</section>
			<!-- /.content -->

		</div>

		<jsp:include page="../template/footer.jsp" flush="true">
			<jsp:param name="name0" value="peter0" />
		</jsp:include>

	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/Backstage/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="<%=request.getContextPath()%>/Backstage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Select2.full -->
	<script src="<%=request.getContextPath()%>/Backstage/plugins/select2/js/select2.full.min.js"></script>
	<!-- Bootstrap4 Duallistbox -->
	<script
		src="<%=request.getContextPath()%>/Backstage/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
	<!-- InputMask -->
	<script src="<%=request.getContextPath()%>/Backstage/plugins/moment/moment.min.js"></script>
	<script src="<%=request.getContextPath()%>/Backstage/plugins/inputmask/jquery.inputmask.min.js"></script>
	<!-- date-range-picker -->
	<script src="<%=request.getContextPath()%>/Backstage/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap color picker -->
	<script
		src="<%=request.getContextPath()%>/Backstage/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/Backstage/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Bootstrap Switch -->
	<script src="<%=request.getContextPath()%>/Backstage/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
	<!-- BS-Stepper -->
	<script src="<%=request.getContextPath()%>/Backstage/plugins/bs-stepper/js/bs-stepper.min.js"></script>
	<!-- dropzonejs -->
	<script src="<%=request.getContextPath()%>/Backstage/plugins/dropzone/min/dropzone.min.js"></script>
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/Backstage/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%=request.getContextPath()%>/Backstage/dist/js/demo.js"></script>
	<!-- Page specific script -->
	<script>
		$(function() {
			$('.select2').select2()
		});
	</script>

</body>

</html>