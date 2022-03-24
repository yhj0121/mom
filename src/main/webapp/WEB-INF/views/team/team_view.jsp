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
			List<TeamDto> list = (List<TeamDto>) request.getAttribute("getTeamViewList");
		%>
		
		<!-- Main -->
		<div id="main">
			<form name="myform">
			<input type="hidden" name="team_name" value="<%=dto.getTeam_name()%>"/>
			<input type="hidden" name="team_key" value="<%=dto.getTeam_key() %>"/>
			<input type="hidden" name="user_key" value="${userkey}"/>
		
			
			
			
			<!-- Post -->
			<article class="post">
			
				<header style="max-height: 250px;">
					
					<div class="title" align="center">
						<h2>
							<a href="single.html"><%=dto.getTeam_name() %></a>
						</h2>
					</div>
					<div class="meta">
						<time class="published">SINCE :<%=dto.getTeam_fdate()%></time>
					</div>
					<div class="meta" style="padding: 0;">
						<img
							src="../upload/<%=dto.getTeam_emblem() %>"
							alt="팀 엠블럼" style="width: 100%; height: 100%;" />
					</div>
				</header>
				
				<div class="row gtr-uniform" align="center">
					<div class="col-6 col-12-medium">
						<p>
							<h2>팀 소개</h2>
							<div><%=dto.getTeam_intro() %></div>
						</p>
						<br>
						<p>
							<h2>지역</h2>
							<div><%=dto.getTeam_city() %></div>
						</p>
						<br>
						<p>
							<h2>감독</h2>
							<div><%=dto.getUser_name() %></div>
						</p>
						<br>
						<p>
							<h2>모집여부</h2>
							<div><%if(dto.getTeam_recruit_yn().equals("1")){%>모집중<%}else{%>모집종료<%} %></div>
						</p>
					</div>
				
					<div class="col-6 col-12-medium">
						<p>
							<h2>공지사항</h2>
							<div><%=dto.getTeam_notice() %></div>
						</p>
						<br>
						<p>
							<h2>회비(월)</h2>
							<div><%=dto.getTeam_fee() %>원</div>
						</p>
						<br>
						<p>
							<h2>인원</h2>
							<div><%=dto.getTeam_num() %>명</div>
						</p>
						<br>
					
					</div>
				</div>
				<br>
				
				<table>
					<tr>
						<td>팀 회원 명단</td>
						<td>직책</td>
						<td>선호포지션</td>
					</tr>
					<tr>
					<%
					for(TeamDto teamDto : list) { 
					%>
						<td><%=teamDto.getUser_name() %></td>
						<td><%if(teamDto.getMembership_role().equals("1")){ %>감독<%}else{%>선수<%} %></td>
						<td><%=teamDto.getUser_position() %></td>
					</tr>	
					<%} %>
				</table>
				

				<ul class="actions" style=" margin-top: 200px; justify-content:unset;">
					<li><input type="button" value="목록" onClick="location.href='${commonURL}/team/list'" /></li>
					<li><input type="button" value="팀 가입신청하기" onclick="goJoin()" /></li>
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
<script>


	function goJoin()
	{
		var user_key = `${user_key}`;
		var frm = document.myform;
		frm.action="<%=request.getContextPath()%>/team/teamJoin";
		frm.method="post";
		console.log('user_key');
		alert("팀 가입 신청이 완료되었습니다.");
		frm.submit();
	}
</script>