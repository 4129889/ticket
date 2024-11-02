<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NEW VIEW | Administrator Backstage | Activity Category Add</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/fontawesome-free/css/all.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/daterangepicker/daterangepicker.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/select2/css/select2.min.css">
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
    <!-- BS Stepper -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/bs-stepper/css/bs-stepper.min.css">
    <!-- dropzonejs -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/plugins/dropzone/min/dropzone.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Backstage/dist/css/adminlte.min.css">
</head>

<body class="hold-transition sidebar-mini">
<script src="./vendors/jquery/jquery-3.7.1.min.js"></script>
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
                            <h1>新增分類</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/Backstage/Allpage-administrator/admin-index.jsp">後台首頁</a></li>
                                <li class="breadcrumb-item active">分類管理</li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <!-- Default box -->
                <div class="container-fluid">
                    <div class="card" class="container-fluid">
                        <form METHOD="post" action="<%=request.getContextPath()%>/actcategory/actcategory.do" name="add" style="padding: 30px 0px;">
                            <div class="col-md-10 offset-md-1">
                                <div class="form-group">
                                    <label for="inputDisContent">分類名稱：</label>
                                    <input type="text" id="inputCategoryContent" name="actCategoryName" class="form-control" />
                                </div>
                                <div class="form-group">
									<input type="hidden" name="action" value="add"> 
									<input type="submit" class="btn btn-primary" value="送出">
								</div>
							</div>
                        </form>        
                                                         
                                    <input type="submit" class="btn btn-danger" value="清空">
                                
                    </div>
                        
                 </div>
                
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
      $("#categorySubmit").on("click", function (e) {
        // 停止點擊預設事件
        e.preventDefault();
        console.log("aa");
        // window.location.href = "http://localhost:8081/com.tha103.newview/member.html";

        /*  將 sign-in 資料用物件包裝  */
        let signIn_item = {
          account: $("#account").val(),
          password: $("#password").val(),
        };
        console.log(signIn_item);

        $.ajax({
          url: "http://localhost:8081/com.tha103.newview/SignIn",
          type: "POST",
          data: signIn_item,
          dataType: "json",
          beforeSend: function () {
            console.log("success前->beforeSend");
          },
          success: function (data) {
            console.log(data);
            loginRedirect(data);
            console.log("成功接data");
            alert("登入成功");
          },
          error: function (xhr) {
            console.log("error");
            console.log(xhr);
            // location.href = "http://localhost:8081/com.tha103.newview/sign-in.html";
          },
          complete: function (xhr) {
            console.log("complete");
            console.log(xhr);
            // location.href = "http://localhost:8081/com.tha103.newview/member.html";
          },
        });
        function loginRedirect(data) {
          if (data != null) {
            location.href = data.location;
          }
        }
      });
    </script>
    
    

    <!-- jQuery -->
    <script src="../../plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Select2.full -->
    <script src="../../plugins/select2/js/select2.full.min.js"></script>
    <!-- Bootstrap4 Duallistbox -->
    <script src="../../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
    <!-- InputMask -->
    <script src="../../plugins/moment/moment.min.js"></script>
    <script src="../../plugins/inputmask/jquery.inputmask.min.js"></script>
    <!-- date-range-picker -->
    <script src="../../plugins/daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap color picker -->
    <script src="../../plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="../../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
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
        $(function () {
            $('.select2').select2()
        });
    </script>
    <script>
        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()

            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            })








        // Setup the buttons for all transfers
        // The "add files" button doesn't need to be setup because the config
        // `clickable` has already been specified.
        document.querySelector("#actions .start").onclick = function () {
            myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED))
        }
        document.querySelector("#actions .cancel").onclick = function () {
            myDropzone.removeAllFiles(true)
        }
        // DropzoneJS Demo Code End
    </script>
      <!-- Ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</body>

</html>    