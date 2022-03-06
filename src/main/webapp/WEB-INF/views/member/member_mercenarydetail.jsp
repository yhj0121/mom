<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mom.momhome.member.*"%>
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
			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>용병 구인 내역(${totalCnt} 건)</h2>
						<p>용병 구인 내역을 보여줍니다.</p>
					</div>
				</header>

				<section>
					<div class="table-wrapper">
						<table>
							<colgroup>
								<col width="5%" />
								<col width="5%" />
								<col width="*" />
								<col width="15%" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>상태</th>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<%
								List<MercenaryDto> list = (List<MercenaryDto>) request.getAttribute("mercenaryList");
								for (MercenaryDto tempDto : list) {
								%>
								<tr>
									<td><%=totalCnt - tempDto.getRnum() + 1%></td>
										<td><%=tempDto.getMercenary_complete()%></td>
										<td class="introduction"><a href="#none"
											onclick="goView('<%=tempDto.getMercenary_key()%>')"><%=tempDto.getMercenary_title()%></a></td>
										<td><%=tempDto.getReg_date()%></td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
			<!-- Pagination  -->
			<div class="container"
				style="display: flex; justify-content: center;">
				<%=Pager.makeTag(request, 10, totalCnt)%>
			</div>
			<!-- /Pagination  -->
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
	<script>
	function goView(id) {
		frm = document.myform;
		frm.mercenary_key.value = id;
		frm.method = "get";
		frm.action = "${pageContext.request.contextPath}/mercenary/view";
		frm.submit();
	}
	</script>

</body>
</html>