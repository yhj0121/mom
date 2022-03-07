<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

#findInfo a {
	color: #bcbcbc;
}
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper" style="justify-content: center;">

		<!-- Header -->
		<%@include file="../include/nav.jsp"%>

		<div class="column">

			<!-- Intro -->
			<section id="intro">
				<a href="#" class="logo"><img
					src="${pageContext.request.contextPath}/resources/images/logo.jpg"
					alt="" /></a>
				<header>
					<h2>Man of the match</h2>
					<p>쉬운 경기 매칭 서비스 및 팀 관리 서비스를 제공합니다.</p>
				</header>
			</section>

			<!-- Post -->
			<article class="mt-5">
				<header>
					<div class="title">
						<h2>아이디 찾기</h2>
						<p></p>
					</div>
				</header>

				<section>
					<form id="myform" name="myform" >
						<div class="row d-flex flex-row justify-content-between gtr-uniform">
							<div class=" col-12 col-12-xsmall">
								<input type="text" name="user_name" id="username" value="" 
									placeholder="이름" />
							</div>
							<div class=" col-12 col-12-xsmall">
								<input type="password" name="user_phone" id="phone" value=""
									placeholder="전화번호" />
							</div>
							<div class=" col-12 mt-5">
									<ul class="column actions fit d-flex flex-column justify-content-between">
										<li><a href="javascript:void(0)" class="button fit" onclick="findid()" >아이디 찾기</a></li>
										<li><a href="javascript:void(0)" class="button fit" onclick="javascript:history.back()">취소</a></li>
								</ul>
							</div>
						</div>
					</form>
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
		function findid() {
			var frmData = new FormData(document.myform);
			   var queryString = $("form[name=myform]").serialize(); 
			       
			   $.ajax({
			      url:"${commonURL}/member/findid_proc",
			      data:queryString,
			      type:"POST",
			      dataType:"json"
			   })
			   .done( (result)=>{
			      	if(result.result=="fail")
					{
			      		alert("해당하는 아이디를 찾을 수 없습니다.");
					}
			       	else  //패스워드 실패시 3을 보낸다  
			      	{
			       		alert("아이디는 "+result.result+" 입니다.");
			       		location.href="${ commonURL }/member/login";
			      	}
			   })
			   .fail( (error)=>{
			      console.log(error);
			   })
		}
	</script>
</body>
</html>