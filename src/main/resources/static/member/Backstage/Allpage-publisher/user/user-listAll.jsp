<%@ page import="java.util.*"%>
<%@ page import="com.tha103.newview.pubuser.service.*"%>
<%@ page import="com.tha103.newview.pubuser.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
Integer pubID = (Integer) session.getAttribute("pubID");
if(pubID == null){
	response.sendRedirect("/Backstage/Allpage-publisher/pub-index.jsp");
	return;
}

PubUserService pubUserSvc = new PubUserService();
// List<PubUserVO> list = pubUserSvc.getAll();
List<PubUserVO> list = pubUserSvc.getPubuesrByPub(pubID);
pageContext.setAttribute("list", list);

%>


<!DOCTYPE html>
<html>
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Backstage/dist/css/adminlte.min.css">
</head>

<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<jsp:include page="../template/nav.jsp" flush="true">
			<jsp:param name="nav" value="nav" />
		</jsp:include>

		<jsp:include page="../template/aside.jsp" flush="true">
			<jsp:param name="aside" value="aside" />
		</jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>使用者列表</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a
									href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/pub-index.jsp">後台首頁</a></li>
								<li class="breadcrumb-item active">權限管理</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			
			<section class="content">
				<%-- 萬用複合查詢 --%>
				<form METHOD="post"
					ACTION="<%=request.getContextPath()%>/pubuser/pubuser.do"
					name="form4pubuser">
					<div class="col-md-12" style="padding: 0px 40px">
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<label>姓名查詢：</label>
									<div class="input-group">
										<input type="text" name="pubNickname" class="form-control"
											placeholder="請輸入名字">
									</div>
								</div>
							</div>
							<div class="col-5">
								<div class="form-group">
									<label>使用者編號：</label>
									<div class="input-group">
										<input type="text" name="pubUserID"
											class="form-control" placeholder="請輸入編號">
									</div>
								</div>
							</div>
							
							<div class="col-5">
								<div class="form-group">
									<label>使用者權限：</label><select name="pubAuthority" class="form-control"
										style="width: 100%">
										<option >選擇權限</option>
										<option value="0">高階權限</option>
										<option value="1">一般權限</option>
									</select>
								</div>
							</div>
							
							<div class="col-2">
								<div class="form-group">
									<label style="padding-bottom: 17px"></label> <a
										href="<%=request.getContextPath()%>/pubuser/pubuser.do">
										<button type="submit" class="btn btn-dark" style="width: 100%" >送出</button>
										<input type="hidden" name="action" value="pubuserCompositeQuery">
									</a>
								</div>
							</div>
						</div>
						<!-- /.form group -->
					</div>

				</form>
				<%-- 萬用複合查詢 --%>
			</section>
			<!-- Main content -->
			
			
			<section class="content">
				
				<div class="container-fluid">
				<%@ include file="../pages/page1.file"%>
					<!-- /.row -->
					<div class="row">
						<div class="col-12">

							<div class="card">
								<!-- /.card-header -->
								
								<div class="card-body table-responsive p-0">
									<table class="table table-hover text-nowrap">
										<thead>
											<tr>
												<th>使用者編號</th>
												<th>使用者暱稱</th>
												<th>使用者帳號</th>
												<th>使用者權限</th>
												<th style="text-align: center;" colspan="2">操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="pu" items="${list}" begin="<%=pageIndex%>"
												end="<%=pageIndex+rowsPerPage-1%>">
												<tr>
													<td>${pu.pubUserID}</td>
													<td>${pu.pubNickname}</td>
													<td>${pu.pubAccount}</td>
													<td>
														<c:choose>
															<c:when test="${pu.pubAuthority == 1}">高級權限</c:when>
															<c:when test="${pu.pubAuthority == 2}">一般權限</c:when>
															<c:otherwise>其他權限</c:otherwise>
														</c:choose>
													</td>
													<td>
														<Form METHOD="post"
															ACTION="<%=request.getContextPath()%>/pubuser/pubuser.do">
															<input type="submit" value="修改"
																class="btn btn-block btn-success btn-sm"> <input
																type="hidden" name="pubUserID" value="${pu.pubUserID}">
															<input type="hidden" name="requestURL"
																value="<%=request.getServletPath()%>"> <input
																type="hidden" name="whichPage" value="<%=whichPage%>">
															<input type="hidden" name="action"
																value="getOneForUpdate">

														</Form>
													</td>
													<td>
														<Form METHOD="post"
															ACTION="<%=request.getContextPath()%>/pubuser/pubuser.do">
															<input type="submit" value="刪除"
																class="btn btn-block btn-danger btn-sm"> <input
																type="hidden" name="pubUserID" value="${pu.pubUserID}">
															<input type="hidden" name="requestURL"
																value="<%=request.getServletPath()%>"> <input
																type="hidden" name="whichPage" value="<%=whichPage%>">
															<input type="hidden" name="action" value="delete">

														</Form>
													</td>
												</tr>
											</c:forEach>
										</tbody>

									</table>
									
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
							<div class="row" style="padding: 10px">
								<div class="col-12">
									<%@ include file="../pages/page2.file"%>
								</div>
							</div>

						</div>
					</div>

				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->

		</div>

		<jsp:include page="../template/footer.jsp" flush="true">
			<jsp:param name="footer" value="footer" />
		</jsp:include>

	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="<%=request.getContextPath()%>/Backstage/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="<%=request.getContextPath()%>/Backstage/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="<%=request.getContextPath()%>/Backstage/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%=request.getContextPath()%>/Backstage/dist/js/demo.js"></script>
</body>

</html>