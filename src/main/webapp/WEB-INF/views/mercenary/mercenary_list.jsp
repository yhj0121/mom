<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mom.momhome.mercenary.*"%>
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
</style>
<body class="is-preload">
	<div id="wrapper">
		<%@include file="../include/nav.jsp"%>

		<%
		String key = StringUtil.nullToValue(request.getParameter("key"), "");
		String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
		String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
		int totalCnt = (Integer) request.getAttribute("totalCnt");
		%>
		<div id="main">
			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">용병 구인 게시판</a>
						</h2>
						<p>감독 권한으로 올린 용병 구인 게시글을 확인하는 페이지</p>
					</div>
					<div class="meta">
						<a href="#" class="logo"><img
							src="${pageContext.request.contextPath}/resources/images/icon_mercenary.png"
							alt="" /></a>
					</div>
				</header>

				<section>
					<h3 style="text-align: center">용병구인리스트 (${totalCnt}건)</h3>
					<form name="myform">
						<%-- <input type="hidden" name="user_key" id="user_key" value="<%=user_key%>"/> --%>
						<input type="hidden" name="pg" id="pg" value="<%=pg%>" /> <input
							type="hidden" name="mercenary_key" id="mercenary_key" value="" />

						<div class="row gtr-uniform">
							<div class="col-3 col-6-xsmall">
								<select name="key" id="key">
									<option value="">- 선택하세요 -</option>
									<option value="1">제목</option>
									<option value="2">내용</option>
									<option value="3">제목+내용</option>
								</select>
							</div>
							<div class="col-7 col-12-xsmall">
								<input type="text" class="form-control" placeholder="검색어를 입력하세요"
									name="keyword" id="keyword" value="<%=keyword%>">
							</div>
							<div class="col-2 col-4-xsmall">
								<input type="button" style="width: 100%" value="검색"
									onclick="goSearch()" />
							</div>
						</div>
						<div class="table-wrapper">
							<table>
								<colgroup>
									<col width="8%">
									<col width="8%">
									<col width="*">
									<col width="12%">
									<col width="12%">
								</colgroup>
								<thead class="table-secondary">
									<tr>
										<th>번호</th>
										<th>상태</th>
										<th>제목</th>
										<th>작성자</th>
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
										<td><a href="#none"
											onclick="goView('<%=tempDto.getMercenary_key()%>')"><%=tempDto.getMercenary_title()%></a></td>
										<td><%=tempDto.getUser_name()%></td>
										<td><%=tempDto.getReg_date()%></td>
									</tr>
									<%}%>
								</tbody>
							</table>

							<div class="col-12" style="text-align: right;">
								<ul class="actions">
									<li style="margin-left: auto"><input type="button"
										value="글쓰기" onclick="goWrite()" /></li>
								</ul>
							</div>
						</div>
					</form>
				</section>
			</article>
			<!-- Pagination  -->
			<div class="container"
				style="display: flex; justify-content: center;">
				<%=Pager.makeTag(request, 10, totalCnt)%>
			</div>
			<!-- /Pagination  -->
		</div>
	</div>
</body>
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
function goSearch(){
   let frm = document.myform;
   frm.pg.value=0; 
   frm.action = "<%=request.getContextPath()%>
	/mercenary/list";
		frm.method = "get";
		frm.submit();
	}

	function goPage(pg) {
		frm = document.myform;
		frm.pg.value = pg;
		frm.method = "get";
		frm.action = "${pageContext.request.contextPath}/mercenary/list";
		frm.submit();
	}
	function goView(id) {
		frm = document.myform;
		frm.mercenary_key.value = id;
		frm.method = "get";
		frm.action = "${pageContext.request.contextPath}/mercenary/view";
		frm.submit();
	}
	function goWrite() {
		var frm = document.myform;
		frm.action = "${pageContext.request.contextPath}/mercenary/write";
		frm.submit();
	}
</script>