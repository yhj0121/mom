<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>   
<%@page import="com.mom.momhome.game.*" %>
<%@page import="com.mom.momhome.common.*" %>
<%@page import="com.mom.momhome.gamejoin.*" %>
<%@page import="com.mom.momhome.membership.*" %>

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

	GameDto daoo = (GameDto)request.getAttribute("GameDto");
	GameDto tdaoo = (GameDto)request.getAttribute("teamdto");
	%>
	    
	<div id="main">
	 		<article class="post">
	 			<header>
					<div class="title">
						<h2>
							<a href="#">게임 매칭 게시판</a>
						</h2>
						<p>감독님만 게임 매칭을 만들수 있어요</p>
					</div>
					<div class="meta">
						<a href="#" class="logo"><i class="fas fa-futbol fa-8x" style="display: flex; justify-content: center;"></i></a>
					</div>
				</header>

	 			<section>
					<h3 style="text-align: center">매칭 정보</h3>	
					<form name="myform">
						<input type="hidden" name="pg"      value="<%=pg%>" >
						<input type="hidden" name="key"     value="<%=key%>" >
						<input type="hidden" name="keyword" value="<%=keyword%>" >
						<input type="hidden" name="membership_role" value="${membership_role}">			
						<input type="hidden" name="team_key" id="team_key" value="<%=daoo.getTeam_key()%>">
						<%-- <input type="hidden" name="team_key2" id="team_key2" value="<%=tdaoo.getTeam_key()%>"> --%>
					    <input type="hidden" name="user_key" value="${userkey}">
					    <input type="hidden" name="matchingjoin_key" id="matchingjoin_key" value="">
					    <input type="hidden" name="team_side" id="team_side" value="" >
					    <input type="hidden" name="team_name" id="team_name" value="<%=daoo.getTeam_name()%>">
				   	    <input type="hidden" name="result_proc"  id="result_proc" value="" />
				      	<input type="hidden" name="game_key" id="game_key" value="<%=daoo.getGame_key()%>">
						<input type="hidden" name="game_date" id="game_date" value="<%=daoo.getGame_fdate()%>"> 
   						<input type="hidden" name="game_complete" id="game_complete" value=""/> 
					    
					      	
						<div class="row gtr-uniform">
							<div class="col-12">
								<input type="text" name="game_title"   name="game_title"  value="<%=daoo.getGame_title()%>"  style="color:black;" readonly  />
							</div>
							
							<div class="col-6 col-12-xsmall">
								<input type="text" name="game_fdate" id="game_fdate" value="<%=daoo.getGame_fdate()%>"  style="color:black;" readonly />
							</div>
							<div class="col-12">
								<input type="text" name="game_location" id="game_location" value="<%=daoo.getGame_location()%>" style="color:black;" readonly />
							</div>
							<div class="col-12">
								<textarea name="game_contents" id="game_contents" rows="6" style="color:black;" readonly><%=daoo.getGame_contents()%></textarea>
							</div>
						
							<div class="col-12">
								<ul class="actions">
									<li><input type="button" value="목록" onclick="goList()" /></li>
							        <li><input type="button" value="어웨이리스트가기" onclick="goLineup(2)"/></li>
								    <li><input type="button" value="홈리스트가기" onclick="goLineup(1)" /></li>
									
									<%if(membership_role.equals("1") && user_key.indexOf(tdaoo.getUser_key())==-1) 
									{%>
										<li><input type="button" value="신청" onclick="goapply()"/></li>
						
					 				<%}%>
					 						<%if(membership_role.equals("1")  && user_key.equals(tdaoo.getUser_key()))
										{%>		
							 				 <li><input type="button" value="수정" onclick="goupdate()" /></li>
											 <li><input type="button" value="삭제" onclick="goDelete()" /></li>
											 <li><input type="button" value="팀신청리스트" onclick="goviewlist()" /></li>										
										<%}%>
								</ul>
							</div>
						</div>
						<br/><br/>
						<div class="table-wrapper" id ="tbl_app" style="display:none;">
							<table id ="tbl_applicants">
								<colgroup>
					              <col width="8%">
					              <col width="12%">
					              <col width="12%">
					              <col width="20%">
					              <col width="*">
					           </colgroup>
					            <thead class="table-secondary">
					              <tr>
					                <th>번호</th>
					                <th>팀이름</th>
					                <th>신청일</th>
					                <th>신청상태</th>
					              </tr>
					            </thead>
					            <tbody>
					            </tbody>
							</table>
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
 function goresult()
{
	var frmDate = document.myform;
	let target = document.getElementById('btn_button'); 
	var queryString = $("form[name=myform]").serialize();
	$.ajax({
		url:"<%=request.getContextPath()%>/game/joinresult",
		data:queryString,
		processData:false,
		type:"POST"
	})
	.done((result)=>{
		console.log(result);
		if(result===1)
		{
			alert("신청 할수 있다.");
			  $("#tbl_app").hide();
			target.disabled = true;
		}
		else
		{	
			alert("이미 신청완료된 팀이 있습니다.");
			
		
		} 
	})
	.fail((error)=>{
		console.log(error);
	})		

}

function goapply()
{	
	var frmData = document.myform; 
	var queryString = $("form[name=myform]").serialize();
	$.ajax({
		url:"<%=request.getContextPath()%>/game/joinduplicate",
		data:queryString,
		processData:false,
		type:"POST"
	})
	.done((result)=>{
		console.log(result);
		if(result===0)
		{
			insertJoin();
		}
		else
		{	
			alert("이미 신청하셨습니다.");
			return false;
		} 
	})
	.fail((error)=>{
		console.log(error);
	})		
}

function insertJoin()
{
	$("#result_proc").val("1");
	var frmData = document.myform; 
	var queryString = $("form[name=myform]").serialize();
	$.ajax({
		url:"<%=request.getContextPath()%>/game/apply",
		data:queryString,
		processData:false,
		type:"POST"
	}).done(function(data){
		console.log(data);
		alert("신청이 완료되었습니다.");
		location.href="<%=request.getContextPath()%>/game/list";
		
	})
	  .fail(function(err){
		console.log(err);
	})	
}

function goviewlist()
{
   var frmData = new FormData(document.myform);
   var queryString = $("form[name=myform]").serialize();    
   $.ajax({
	  	url:"${commonURL}/game/applyview",
		data:queryString,
		processData:false,
		type:"POST"
	   })
	   .done( (result)=>{
		   $("#tbl_app").show();
		  for(i=$("#tbl_applicants tr").length-2;i>=0;i--)
				$("#tbl_applicants tr:last").remove(); 
	      var i=1;
	      result.forEach((item)=>{
	       var data = "<tr>";
	           data += "<td>"+ i +"</td>";
	           data += "<td>"+item.team_name+"</td>";
	           data += "<td>"+item.matching_date+"</td>";
	     	   if(item.result_proc == "1")
						data += "<td>"+"승인대기중";
					else if(item.result_proc == "2")
						data += "<td>"+"매칭신청 수락됨";
					else
						data += "<td>"+"매칭신청 거절됨";
					if(item.result_proc =="1"){
					data += "&nbsp&nbsp<button type='button' id='btn_button' onclick=goApprove('"+item.matchingjoin_key+"')>수락</button>" 
					} else 
						{
							data += "</tr>";
					    }	
					i++;   
	         $("#tbl_applicants > tbody:last").append(data);
	         
	      });
	   })
	   .fail( (error)=>{
	      console.log(error);
	   })
	}
function goApprove(matchingjoin_key)
{
	$("#matchingjoin_key").val(matchingjoin_key);
	$("#game_complete").val("1");
	$("#result_proc").val("2");
	var frmData = document.myform; 
	console.log(frmData);
	var queryString = $("form[name=myform]").serialize();
	$.ajax({
		url:"<%=request.getContextPath()%>/game/proc",
		data:queryString,
		processData:false,
		type:"POST"
	})
	.done((result)=>{
		console.log(result);
		goresult()
		goviewlist();
	
	})
	.fail((error)=>{
		console.log(error);
	})
}
function goDecline(matchingjoin_key)
{
	alert("도입");
	$("#matchingjoin_key").val(matchingjoin_key);
	$("#result_proc").val("3");
	alert($("#matchingjoin_key").val());
	var frmData = document.myform; 
	var queryString = $("form[name=myform]").serialize();
	$.ajax({
		url:"<%=request.getContextPath()%>/game/procdecline",
		data:queryString,
		processData:false,
		type:"POST"
	})
	.done((result)=>{
		console.log(result);
		alert("승인처리 완료되었습니다.");
		goviewlist();
	})
	.fail((error)=>{
		console.log(error);
	})
}

function goLineup(team_side)
{
	$.ajax({
		url:"${commonURL}/game/getLineupCount",
		data:{'game_key': <%=daoo.getGame_key()%>, 'team_side':team_side},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8;",
		type:"POST",
		dataType:"JSON"
	})
	.done((result)=>{
		//console.log("goLineup.count: " + result);
		if(result > 0)
		{
		 	var frm = document.myform;
		 	frm.team_side.value=team_side;
		 	frm.method = "get";
		 	frm.action = "${commonURL}/lineup/info";
		 	frm.submit();
		}
		else
		{
			if(<%=membership_role.equals("2")%>)
			{
				alert("아직 라인업이 작성되지 않았습니다.");
			}
			else
			{
				
				if(team_side == 1) 
				{
					if(<%=daoo.getTeam_key().equals(membershipDto.getTeam_key())%>)
						goLineupModify();
					else
						alert("아직 라인업이 작성되지 않았습니다.");	
				}
				else if(team_side == 2)
					checkAwayLineupPermission();
			}
		}
	})
	.fail((error)=>{
		console.log(error);
	})
}

function checkAwayLineupPermission()
{
	console.log("game_key: " + <%=daoo.getGame_key()%>)
	console.log("team_key: " + <%=membershipDto.getTeam_key()%>);
	$.ajax({
		url:"${commonURL}/game/getGameJoinResultProc",
		data:{'game_key': <%=daoo.getGame_key()%>, 'team_key':<%=membershipDto.getTeam_key()%>},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8;",
		type:"POST",
		dataType:"JSON"
	})
	.done((result)=>{
		//console.log("checkAwayLineupPermission().result : "+ result);
		if(result === "2")
			goLineupModify();
		else
			alert("아직 라인업이 작성되지 않았습니다.");	
	})
	.fail((error)=>{
		console.log(error);
	})
}

function goLineupModify()
{	
	var frm = document.myform;
 	frm.team_side.value=team_side;
 	frm.method = "get";
 	frm.action = "${commonURL}/lineup/modify";
 	frm.submit();
}



</script>
</html>














