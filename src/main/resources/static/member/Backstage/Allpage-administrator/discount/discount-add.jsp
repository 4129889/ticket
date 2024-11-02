<%@ page import="com.tha103.newview.discount.service.*"%>
<%@ page import="com.tha103.newview.discount.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
  DiscountVO discountVO = (DiscountVO) request.getAttribute("discountVO");
%>

<%
  System.out.println(discountVO);
%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NEW VIEW | Administrator Backstage | Discount Add</title>

<link rel="stylesheet" type="text/css" href="/jquery.datetimepicker.css" >

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
							<h1>新增優惠</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/Backstage/Allpage-administrator/admin-index.jsp">後台首頁</a></li>
								<li class="breadcrumb-item active">優惠管理</li>
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
						<form METHOD="post" action="<%=request.getContextPath()%>/discount/discount.do" name="addform" style="padding: 30px 0px;">
							<div class="col-md-10 offset-md-1">
													
							    
							    
							    
							    
								<div class="form-group">
									<label for="inputDisContent">優惠名稱：</label> <input type="text"
										name="discountContent"
										value="<%=(discountVO == null) ? "請輸入欲設定之優惠名稱" : discountVO.getDiscountContent()%>"
										id="inputDisContent" class="form-control" />
								</div>
								<div class="form-group">
									<label for="inputDisAmount">優惠金額：</label> <input type="text"
										name="disAmount"
										value="<%=(discountVO == null) ? "請輸入欲設定之優惠金額" : discountVO.getDisAmount()%>"
										id="inputDisAmount" class="form-control" />
								</div>
								<div class="form-group">
									<label for="inputDisCode">折扣碼：</label> <input type="text"
										name="discountCode"
										value="<%=(discountVO == null) ? "請輸入欲設定之折扣碼" : discountVO.getDiscountCode()%>"
										id="inputDisCode" class="form-control" />
								</div>
								<div class="form-group">
									<label for="inputDisStartDate">優惠起始日期：</label> 
									<div class="input-group date" id="disStartDate"
										data-target-input="nearest">
										<input type="text"
											name="disStartDate" 
											class="form-control datetimepicker-input"
											data-target="#inputDisStartDate" 
											id="datetimepicker" value="請選擇優惠起始日期"/>
										<div class="input-group-append" data-target="#inputDisStartDate"
											data-toggle="datetimepicker">
											<div class="input-group-text">
												<i class="fa fa-calendar-alt"></i>
											</div>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="inputDisStartDate">優惠結束日期：</label> <input type="text"
										name="disStartDate"
										value="<%=(discountVO == null) ? "請輸入欲設定優惠結束日期" : discountVO.getDisFinishDate()%>"
										id="inputDisFinishDate" class="form-control" />
								</div>
								<div class="form-group">
									<label for="inputTestDate">優惠測試日期：</label> <input type="datetime-local"
										name="testDate"
										value="<%=(discountVO == null) ? "請輸入欲設定優惠測試日期" : discountVO.getDisFinishDate()%>"
										id="inputTestDate" class="form-control" />
								</div>
								
			
								<!-- Date range -->
								<div class="form-group">
									<label>優惠期間：</label>
									<div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"> <i
												class="far fa-calendar-alt"></i>
											</span>
										</div>
										<input type="text" class="form-control float-right"
											id="reservation">
									</div>
									<!-- /.input group -->
								</div>
								<!-- /.form group -->




								<div class="form-group">
									<input type="hidden" name="action" value="add"> 
									<input type="submit" class="btn btn-primary" value="送出">
									<input type="submit" class="btn btn-danger" value="清空">
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
	
	
	<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->
	
	<script src="/jquery.js"></script>
	<script src="/build/jquery.datetimepicker.full.min.js"></script>
	
	<script>
		jQuery('#datetimepicker').datetimepicker();
	</script>
	
	

	<!-- jQuery -->
	<script src="../../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Select2.full -->
	<script src="../../plugins/select2/js/select2.full.min.js"></script>
	<!-- Bootstrap4 Duallistbox -->
	<script
		src="../../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
	<!-- InputMask -->
	<script src="../../plugins/moment/moment.min.js"></script>
	<script src="../../plugins/inputmask/jquery.inputmask.min.js"></script>
	<!-- date-range-picker -->
	<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
	<!-- bootstrap color picker -->
	<script
		src="../../plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="../../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Bootstrap Switch -->
	<script src="../../plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
	<!-- BS-Stepper -->
	<script src="../../plugins/bs-stepper/js/bs-stepper.min.js"></script>
	<!-- dropzonejs -->
	<script src="../../plugins/dropzone/min/dropzone.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../../dist/js/demo.js"></script>
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

