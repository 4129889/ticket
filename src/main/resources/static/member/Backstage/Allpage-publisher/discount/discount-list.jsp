<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.tha103.newview.discount.service.*"%>
<%@ page import="com.tha103.newview.discount.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
Integer pubID = (Integer) session.getAttribute("pubID");
System.out.println(pubID);
if(pubID == null){
	response.sendRedirect("/Backstage/Allpage-publisher/pub-index.jsp");
	return;
}

DiscountService discountSvc = new DiscountServiceImpl();
List<DiscountVO> pubDiscount = discountSvc.getDiscountByPub(pubID);
pageContext.setAttribute("list", pubDiscount);
%>

<!DOCTYPE html>
<html lang="en">

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
							<h1>優惠列表</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/pub-index.jsp">後台首頁</a></li>
								<li class="breadcrumb-item active">優惠管理</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
			
				<div class="container-fluid">
					<!-- /.row -->
					<div class="row">
						<div class="col-12">
							<div class="form-group">
							<a href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/discount/discount-add.jsp" class="btn btn-dark">
							新增優惠 
							</a>
							</div>
							<div class="card">
								<!-- /.card-header -->
								<div class="card-body table-responsive p-0">
									<table class="table table-hover text-nowrap">
										<thead>
											<tr>
												<th>編號</th>
												<th>優惠名稱</th>
												<th>折扣金額</th>
												<th>折扣碼</th>
												<th>起始日</th>
												<th>結束日</th>
												<th style="text-align: center;" colspan="2">操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="discountDate" items="${list}">
												<tr>
													<td>${discountDate.discountNO}</td>
													<td>${discountDate.discountContent}</td>
													<td>${discountDate.disAmount}</td>
													<td>${discountDate.discountCode}</td>
													<td>${discountDate.disStartDate}</td>
													<td>${discountDate.disFinishDate}</td>
													<td>
													<form METHOD="post" ACTION="<%=request.getContextPath()%>/pub/discount.do">
														<input type="submit" value="修改" class="btn btn-block btn-success btn-sm">
														<input type="hidden" name="action" value="getOneForUpdate">
														<input type="hidden" name="discountNO" value="${discountDate.discountNO}">
														<input type="hidden" name="pubID" value="<%= session.getAttribute("pubID") %>" />
													</form>
													</td>
													<td>
													<form METHOD="post" ACTION="<%=request.getContextPath()%>/pub/discount.do">
														<input type="submit" value="刪除" class="btn btn-block btn-danger btn-sm">
														<input type="hidden" name="action" value="delete">
														<input type="hidden" name="discountNO" value="${discountDate.discountNO}">
													</form>
													</td>
												</tr>


											</c:forEach>
										</tbody>

									</table>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
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
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/Backstage/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%=request.getContextPath()%>/Backstage/dist/js/demo.js"></script>
</body>


</html>