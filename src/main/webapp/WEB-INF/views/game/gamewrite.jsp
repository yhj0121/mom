 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<style>
.form_input {
width:100%;
padding:10px;
font-size:20px;
border: 1px solid black;
boarder-radius: 5px;
box-sizing: border-box;

}

input,textarea {
	box-sizing: border-box;
}

#button {
background-Color:#ffe6f2;  
font-weight:bold;   
margin:auto;

}

</style>

<body>
				<%@include file="../include/nav.jsp"%>


	<%
   GameDto dao = (GameDto)request.getAttribute("GameDto");
   %>
   
   
	<div id="main">
		 		<article class="post">
		 			<header>
						<div class="title">
							<h2><a href="#">게임 신청 게시판</a></h2>
							<p>게임할 사람을 구하는 페이지</p>
						</div>
						<div class="meta">
							<a href="#" class="author"><span class="name">Jane Doe</span><img src="resources/images/avatar.jpg" alt="" /></a>
						</div>
					</header>
					
		 			<section>
						<h3>게임게시글 작성</h3>
							<form name="myform" >
							<input type="hidden" name="team_key" value="1"/>	
							<input type="hidden" name="user_key" value="<%=user_key%>"/>					
							<input type="hidden" name="game_key" value="<%=dao.getGame_key()%>"/>
								
								<div class="row gtr-uniform">
									<div class="col-12">
										<input type="text" name="game_title" id="game_title" value="<%=dao.getGame_title()%>" placeholder="제목" />
									</div>
									
										<div class="col-12">
										  <select name="game_location" id="game_location" value="<%=dao.getGame_location()%>">
    					<option value="kr">지역선택</option>
   		      			 <option value="SU">SU</option>
    					<option value="BS">BS</option>
    					<option value="TK">TK</option>
    			    	<option value="IC">IC</option>
    			    	<option value="GJ">GJ</option>
    			    	<option value="US">US</option>
    			    	<option value="SJ">SJ</option>
    			    	<option value="GG">GG</option>
    			    	<option value="GW">GW</option>
  			    		<option value="CB">CB</option>
      					<option value="CN">CN</option>
    					
						</select>
									</div>
									
									
									<div class="col-6 col-12-xsmall">
										<input type="text" name="user_name" id="user_name" value="<%=username%>" placeholder="작성자" readonly/>
									</div>
									<div class="col-6 col-12-xsmall">
									           <input type="datetime-local"  id="game_fdate" name="game_fdate">
									</div>
									
						
									
									
									<div class="col-12">
										<textarea name="game_contents" id="game_contents"  rows="6"><%=dao.getGame_contents()%></textarea>
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
			<script src="../resources/assets/js/jquery.min.js"></script>
			<script src="../resources/assets/js/browser.min.js"></script>
			<script src="../resources/assets/js/breakpoints.min.js"></script>
			<script src="../resources/assets/js/util.js"></script>
			<script src="../resources/assets/js/main.js"></script>
		
			
<script>
function goWrite()
{
	var frmData = document.myform; 
	var queryString = $("form[name=myform]").serialize();
	if(frmData.game_title.value.trim().length<10)
	{
		alert("제목을 10글자 이상 작성하시오");
		frmData.game_title.focus();
		return false;
	}
	
	if(frmData.game_contents.value.trim().length<10)
	{
		alert("내용을 10글자 이상 작성하시오");
		frmData.game_contents.focus();
		return false;
	} 
	$.ajax({
		url:"<%=request.getContextPath()%>/game/save",
		data:queryString,
		processData:false,
		type:"POST"
	})
	.done((result)=>{
		console.log(result);
		alert("성공");
		location.href="<%=request.getContextPath()%>/game/list";
	})
	.fail((error)=>{
		console.log(error);
	})
}


</script>

