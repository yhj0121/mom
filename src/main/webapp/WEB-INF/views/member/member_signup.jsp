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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
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
				<a href="#" class="logo"><img src="${pageContext.request.contextPath}/resources/images/logo.jpg"
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
						<h2>회원가입</h2>
						<p>다양한 서비스 이용을 위해 하단 회원가입 양식을 작성해서 제출해주세요.</p>
					</div>
				</header>

				<section>
					<form id="myform" name="myform" method="post" action="#">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-medium">
								<input type="text" name="user_name" id="username" value=""
									placeholder="이름" />
							</div>
							<div class="col-6 col-12-medium" style="display: flex;">
								<input type="text" name="user_id" id="userid" value="" 
									placeholder="아이디" />
								<button class="btn btn-success" type="button" id="btnDuplicate">중복체크</button>
							</div>
							<div class="col-6 col-12-medium">
								<input type="password" name="user_password" id="password" value=""
									placeholder="비밀번호" />
							</div>
							<div class="col-6 col-12-medium">
								<input type="password" name="checkPassword" id="checkPassword"
									value="" placeholder="비밀번호 확인" />
							</div>
							<div class="col-6 col-12-medium">
								<input type="email" name="user_mail" id="email" value=""
									placeholder="이메일" />
							</div>
							<div class="col-6 col-12-medium">
								<input type="text" name="user_phone" id="phone" value=""
									placeholder="전화번호" />
							</div>
							<div class="col-6 col-12-medium">
								<input type="text" name="user_address1" id="address1" value=""
									placeholder="주소" />
							</div>
							<div class="col-6 col-12-medium">
								<input type="text" name="user_address2" id="address2" value=""
									placeholder="상세주소" />
							</div>
							<div class="col-12">
								<select id="positionList" name="user_position">
									<option id="opt1" value="NN">원하는 포지션을 선택해주세요.</option>
								</select>
							</div>
							<div class="col-12">
								<textarea name="user_intro" id="intro" placeholder="자기소개를 해주세요."
									rows="6"></textarea>
							</div>
							<div class="col-12">
								<ul class="actions">
									<li><input type="button" id="goSignup" value="회원가입 완료" /></li>
									<li><input type="reset" onclick="formReset()" value="다시 작성하기" /></li>
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
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
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
			location.href="${ commonURL }/member/login"; //로그인 페이지로 이동 
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