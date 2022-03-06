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

table th {
	text-align: center !important;
}

table td {
	padding: .4rem .75em;
	text-align: center;
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
			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>용병 구인 내역</h2>
						<p>용병 구인 내역을 보여줍니다.</p>
					</div>
				</header>

				<section>
					<h3>용병 구인 내역</h3>
					<div class="table-wrapper">
						<table>
							<colgroup>
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>상대 팀 이름</th>
									<th>경기 장소</th>
									<th>경기 시간</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>길동이네</td>
									<td>석촌초등학교</td>
									<td>2023년 3월 1일 10시</td>
									<td><a href="" class="button"
										style="line-height: 0; padding: 1rem; height: auto;">수락</a> <a
										href="" class="button"
										style="line-height: 0; padding: 1rem; height: auto;">거절</a></td>
								</tr>
							</tbody>
						</table>
					</div>
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