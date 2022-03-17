<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.mom.momhome.cscenter.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mom.momhome.common.*" %>
<%@ page import="com.mom.momhome.member.*" %>
<%@ page import="com.mom.momhome.csanswer.*" %>
<html>
	<head>
		<title>Man of the match</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
	<style>
	
img{
display:block;
margin:auto;
}

dl {
	margin-bottom: .5em !important;
}

dl > *{
	display: inline-block;
}

dl > dt {
	min-width: 5vw;
}

dl:nth-of-type(4){
overflow: hidden;
}

dl:nth-of-type(4) dd, 
dl:nth-of-type(5) dd {
	display: block;
	float: right;
	background: rgba(160,160,160,.3);
	width: 90%;
	border-radius: 15px;
	min-height: 30vh;
	padding: 15px 20px;
}
	</style>
	</head>

<body class="is-preload">
<%MemberDto mdto = (MemberDto)request.getAttribute("memberDto");%>
	<!-- Wrapper -->
	<div id="wrapper">

				<!-- Header -->
				<%@include file="../include/nav.jsp"%>
				
						<!-- Main -->
		<div id="main">
			<article class="post">
					<header>
					<div class="title">
						<h2><a href="#">접수내용</a></h2>
						<p>문의한 글의 내용입니다. </p>
					</div>
					<div class="meta">
						<a href="#" class="logo"><img src="${pageContext.request.contextPath}/resources/images/icon_customerservice.png" alt="고객센터 아이콘" /></a>
					</div>
				</header>
				
				<!-- Detail Main Form -->
				<%CSCenterDto csDto = (CSCenterDto)request.getAttribute("csDetail");
					System.out.println(csDto.getCscenter_key());
					System.out.println("dto!!" + csDto.getUser_name());
				  CSAnswerDto  csAnsDto = (CSAnswerDto)request.getAttribute("answerDto");
				  if(csAnsDto == null) {
					  csAnsDto = new CSAnswerDto();
				  }
				  System.out.println("content" + csAnsDto.getANS_CONTENT());
				%>
				
				<form name="myform">
				<dl>
					<dt>제목</dt>
					<dd><%=csDto.getCscenter_title()%></dd>
				</dl>
				<dl>
					<dt>작성자</dt>
					<dd><%=csDto.getUser_name()%></dd>
				</dl>
				<dl>
					<dt>작성일</dt>
					<dd><%=csDto.getCscenter_date()%></dd>
				</dl>
				<hr />
				<dl>
					<dt>내용</dt>
					<dd><%=csDto.getCscenter_contents()%></dd>
				</dl>
				<hr />
				<dl class="resultAnswered" style="display: none; width: 100%;">
					<dt>답변</dt>
					<dd class="ansResult"><%=csAnsDto.getANS_CONTENT()%></dd>
				</dl>
					<textarea class="inputAnswered" style="display: none"></textarea>
							<div class="col-12" style="text-align: right; margin-top: 50px;">
								<ul class="actions">
									
									<li style="margin-left: auto">
									<input type="button" style="margin: 0px 10px 0px 10px; visibility: hidden;"
										value="답변하기" class="answered" />
									<input type="button" style="margin: 0px 10px 0px 10px"
										value="뒤로가기" class="goBack" />
									</li>
								</ul>
							</div>
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
				const backBtn = document.querySelector('.goBack');
				const ansBtn = document.querySelector('.answered');
				const resultAns = document.querySelector('.resultAnswered');
				const inputAns = document.querySelector('.inputAnswered');
				const ansResult = document.querySelector('.ansResult');
				
				backBtn.addEventListener('click', () => {
					location.href='${commonURL}/cscenter';
				})
				
				ansBtn.addEventListener('click', () => {
					let jsonData = {
							listId: <%=Integer.parseInt(csDto.getCscenter_key())%>,
							 ANS_CONTENT: inputAns.value
					};
					
					fetch('${commonURL}/cscenter/detail/insert', {
						method: 'POST', // or 'PUT'
						 body: JSON.stringify(jsonData), // data can be `string` or {object}!
						 headers:{
						   'Content-Type': 'application/json'
						}
					}).then(data => {
						console.log('확인');
						location.reload();
					})
				})
				
				if(<%=mdto.getIsManager()%> == 1 && <%=csDto.getAnswered()%> == 0) {
					ansBtn.style.visibility = 'visible';
					inputAns.style.display = 'inline-block';
				}
				
				if(<%=csDto.getAnswered()%> == 1) {
					resultAns.style.display = 'inline-block';
					ansBtn.style.visibility = 'hidden';
					inputAns.style.display = 'none';
				}
				
			</script>
	</body>
</html>