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
				<header style="margin-bottom: 150px;">
					<h2>Man of the match</h2>
					<p>쉬운 경기 매칭 서비스 및 팀 관리 서비스를 제공합니다.</p>
				</header>
			</section>

			<!-- Post -->
			<article class="mt-5" style="margin-bottom: 200px;">
				<form name="myform">
				<input type="hidden" name="user_key" id="user_key"  value="${userkey}"  />
					<header>
						<div class="title">
							<h2 style="text-align: center;">회원 탈퇴</h2>
							<p></p>
						</div>
					</header>

					<section>
						<div
							class="row d-flex flex-row justify-content-between gtr-uniform">
							<div class=" col-12 mt-5">
								<ul class="actions stacked ">
									<li><a href="javascript:void(0)"
										class="button fit" onclick="userDelete()">회원 탈퇴</a></li>
									<li><a href="${commonURL}/member/login" class="button fit">취소</a></li>
								</ul>
							</div>
						</div>
					</section>
				</form>
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
		function userDelete() {
			var delConfirm = confirm("정말로 탈퇴하시겠습니까? 지금까지 사용했던 모든 데이터는 사라집니다.");
			if (delConfirm) {
				$.ajax({
					url: "${ commonURL }/member/delete_proc",
					data:{ user_key: $("#user_key").val()},
					dataType: "json",
					type: "POST"
				})
				.done( (data)=>{
					console.log(data);
					alert("그동안 이용해주셔서 감사합니다. 탈퇴가 완료되었습니다.");
					location.href="${ commonURL }/member/logout";
				})
				.fail( (error) => {
					alert("회원 탈퇴 실패, 관리자에게 문의해주세요.");
				})
			}
		}
	</script>
</body>
</html>