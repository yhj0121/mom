<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<title>Man of the match</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<style>
	.actions {
		justify-content: center;
	}
	#findInfo a {
		color: #bcbcbc;
	}
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper" style="justify-content: center;">

		<!-- Header -->
		<%@include file="../include/nav.jsp"%>

	<div class="column">
			<!-- Intro -->
			<section id="intro">
				<a href="#" class="logo"><img src="${pageContext.request.contextPath}/resources/images/logo.jpg"
					alt="" /></a>
				<header style="margin-bottom: 150px;">
					<h2>Man of the match</h2>
					<p>쉬운 경기 매칭 서비스 및 팀 관리 서비스를 제공합니다.</p>
				</header>
			</section>

			<!-- Post -->
			<article class="mt-5" style="margin-bottom: 200px; ">
				<header>
					<div class="title">
						<h2 style="text-align: center;">아이디/비밀번호 찾기</h2>
						<p></p>
					</div>
				</header>

				<section>
						<div class="row d-flex flex-row justify-content-between gtr-uniform">
							<div class=" col-12 mt-5">
									<ul class="actions stacked ">
										<li><a href="${commonURL}/member/findid" class="button fit" onclick="login()" >아이디 찾기</a></li>
										<li><a href="${commonURL}/member/findpw" class="button fit" onclick="login()" >비밀번호 찾기 찾기</a></li>
										<li><a href="${commonURL}/member/login" class="button fit">취소</a></li>
								</ul>
							</div>
						</div>
				</section>
			</article>
			<!-- Footer -->
			<%@include file="../include/footer.jsp"%>
			</div>
		</div>

	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>