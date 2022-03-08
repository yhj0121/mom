<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%
request.setAttribute("commonURL", request.getContextPath()); 
%>
<html>
<head>
<title>Man of the match</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
</head>
<body class="is-preload" style="overflow-x: hidden;">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<%@include file="include/nav.jsp"%>

		<!-- Main -->
		<div id="main">
			<section id="intro" style="margin-top: 20em;">
				<a href="#" class="logo"><img src="resources/images/logo.jpg"
					alt="" /></a>
				<header>
					<h2>! 404 !</h2>
					<h4>접근할 수 없는 페이지입니다. 관리자에게 문의하세요.</h4>
				</header>
			</section>
			</div>
	</div>

	<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/browser.min.js"></script>
	<script src="resources/assets/js/breakpoints.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="resources/assets/js/main.js"></script>
</body>
</html>