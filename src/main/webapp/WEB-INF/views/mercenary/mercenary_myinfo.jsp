<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mom.momhome.mercenaryjoin.*"%>
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
<title>용병 구인 게시판</title>
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
							<a href="#">용병 신청 내역</a>
						</h2>
						<p>내가 용병으로 지원한 내역에 대한 승인/거절 결과 확인 페이지</p>
					</div>
					<div class="meta">
						<a href="#" class="logo"><img
							src="${pageContext.request.contextPath}/resources/images/icon_mercenary.png"
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
									<col width="10%">
									<col width="10%">
									<col width="12%">
								</colgroup>
								<thead class="table-secondary">
									<tr>
										<th>번호</th>
										<th>게임일자</th>
										<th>신청상태</th>
										<th>신청일자</th>
									</tr>
								</thead>
								<tbody>
									<%
									List<MercenaryjoinDto> list = (List<MercenaryjoinDto>) request.getAttribute("mercenaryMyList");
									if( !list.isEmpty() ) {
										for (MercenaryjoinDto tempDto : list) {
										%>
										<tr>
											<td><%=tempDto.getRnum()%></td>
											<td><%=tempDto.getGame_fdate() %></td>
											<%
											if(tempDto.getMercenary_proc().equals("1")){%>
												<td>승인대기중</td>
											<%}else if(tempDto.getMercenary_proc().equals("2")) {%>
												<td>승인됨</td>
											<%}else{ %>
												<td>거절됨</td>
											<%}%>
											<td><%=(tempDto.getApp_date()).substring(0,10)%></td>
										</tr>
										<%} %>
								
									<%}else{%>
										<tr>
											<td colspan="4">
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

