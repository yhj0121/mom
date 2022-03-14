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
<%
	MemberDto mdto = (MemberDto)request.getAttribute("userInfo");
// 	System.out.println("mdto : " + mdto);
// 	System.out.println("userId : " + mdto.getUser_id());
// 	System.out.println("userName : " + mdto.getUser_name());
// 	System.out.println("email : " + mdto.getUser_mail());
// 	System.out.println("intro : " + mdto.getUser_intro());
%>
	<div id="wrapper">
		<div id="main">
			<article class="post">
				<section>
					<form id="myform" name="myform" method="post" action="#">
						<div class="row gtr-uniform">
							<div class="col-6 col-12-medium">
								이름 <input type="text" name="user_name" id="username" value="<%=mdto.getUser_name()%>" value="" />
							</div>
							<div class="col-6 col-12-medium" >
								아이디 <input type="text" name="user_id" id="userid"  readonly value="<%=mdto.getUser_id()%>"
									value=""  />
							</div>
							<div class="col-6 col-12-medium">
								이메일 <input type="email" name="user_mail" id="email" value="<%=mdto.getUser_mail()%>"
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
									<li><input type="reset" onclick="window.close()" value="확인" /></li>
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
</body>
</html>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	
<script>

</script>