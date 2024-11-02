<%@ page import="java.util.*"%>
<%@ page import="com.tha103.newview.actcategory.service.ActCategoryService"%>
<%@ page import="com.tha103.newview.actcategory.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
ActCategoryService actCategorySvc = new ActCategoryService();
List<ActCategory> list = actCategorySvc.getAll();
pageContext.setAttribute("list", list);


System.out.println(list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NEW VIEW | Administrator Backstage | Activity Category</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/dist/css/adminlte.min.css">
    <style>
        .offset-md-1M {
            margin-left: 16%;
        }
    </style>
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
                            <h1>分類管理</h1>
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
            <!-- Main content -->
            <section class="content">
            
               	<ul>
					<li>
						<form METHOD="post" ACTION="<%=request.getContextPath()%>/actcategory/actcategory.do">
							<b>輸入分類編號：</b> <input type="text" name="actCategoryID"> <input
								type="submit" value="送出"> <input type="hidden"
								name="action" value="getOneForDisplay">
						</form>
					</li>


					<li>
						<form METHOD="post"
							ACTION="<%=request.getContextPath()%>/ActCategoryServlet">
							<b>選擇分類名稱：</b> <select name="actCategoryName">
								<c:forEach var="actCategory" items="${list}">
									<option value="${actCategory.actCategoryID}">${actCategory.actCategoryName}
								</c:forEach>
							</select> <input type="submit" value="送出"> <input type="hidden"
								name="action" value="getOneForDisplay">
						</form>
					</li>
				</ul>
			</section>
           
            <section class="content">
                        
                <div class="container-fluid">
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-md-7 offset-md-1M">
                        
                        	<div class="form-group">
                        		<button type="button" class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/Backstage/Allpage-administrator/activity/activity-add.jsp'">新增分類</button>     	
                        	</div>
                        
                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0">
                                    <table class="table table-hover text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>排序</th>
                                                <th>分類名稱</th>
                                                <th style="text-align: center;" colspan="2">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="act" items="${list}">
                                        		
	                                            <tr>
	                                            	<td>${act.actCategoryID}</td>
	                                            	<td>${act.actCategoryName}</td>
	                                                <td>
	                                                	<Form METHOD="post"
															ACTION="<%=request.getContextPath()%>/actcategory/actcategory.do">
															<input type="submit" value="修改"
																class="btn btn-block btn-success btn-sm"> <input
																type="hidden" name="actCategoryID" value="${act.actCategoryID}">
															<input type="hidden" name="requestURL"
																value="<%=request.getServletPath()%>"> 
															<input type="hidden" name="action"
																value="getOne_For_Update">
														</Form>
	                                                </td>
	                                                <td>
	                                                	<Form METHOD="post"
															ACTION="<%=request.getContextPath()%>/actcategory/actcategory.do">
															<input type="submit" value="刪除"
																class="btn btn-block btn-danger btn-sm"> <input
																type="hidden" name="actCategoryID" value="${act.actCategoryID}">
															<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
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
                </div><!-- /.container-fluid -->
            </section>

        </div>
        <!-- /.content-wrapper -->
    
    	<jsp:include page="../template/footer.jsp" flush="true">
			<jsp:param name="footer" value="footer" />
		</jsp:include>    
    
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