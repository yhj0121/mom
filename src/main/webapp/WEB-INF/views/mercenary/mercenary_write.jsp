<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.mom.momhome.mercenary.*" %>
<%@page import="com.mom.momhome.common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
img{
display:block;
margin:auto;
}
</style>
</head>
<body class= "is-preload">
	<div id="wrapper">
	<%@include file="../include/nav.jsp"%>
	<%
		MercenaryDto mdto = (MercenaryDto)request.getAttribute("mercenaryDto");
   %>
		<div id="main">
		 		<article class="post">
		 			<header>
						<div class="title">
							<h2><a href="#">용병 구인 게시판</a></h2>
							<p>감독 권한으로 용병 구인글 작성하는 페이지</p>
						</div>
						<div class="meta">
						<a href="#" class="logo"><img src="${pageContext.request.contextPath}/resources/images/icon_mercenary.png" alt="" /></a>
						</div>
					</header>
					
		 			<section>
						<h3>용병구인작성</h3>
							<form name="myform" >
								<input type="hidden" name="user_key" value="<%=user_key%>"/>
								<input type="hidden" name="game_key" value="1"/>
								<input type="hidden" name="mercenary_key" value="<%=mdto.getMercenary_key()%>"/>
								
								<div class="row gtr-uniform">
									<div class="col-12">
										<input type="text" name="mercenary_title" id="mercenary_title" value="<%=mdto.getMercenary_title()%>" placeholder="제목" />
									</div>
									<div class="col-6 col-12-xsmall">
										<input type="text" name="user_name" id="user_name" value="<%=username%>" placeholder="작성자" readonly/>
									</div>
									<div class="col-12">
										<textarea name="mercenary_contents" id="mercenary_contents" placeholder="내용" rows="6"><%=mdto.getMercenary_contents()%></textarea>
									</div>
									<div class="col-12">
										<ul class="actions">
											<li><input type="button" value="등록" onclick="goWrite()" /></li>
											<li><input type="button" value="취소" onclick="goCancle()" /></li>
										</ul>
									</div>
								</div>
							</form>
						</section>
					</article>
				</div>
		</div>
</body>
</html>
<script>
 function goWrite()
{
	var frmData = document.myform; 
	var queryString = $("form[name=myform]").serialize();
	if(frmData.mercenary_title.value.trim().length<10)
	{
		alert("제목을 10글자 이상 작성하시오");
		frmData.mercenary_title.focus();
		return false;
	}
	
	if(frmData.mercenary_contents.value.trim().length<10)
	{
		alert("내용을 10글자 이상 작성하시오");
		frmData.mercenary_contents.focus();
		return false;
	} 
	$.ajax({
		url:"<%=request.getContextPath()%>/mercenary/save",
		data:queryString,
		//contentType:false,
		processData:false,
		type:"POST"
	})
	.done((result)=>{
		console.log(result);
		alert("성공");
		location.href="<%=request.getContextPath()%>/mercenary/list";
	})
	.fail((error)=>{
		console.log(error);
	})
}
 
function goCancle()
{
	 <%-- var frm = document.form;
		frm.action="<%=request.getContextPath()%>/mercenary/list";
		frm.submit(); --%>
		location.href="<%=request.getContextPath()%>/mercenary/list";
} 
</script>