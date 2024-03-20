<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><dec:title default="Admin Home" /></title>
<!-- Custom fonts for this template-->
<link href="<c:url value='/template/admin/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value='/template/admin/css/sb-admin-2.min.css'/>" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="<c:url value='/template/admin/datatables/dataTables.bootstrap4.min.css'/>" rel="stylesheet">

<link rel="icon" type="image/x-icon" href="<c:url value='images/ico/favicon.ico' />">

</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="/common/admin/left_sidebar.jsp"%>
		<!-- End Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Header -->
				<%@ include file="/common/admin/header.jsp"%>

				<dec:body />

			</div>
			<!-- End of Main Content -->
			<%@ include file="/common/admin/footer.jsp"%>
		</div>
		<!-- End of Content Wrapper -->
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
		</a>
	</div>





	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value='/template/admin/jquery/jquery.min.js'/>"></script>
	<script src="<c:url value='/template/admin//bootstrap/js/bootstrap.bundle.min.js'/>"></script>

	<!-- Core plugin JavaScript-->
	<script src="<c:url value='/template/admin/jquery-easing/jquery.easing.min.js'/>"></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/template/admin/js/sb-admin-2.min.js'/>"></script>

	<!-- Page level plugins -->
	<script src="<c:url value='/template/admin/chart.js/Chart.min.js'/>"></script>

	<!-- Page level custom scripts -->
	<script src="<c:url value='/template/admin/js/demo/chart-area-demo.js'/>"></script>
	<script src="<c:url value='/template/admin/js/demo/chart-pie-demo.js'/>"></script>
	
    <!-- Page level plugins -->
    <script src="<c:url value='/template/admin/datatables/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/template/admin/datatables/dataTables.bootstrap4.min.js'/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value='/template/admin/js/demo/datatables-demo.js'/>"></script>
</body>
</html>