<%@ page import="com.tha103.newview.discount.service.*"%>
<%@ page import="com.tha103.newview.discount.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
DiscountVO discountVO = (DiscountVO) request.getAttribute("discountVO");
//EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
System.out.println("discountVO=" + discountVO);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NEW VIEW | Administrator Backstage | Discount Update</title>
	
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
                            <h1>修改優惠</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/Backstage/Allpage-administrator/admin-index.jsp">後台首頁</a></li>
                                <li class="breadcrumb-item active">優惠管理</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
            
            	<div class="card">
					<form METHOD="post" action="<%=request.getContextPath()%>/discount/discount.do" name="formUpdateDiscount"
						style="padding: 30px 0px;">
						<div class="col-md-10 offset-md-1">
							<div class="form-group">
								<label for="inputDiscountNO">優惠編號：<font color=red><b>*</b></font></label> 
								<span><%=discountVO.getDiscountNO()%></span>	
							</div>
							<jsp:useBean id="publisherSvc" scope="page" class="com.tha103.newview.publisher.service.PublisherService" />
							<div class="form-group">
								<label for="inputPubID">廠商：</label>
							 	<select size="1" name="pubID">
								 	<c:forEach var="pubisher" items="${pubisherSvc.all}">
										<option value="${publisher.pubID}" ${publisher.pubID==pubisher.pubID? 'selected':'' }>${pubisher.pubName}
									</c:forEach>
							 	</select>
							 </div>
					



							
							
							
							<div class="form-group">
								<label for="inputDiscountContent">優惠名稱：</label> 
								<input type="text" class="form-control" id="inputDiscountContent" name="discountContent" value="<%=discountVO.getDiscountContent() %>"/>	
							</div>
							<div class="form-group">
								<label for="inputDisAmount">折扣金額：</label> 
								<input type="text" class="form-control" id="inputDisAmount" name="disAmount" value="<%=discountVO.getDisAmount() %>"/>	
							</div>
							<div class="form-group">
								<label for="inputDiscountCode">折扣碼：</label> 
								<input type="text" class="form-control" id="inputDiscountCode" name="discountCode" value="<%=discountVO.getDiscountCode() %>"/>	
							</div>
							<div class="form-group">
								<label for="inputDisStartDate">起始日：</label> 
								<input type="text" class="form-control" id="inputDisStartDate" name="disStartDate"/>	
							</div>
							<div class="form-group">
								<label for="inputDisFinishDate">結束日：</label> 
								<input type="text" class="form-control" id="inputDisFinishDate" name="disFinishDate"/>	
							</div>
											

							<div class="form-group">
								<input type="hidden" name="action" value="update"> 
								<input type="hidden" name="discountNO" value="<%=discountVO.getDiscountNO() %>"> 
								<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"> 
								
								<input type="submit" class="btn btn-primary" value="送出">
							</div>
            
            
            			</div>
					</form>
                </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->

        </div>
        <!-- /.content-wrapper -->



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

	<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/Backstage/Allpage-administrator/datetimepicker/jquery.datetimepicker.css" />
	<script src="<%=request.getContextPath()%>/Backstage/Allpage-administrator/datetimepicker/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/Backstage/Allpage-administrator/datetimepicker/jquery.datetimepicker.full.js"></script>
	
	<style>
	  .xdsoft_datetimepicker .xdsoft_datepicker {
	           width:  300px;   /* width:  300px; */
	  }
	  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	           height: 151px;   /* height:  151px; */
	  }
	</style>
	
	<script>
	        $.datetimepicker.setLocale('zh');
	        $('#inputDisStartDate').datetimepicker({
	           theme: '',              //theme: 'dark',
	  	       timepicker:false,       //timepicker:true,
	  	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	  	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
	  		   value: '<%=discountVO.getDisStartDate()%>', // value:   new Date(),
	           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	           //startDate:	            '2017/07/10',  // 起始日
	           //minDate:               '-1970-01-01', // 去除今日(不含)之前
	           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	        });
	</script>
    
    <script>
	        $.datetimepicker.setLocale('zh');
	        $('#inputDisFinishDate').datetimepicker({
	           theme: '',              //theme: 'dark',
	  	       timepicker:false,       //timepicker:true,
	  	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	  	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
	  		   value: '<%=discountVO.getDisFinishDate()%>', // value:   new Date(),
	           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	           //startDate:	            '2017/07/10',  // 起始日
	           //minDate:               '-1970-01-01', // 去除今日(不含)之前
	           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	        });
	</script>

</html>