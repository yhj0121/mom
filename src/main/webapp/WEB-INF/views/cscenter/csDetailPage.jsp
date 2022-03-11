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
	">
	
		<!-- Wrapper -->
			<div id="wrapper" 
			style="
				display:flex; 
				flex-direction: column;
				align-items: center;
				justify-content: center;
				width: 80vw;
				height: 90vh;
				background-color: white;
				height: 100%;
				margin: 50px 0px 50px 0px;
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
					
				<!-- section csTitle -->
				<section class="section_csTitle"
				style="
					display: flex;
					justify-content: center;
					width: 100%;
					padding: 50px 0px 50px 0px;
				"><h1>접수내용</h1>
				</section>
				
				<!-- Detail Main Form -->
				<%CSCenterDto csDto = (CSCenterDto)request.getAttribute("csDetail"); %>
				<form style="
			    	margin: 0px 0px 25px 0px;
			    	width: 80%
			    ">
				  <div class="form-group">
				    <label for="exampleFormControlInput1" style="
				    	margin: 0;
				    "><span style="font-size: 1.5rem;">제목</span></label>
				    <input type="email" class="form-control" id="exampleFormControlInput1" readonly style="
				    	background-color: white;
				    	border: 1px solid #dddddd;
					   	border-left: 0;
					   	border-right: 0;
					   	border-radius: 0;
					   	cursor: grab;
					   	color: black;
					   	margin-top: 10px;
				    " value=<%=csDto.getCscenter_title()%>>
				  </div>
				  
				    <div class="form-group">
				    <label for="exampleFormControlInput1" style="
				    	margin: 25px 0px 0px 0px;
				    "><span style="font-size: 1.5rem;">작성자</span></label>
				    <input type="email" class="form-control" id="exampleFormControlInput1" readonly style="
				    	background-color: white;
				    	border: 1px solid #dddddd;
					   	border-left: 0;
					   	border-right: 0;
					   	border-radius: 0;
					   	cursor: grab;
					   	color: black;
					   	margin-top: 10px;
				    " value=<%=csDto.getUser_name()%>>
				  </div>
				  
				    <div class="form-group">
				    <label for="exampleFormControlInput1" style="
				    	margin: 25px 0px 0px 0px;
				    "><span style="font-size: 1.5rem;">작성일</span></label>
				    <input type="email" class="form-control" id="exampleFormControlInput1" readonly style="
				    	background-color: white;
						border: 1px solid #dddddd;
					   	border-left: 0;
					   	border-right: 0;
					   	border-radius: 0;
					   	cursor: grab;
					   	color: black;
					   	margin-top: 10px;
				    " value=<%=csDto.getCscenter_date()%>>
				  </div>
				
				  <div class="form-group">
				    <label for="exampleFormControlTextarea1" style="
				    	margin: 25px 0px 0px 0px;
				    "><span style="font-size: 1.5rem;">내용</span></label>
				    <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" readonly
				    style="
				   	 background-color: white;
				   	 resize: none;
				   	 border: 1px solid #dddddd;
				   	 border-left: 0;
				   	 border-right: 0;
				   	 border-radius: 0;
				   	 cursor: grab;
				   	 color: black;
				   	 margin-top: 10px;
				    "><%=csDto.getCscenter_contents()%></textarea>
				  </div>
				</form>
								
					<!-- btn Senction -->
						<section class="section_writeBtn" 
						style="
						display: flex;
						width: 80%;
						flex-direction: row-reverse;">
							<button type="button" class="btn btn-outline-secondary" 
							style="
							height: 50px;
							border-color: #dddddd;
							padding-right: 6px;
							margin-bottom: 10px;
							">뒤로가기</button>
						</section>
					</div>
					
					<!-- Seperate Line -->
					<div style="width: 100%">
						<hr style="
							width: 100%;
							margin-top: 30px;
						" />
					</div>
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
				const backBtn = document.querySelector('.btn-outline-secondary');
				console.log(backBtn)
				backBtn.addEventListener('click', () => {
					location.href='${commonURL}/cscenter';
				})
			</script>
	</body>
</html>