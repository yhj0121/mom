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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
				"><h1>문의사항</h1></section>
				
				<!-- Input Form -->
				<form name="writeForm">
					<input type="hidden" name="user_key" value="<%=user_key%>"/>
					<div class="mb-3" style="
					width: 80%;
					margin: 20px 0px 20px 0px;
					">
					  <label for="exampleFormControlInput1" class="form-label">제목</label>
					  <input type="email" name="cscenter_title" class="form-control" id="exampleFormControlInput1" placeholder="" style="
					  border-radius: 4px;
					  background-color: white;
					  ">
					</div>
					<div class="mb-3" style="
					width: 80%;
					height: 50%;
					margin: 20px 0px 20px 0px;
					">
					  <label for="exampleFormControlTextarea1" class="form-label">문의 내용</label>
					  <textarea class="form-control" name="cscenter_contents" id="exampleFormControlTextarea1" rows="3" style="
					  height: 80%;
					  resize: none;
					  "></textarea>
					</div>
				</form>
								
					<!-- btn Senction -->
						<section class="section_writeBtn" 
						style="
						display: flex;
						width: 80%;
						flex-direction: row-reverse;">
							<button type="button" onClick="goWrite()" class="btn btn-outline-secondary" 
							style="
							height: 50px;
							border-color: #dddddd;
							padding-right: 6px;
							margin-bottom: 9px;
							">접수하기</button>
						</section>
					
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
			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	</body>
<script>
function goWrite()
{
	let userKey='<%=user_key%>';
	if(userKey === "") {
		alert('로그인이 필요합니다.');
		return;
	}
	var frmData = document.writeForm; // form name
	var queryString = $("form[name=writeForm]").serialize();
	if(frmData.cscenter_title.value.trim().length < 10)
	{
		alert("제목을 10글자 이상 작성하시오");
		frmData.cscenter_title.focus();
		return false;
	}
	
	if(frmData.cscenter_contents.value.trim().length<10)
	{
		alert("내용을 10글자 이상 작성하시오");
		frmData.cscenter_contents.focus();
		return false;
	} 
	$.ajax({
		url:"<%=request.getContextPath()%>/cscenter/write/save",
		data:queryString,
		type:"POST"
	})
	.done((result)=>{
		console.log(result);
		alert("정상적으로 접수 되었습니다.");
		<%-- alert('<%=request.getAttribute("msg")%>'); --%>
	})
	.fail((error)=>{
		console.log(error);
	})
}
</script>
</html>