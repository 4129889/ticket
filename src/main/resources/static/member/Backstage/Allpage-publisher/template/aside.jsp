<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NEW VIEW | Backstage</title>

</head>

<body class="hold-transition sidebar-mini">

	<aside class="main-sidebar sidebar-dark-primary elevation-4">
		<!-- Brand Logo -->
		<a href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/pub-index.jsp" class="brand-link"> <img
			src="<%=request.getContextPath()%>/Backstage/dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
			class="brand-image img-circle elevation-3" style="opacity: .8">
			<span class="brand-text font-weight-light">NewView</span>
		</a>

		<!-- Sidebar -->
		<div class="sidebar">
			<!-- Sidebar user (optional) -->
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
<!-- 				<div class="image"> -->
<%-- 					<img src="<%=request.getContextPath()%>/Backstage/dist/img/user2-160x160.jpg" --%>
<!-- 						class="img-circle elevation-2" alt="User Image"> -->
<!-- 				</div> -->
				<div class="info">
					<a href="#" class="d-block">廠商後台管理員</a>
				</div>
			</div>

			<!-- Sidebar Menu -->
			<nav class="mt-2">
				<ul class="nav nav-pills nav-sidebar flex-column"
					data-widget="treeview" role="menu" data-accordion="false">
					<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon far fa-calendar-alt"></i>
							<p>
								活動管理 <i class="right fas fa-angle-left"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a
								href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/activity/activity-list.jsp" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>活動列表</p>
							</a></li>
							<li class="nav-item"><a
								href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/activity/activity-shelves.jsp" class="nav-link">
									<i class="far fa-circle nav-icon"></i>
									<p>活動上架</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/order/order-list.jsp"
						class="nav-link"> <i class="nav-icon fas fa-file"></i>
							<p>訂單管理</p>
					</a></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-tree"></i>
							<p>
								優惠管理 <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a
								href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/discount/discount-list.jsp" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>優惠列表</p>
							</a></li>
							<li class="nav-item"><a
								href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/discount/discount-add.jsp" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>新增優惠</p>
							</a></li>
						</ul></li>
					<li class="nav-item"><a href="#" class="nav-link"> <i
							class="nav-icon fas fa-edit"></i>
							<p>
								權限管理 <i class="fas fa-angle-left right"></i>
							</p>
					</a>
						<ul class="nav nav-treeview">
							<li class="nav-item"><a href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/user/user-listAll.jsp"
								class="nav-link"> <i class="far fa-circle nav-icon"></i>
									<p>使用者列表</p>
							</a></li>
							<li class="nav-item"><a
								href="<%=request.getContextPath()%>/Backstage/Allpage-publisher/user/user-add.jsp" class="nav-link"> <i
									class="far fa-circle nav-icon"></i>
									<p>新增使用者</p>
							</a></li>
						</ul></li>
						
						
						
					<form method="post" action="<%=request.getContextPath()%>/pubuser/pubuser.do">	
						<li class="nav-item">
							<div class="nav-link"> 
								<button type="submit" class="btn btn-block btn-light btn-sm">登出</button>
								<input type="hidden" name="action" value="logout" />
							</div>
						</li>
					</form>
					
					
					
					
				</ul>
			</nav>
			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>

</body>
</html>