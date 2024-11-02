<%@ page import="java.util.*"%>
<%@ page import="com.tha103.newview.act.model.*"%>
<%@ page import="com.tha103.newview.act.service.*"%>
<%@ page import="com.tha103.newview.actcategory.model.*"%>
<%@ page import="com.tha103.newview.cityaddress.model.*"%>
<%@ page import="com.tha103.newview.publisher.model.*"%>
<%@ page import="com.tha103.newview.act.controller.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
ActDAO actDAO = new ActDAOHibernateImpl();
ActService actSvc = new ActServiceImpl(actDAO);
List<ActVO> list = actSvc.getAll();
List<ActCategory> categories = actSvc.getAllCategories();
List<CityAddress> city = actSvc.getAllCities();
pageContext.setAttribute("city", city);
pageContext.setAttribute("list", list);
pageContext.setAttribute("categories", categories);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NEW VIEW | Administrator Backstage | Activity List</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/fontawesome-free/css/all.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/select2/css/select2.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/dist/css/adminlte.min.css">
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
                            <h1>活動列表</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/Backstage/Allpage-administrator/admin-index.jsp">後台首頁</a></li>
                                <li class="breadcrumb-item active">活動管理</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>
            <section class="content">
                <div class="container-fluid">
                    <!-- <h2 class="text-center display-4">Enhanced Search</h2> -->
                    <form action="enhanced-results.html">
                        <div class="row">
                            <div class="col-md-10 offset-md-1">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label>活動類別:</label>
                                            <select class="form-control" style="width: 100%;">
                                                <option>脫口秀</option>
                                                <option>演講</option>
                                                <option>音樂劇</option>
                                                <option>舞台劇</option>
                                                <option>演唱會</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="form-group">
                                            <label>日期排序：</label>
                                            <select class="form-control" style="width: 100%;">
                                                <option>由新到舊</option>
                                                <option>由舊到新</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="form-group">
                                            <label>審核狀態：</label>
                                            <select class="form-control" style="width: 100%;">
                                                <option>已通過</option>
                                                <option>審核中</option>
                                                <option>未通過</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>關鍵字搜尋:</label>
                                    <div class="input-group input-group-lg">
                                        <input type="search" class="form-control form-control-lg"
                                            placeholder="Type your keywords here" value="">
                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-lg btn-default">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
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
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0">
                                    <table class="table table-hover text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>編號</th>
                                                <th>分類</th>
                                                <th>名稱</th>
                                                <th>價格</th>
                                                <th>規模</th>
                                                <th>狀態</th>
                                                <th style="text-align: center;">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="act" items="${list}" >
                                            <tr>
                                                <td>${act.actID}</td>
                                                <td>${act.actCategory.actCategoryName}</td>
                                                <td>${act.actName}</td>
                                                <td>${act.actPrice}</td>
                                                <td id="scope_${act.actID}">${act.actScope}</td>
                                                <td>${act.approvalCondition}</td>
                                                <td>
	                                                	
	                                                	<Form METHOD="post"
															ACTION="<%=request.getContextPath()%>/act/act.actadmindo">
															<input type="submit" value="修改"
																class="btn btn-block btn-success btn-sm"> <input
																type="hidden" name="actId" value="${act.actID}">
															<input type="hidden" name="action"
																value="update">

														</Form>

	                                           			<br>
	                                                
	                                                	<Form METHOD="post"
															ACTION="<%=request.getContextPath()%>/act/act.admindo">
															<input type="submit" value="刪除"
																class="btn btn-block btn-danger btn-sm"> <input
																type="hidden" name="actIDDelete" value="${act.actID}">
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
                        </div>
                    </div>
                    <!-- /.row -->
                </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->

        </div>
        <!-- /.content-wrapper -->
        <footer class="main-footer">
            <div class="float-right d-none d-sm-block">
                <b>Version</b> 1.0.0
            </div>
            <strong>Copyright &copy; 2023~ <a href="https://newview.com">NewView</a>.</strong> All rights
            reserved.
        </footer>

        <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-dark">
            <!-- Control sidebar content goes here -->
        </aside>
        <!-- /.control-sidebar -->
    </div>
    <!-- ./wrapper -->

	<script>
	document.addEventListener("DOMContentLoaded", function(event) {
		
		//活動範圍大小代表數字 
		var showedScope = document.getElementById('scope_1');
		console.log(showedScope);
		
		//判斷該數字分別顯示不同的座位數量
		
		/*if (document.getElementById("scope").text = "1") {
			showedScope.innerHTML = "大：可容納900人";
		} else if (showedScope.innerHTML = 2) {
			showedScope.innerHTML = "中：可容納400人";
		} else {
			showedScope.innerHTML = "小：可容納100人";
		}*/
		//var selectPub = document.getElementById("selectPub");
		
		//if(selectedRadio.value == "pubDis") {
		//	selectPub.style.display="block";
		//} else {
		//	selectPub.style.display="none";
		//}
					
	});
	</script>
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