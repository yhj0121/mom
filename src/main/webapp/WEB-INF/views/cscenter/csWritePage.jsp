<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.mom.momhome.cscenter.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mom.momhome.common.*"%>
<html>
<head>
<title>Man of the match</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<style>
img {
	display: block;
	margin: auto;
}
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<%@include file="../include/nav.jsp"%>

		<!-- Main -->
		<div id="main">
			<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">문의사항 작성</a>
						</h2>
						<p>사이트 이용시 불편한 점이나 궁금했던 점을 작성해주세요. 빠른 시일 내에 답변해드리도록 하겠습니다.</p>
					</div>
					<div class="meta">
						<a href="#" class="logo"><img
							src="${pageContext.request.contextPath}/resources/images/icon_customerservice.png"
							alt="고객센터 아이콘" /></a>
					</div>
				</header>
				<!-- Input Form -->
				<form name="writeForm">
					<input type="hidden" name="user_key" value="<%=user_key%>" />

					<div class="row gtr-uniform">
						<div class="col-12">
							<label for="exampleFormControlInput1" class="form-label">제목</label>
							<input type="email" name="cscenter_title" class="form-control"
								id="exampleFormControlInput1" placeholder=""
								style="border-radius: 4px; background-color: white;">
						</div>
					</div>
					<div class="col-12">
						<label for="exampleFormControlTextarea1" class="form-label"
							style="margin-top: 20px;">문의 내용</label>
						<textarea class="form-control" name="cscenter_contents"
							id="exampleFormControlTextarea1" rows="3"
							style="height: 80%; resize: none;"></textarea>
					</div>
				</form>

				<div class="col-12" style="text-align: right;">
					<ul class="actions">
						<li style="margin-left: auto"><input type="button"
							value="접수하기" onclick="goWrite()" /></li>
						<li><input type="button" value="뒤로가기" class="btn-goList" /></li>
					</ul>
				</div>
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
		location.href='${commonURL}/cscenter';
	})
	.fail((error)=>{
		console.log(error);
	})
}

	const btnGoList = document.querySelector('.btn-goList');
	
	btnGoList.addEventListener('click', () => {
		location.href='${commonURL}/cscenter';
	})

</script>
</html>