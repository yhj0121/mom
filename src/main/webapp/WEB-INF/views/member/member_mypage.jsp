<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mom.momhome.member.*"%>
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
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<%@include file="../include/nav.jsp"%>



		<!-- Main -->
		<div id="main">

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
			<article class="post">
				<header>
					<div class="title">
						<h2>My Page</h2>
						<p>내 정보 수정이나 팀 신청 내역, 경기 매칭 내역 등을 확인할 수 있습니다.</p>
					</div>
				</header>

				<!-- Posts List -->
				<section>
					<ul class="posts">
						<li>
							<article>
								<header>
									<h3>
										<a href="${ commonURL }/member/myinfo">내 정보 수정</a>
									</h3>
									<p class="published">내 정보를 수정합니다. </p>
								</header>
								<a href="${ commonURL }/member/myinfo" class="image"><img
									src="${pageContext.request.contextPath}/resources/images/icon_account.png"
									alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="${ commonURL }/member/teamdetail">팀 가입/탈퇴 신청 내역</a>
									</h3>
									<p class="published">팀에 가입 신청을 한 내역을 확인합니다.</p>
								</header>
								<a href="${ commonURL }/member/teamdetail" class="image"><img
									src="${pageContext.request.contextPath}/resources/images/icon_list.png"
									alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="${pageContext.request.contextPath}/member/matchinglist">매칭 신청 내역</a>
									</h3>
									<p class="published">우리 팀과 경기를 원하는 신청 내역을 확인합니다.</p>
								</header>
								<a href="${pageContext.request.contextPath}/member/matchinglist" class="image"><img
									src="${pageContext.request.contextPath}/resources/images/icon_calendar.png"
									alt="" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html">미정</a>
									</h3>
									<p class="published">미정</p>
								</header>
								<a href="single.html" class="image"><img
									src="${pageContext.request.contextPath}/resources/images/icon_list.png"
									alt="" /></a>
							</article>
						</li>
					</ul>
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
	$(()=>{
		getPositionList();
		
		$("#btnDuplicate").click(function(){
			$.ajax({
				url: "${ commonURL }/member/isDuplicate",
				data:{ user_id: $("#userid").val()},
				dataType: "json",
				type: "POST"
			})
			.done( (data)=>{
				console.log(data);
				if( data.result == "true" ) {
					alert("이미 사용중인 아이디입니다.");
				} else {
					alert("사용 가능한 아이디입니다.");
					$("#idcheck").val("Y");
					$("#userid").prop("readonly", true); //사용중인 아이디라고 판명되면 읽기전용으로 입력창이 막힘 
				}
			})
			.fail( (error) => {
				console.log(error);
			})
		});
	});
	
	$("#goSignup").click(function(){
		// input이 비어있는지 확인
		if( $("#username").val() == "" ) {
			alert("이름을 입력해주세요.");
			 $("#username").focus();
			 return;
		} else if( $("#password").val() == "" ) {
			alert("비밀번호를 입력해주세요.");
			 $("#password").focus();
			 return;
		} else if( $("#userid").val() == "") {
			alert("아이디를 입력해주세요.");
			 $("#userid").focus();
			 return;
		} else if( $("#email").val() == "" ) {
			alert("이메일을 입력해주세요.");
			 $("#email").focus();
			 return;
		} else if( $("#address1").val() == "" ) {
			alert("주소를 입력해주세요.");
			 $("#address1").focus();
			 return;
		} else if( $("#phone").val() == "" ) {
			alert("전화번호를 입력해주세요.");
			 $("#phone").focus();
			 return;
		}
		
		//비밀번호 확인 
		if( $("#password").val() != $("#checkPassword").val() ) {
			alert("비밀번호가 일치하지 않습니다.");
			 return;
		}
		
		//회원가입 진행 
		 var frmData = new FormData(document.myform);
		$.ajax({
			url: "${commonURL}/member/insert",
			data: frmData,
			contentType: false,
			processData: false,
			type: "POST"
		})
		.done( (result) => {
			location.href="${ commonURL }/login"; //로그인 페이지로 이동 
		})
		.fail( (error) => {
			alert("회원가입 실패, 다시 시도해주세요.");
		});
	});

	//포지션 리스트 db에서 받아오기
	function getPositionList(){
		$.ajax({
			url: "${commonURL}/member/selectPosition",
			contentType: false,
			processData: false,
			type: "POST"
		})
		.done( (result) => {
			var i=1;
		
		  result.forEach( (item)=>{
		    	var data = "<option "+"value='"+item.position+"'>";
		    	    data +=  item.position ;
		    	    data += "</option>";
		    	i++;
		      	$("#opt1").after(data);
		})
		})
		.fail( (error) => {
			alert("정보 가져오기 실패");
		})
	}
	
	//리셋 버튼
	function formReset(){
		$("#myform")[0].reset();
	}
	</script>

</body>
</html>