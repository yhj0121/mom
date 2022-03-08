<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	">
	
		<!-- Wrapper -->
			<div id="wrapper"
			style="
				display:flex; 
				flex-direction: column;
				align-items: center;
				justify-content: center;
				width: 80vw;
				height: 80vh;
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
						<table class="table table-hover">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">제목</th>
						      <th scope="col">작성자</th>
						      <th scope="col">작성일</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr  style="cursor: pointer">
						      <th scope="row">1</th>
						      <td>Mark</td>
						      <td>Otto</td>
						      <td>@mdo</td>
						    </tr>
						    <tr  style="cursor: pointer">
						      <th scope="row">2</th>
						      <td>Jacob</td>
						      <td>Thornton</td>
						      <td>@fat</td>
						    </tr>
						    <tr  style="cursor: pointer">
						      <th scope="row">3</th>
						      <td colspan="2">Larry the Bird</td>
						      <td>@twitter</td>
						    </tr>
						  </tbody>
						</table>
						
						<!-- btn Senction -->
						<section class="section_writeBtn" 
						style="
						display: flex;
						width: 100%;
						flex-direction: row-reverse;">
							<button type="button" class="btn btn-outline-secondary" 
							style="
							height: 50px;
							border-color: #dddddd;
							padding-right: 6px;
							margin: 10px 0px 10px 0px;
							">문의하기</button>
						</section>
						
					<!-- Pagination -->
						<nav aria-label="...">
						  <ul class="pagination" style="margin-top:16">
						    <li class="page-item disabled">
						      <a class="page-link">Previous</a>
						    </li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item active" aria-current="page">
						      <a class="page-link" href="#">2</a>
						    </li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item">
						      <a class="page-link" href="#">Next</a>
						    </li>
						  </ul>
						</nav>
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
			<script src="${pageContext.request.contextPath}/resources/assets/js/csCenterPage.js"></script>
	</body>
</html>
