<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.util.*"%>
<%@ page import="com.tha103.newview.act.model.*"%>
<%@ page import="com.tha103.newview.act.service.*"%>

<%@ page import="com.tha103.newview.actcategory.model.*"%>
<%@ page import="com.tha103.newview.cityaddress.model.*"%>
<%@ page import="com.tha103.newview.publisher.model.*"%>
<%@ page import="com.tha103.newview.act.controller.*"%>
<%@ page import="com.google.gson.Gson" %>
<%
ActWithPicsDTO actData = (ActWithPicsDTO) request.getAttribute("actData");
List<String> base64Images = actData.getBase64Images();
Integer scope = actData.getActScope();

%>

<html lang="en">
<head>

<title>Product Detail</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/linearicons-v1.0.0/icon-font.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/MagnificPopup/magnific-popup.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<!--===============================================================================================-->
<style>
#act_date {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
	border: 1px solid #ccc;
	background-color: #fff;
}

div .seatsTry a {
	padding: 15px;
	padding-left: 35px;
	padding-right: 35px;
	border-radius: 23px;
	color: #fff;
}

.seatsV {
	display: flex;
	justify-content: center;
	align-items: center;
}

.seatsTry {
	border: 1px solid #f4f4f4;
	background-color: #717fe0;
	border-radius: 23px;
	min-width: 161px;
	height: 46px;
}

.seatsTry:hover {
	border: 1px solid #ebe8ef;
	background-color: #cb476a;
	color: aliceblue;
	border-radius: 23px;
	min-width: 161px;
	height: 46px;
}
</style>


</head>
<body class="animsition">
	    <!-- Header -->
    <header class="header-v3">
      <!-- Header desktop -->
      <div class="container-menu-desktop trans-03 mb-6">
        <div class="wrap-menu-desktop" style="background-color: black">
          <nav class="limiter-menu-desktop p-l-45">
            <!-- Logo desktop -->
            <a href="./home-03.html" class="logo" style="color: white; font-size: large; font-weight: bold">
              <!-- <img src="images/icons/logo-02.png" alt="IMG-LOGO"> -->
              NewView
            </a>

            <!-- Menu desktop -->
            <div class="menu-desktop">
              <ul class="main-menu" style="font-weight: bold">
                <li>
                  <a href="./home-03.html">主頁</a>
                </li>

                <li>
                  <a href="./NewActJSPTest.jsp">活動專區</a>
                </li>

                <li class="label1" data-label1="hot">
                  <a href="./checkout_cart.html">購物車</a>
                </li>

                <li>
                  <a href="./forum_home.html">討論區</a>
                </li>

                <li>
                  <a href="./member.html">會員中心</a>
                </li>
              </ul>
            </div>

            <!-- Icon header -->
            <div class="wrap-icon-header flex-w flex-r-m h-full">
              <div class="flex-c-m h-full p-r-25 bor6">
                <div class="icon-header-item cl0 hov-cl1 trans-04 p-lr-11 js-show-login">
                  <i class="fa fa-user me-sm-1"></i>
                </div>
                <a href="#" class="logout" style="color: white; margin-right: 15px; margin-left: 15px">登出</a>
                <!-- <div class="icon-header-item cl0 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart" data-notify="2">
                  <i class="zmdi zmdi-shopping-cart"></i>
                </div> -->
              </div>

              <div class="flex-c-m h-full p-lr-19">
                <div class="icon-header-item cl0 hov-cl1 trans-04 p-lr-11 js-show-sidebar">
                  <i class="zmdi zmdi-menu"></i>
                </div>
              </div>
            </div>
          </nav>
        </div>
      </div>

      <!-- Header Mobile -->
      <div class="wrap-header-mobile">
        <!-- Logo moblie -->
        <div class="logo-mobile">
          <a href="home-03.html" style="color: black; font-size: large; font-weight: bold">
            <!-- <img src="images/icons/logo-01.png" alt="IMG-LOGO"/> -->
            NewView
          </a>
        </div>

        <!-- Icon header -->
        <div class="wrap-icon-header flex-w flex-r-m h-full m-r-15">
          <div class="flex-c-m h-full p-r-5">
            <div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 js-show-login">
              <i class="fa fa-user me-sm-1"></i>
            </div>
            <a href="#" class="logout" style="margin-right: 15px; margin-left: 15px">登出</a>
            <!-- <div class="icon-header-item cl2 hov-cl1 trans-04 p-lr-11 icon-header-noti js-show-cart" data-notify="2">
              <i class="zmdi zmdi-shopping-cart"></i>
            </div> -->
          </div>
        </div>

        <!-- Button show menu -->
        <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
          <span class="hamburger-box">
            <span class="hamburger-inner"></span>
          </span>
        </div>
      </div>

      <!-- Menu Mobile -->
      <div class="menu-mobile">
        <ul class="main-menu-m" style="font-weight: bold">
          <li>
            <a href="./home-03.html">主頁</a>
            <span class="arrow-main-menu-m">
              <i class="fa fa-angle-right" aria-hidden="true"></i>
            </span>
          </li>

          <li>
            <a href="./NewActJSPTest.jsp">活動專區</a>
          </li>

          <li>
            <a href="./checkout_cart.html" class="label1 rs1" data-label1="hot">購物車</a>
          </li>

          <li>
            <a href="./forum_dopost.html">討論區</a>
          </li>

          <li>
            <a href="./member.html">會員中心</a>
          </li>

          <li>
            <a href="./myOrder.html">訂單查詢</a>
          </li>
        </ul>
      </div>

      <!-- Modal Search -->
      <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
        <button class="flex-c-m btn-hide-modal-search trans-04">
          <i class="zmdi zmdi-close"></i>
        </button>

        <form class="container-search-header">
          <div class="wrap-search-header">
            <input class="plh0" type="text" name="search" placeholder="Search..." />

            <button class="flex-c-m trans-04">
              <i class="zmdi zmdi-search"></i>
            </button>
          </div>
        </form>
      </div>

      <!-- 登出 -->
      <script>
        $(".logout").on("click", function (e) {
          // 登出 API
          const COLLECTION_POINT = "/LogOut";
          e.preventDefault();
          $.ajax({
            url: END_POINT_URL + COLLECTION_POINT,
            type: "POST",
            dataType: "json",
            beforeSend: function (xhr) {
              console.log("beforeSend");
            },
            success: function (data) {
              console.log(data);
              redirect(data);
            },
            complete: function (xhr) {
              console.log("complete");
            },
          });
          function redirect(data) {
            console.log(data);
            alert("帳號已登出，畫面將轉導至首頁");
            location.href = "home-03.html";
          }
        });
      </script>
    </header>
    
    
        <!-- Sidebar -->
    <aside class="wrap-sidebar js-sidebar">
      <div class="s-full js-hide-sidebar"></div>

      <div class="sidebar flex-col-l p-t-22 p-b-25">
        <div class="flex-r w-full p-b-30 p-r-27">
          <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-sidebar">
            <i class="zmdi zmdi-close"></i>
          </div>
        </div>

        <div class="sidebar-content flex-w w-full p-lr-65 js-pscroll">
          <ul class="sidebar-link w-full">
            <li class="p-b-13">
              <a href="./home-03.html" class="stext-102 cl2 hov-cl1 trans-04"> 主頁 </a>
            </li>

            <li class="p-b-13">
              <a href="./NewActJSPTest.jsp" class="stext-102 cl2 hov-cl1 trans-04"> 活動專區 </a>
            </li>

            <li class="p-b-13">
              <a href="./forum_home.html" class="stext-102 cl2 hov-cl1 trans-04"> 討論區 </a>
            </li>

            <li class="p-b-13">
              <a href="./member.html" class="stext-102 cl2 hov-cl1 trans-04"> 會員中心 </a>
            </li>

            <li class="p-b-13">
              <a href="./myOrder.html" class="stext-102 cl2 hov-cl1 trans-04"> 訂單查詢 </a>
            </li>
          </ul>

          <div class="sidebar-gallery w-full p-tb-30">
            <span class="mtext-101 cl5"> @ NewView </span>

            <div class="flex-w flex-sb p-t-36 gallery-lb"></div>
          </div>

          <div class="sidebar-gallery w-full">
            <span class="mtext-101 cl5"> About Us </span>

            <p class="stext-108 cl6 p-t-27">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur maximus vulputate hendrerit. Praesent faucibus erat vitae rutrum gravida. Vestibulum tempus mi enim, in molestie sem
              fermentum quis.
            </p>
          </div>
        </div>
      </div>
    </aside>
	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2"> Your Cart </span>

				<div
					class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-01.jpg" alt="IMG" />
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								White Shirt Pleat </a> <span class="header-cart-item-info"> 1
								x $19.00 </span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-02.jpg" alt="IMG" />
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Converse All Star </a> <span class="header-cart-item-info"> 1
								x $39.00 </span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="images/item-cart-03.jpg" alt="IMG" />
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Nixon Porter Leather </a> <span class="header-cart-item-info">
								1 x $17.00 </span>
						</div>
					</li>
				</ul>

				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">Total: $75.00</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.html"
							class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							View Cart </a> <a href="shoping-cart.html"
							class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Check Out </a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="NewActJSPTest.jsp" class="stext-109 cl8 hov-cl1 trans-04"> 主頁 <i
				class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <a href="NewActJSPTest.jsp" class="stext-109 cl8 hov-cl1 trans-04" data-category-id="${actData.actCategoryID}">
				${actData.actCategoryName} <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <span class="stext-109 cl4"> ${actData.actName} </span>
		</div>
	</div>

	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<!-- 小圖生產區 -->
							<div class="wrap-slick3-dots">
							
							</div>
							<!-- 小圖生產區 -->
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb" id="imgHere">

								<%
								for (int i = 0; i < base64Images.size(); i++) {
									String base64Image = base64Images.get(i);
								%>
								<div class="item-slick3"
									data-thumb="images/icons/iStock-961709574.jpg">
									<div class="wrap-pic-w pos-relative">
										<img src="data:image/jpeg;base64, <%=base64Image%>"
											alt="IMG-PRODUCT" /> <a
											class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
											href="data:image/jpeg;base64, <%=base64Image%>"> <i
											class="fa fa-expand"></i>
										</a>
									</div>
								</div>
								<%
								}
								%>



							</div>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
							${actData.actName}</h4>

						<span class="mtext-106 cl2"> ${actData.actPrice} </span>

						<p class="stext-102 cl3 p-t-23">${actData.actContent}</p>

						<!-- 顯示資訊 -->
						<div class="p-t-33">
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">場地</div>

								
									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<div class="seatWT" id="act_date"></div>

											<div class="dropDownSelect2"></div>
										</div>
									</div>
							</div>

							<div class="flex-w flex-r-m p-b-10">
								<div class="size-203 flex-c-m respon6">活動日期</div>

								<div class="size-204 respon6-next">
									<div class="rs1-select2 bor8 bg0">
										<div id="act_date">${actData.actDate}${actData.time}</div>

										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>


							<div class="seatsV">
								<button class="seatsTry">
									<a id="dynamic-link" href="./seat/中等規模 20X20/seatnotest.html">馬上前往購買</a>
								</button>
							</div>
						</div>
					</div>
				</div>

				<!--  -->
				
			</div>
		</div>
		</div>

		<div class="bor10 m-t-50 p-t-43 p-b-40">
			<!-- Tab01 -->
			<div class="tab01">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item p-b-10"><a class="nav-link active"
						data-toggle="tab" href="#description" role="tab">活動詳細</a></li>

					

					<li class="nav-item p-b-10"><a class="nav-link"
						data-toggle="tab" href="#reviews" role="tab">活動評論 (1)</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content p-t-43">
					<!-- - -->
					<div class="tab-pane fade show active" id="description"
						role="tabpanel">
						<div class="how-pos2 p-lr-15-md">
							<p class="stext-102 cl6">${actData.actIntroduce }</p>
						</div>
					</div>

					<!-- - -->
					<div class="tab-pane fade" id="information" role="tabpanel">
						<div class="row">
							<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
								<ul class="p-lr-28 p-lr-15-sm">
									<li class="flex-w flex-t p-b-7"><span
										class="stext-102 cl3 size-205"> Weight </span> <span
										class="stext-102 cl6 size-206"> 0.79 kg </span></li>

									<li class="flex-w flex-t p-b-7"><span
										class="stext-102 cl3 size-205"> Dimensions </span> <span
										class="stext-102 cl6 size-206"> 110 x 33 x 100 cm </span></li>

									<li class="flex-w flex-t p-b-7"><span
										class="stext-102 cl3 size-205"> Materials </span> <span
										class="stext-102 cl6 size-206"> 60% cotton </span></li>

									<li class="flex-w flex-t p-b-7"><span
										class="stext-102 cl3 size-205"> Color </span> <span
										class="stext-102 cl6 size-206"> Black, Blue, Grey,
											Green, Red, White </span></li>

									<li class="flex-w flex-t p-b-7"><span
										class="stext-102 cl3 size-205"> Size </span> <span
										class="stext-102 cl6 size-206"> XL, L, M, S </span></li>
								</ul>
							</div>
						</div>
					</div>

					<!-- - -->
					<div class="tab-pane fade" id="reviews" role="tabpanel">
						<div class="row">
							<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
								<div class="p-b-30 m-lr-15-sm" id="reviewIn">
									<!-- Review -->
									

									<!-- Add review -->
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

		<div class="bg6 flex-c-m flex-w size-302 m-t-73 p-tb-15">
			<span class="stext-107 cl6 p-lr-25"> SKU: JAK-01 </span> <span
				class="stext-107 cl6 p-lr-25"> Categories: Jacket, Men </span>
		</div>
	</section>

	<!-- Related Products -->
	<section class="sec-relate-product bg0 p-t-45 p-b-105">
		<div class="container">
			<div class="p-b-45">
				<h3 class="ltext-106 cl5 txt-center">Related Products</h3>
			</div>

			<!-- Slide2 -->
			<div class="wrap-slick2">
				<div class="slick2">
				
				
				
					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="images/icons/iStock-831601850.jpg" alt="IMG-PRODUCT" />

								<a href="#"
									class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									活動詳細 </a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<p style="font-size: 11px">活動日期:2023.12.12(一)8:00</p>

								<div class="block2-txt-child1 flex-col-l">
									<div style="width: 100%; overflow: hidden">
										<div style="float: left">
											<a href="product-detail.html"
												class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
												Esprit Ruffle Shirt </a>
										</div>
										<div style="float: right">
											<span class="stext-105 cl3"> TWD 300 </span>
										</div>
									</div>
									<hr style="margin-top: 0" size="8px" align="center"
										width="100%" />
									<div style="width: 100%; overflow: hidden">
										<div style="float: left">
											<a
												href="https://www.google.com/maps/@25.0356163,121.4798943,15z?authuser=0&entry=ttu">
												<img src="./images/icons/iStock-902788474 (1).png" alt="" />
												台北市
											</a>
										</div>
										<div style="float: right"
											class="block2-txt-child2 flex-r p-t-3">
											<a href="#"
												class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
												<img class="icon-heart1 dis-block trans-04"
												src="images/icons/icon-heart-01.png" alt="ICON" /> <img
												class="icon-heart2 dis-block trans-04 ab-t-l"
												src="images/icons/icon-heart-02.png" alt="ICON" />
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="images/iStock-489518962.jpg" alt="IMG-PRODUCT" /> <a
									href="#"
									class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									活動詳細 </a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<p style="font-size: 11px">活動日期:2023.12.12(一)8:00</p>

								<div class="block2-txt-child1 flex-col-l">
									<div style="width: 100%; overflow: hidden">
										<div style="float: left">
											<a href="product-detail.html"
												class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
												哪裡的音樂會 </a>
										</div>
										<div style="float: right">
											<span class="stext-105 cl3"> TWD 500 </span>
										</div>
									</div>
									<hr style="margin-top: 0" size="8px" align="center"
										width="100%" />
									<div style="width: 100%; overflow: hidden">
										<div style="float: left">
											<a
												href="https://www.google.com/maps/@25.0356163,121.4798943,15z?authuser=0&entry=ttu">
												<img src="./images/icons/iStock-902788474 (1).png" alt="" />
												台北市
											</a>
										</div>
										<div style="float: right"
											class="block2-txt-child2 flex-r p-t-3">
											<a href="#"
												class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
												<img class="icon-heart1 dis-block trans-04"
												src="images/icons/icon-heart-01.png" alt="ICON" /> <img
												class="icon-heart2 dis-block trans-04 ab-t-l"
												src="images/icons/icon-heart-02.png" alt="ICON" />
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="images/icons/00301812.202110180187M.jpg"
									alt="IMG-PRODUCT" /> <a href="#"
									class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									活動詳細 </a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<p style="font-size: 11px">活動日期:2023.12.12(一)8:00</p>

								<div class="block2-txt-child1 flex-col-l">
									<div style="width: 100%; overflow: hidden">
										<div style="float: left">
											<a href="product-detail.html"
												class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
												睡著的舞台劇 </a>
										</div>
										<div style="float: right">
											<span class="stext-105 cl3"> TWD 300 </span>
										</div>
									</div>
									<hr style="margin-top: 0" size="8px" align="center"
										width="100%" />
									<div style="width: 100%; overflow: hidden">
										<div style="float: left">
											<a
												href="https://www.google.com/maps/@25.0356163,121.4798943,15z?authuser=0&entry=ttu">
												<img src="./images/icons/iStock-902788474 (1).png" alt="" />
												台北市
											</a>
										</div>
										<div style="float: right"
											class="block2-txt-child2 flex-r p-t-3">
											<a href="#"
												class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
												<img class="icon-heart1 dis-block trans-04"
												src="images/icons/icon-heart-01.png" alt="ICON" /> <img
												class="icon-heart2 dis-block trans-04 ab-t-l"
												src="images/icons/icon-heart-02.png" alt="ICON" />
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="images/iStock-1482843353.jpg" alt="IMG-PRODUCT" /> <a
									href="#"
									class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									活動詳細 </a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<p style="font-size: 11px">活動日期:2023.12.12(一)8:00</p>

								<div class="block2-txt-child1 flex-col-l">
									<div style="width: 100%; overflow: hidden">
										<div style="float: left">
											<a href="product-detail.html"
												class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
												莫名其妙講座 </a>
										</div>
										<div style="float: right">
											<span class="stext-105 cl3"> TWD 200 </span>
										</div>
									</div>
									<hr style="margin-top: 0" size="8px" align="center"
										width="100%" />
									<div style="width: 100%; overflow: hidden">
										<div style="float: left">
											<a
												href="https://www.google.com/maps/@25.0356163,121.4798943,15z?authuser=0&entry=ttu">
												<img src="./images/icons/iStock-902788474 (1).png" alt="" />
												台北市
											</a>
										</div>
										<div style="float: right"
											class="block2-txt-child2 flex-r p-t-3">
											<a href="#"
												class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
												<img class="icon-heart1 dis-block trans-04"
												src="images/icons/icon-heart-01.png" alt="ICON" /> <img
												class="icon-heart2 dis-block trans-04 ab-t-l"
												src="images/icons/icon-heart-02.png" alt="ICON" />
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="images/product-05.jpg" alt="IMG-PRODUCT" /> <a
									href="#"
									class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									Quick View </a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l">
									<a href="product-detail.html"
										class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										Front Pocket Jumper </a> <span class="stext-105 cl3">
										$34.75 </span>
								</div>

								<div class="block2-txt-child2 flex-r p-t-3">
									<a href="#"
										class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										<img class="icon-heart1 dis-block trans-04"
										src="images/icons/icon-heart-01.png" alt="ICON" /> <img
										class="icon-heart2 dis-block trans-04 ab-t-l"
										src="images/icons/icon-heart-02.png" alt="ICON" />
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="images/product-06.jpg" alt="IMG-PRODUCT" /> <a
									href="#"
									class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									Quick View </a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l">
									<a href="product-detail.html"
										class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										Vintage Inspired Classic </a> <span class="stext-105 cl3">
										$93.20 </span>
								</div>

								<div class="block2-txt-child2 flex-r p-t-3">
									<a href="#"
										class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										<img class="icon-heart1 dis-block trans-04"
										src="images/icons/icon-heart-01.png" alt="ICON" /> <img
										class="icon-heart2 dis-block trans-04 ab-t-l"
										src="images/icons/icon-heart-02.png" alt="ICON" />
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="images/product-07.jpg" alt="IMG-PRODUCT" /> <a
									href="#"
									class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									Quick View </a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l">
									<a href="product-detail.html"
										class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										Shirt in Stretch Cotton </a> <span class="stext-105 cl3">
										$52.66 </span>
								</div>

								<div class="block2-txt-child2 flex-r p-t-3">
									<a href="#"
										class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										<img class="icon-heart1 dis-block trans-04"
										src="images/icons/icon-heart-01.png" alt="ICON" /> <img
										class="icon-heart2 dis-block trans-04 ab-t-l"
										src="images/icons/icon-heart-02.png" alt="ICON" />
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="item-slick2 p-l-15 p-r-15 p-t-15 p-b-15">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic hov-img0">
								<img src="images/product-08.jpg" alt="IMG-PRODUCT" /> <a
									href="#"
									class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									Quick View </a>
							</div>

							<div class="block2-txt flex-w flex-t p-t-14">
								<div class="block2-txt-child1 flex-col-l">
									<a href="product-detail.html"
										class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
										Pieces Metallic Printed </a> <span class="stext-105 cl3">
										$18.96 </span>
								</div>

								<div class="block2-txt-child2 flex-r p-t-3">
									<a href="#"
										class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
										<img class="icon-heart1 dis-block trans-04"
										src="images/icons/icon-heart-01.png" alt="ICON" /> <img
										class="icon-heart2 dis-block trans-04 ab-t-l"
										src="images/icons/icon-heart-02.png" alt="ICON" />
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	    <!-- Footer -->
    <footer class="bg3 p-t-55 p-b-32">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-lg-3 p-b-20">
            <h4 class="stext-301 cl0 p-b-30">Categories</h4>
            <ul style="border-right: 1px solid #ccc; padding-right: 20px">
              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> 脫口秀 </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> 講座 </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> 音樂會 </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> 舞台劇 </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> 演唱會 </a>
              </li>
            </ul>
          </div>

          <div class="col-sm-6 col-lg-3 p-b-20">
            <h4 class="stext-301 cl0 p-b-30">Help</h4>

            <ul>
              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> 訂單查詢 </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> 退貨申請 </a>
              </li>

              <li class="p-b-10">
                <a href="#" class="stext-107 cl7 hov-cl1 trans-04"> FAQs </a>
              </li>
            </ul>
          </div>

          <div class="col-sm-6 col-lg-3 p-b-20">
            <h4 class="stext-301 cl0 p-b-30">Newsletter</h4>

            <form>
              <div class="wrap-input1 w-full p-b-4">
                <input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email" placeholder="email@example.com" />
                <div class="focus-input1 trans-04"></div>
              </div>

              <div class="p-t-18">
                <button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">訂閱電子報</button>
              </div>
            </form>
          </div>

          <div class="col-sm-6 col-lg-3 p-b-20">
            <!-- <h4 class="stext-301 cl0 p-b-30">Latest Blog Post</h4> -->
            <p class="stext-301 cl7 size-201">Ready to get started?</p>
            <p class="stext-107 cl7 size-201">Any questions? Let us know in store at 104台北市中山區南京東路三段219號5樓 or call us on (+886) 2712 0589</p>

            <div class="p-t-27">
              <!-- <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
            <i class="fa fa-facebook"></i>
          </a>

          <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
            <i class="fa fa-instagram"></i>
          </a>

          <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
            <i class="fa fa-pinterest-p"></i>
          </a> -->
            </div>
          </div>
        </div>
      </div>
    </footer>

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Modal1 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img src="images/icons/icon-close.png" alt="CLOSE" />
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

								<div class="slick3 gallery-lb">
									<div class="item-slick3"
										data-thumb="images/product-detail-01.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-01.jpg" alt="IMG-PRODUCT" />

											<a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-01.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3"
										data-thumb="images/product-detail-02.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-02.jpg" alt="IMG-PRODUCT" />

											<a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-02.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3"
										data-thumb="images/product-detail-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="images/product-detail-03.jpg" alt="IMG-PRODUCT" />

											<a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-03.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">Lightweight
								Jacket</h4>

							<span class="mtext-106 cl2"> $58.79 </span>

							<p class="stext-102 cl3 p-t-23">Nulla eget sem vitae eros
								pharetra viverra. Nam vitae luctus ligula. Mauris consequat
								ornare feugiat.</p>

							<!--  -->
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">Size</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Size S</option>
												<option>Size M</option>
												<option>Size L</option>
												<option>Size XL</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">Color</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Red</option>
												<option>Blue</option>
												<option>White</option>
												<option>Grey</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-204 flex-w flex-m respon6-next">
										<div class="wrap-num-product flex-w m-r-20 m-tb-10">
											<div
												class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product"
												type="number" name="num-product" value="1" />

											<div
												class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>

										<button
											class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
											Add to cart</button>
									</div>
								</div>
							</div>

							<!--  -->
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next(".dropDownSelect2"),
			});
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/parallax100/parallax100.js"></script>
	<script>
		$(".parallax100").parallax100();
	</script>
	<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$(".gallery-lb").each(function() {
			// the containers for all your galleries
			$(this).magnificPopup({
				delegate : "a", // the selector for gallery item
				type : "image",
				gallery : {
					enabled : true,
				},
				mainClass : "mfp-fade",
			});
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$(".js-addwish-b2, .js-addwish-detail").on("click", function(e) {
			e.preventDefault();
		});

		$(".js-addwish-b2").each(
				function() {
					var nameProduct = $(this).parent().parent().find(
							".js-name-b2").html();
					$(this).on("click", function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass("js-addedwish-b2");
						$(this).off("click");
					});
				});

		$(".js-addwish-detail").each(
				function() {
					var nameProduct = $(this).parent().parent().parent().find(
							".js-name-detail").html();

					$(this).on("click", function() {
						swal(nameProduct, "is added to wishlist !", "success");

						$(this).addClass("js-addedwish-detail");
						$(this).off("click");
					});
				});

		/*---------------------------------------------*/

		$(".js-addcart-detail").each(
				function() {
					var nameProduct = $(this).parent().parent().parent()
							.parent().find(".js-name-detail").html();
					$(this).on("click", function() {
						swal(nameProduct, "is added to cart !", "success");
					});
				});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$(".js-pscroll").each(function() {
			$(this).css("position", "relative");
			$(this).css("overflow", "hidden");
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on("resize", function() {
				ps.update();
			});
		});
	</script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>


<script>
document.addEventListener("DOMContentLoaded", function() {
    var base64Images = <%= new Gson().toJson(base64Images) %>;
    var dotImages = document.querySelectorAll(".slick3-dots img");

    for (var i = 0; i < base64Images.length; i++) {
        dotImages[i].src = "data:image/jpeg;base64," + base64Images[i];
    }
});

var actScope = ${actData.actScope};
var actID = ${actData.actID};
var scale;
switch (actScope) {
case 1:
	scale = "最小規模";
	$('#dynamic-link').attr('href',
			'seatChooseWebsocketSmall.jsp?actID=' + actID);
	break;
case 2:
	scale = "中等規模";
	$('#dynamic-link').attr('href',
			'seatChooseWebsocket.jsp?actID=' + actID);
	break;
case 3:
	scale = "最大規模";
	$('#dynamic-link').attr('href',
			'seatChooseWebsocketLarge.jsp?actID=' + actID);
	break;
default:
	console.error("未知的規模");
}

$(".seatWT").text(scale);

$(document).ready(function(){
   
	$.ajax({
	    type: "POST",
	    url: "review",
	    data: { actID: ${actData.actID}},
	    dataType: "json",
	    beforeSend: function(xhr) {
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
	    },
	    success: function(response) {
	        console.log(response);

	        // 獲取容器元素
	        var reviewContainer = $("#reviewIn");
	        var numberOfItems = response.length;
	        var reviewsTabLink = $(".nav-link[data-toggle='tab'][href='#reviews']");
	        reviewsTabLink.text("活動評論 (" + numberOfItems + ")");
	        // 遍歷 response 中的每個評論
	        $.each(response, function(index, item) {
	            console.log("Order ID: " + item.orderID);
	            console.log("Act ID: " + item.actID);
	            console.log("User Name: " + item.userName);
	            console.log("StarWith: " + item.StarWith);
	            console.log("Review: " + item.review);

	            // 創建一個新的評論區塊
	            var commentBlock = $("<div class='flex-w flex-t p-b-68'></div>");

	            // 創建評論中的圖像元素
	            var imageElement = $("<div class='wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6'><img src='images/05_68473.jpg' alt='AVATAR' /></div>");

	            // 創建評論中的文本元素
	            var textElement = $("<div class='size-207'></div>");

	            // 創建評論中的用戶名元素
	            var userNameElement = $("<span class='mtext-107 cl2 p-r-20' id='userNameSpan'>" + item.userName + "</span>");

	            // 創建評論中的星級評分元素
	            var starRatingElement = $("<span class='fs-18 cl11'></span>");
	            for (var i = 0; i < item.StarWith; i++) {
	                starRatingElement.append("<i class='zmdi zmdi-star'></i>");
	            }

	            // 創建評論中的評論文本元素
	            var reviewTextElement = $("<p class='stext-102 cl6'>" + item.review + "</p>");

	            // 添加所有元素到評論區塊
	            textElement.append(userNameElement);
	            textElement.append(starRatingElement);
	            textElement.append(reviewTextElement);
	            commentBlock.append(imageElement);
	            commentBlock.append(textElement);

	            // 將評論區塊的內容添加到容器中
	            reviewContainer.append(commentBlock);
	        });
	    }
	});



});



</script>



</body>
</html>
