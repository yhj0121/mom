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
					<input type="hidden" name="team_key" id="team_key" value="1">
			   	<input type="hidden" name="game_key" value="<%=daoo.getGame_key()%>">
				        
					
					<input type="hidden" name="game_date" id="game_date" value="<%=daoo.getGame_date()%>"/> 
					      	
							<div class="row gtr-uniform">
								<div class="col-12">
								<input type="text" name="game_title"   name="game_title"  value="<%=daoo.getGame_title()%>" >
								</div>
							
							
										<div class="col-6 col-12-xsmall">
									<input type="text" name="game_fdate" id="game_fdate" value="<%=daoo.getGame_fdate()%>">
								</div>
								<div class="col-12">
									<input type="text" name="game_location" id="game_location" value="<%=daoo.getGame_location()%>" >
								</div>
								<div class="col-12">
									<textarea name="game_contents" id="game_contents" rows="6"><%=daoo.getGame_contents()%></textarea>
								</div>
								<div class="col-12">
									<ul class="actions">
										<li><input type="button" value="목록" onclick="goList()" /></li>
										<li><input type="button" value="참가신청" id="joinornot" /></li>
							
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

$(()=>{
    $("#joinornot").click(()=>{
       $.ajax({
          url:"${commonURL}/game/joinornot", //요청 url정보
          data:{userid:$("#userid").val()},   //서버로 전달할 데이터정보: JSON형태
          dataType:"json",  //결과를 jSON으로 받겠다. 결과가 text로 온다
          type:"POST"
       })
       .done((data)=>{
          //데이터가 정상적으로 수신되면 done메서드 호출되면서 매개변수는 전달받은 값
          //값은 dataType 속성을 안주면 text로 온다.
          console.log(data.result);
         if(data.result == "true") //중복
         {
            alert("이미 사용중인 아이디입니다.")
         }
         else
         {
            alert("사용가능합니다.")
            $("#idcheck").val("Y");
            $("#userid").prop("readonly", true);   //수정못하게 막는 기능
            
         }
       })
       .fail((error)=>{
          //통신에러, 오류에 관한 것
             console.log(error)
       })
    })
 })

</script>
</html>














