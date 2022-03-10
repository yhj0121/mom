<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mom.momhome.member.*"%>
<%@page import="com.mom.momhome.common.*"%>
<html>
<head>
<title>Man of the match</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<style>
.actions {
	justify-content: center;
}

textarea {
	text-align: left !important;
	resize: none;
}
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<%@include file="../include/nav.jsp"%>



		<!-- Main -->
		<div id="main">

			<!-- Intro -->
			<section id="intro">
				<a href="#" class="logo"><img
					src="${pageContext.request.contextPath}/resources/images/logo.jpg"
					alt="" /></a>
				<header>
					<h2>Man of the match</h2>
					<p>쉬운 경기 매칭 서비스 및 팀 관리 서비스를 제공합니다.</p>
				</header>
			</section>

			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>My Page</h2>
						<p>내 정보 수정이나 팀 신청 내역, 경기 매칭 내역 등을 확인할 수 있습니다.</p>
					</div>
				</header>

				<!-- Posts List -->
				<section>
					<ul class="posts">
						<li>
							<article>
								<header>
									<h3>
										<a href="${ commonURL }/member/myinfo">내 정보 수정</a>
									</h3>
									<p class="published">내 정보를 수정합니다. </p>
								</header>
								<a href="${ commonURL }/member/myinfo" class="image"><img
									src="${pageContext.request.contextPath}/resources/images/icon_account.png"
									alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="${ commonURL }/member/teamdetail">나의 팀</a>
									</h3>
									<p class="published">내가 가입한 팀이나 생성한 팀에 관한 정보를 볼 수 있습니다.</p>
								</header>
								<a href="${ commonURL }/member/teamdetail" class="image"><img
									src="${pageContext.request.contextPath}/resources/images/icon_list.png"
									alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="${pageContext.request.contextPath}/member/matchinglist">매칭 신청 내역</a>
									</h3>
									<p class="published">우리 팀과 경기를 원하는 신청 내역을 확인합니다.</p>
								</header>
								<a href="${pageContext.request.contextPath}/member/matchinglist" class="image"><img
									src="${pageContext.request.contextPath}/resources/images/icon_calendar.png"
									alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="${pageContext.request.contextPath}/member/mercenarylist">용병 구인 내역</a>
									</h3>
									<p class="published">내가 작성한 용병 구인 내역을 볼 수 있습니다.</p>
								</header>
								<a href="${pageContext.request.contextPath}/member/mercenarylist" class="image"><img
									src="${pageContext.request.contextPath}/resources/images/icon_list.png"
									alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="${pageContext.request.contextPath}/member/cscenterlist">나의 문의 내역</a>
									</h3>
									<p class="published">문의한 내용을 확인합니다.</p>
								</header>
								<a href="${pageContext.request.contextPath}/member/cscenterlist" class="image"><img
									src="${pageContext.request.contextPath}/resources/images/icon_customerservice.png"
									alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="${pageContext.request.contextPath}/member/delete" onclick="userDelete()">회원 탈퇴</a>
									</h3>
									<p class="published">MAN OF THE MATCH 회원 탈퇴를 진행합니다.</p>
								</header>
								<a href="${pageContext.request.contextPath}/member/delete" class="image"><img
									src="${pageContext.request.contextPath}/resources/images/icon_accountRemove.png"
									alt="" /></a>
							</article>
						</li>
					</ul>
				</section>
			</article>
			<!-- Footer -->
			<%@include file="../include/footer.jsp"%>
		</div>

	</div>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</body>
</html>