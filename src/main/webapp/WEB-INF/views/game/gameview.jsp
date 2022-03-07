<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.util.List" %>   
 <%@page import="com.mom.momhome.game.*" %>
<%@page import="com.mom.momhome.common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Man of the match</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
		<link rel="stylesheet" href="../resources/assets/css/main.css" /></head>
<body class="is-preload">

			<%@include file="../include/nav.jsp"%>
		<%
		String key = StringUtil.nullToValue(request.getParameter("key"), "1");
		String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
		String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
		String team_key="1";
	%>
	<%
	GameDto daoo = (GameDto)request.getAttribute("GameDto");
	%>
	

 
    
	<div id="main">
	 		<article class="post">
	 			<header>
					<div class="title">
						<h2><a href="#">경기 테이블</a></h2>
						<p>게시판 상세보기</p>
					</div>
					
				</header>
				
	 			<section>
					<h3 style="text-align: center">경기 테이블</h3>	
						<form name="myform">
					<input type="hidden" name="pg"      value="<%=pg%>" >
					<input type="hidden" name="key"     value="<%=key%>" >
					<input type="hidden" name="keyword" value="<%=keyword%>" >
					<input type="hidden" name="team_key" id="team_key" value="${team_key}">
				    <input type="hidden" name="user_key" value="${userkey}" >
				    <input type="hidden" name="team_side" value="1" >
	
			   	<input type="hidden" name="game_key" value="<%=daoo.getGame_key()%>">
				        
					
					<input type="hidden" name="game_date" id="game_date" value="<%=daoo.getGame_date()%>" readonly /> 
					      	
							<div class="row gtr-uniform">
								<div class="col-12">
								<input type="text" name="game_title"   name="game_title"  value="<%=daoo.getGame_title()%>"  readonly />
								</div>
							
							
										<div class="col-6 col-12-xsmall">
									<input type="text" name="game_fdate" id="game_fdate" value="<%=daoo.getGame_fdate()%>" readonly />
								</div>
								<div class="col-12">
									<input type="text" name="game_location" id="game_location" value="<%=daoo.getGame_location()%>" readonly />
								</div>
								<div class="col-12">
									<textarea name="game_contents" id="game_contents" rows="6" readonly><%=daoo.getGame_contents()%></textarea>
								</div>
								<div class="col-12">
									<ul class="actions">
									
										<li><input type="button" value="목록" onclick="goList()" /></li>
									<%if(team_key.equals(daoo.getTeam_key())) {%>
										<li><input type="button" value="수정" onclick="goupdate()" /></li>
										<li><input type="button" value="삭제" onclick="goDelete()" /></li>
										<%}%>
											<%if(team_key.equals(daoo.getTeam_key())) {%>
										<li><input type="button" value="홈팀라인업짜기" onclick="homelineup()" /></li>
										
										<%} else {%>
										<li><input type="button" value="어웨이 라인업 짜기" onclick="awaylineup()" /></li>
									<%}%>
									</ul>
								</div>
							</div>
						</form>
					</section>
				</article>
		</div>
</body>

   <!-- Scripts -->
			<script src="../resources/assets/js/jquery.min.js"></script>
			<script src="../resources/assets/js/browser.min.js"></script>
			<script src="../resources/assets/js/breakpoints.min.js"></script>
			<script src="../resources/assets/js/util.js"></script>
			<script src="../resources/assets/js/main.js"></script>
<script>
function goList()
{
	var frm = document.myform;
	frm.action="<%=request.getContextPath()%>/game/list";
	frm.submit();
}

function goupdate()
{
	var frm = document.myform;
	frm.action="<%=request.getContextPath()%>/game/modify";
	frm.submit();
}

function goDelete()
{
	if( confirm("삭제하시겠습니까?"))
	   {
	      var frm = document.myform;
	      frm.action="<%=request.getContextPath()%>/game/delete";
	      frm.submit();
	   }
}

function homelineup()
{
	var frm = document.myform;
	frm.
	
	
}

</script>
</html>














