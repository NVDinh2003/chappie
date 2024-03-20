<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><dec:title default="Trang chủ" /></title>

<!-- css -->
<!-- <link href="<c:url value='/template/web/css/style.css' />" rel="stylesheet" type="text/css" media="all" /> -->
<link href="<c:url value='/template/web/css/mycss.css' />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value='/template/web/css/bootstrap.min.css' />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value='/template/web/css/font-awesome.min.css' />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value='/template/web/css/prettyPhoto.css' />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value='/template/web/css/price-range.css' />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value='/template/web/css/animate.css' />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value='/template/web/css/main.css' />" rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value='/template/web/css/responsive.css' />" rel="stylesheet" type="text/css" media="all" />


<link rel="icon" type="image/x-icon" href="<c:url value='images/ico/favicon.ico' />">


</head>
<body>
	<!-- header -->
	<%@ include file="/common/web/header.jsp"%>
	<!-- header -->
	<%@ include file="/common/web/slider.jsp"%>
	<section>
	<div class="container">
		<div class="row">
		<%@ include file="/common/web/left_sidebar.jsp"%>
			<dec:body />
		</div>
	</div>
	</section>

	<!-- footer -->
	<%@ include file="/common/web/footer.jsp"%>
	<!-- footer -->

	<!-- jquery -->
	<!-- <script type="text/javascript" src="<c:url value='/template/web/jquery/jquery.min.js' />"></script> -->


	<script type="text/javascript" src="<c:url value='/template/web/js/jquery.js' />"></script>
	<script type="text/javascript" src="<c:url value='/template/web/js/price-range.js' />"></script>
	<script type="text/javascript" src="<c:url value='/template/web/js/jquery.scrollUp.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/template/web/js/bootstrap.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/template/web/js/jquery.prettyPhoto.js' />"></script>
	<script type="text/javascript" src="<c:url value='/template/web/js/main.js' />"></script>

</body>
</html>