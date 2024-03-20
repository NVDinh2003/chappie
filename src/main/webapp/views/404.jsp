<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Error page !</title>
            <link href="<c:url value='/template/web/css/bootstrap.min.css' />" rel="stylesheet" type="text/css" media="all" />
            <link href="<c:url value='/template/web/css/font-awesome.min.css' />" rel="stylesheet" type="text/css" media="all" />
            <link href="<c:url value='/template/web/css/prettyPhoto.css' />" rel="stylesheet" type="text/css" media="all" />
            <link href="<c:url value='/template/web/css/price-range.css' />" rel="stylesheet" type="text/css" media="all" />
            <link href="<c:url value='/template/web/css/animate.css' />" rel="stylesheet" type="text/css" media="all" />
            <link href="<c:url value='/template/web/css/main.css' />" rel="stylesheet" type="text/css" media="all" />
            <link href="<c:url value='/template/web/css/responsive.css' />" rel="stylesheet" type="text/css" media="all" />
            <link href="<c:url value='/template/web/css/mycss.css' />" rel="stylesheet" type="text/css" media="all" />

            <link rel="icon" type="image/x-icon" href="<c:url value='images/ico/favicon.ico' />">
        </head>

        <body>
            <div class="mycss_404_page container text-center">

                <div class="logo pull-center logo-40">
                    <a href="<%=request.getContextPath()%>/trang-chu"><img class="mycss-logo-shop" src="<%=request.getContextPath()%>/images/home/logo_chappie.jpg" alt="" /></a>
                </div>

                <div class="content-404">
                    <img src="<%=request.getContextPath()%>/images/404/404(1)_3.png" class="mycss-404-img img-responsive" alt="" />
                    <h1>
                        <b>OPPS!</b> Tôi chưa mần được trang ni, thử cấy khác tạm hấy =))
                    </h1>
                    <p>Uh... So it looks like you brock something. The page you are looking for has up and Vanished !</p>



                    <a href="<%=request.getContextPath()%>/trang-chu">
                        <button class="snip1582">Home page</button>
                    </a>
                </div>
            </div>
        </body>

        </html>