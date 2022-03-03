<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mom.momhome.mercenary.*" %>
<%@page import="com.mom.momhome.common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>용병 구인 상세보기</title>
</head>
<body class= "is-preload">
	<div id="wrapper">
	<%@include file="../include/nav.jsp"%>
	<%
	 	String key = StringUtil.nullToValue(request.getParameter("key"), "1");
	 	String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
	 	String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
	 	
	 	/* String user_key = (String)session.getAttribute("user_key"); */
	 %>
	 <%
	   MercenaryDto dto = (MercenaryDto)request.getAttribute("mercenaryDto");
	  %>
		<div id="main">
	 		<article class="post">
	 			<header>
					<div class="title">
						<h2><a href="#">용병 구인 게시판</a></h2>
						<p>용병 구인 상세보기 화면</p>
					</div>
					<div class="meta">
						<a href="#" class="author"><span class="name">Jane Doe</span><img src="resources/images/avatar.jpg" alt="" /></a>
					</div>
				</header>
				
	 			<section>
					<h3 style="text-align: center">용병 구인 상세보기</h3>	
						<form name="myform">
							<input type="hidden" name="pg"      value="<%=pg%>" >
					     	<input type="hidden" name="key"     value="<%=key%>" >
					        <input type="hidden" name="keyword" value="<%=keyword%>" >
					        <input type="hidden" name="user_key" value=""/>
							<input type="hidden" name="game_key" value="1"/>
							<input type="hidden" name="mercenary_key" value="<%=dto.getMercenary_key()%>" />
					   
					      	
							<div class="row gtr-uniform">
								<div class="col-12">
									<input type="text" name="mercenary_title" id="mercenary_title" value="<%=dto.getMercenary_title()%>" readonly />
								</div>
								<!-- <div class="col-6 col-12-xsmall">
									<input type="text" name="team_name" id="team_name" value="" placeholder="팀이름" />
								</div> -->
								<div class="col-6 col-12-xsmall">
									<input type="text" name="user_name" id="user_name" value="<%=dto.getUser_name()%>" readonly/>
								</div>
								<div class="col-12">
									<textarea name="mercenary_contents" id="mercenary_contents" rows="6" readonly><%=dto.getMercenary_contents()%></textarea>
								</div>
								<div class="col-12">
									<ul class="actions">
										<li><input type="button" value="목록" onclick="goList()" /></li>
										<li><input type="button" value="용병신청" onclick="goApply()" /></li>
								<%-- <%if(user_key.equals(dto.getUser_key())) {%> --%>
										<li><input type="button" value="수정" onclick="goModify()" /></li>
										<li><input type="button" value="삭제" onclick="goDelete()" /></li>
										<%-- <%}%> --%>
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
function goList()
{
	var frm = document.myform;
   	frm.action="<%=request.getContextPath()%>/mercenary/list";
   	frm.submit();
}

function goApply()
{
	alert("신청이 완료되었습니다.");
}

function goModify()
{
	var frm = document.myform;
   	frm.action="<%=request.getContextPath()%>/mercenary/modify";
   	frm.submit();
}
function goDelete()
{
	if( confirm("삭제하시겠습니까?"))
	   {
	      var frm = document.myform;
	      frm.action="<%=request.getContextPath()%>/mercenary/delete";
	      frm.submit();
	   }
}
</script>