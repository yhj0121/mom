<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mom.momhome.gamejoin.*"%>
<%@page import="com.mom.momhome.common.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>매칭 완료 게시판</title>
</head>
<style>
img {
	display: block;
	margin: auto;
}

a.link{
	margin-left: 20px; 
	font-size: .9rem;
	color: rgb(46, 174, 173);
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
<body class="is-preload">
	<div id="wrapper">
		<%@include file="../include/nav.jsp"%>

		<%
		String key = StringUtil.nullToValue(request.getParameter("key"), "");
		String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
		String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
		String filter = StringUtil.nullToValue(request.getParameter("filter"), "");
		int totalCnt = (Integer) request.getAttribute("totalCnt");
		%>
		
		<div id="main">
			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">매칭 완료 게시판</a>
						</h2>
						<p>매칭이 성사된 경기를 보여줍니다.</p>
					</div>
					<div class="meta">
						<a href="#" class="logo"><img
							src="${pageContext.request.contextPath}/resources/images/icon_soccerball.png"
							alt="" /></a>
					</div>
				</header>

				<section>
					<form name="myform">
						<input type="hidden" name="pg" id="pg" value="<%=pg%>" /> 
						<%-- <input type="text" name="user_key" id="user_key" value="${user_key}" />  --%>
						<!-- <input type="hidden" name="mercenary_key" id="mercenary_key" value="" /> -->

						<div class="table-wrapper">
							<table>
								<colgroup>
									<col width="8%">
									<col width="*">
									<col width="15%">
									<col width="15%">
								</colgroup>
								<thead class="table-secondary">
									<tr>
										<th>번호</th>
										<th>홈팀 vs. 어웨이팀</th>
										<th>게임일자</th>
										<th>게임장소</th>
									</tr>
								</thead>
								<tbody>
									<%
									List<GameJoinDto> matchList = (List<GameJoinDto>) request.getAttribute("matchList");
									System.out.println(totalCnt);
									if( !matchList.isEmpty() ) {
										for (GameJoinDto tempDto : matchList) {
										%>
										<tr>
											<td><%=tempDto.getRnum()%></td>
											<td><%=tempDto.getHome_team_name() %> vs <%=tempDto.getTeam_name() %></td>
												<td><%=tempDto.getGame_fdate() %></td>
												<td><%=tempDto.getGame_location() %></td>
										</tr>
									<%}}else{%>
										<tr>
											<td colspan="5">
												<div class="title" style="text-align:center;" >아직 신청한 내역이 없습니다. <br/>
												<a href="${pageContext.request.contextPath}/mercenary/list" class="link"> 용병 신청하러 가기 </a>
												</div>
											</td>
										</tr>
									<%} %>
								</tbody>
							</table>

							
						</div>
					</form>
				</section>
			</article>
			<%-- <!-- Pagination  -->
			<div class="container"
				style="display: flex; justify-content: center;">
				<%=Pager.makeTag(request, 10, totalCnt)%>
			</div> --%>
			<!-- Footer -->
			<%@include file="../include/footer.jsp"%>
		</div>
	</div>
</body>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

