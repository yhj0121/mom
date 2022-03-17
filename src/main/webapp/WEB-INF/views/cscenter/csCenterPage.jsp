<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.mom.momhome.cscenter.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mom.momhome.common.*"%>
<html>
<head>
<title>Man of the match</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<style>
img {
	display: block;
	margin: auto;
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
		<%@include file="../include/nav.jsp"%>

<%%>
		<%
		String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
		int totalCnt = (Integer) request.getAttribute("totalCnt");
		%>

		<!-- Main -->
		<div id="main">
			<article class="post">

				<header>
					<div class="title">
						<h2>
							<a href="#">고객센터(${totalCnt}건)</a>
						</h2>
						<p>사이트 이용시 궁금한 점을 문의할 수 있습니다.</p>
					</div>
					<div class="meta">
						<a href="#" class="logo"><img
							src="${pageContext.request.contextPath}/resources/images/icon_customerservice.png"
							alt="" /></a>
					</div>
				</header>

				<!-- Board Table -->
				<form name="myForm">
					<input type="hidden" name="cscenter_key" /> <input type="hidden"
						name="pg" id="pg" value="<%=pg%>" />

					<div class="table-wrapper">
						<table class="table table-hover">
						 <colgroup>
								<col width="12%" />
								<col width="*" />
								<col width="12%" />
								<col width="17%" />
								<col width="10%" />
							</colgroup> 
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">작성일</th>
									<th scope="col">답변여부</th>
								</tr>
							</thead>
							<tbody>

								<%
								List<CSCenterDto> list = (List<CSCenterDto>) request.getAttribute("csCenterList");
								if(!list.isEmpty()) {
								for (int i = 0; i < list.size(); i++) {
									CSCenterDto csCenterDto = list.get(i);
								%>
								<tr class="listUnit" style="cursor: pointer">
									<td><%=csCenterDto.getCscenter_key()%></td>
									<td><%=csCenterDto.getCscenter_title()%></td>
									<td><%=csCenterDto.getUser_name()%></td>
									<td><%=csCenterDto.getCscenter_date()%></td>
									<td><%if(csCenterDto.getAnswered() == 1) { %>
										답변완료
									<%} else {%>
									답변중</td>
								</tr>
								<%}}} else {%>
								<tr>
									<td colspan="7"><div class="title" >아직 작성된 글이 없습니다. <a href="${pageContext.request.contextPath}/cscenter/write" class="link"> >> 문의하러 가기 << </a></div></td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
				</form>

				<div class="col-12" style="text-align: right;">
					<ul class="actions">
						<li style="margin-left: auto"><input type="button"
							value="문의하기" class="goWritePage" /></li>
					</ul>
				</div>
				<!-- Pagination  -->
				<div class="container"
					style="display: flex; justify-content: center; background-color: white;">
					<%=Pager.makeTag(request, 10, totalCnt)%>
				</div>
				<!-- /Pagination  -->
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
				const reqBtn = document.querySelector('.goWritePage');
				const listUnit = document.querySelectorAll('.listUnit');
				
				reqBtn.addEventListener('click', ()=> {
					location.href="http://localhost:8080/momhome/cscenter/write";
				});
				
				for(let i = 0; i < listUnit.length; i++) {
					listUnit[i].addEventListener('click', (e)=> {
						let unitId = e.target.parentNode.childNodes[1].textContent;
						goView(unitId);
					});
				}

				function goView(unitId) 
				{
					frm = document.myForm;
					frm.cscenter_key.value = unitId;
					frm.method = "get";
					frm.action = "${pageContext.request.contextPath}/cscenter/detail";
					frm.submit();
				}
				
				function goPage(pg) 
				{
					frm = document.myForm;
					frm.pg.value = pg;
					frm.method = "get";
					frm.action = "${pageContext.request.contextPath}/cscenter";
					frm.submit();
				}
				
			</script>
</body>
</html>
