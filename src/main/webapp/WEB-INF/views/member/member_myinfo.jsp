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
		<%
		MemberDto mdto = (MemberDto)request.getAttribute("memberDto");
		%>
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
						<h2>회원가입</h2>
						<p>다양한 서비스 이용을 위해 하단 회원가입 양식을 작성해서 제출해주세요.</p>
					</div>
				</header>

				<section>
					<form id="myform" name="myform" method="post" action="#">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-medium">
								이름 <input type="text" name="user_name" id="username" value="<%=mdto.getUser_name()%>"
									 value="" />
							</div>
							<div class="col-6 col-12-medium" >
								아이디 <input type="text" name="user_id" id="userid"  readonly value="<%=mdto.getUser_id()%>"
									value=""  />
							</div>
							<div class="col-6 col-12-medium">
								이메일 <input type="email" name="user_mail" id="email" value="<%=mdto.getUser_mail()%>"
									value=""  />
							</div>
							<div class="col-6 col-12-medium">
								전화번호 <input type="text" name="user_phone" id="phone" value="<%=mdto.getUser_phone()%>"
									value="" />
							</div>
							<div class="col-6 col-12-medium">
								주소 <input type="text" name="user_address1" id="address1" value="<%=mdto.getUser_address1()%>"
									value="" />
							</div>
							<div class="col-6 col-12-medium">
								상세주소 <input type="text" name="user_address2" id="address2" value="<%=mdto.getUser_address2()%>"
									value=""  />
							</div>
							<div class="col-12">
								<select id="positionList" name="user_position">
									<option id="opt1" value="NN">원하는 포지션을 선택해주세요.</option>
								</select>
							</div>
							<div class="col-12">
								자기소개 <textarea name="user_intro" id="intro"  rows="6"><%=mdto.getUser_intro()%></textarea>
							</div>
							<div class="col-12">
								<ul class="actions">
									<li><input type="button" id="goModSignup" value="회원정보 수정" /></li>
									<li><input type="reset" onclick="javascript:history.back()"
										value="취소" /></li>
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
	$(()=>{
		getPositionList();
	});
	
	$("#goModSignup").click(function(){
		// input이 비어있는지 확인
		if( $("#username").val() == "" ) {
			alert("이름을 입력해주세요.");
			 $("#username").focus();
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
		//회원가입 진행 
		 var frmData = new FormData(document.myform);
		$.ajax({
			url: "${commonURL}/member/update",
			data: frmData,
			contentType: false,
			processData: false,
			type: "POST"
		})
		.done( (result) => {
			alert("회원정보 수정완료");
			location.href="${ commonURL }/member/mypage"; 
		})
		.fail( (error) => {
			alert("회원정보 수정 실패, 다시 시도해주세요.");
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
	</script>

</body>
</html>