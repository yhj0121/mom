<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.mom.momhome.cscenter.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mom.momhome.common.*" %>
<html>
	<head>
		<title>Man of the match</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	
	<body class="is-preload"
	style="
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #f4f4f4;
	margin: 50px 0px 50px 0px;
	">
	
		<!-- Wrapper -->
			<div id="wrapper"
			style="
				display:flex; 
				flex-direction: column;
				align-items: center;
				justify-content: center;
				width: 80vw;
				background-color: white;
			">

				<!-- Header -->
				<%@include file="../include/nav.jsp"%>
				
				<!-- Main -->
					<div id="main"
					style="
						display: flex;
						flex-direction: column;
						align-items: center;
						height: 100%;
					">
				<section class="section_csTitle"
				style="
					display: flex;
					justify-content: center;
					width: 100%;
					padding: 50px 0px 50px 0px;
				"><h1>고객센터</h1></section>
				
					
					<!-- Board Table -->
					<%
						String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
						int totalCnt = (Integer) request.getAttribute("totalCnt");
						System.out.println(pg);
						System.out.println(totalCnt);
					%>
					<form name="myForm" style="
						width: 80%;
					">
					<input type="hidden" name="cscenter_key"/>
					<input type="hidden" name="pg" id="pg" value="<%=pg%>"/>
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th scope="col">번호</th>
						      <th scope="col">제목</th>
						      <th scope="col">작성자</th>
						      <th scope="col">작성일</th>
						    </tr>
						  </thead>
						  <tbody>
						    
							<%List<CSCenterDto> list = (List<CSCenterDto>)request.getAttribute("csCenterList"); 
								for(int i = 0; i < list.size(); i++) {
									CSCenterDto csCenterDto = list.get(i);
							%>
						    <tr class="listUnit"  style="cursor: pointer">
						      <td><%=csCenterDto.getCscenter_key()%></td>
						      <td><%=csCenterDto.getCscenter_title()%></td>
						      <td><%=csCenterDto.getUser_name()%></td>
						      <td><%=csCenterDto.getCscenter_date()%></td>
						    </tr>
								<%}%>
						  </tbody>
						</table>
					</form>
						
						<!-- btn Senction -->
						<section class="section_writeBtn" 
						style="
							display: flex;
							width: 80%;
							flex-direction: row-reverse;
						">
							<button type="button" class="btn btn-outline-secondary" 
							style="
							height: 50px;
							border-color: #dddddd;
							padding-right: 6px;
							margin: 10px 0px 10px 0px;
							">문의하기</button>
						</section>
						
					<!-- Pagination  -->
						<div class="container"
							style="
							display: flex; 
							justify-content: center;
							background-color: white;
							">
							<%=Pager.makeTag(request, 10, totalCnt)%>
						</div>
					<!-- /Pagination  -->
			
					</div>
					<!-- Seperate Line -->
					<hr style="width:100%" />
					
						<!-- Footer -->
							<section id="footer" style="
								margin-top: 20px;
							">
								<ul class="icons">
									<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon solid fa-rss"><span class="label">RSS</span></a></li>
									<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
								</ul>
								<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
							</section>
			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
			
			<script>
				const reqBtn = document.querySelector('.btn-outline-secondary');
				const listUnit = document.querySelectorAll('.listUnit');
					
				reqBtn.addEventListener('click', ()=> {
					location.href="http://localhost:8080/momhome/cscenter/write";
				});
				
				for(let i = 0; i < listUnit.length; i++) {
					listUnit[i].addEventListener('click', (e)=> {
						let unitId = e.target.parentNode.childNodes[1].textContent;
// 						console.log(unitId)
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
					console.log(pg);
					frm = document.myForm;
					frm.pg.value = pg;
					frm.method = "get";
					frm.action = "${pageContext.request.contextPath}/cscenter";
					frm.submit();
				}
				
			</script>
	</body>
</html>
