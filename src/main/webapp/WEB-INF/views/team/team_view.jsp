<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mom.momhome.member.*"%>
<%@page import="com.mom.momhome.team.*"%>
<%@page import="com.mom.momhome.mercenary.*"%>
<%@page import="com.mom.momhome.common.*"%>
<html>
<head>
<title>Man of the match</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.actions {
	justify-content: center;
}

textarea {
	text-align: left !important;
	resize: none;
}

table th {
	text-align: center !important;
}

table {
	margin-top: 40px !important;
}

table td {
	padding: .4rem .75em;
}

table td:not(.introduction) {
	text-align: center;
}
</style>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<%@include file="../include/nav.jsp"%>
		<%
			String key = StringUtil.nullToValue(request.getParameter("key"), "1");
		%>
		<%
			TeamDto dto = (TeamDto)request.getAttribute("teamDto");
		%>
		
		<!-- Main -->
		<div id="main">
			<form name="myform">
			<input type="hidden" name="team_name" value="<%=dto.getTeam_name()%>"/>
			<!-- Post -->
			<article class="post">
			
				<header>
					
					<div class="title">
					
						<h2>
							<a href="single.html"><%=dto.getTeam_name() %></a>
						</h2>
					</div>
					<div class="meta">
						<time class="published">SINCE team_fdate 끌어오기</time>
						<a href="#" class="author"><span class="name">감독 이름
								끌어오기</span></a>
					</div>
					<div class="meta" style="padding: 0;">
						<img
							src="${pageContext.request.contextPath}/resources/images/citylogo/busan.jpg"
							alt="팀 엠블럼" style="width: 100%; height: 100%;" />
					</div>
				</header>
				<div>
					<h2>팀 소개</h2>
					<p>팀 소개 끌어오기</p>
				</div>
				<div>
					<h2>지역</h2>
					<p>지역 끌어오기</p>
				</div>
				<div>
					<h2>감독</h2>
					<p>감독 끌어오기</p>
				</div>
				<div>
					<h2>팀 룰</h2>
					<p>team_notice 끌어오기</p>
				</div>
				<div>
					<h2>회비</h2>
					<p>team_fee 끌어오기</p>
				</div>
				<div>
					<h2>인원</h2>
					<p>team_num 끌어오기</p>
				</div>
				<div>
					<h2>모집여부</h2>
					<p>team_recruit_yn 끌어오기</p>
				</div>
				

				<ul class="actions" style=" margin-top: 200px; justify-content:unset;">
					<li><input type="button" value="목록" /></li>
					<li><input type="button" value="팀 가입신청하기" /></li>
					<li><input type="button" value="미정"  /></li>
					<li><input type="button" value="미정"  /></li>
					<li><input type="button" value="미정"  /></li>
				</ul>
				
			</article>
			
			<!-- Footer -->
			<%@include file="../include/footer.jsp"%>
			</form>
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
	<script>
		
	</script>

</body>
</html>