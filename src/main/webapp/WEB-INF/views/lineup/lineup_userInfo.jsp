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
	padding: 0.75em 1em !important;
}
body{
	padding:0;
}
dl>*{
	display:inline-block !important; 
}
dl{
	text-align: center;
	margin-bottom:0;
}
dl dt{
	width:80px;
}
dl dd{
	width:280px;
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

	<article class="post">
		<div style="text-align : center;">
			<img src="../resources/images/playerIcon1.png" alt="" />
		</div>	
		<br/><br/>	
		<section style="padding-bottom: 50px;">
			<div style="display:contents;">
				<dl>
					<dt style=" text-align:left;">이름</dt>
					<dd><input type="text" name="user_name" id="username" style="color:black; " value="<%=mdto.getUser_name()%>" readonly /></dd>
				</dl>
				
				<dl>
					<dt style=" text-align:left;">아이디</dt>
					<dd><input type="text" name="user_id" id="userid" style="color:black;" value="<%=mdto.getUser_id()%>" readonly /></dd>
				</dl>
				
				<dl>
					<dt style=" text-align:left;">이메일</dt>
					<dd><input type="email" name="user_mail" id="email" style="color:black;" value="<%=mdto.getUser_mail()%>" readonly /></dd>
				</dl>
				
				<dl>
					<dt style=" text-align:left;">선호포지션</p>
					<dd><input type="text" name="user_id" id="userid" style="color:black;" value="<%=mdto.getUser_position()%>" readonly></dd>
				</dl>

				<dl>					
					<dt style=" text-align:left; vertical-align: top;">자기소개</dt>
					<dd><textarea name="user_intro" id="intro"  rows="6" style="color:black;" readonly><%=mdto.getUser_intro()%></textarea></dd>
				</dl>
				
				<button class="button large next" type="button" style="margin:auto; display:block; width:150px" onclick="window.close()">확인</button>
			</div>
		</section>
	</article>
</body>
</html>

<!-- Scripts -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>















