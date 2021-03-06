<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mom.momhome.member.*"%>
<%@page import="com.mom.momhome.cscenter.*"%>
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

table {
	margin-top: 40px !important;
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
			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>나의 문의 내역(${totalCnt} 건)</h2>
						<p>나의 문의 내역을 보여줍니다.</p>
					</div>
				</header>

				<section>
					<div class="table-wrapper">
						<form name="myform">
						<input type="hidden" name="pg" id="pg" value="<%=pg%>" />
							 <input type="hidden" name="cscenter_key" id="cscenter_key" value="" /> 
							<div class="row gtr-uniform mb-5">
								<div class="col-3 col-6-xsmall">
									<select name="key" id="key">
										<option value="">- 선택하세요 -</option>
										<option value="1">제목</option>
										<option value="2">내용</option>
										<option value="3">제목+내용</option>
									</select>
								</div>
								<div class="col-7 col-12-xsmall">
									<input type="text" class="form-control"
										placeholder="검색어를 입력하세요" name="keyword" id="keyword"
										value="<%=keyword%>">
								</div>
								<div class="col-2 col-4-xsmall">
									<input type="button" style="width: 100%" value="검색"
										onclick="goSearch()" />
								</div>
							</div>
							<table>
								<colgroup>
									<col width="5%" />
									<col width="*" />
									<col width="15%" />
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
								<%
									List<CSCenterDto> list = (List<CSCenterDto>) request.getAttribute("cscenterList");
									if( !list.isEmpty() ) {
									for (CSCenterDto tempDto : list) {
									%>
									<tr>
										<td><%=totalCnt - tempDto.getRnum() + 1%></td>
										<td class="introduction"><a href="#none"
											onclick="goView('<%=tempDto.getCscenter_key()%>')"> <%=tempDto.getCscenter_title()%></a></td>
										<td><%=tempDto.getCscenter_date()%></td>
									</tr>
									<%} } else {%> 
									<tr>
										<td colspan="7"><div class="title" >아직 작성한 글이 없습니다.  <a href="${pageContext.request.contextPath}/cscenter/list" class="link">  >> 글 작성하러 가기 << </a></div></td>
									</tr>
									<%} %>
								</tbody>
							</table>
						</form>
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
		function goSearch() {
			let frm = document.myform;
			frm.pg.value = 0;
			frm.action = "${pageContext.request.contextPath}/member/cscenterlist";
			frm.method = "get";
			frm.submit();
		}
		function goView(id) {
			frm = document.myform;
			frm.cscenter_key.value = id;
			frm.method = "get";
			frm.action = "${pageContext.request.contextPath}/cscenter/detail";
			frm.submit();
		}
	</script>

</body>
</html>