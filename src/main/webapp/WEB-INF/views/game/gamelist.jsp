<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mom.momhome.game.*"%>
<%@page import="com.mom.momhome.common.*"%>
<%@page import="com.mom.momhome.team.*"%>

<!DOCTYPE html>
<html>
<head>
<title>게임 매칭 테이블</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../resources/assets/css/main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

</head>

<style>

a.link{
	margin-left: 20px; 
	font-size: .9rem;
	color: rgb(46, 174, 173);
}

.pagination {
	list-style: none;
	margin: 0;
	padding: 0;
	display: block;
	justify-content: center;
	margin: auto;
	text-align: center;
}

.page-item {
	margin: auto;
	padding: 10px;
	border: 0;
	display: inline-block;
}

.btn {
	display: block;
	width: 80px;
	line-height: 30px;
	background-color: #222;
	color: #fff;
}
table {
	margin-top: 40px !important;
}

table th {
	text-align: center !important;
}

table td:not(.introduction) {
	text-align: center;
}
</style>
<body class="is-preload">
	<div id="wrapper">
		<%@include file="../include/nav.jsp"%>

		<%
		String key = StringUtil.nullToValue(request.getParameter("key"), "1");
		String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
		String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
		int totalCnt = (Integer) request.getAttribute("totalCnt");
		%>
		<div id="main">
			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">게임 매칭 게시판</a>
						</h2>
						<p>감독님만 게임 매칭을 만들수 있어요</p>
					</div>
					<div class="meta">
						<a href="#" class="logo"><i class="fas fa-futbol fa-8x"
							style="display: flex; justify-content: center;"></i></a>
					</div>
				</header>

				<section>
					<h3 style="text-align: center">게임매칭게시판 (${totalCnt}건)</h3>
					<form name="myform" method="get">
						<input type="hidden" name="team_key" id="team_key" value="" /> <input
							type="hidden" name="pg" id="pg" value="<%=pg%>" /> <input
							type="hidden" name="key" id="key" value="<%=key%>" /> 
							<input type="hidden" name="game_key" id="game_key" value="" />
				   			<input type="hidden" name="user_key" id="user_key" value="${userkey}" />
							

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
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>매칭 장소</th>
										<th>날짜</th>
										<th>팀이름</th>
										<th>모집</th>

									</tr>
								</thead>
								<tbody>
									<%
									List<GameDto> list = (List<GameDto>) request.getAttribute("boardList");
									if( !list.isEmpty() ) {
									for (GameDto tempDto : list) {
										
									%>
									<tr>
										<td><%=totalCnt - tempDto.getRnum() + 1%></td>
										<td><a href="#none"
											onclick="goView('<%=tempDto.getGame_key()%>','<%=tempDto.getTeam_key()%>')"><%=tempDto.getGame_title()%></a></td>
										<td><%=tempDto.getGame_location()%></td>
										<td><%=tempDto.getGame_date()%></td>
										<td><%=tempDto.getTeam_name()%></td>
										<%
										if(tempDto.getGame_complete().equals("0")){%>
										<td>모집중</td>
										<%}else{%>
											<td>모집 완료</td>
										<%}%>
									</tr>
									<%}%>
										<%} else {%>
											<tr>
												<td colspan="6"><div class="title" >아직 작성한 글이 없습니다.  <a href="${pageContext.request.contextPath}/cscenter/list" class="link">  >> 글 작성하러 가기 << </a></div></td>
											</tr>
										<%} %>
									


								</tbody>
							</table>
						</div>

							<div class="col-12" style="text-align: right;">
								<ul class="actions">
									<li style="margin-left: auto"><input type="button"
										value="글쓰기" onclick="goWrite()"/></li>
								</ul>
							</div>

					</form>
				</section>
			</article>

			<!-- Pagination  -->
			<div class="container"
				style="display: flex; justify-content: center;">
				<%=Pager.makeTag(request, 10, totalCnt)%>
			</div>
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
		   frm.action = "<%=request.getContextPath()%>/game/list";
		   frm.method = "get";
		   frm.submit();
		}

	function goPage(pg) {
		frm = document.myform;
		frm.pg.value = pg;
		frm.method = "get";
		frm.action = "${pageContext.request.contextPath}/game/list";
		frm.submit();
	}
	function goView(gamekey,teamkey) {
		frm = document.myform;
		frm.game_key.value = gamekey;
		frm.team_key.value = teamkey;
		frm.method = "get";
		frm.action = "${pageContext.request.contextPath}/game/view";
		frm.submit();
	}
	function goWrite() {
		var frm = document.myform;
		frm.action = "${pageContext.request.contextPath}/game/write";
		frm.submit();
	}
</script>
</html>
