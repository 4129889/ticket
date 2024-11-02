<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.tha103.newview.orders.service.*"%>
<%@ page import="com.tha103.newview.orders.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
Integer pubID = (Integer) session.getAttribute("pubID");
if(pubID == null){
	response.sendRedirect("/Backstage/Allpage-publisher/pub-index.jsp");
	return;
}

OrdersService ordersSvc = new OrdersServiceImpl();
List<OrdersVO> pubOrders = ordersSvc.getOrdersByPub(pubID);
pageContext.setAttribute("list", pubOrders);
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
			<!-- Main content -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>訂單列表</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/pub-index.jsp">後台首頁</a></li>
								<li class="breadcrumb-item active">訂單管理</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- content Search -->
			<section class="content">
				<div class="container-fluid">
					<!-- <h2 class="text-center display-4">Enhanced Search</h2> -->
					<form action="enhanced-results.html">
						<div class="row">
							<div class="col-md-10 offset-md-1">
<!-- 								<div class="row"> -->
<!-- 									<div class="col-6"> -->
<!-- 										<div class="form-group"> -->
<!-- 											<label>活動類別:</label> <select class="form-control" -->
<!-- 												style="width: 100%;"> -->
<!-- 												<option>脫口秀</option> -->
<!-- 												<option>演講</option> -->
<!-- 												<option>音樂劇</option> -->
<!-- 												<option>舞台劇</option> -->
<!-- 												<option>演唱會</option> -->
<!-- 											</select> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 									<div class="col-6"> -->
<!-- 										<div class="form-group"> -->
<!-- 											<label>日期排序：</label> <select class="form-control" -->
<!-- 												style="width: 100%;"> -->
<!-- 												<option>由新到舊</option> -->
<!-- 												<option>由舊到新</option> -->
<!-- 											</select> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>關鍵字搜尋:</label> -->
<!-- 									<div class="input-group input-group-lg"> -->
<!-- 										<input type="search" class="form-control form-control-lg" -->
<!-- 											placeholder="Type your keywords here" value=""> -->
<!-- 										<div class="input-group-append"> -->
<!-- 											<button type="submit" class="btn btn-lg btn-default"> -->
<!-- 												<i class="fa fa-search"></i> -->
<!-- 											</button> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
								<!-- Date and time range -->
<!-- 								<div class="form-group"> -->
<!-- 									<label>訂單成立時間：</label> -->

<!-- 									<div class="input-group"> -->
<!-- 										<div class="input-group-prepend"> -->
<!-- 											<span class="input-group-text"><i class="far fa-clock"></i></span> -->
<!-- 										</div> -->
<!-- 										<input type="text" class="form-control float-right" -->
<!-- 											id="reservationtime"> -->
<!-- 									</div> -->
<!-- 									/.input group -->
<!-- 								</div> -->
								<!-- /.form group -->
							</div>
						</div>
					</form>
				</div>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<!-- /.row -->
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body table-responsive p-0">
									<table class="table table-hover text-nowrap">
										<thead>
											<tr>
												<th>訂單編號</th>
												<th>訂購人</th>
												<th>訂單金額</th>
												<th>折扣金額</th>
												<th>折扣後金額</th>
												<th>訂單成立時間</th>
												<th>訂單數量</th>
<!-- 												<th style="text-align: center;">操作</th> -->
											</tr>
										</thead>
										<tbody>
											<c:forEach var="orderDate" items="${list}">
											<tr>
												<td>${orderDate.orderID}</td>
												<td>${orderDate.userVO.userNickname}</td>
												<td>${orderDate.ordTotal}</td>
												<td>${orderDate.discountVO.disAmount}</td>
												<td>${orderDate.discountPrice}</td>
												<td>${orderDate.ordTime}</td>
												<td>${orderDate.actQuantity}</td>
<!-- 												<td> -->
<!-- 													<button type="button" -->
<!-- 														class="btn btn-block btn-success btn-sm">詳情</button> -->
<!-- 												</td> -->
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
	<!-- Select2 -->
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
	<script>
		$(function() {
			//Initialize Select2 Elements
			$('.select2').select2()

			//Initialize Select2 Elements
			$('.select2bs4').select2({
				theme : 'bootstrap4'
			})

			//Datemask dd/mm/yyyy
			$('#datemask').inputmask('dd/mm/yyyy', {
				'placeholder' : 'dd/mm/yyyy'
			})
			//Datemask2 mm/dd/yyyy
			$('#datemask2').inputmask('mm/dd/yyyy', {
				'placeholder' : 'mm/dd/yyyy'
			})
			//Money Euro
			$('[data-mask]').inputmask()

			//Date picker
			$('#reservationdate').datetimepicker({
				format : 'L'
			});

			//Date and time picker
			$('#reservationdatetime').datetimepicker({
				icons : {
					time : 'far fa-clock'
				}
			});

			//Date range picker
			$('#reservation').daterangepicker()
			//Date range picker with time picker
			$('#reservationtime').daterangepicker({
				timePicker : true,
				timePickerIncrement : 30,
				locale : {
					format : 'MM/DD/YYYY hh:mm A'
				}
			})
			//Date range as a button
			$('#daterange-btn').daterangepicker(
					{
						ranges : {
							'Today' : [ moment(), moment() ],
							'Yesterday' : [ moment().subtract(1, 'days'),
									moment().subtract(1, 'days') ],
							'Last 7 Days' : [ moment().subtract(6, 'days'),
									moment() ],
							'Last 30 Days' : [ moment().subtract(29, 'days'),
									moment() ],
							'This Month' : [ moment().startOf('month'),
									moment().endOf('month') ],
							'Last Month' : [
									moment().subtract(1, 'month').startOf(
											'month'),
									moment().subtract(1, 'month')
											.endOf('month') ]
						},
						startDate : moment().subtract(29, 'days'),
						endDate : moment()
					},
					function(start, end) {
						$('#reportrange span').html(
								start.format('MMMM D, YYYY') + ' - '
										+ end.format('MMMM D, YYYY'))
					})

			//Timepicker
			$('#timepicker').datetimepicker({
				format : 'LT'
			})

		})

		// Setup the buttons for all transfers
		// The "add files" button doesn't need to be setup because the config
		// `clickable` has already been specified.
		document.querySelector("#actions .start").onclick = function() {
			myDropzone.enqueueFiles(myDropzone
					.getFilesWithStatus(Dropzone.ADDED))
		}
		document.querySelector("#actions .cancel").onclick = function() {
			myDropzone.removeAllFiles(true)
		}
		// DropzoneJS Demo Code End
	</script>
</body>

</html>