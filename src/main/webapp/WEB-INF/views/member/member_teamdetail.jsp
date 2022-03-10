<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mom.momhome.member.*"%>
<%@page import="com.mom.momhome.team.*"%>
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

table th {
	text-align: center !important;
}

table td {
	padding: .4rem .75em;
}

table td:not(.introduction) {
	text-align: center;
}

a.link{
	margin-left: 20px; 
	font-size: .9rem;
	color: rgb(46, 174, 173);
}
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<%@include file="../include/nav.jsp"%>

		<%
		String key = StringUtil.nullToValue(request.getParameter("key"), "");
		String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
		String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
		int totalCnt = (Integer) request.getAttribute("totalCnt");
		%>
		<!-- Main -->
		<div id="main">
		<form name="myform">
			<input type="hidden" name="pg" id="pg" value="<%=pg%>" /> 
			<input type="hidden" name="team_key" id="team_key" value="" />
			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>팀 상세 내역</h2>
						<p>감독에게는 우리 팀에 가입을 신청하거나 탈퇴를 신청한 회원 내역을 보여주고, 일반 회원에게는 나의 팀 내역을 보여줍니다.</p>
					</div>
				</header>

				<section>
				<h3>나의 팀</h3>
					<div class="table-wrapper">
						<table>
							 <colgroup>
								<col width="10%" />
								<col width="*" />
								<col width="12%" />
								<col width="12%" />
								<col width="12%" />
								<col width="17%" />
							</colgroup> 
							<thead>
								<tr>
									<th>번호</th>
									<th>팀이름</th>
									<th>지역</th>
									<th>모집여부</th>
									<th>나의 역할</th>
									<th>팀 생성일</th>
								</tr>
							</thead>
							<tbody>
								<%
								List<TeamDto> teamList = (List<TeamDto>) request.getAttribute("teamList");
								if( !teamList.isEmpty()) {
								for (TeamDto tempDto : teamList) {
								%>
								<tr>
									<td><%=totalCnt - tempDto.getRnum() + 1%></td>
									<td><a href="#none"
											onclick="goView('<%=tempDto.getTeam_key()%>')"><%=tempDto.getTeam_name()%></a></td>
									<td><%=tempDto.getTeam_city()%></td>
									<td><%if(tempDto.getTeam_recruit_yn().equals("1")){ %>모집중<%} else {%>모집마감<%} %></td>
									<td><%if(tempDto.getMembership_role().equals("1")){ %>감독<%} else {%>팀원<%} %></td>
									<td><%=tempDto.getTeam_fdate()%></td>
								</tr>
								<%}} else { %>
								<tr>
									<td colspan="6"><div class="title" >아직 팀을 생성하지 않으셨네요. <a href="${pageContext.request.contextPath}/team/main" class="link"> >> 팀 생성하러 가기 << </a></div></td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
					<%
					for (TeamDto tempDto : teamList) {
					if( tempDto.getMembership_role().equals("1")) { %>
					<hr />
					
					<h3>가입 신청내역</h3>
					<div class="table-wrapper">
						<table>
							<colgroup>
								<col width="5%" />
								<col width="7%" />
								<col width="5%" />
								<col width="*" />
								<col width="15%" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>포지션</th>
									<th>자기소개</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>홍길동</td>
									<td>LW</td>
									<td class="introduction">같이 축구하고 싶습니다..</td>
									<td><a href="" class="button"
										style="line-height: 0; padding: 1rem; height: auto;">수락</a> <a
										href="" class="button"
										style="line-height: 0; padding: 1rem; height: auto;">거절</a></td>
								</tr>
							</tbody>
						</table>
					</div>

					<hr />

					<h3>탈퇴 신청내역</h3>
					<div class="table-wrapper">
						<table>
							<colgroup>
								<col width="5%" />
								<col width="7%" />
								<col width="5%" />
								<col width="*" />
								<col width="15%" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>포지션</th>
									<th>자기소개</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>홍길동</td>
									<td>LW</td>
									<td class="introduction">탈퇴합니다 빠염</td>
									<td><a href="" class="button"
										style="line-height: 0; padding: 1rem; height: auto;">수락</a> <a
										href="" class="button"
										style="line-height: 0; padding: 1rem; height: auto;">거절</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<%} }%>
				</section>
			</article>
			</form>
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
	<script>
	function goView(id) {
		frm = document.myform;
		frm.team_key.value = id;
		frm.method = "get";
		frm.action = "${pageContext.request.contextPath}/team/view";
		frm.submit();
	}
	</script>

</body>
</html>