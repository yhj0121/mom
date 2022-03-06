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
						<h2><img src="${pageContext.request.contextPath}/resources/images/note.jpg"width="100" height="100">팀 작성 하기</h2>
						<h4>빈 칸에 알맞게 작성해주세요.</h4>
						<h4>모든 입력 정보는 *필수 입력* 사항입니다.</h4>
					</div>
				</header>

				<section>
					<form id="myform" name="myform" method="post" action="#">
						<legend>기본정보입력</legend><br>
						<div class="row gtr-uniform">
							<div class="col-6 col-12-medium">
							<p>  
			                    <label>팀 이름
			                    <div>
				                    <input type="text" id="tname" name="team_name" placeholder="팀 이름을 입력해주세요"><br>
				                    <button class="btn btn-success" type="button" id="btnTeamDuplicate">팀 이름 중복체크</button></input>
			                    </div>
			                    </label>
			                </p>
			                <br>
			                <p>  
			                    <label>팀 앰블럼
			                    <div>
									<input type="file" name="team_emblem" id="emblem" value=""/>
								</div>
								</label>
			                </p>
			                <br>
			                 <p>  
			                    <label>팀 인원
			                    <div>
									<input type="text" name="team_num" id="tnum" value="" placeholder="몇 명 인지 숫자입력"/>
								</div>
								</label>
			                </p>
			                <br>	
							</div>
							
							<div class="col-6 col-12-medium">
							<p>  
			                    <label>팀 창설 날짜
			                    <div>
									<input type="date" name="team_fdate" id="fdate" value=""/>
								</div>
								</label>
			                </p>
			                <br><br><br><br>
			                <p>  
			                    <label>지역 선택
			                    <div>
									<select id="cityList" name="team_city">
				                        <option id="cityoption" value="">원하는 지역을 선택하세요</option>
				                    </select>
								</div>
								</label>
			                </p>
			                <br>
			                <p>  
			                    <label>팀 회비(월)
			                    <div>
									<input type="text" name="team_fee" id="tfee" value="" placeholder="월 회비 금액 숫자입력(원)"/>
								</div>
								</label>
			                </p>
			                <br>
							</div>
							</div>
							<br>
							<legend>상세정보입력</legend><br>
							
							<div class="row gtr-uniform">
							<div class="col-6 col-12-medium">
							<p>  
			                    <label>팀 소개
			                    <div>
									<textarea name="team_intro" id="tintro" rows="5" placeholder="팀 소개를 간단하게 작성해주세요"></textarea>
								</div>
								</label>
			                </p>
			                <br>
			                <p>
			                    <label>회원 모집 여부
			                    </label>
			                    <select id="recyn" name="team_recruit_yn">
			                        <option>모집여부 선택
			                        </option>
			                        <option value="1">예
			                        </option>
			                        <option value="2">아니오
			                        </option>
			                    </select>
			                </p>
			                </div>
			                <br><br>
							
							<div class="col-6 col-12-medium">
							<p>  
			                    <label>팀 공지
			                    <div>
									<textarea name="team_notice" id="tnotice" rows="5" placeholder="팀 공지를 간단하게 작성해주세요"></textarea>
								</div>
								</label>
			                </p>
							</div>
							</div>
							 <br><br>
							<div class="col-12">
								<ul class="actions">
									<li><input type="button" id="goInsert" value="팀 작성 완료" /></li>
									<li><input type="reset" onclick="formReset()" value="돌아가기" /></li>
								</ul>
							</div>
						</div>
					</form>
				</section>
			</article>
			
		</div>

	

	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	<script>
	
	$(()=>{
		getCityList();
		
		$("#btnDuplicate").click(function(){
			$.ajax({
				url: "${ commonURL }/team/isDuplicate",
				data:{ team_name: $("#tname").val()},
				dataType: "json",
				type: "POST"
			})
			.done( (data)=>{
				console.log(data);
				if( data.result == "true" ) {
					alert("이미 사용중인 팀 이름 입니다.");
				} else {
					alert("사용 가능한 팀 이름 입니다.");
					$("#tnamecheck").val("Y");
					$("#tname").prop("readonly", true); //사용중인 아이디라고 판명되면 읽기전용으로 입력창이 막힘 
				}
			})
			.fail( (error) => {
				console.log(error);
			})
		});
	});
	
	$("#goInsert").click(function(){
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

		
		function getCityList(){
			$.ajax({
				url: "${commonURL}/team/selectCity",
				contentType: false,
				processData: false,
				type: "POST"
			})
			.done( (result) => {
				var i=1;
			
			  result.forEach( (item)=>{
			    	var data = "<option "+"value='"+item.city+"'>";
			    	    data +=  item.city ;
			    	    data += "</option>";
			    	i++;
			      	$("#cityoption").after(data);
			})
			})
			.fail( (error) => {
				alert("정보 가져오기 실패");
			})
		}
		
	</script>

</body>
</html>