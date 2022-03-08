<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@page import="com.mom.momhome.mercenary.*" %>
<%@page import="com.mom.momhome.common.*" %>
<%@page import="com.mom.momhome.member.*" %>
<%@page import="com.mom.momhome.mercenaryjoin.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>용병 구인 상세보기</title>
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
	 	String key = StringUtil.nullToValue(request.getParameter("key"), "1");
	 	String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
	 	String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
	 	String membership_role = "1";
	 %>
	 <%
	   MercenaryDto mdto = (MercenaryDto)request.getAttribute("mercenaryDto");
	  %>
		<div id="main">
	 		<article class="post">
	 			<header>
					<div class="title">
						<h2><a href="#">용병 구인 상세보기</a></h2>
						<p>감독이 올린 용병 구인의 상세정보를 확인하는 화면</p>
					</div>
					<div class="meta">
						<a href="#" class="logo"><img src="${pageContext.request.contextPath}/resources/images/icon_mercenary.png" alt="" /></a>
					</div>
				</header>
				
	 			<section>
					<!-- <h3 style="text-align: center">용병 구인 상세보기</h3>	 -->
						<form name="myform">
							<input type="hidden" name="pg"      value="<%=pg%>" />
					     	<input type="hidden" name="key"     value="<%=key%>" />
					        <input type="hidden" name="keyword" value="<%=keyword%>"/ >
					        <%-- <input type="text" name="test" value="<%=user_key%>" > --%>
					        <input type="hidden" name="user_key" value="${userkey}" />
							<input type="hidden" name="game_key" value="<%=mdto.getGame_key()%>"/>
							<input type="hidden" name="mercenary_key" value="<%=mdto.getMercenary_key()%>"/>
							<%-- <input type="text" name="mercenary_complete" value="<%=mdto.getMercenary_complete()%>" /> --%>
							<input type="hidden" name="mercenary_proc"  id="mercenary_proc" value="" />
							<input type="hidden" name="mercenaryjoin_key"  id="mercenaryjoin_key" value="" />
							<input type="hidden" name="membership_role" value="1" /> 
					   
					      	
							<div class="row gtr-uniform">
								<div class="col-12">
									<input type="text" name="mercenary_title" id="mercenary_title" value="<%=mdto.getMercenary_title()%>" readonly />
								</div>
								<div class="col-6 col-12-xsmall">
									<input type="text" name="user_name" id="user_name" value="<%=mdto.getUser_name()%>" readonly/>
								</div>
								<div class="col-12">
									<textarea name="mercenary_contents" id="mercenary_contents" rows="6" readonly><%=mdto.getMercenary_contents()%></textarea>
								</div>
								<div class="col-12">
									<ul class="actions">
										<li><input type="button" value="목록" onclick="goList()" /></li>
								<%if(user_key.equals(mdto.getUser_key()) && membership_role.equals("1")) {%>
										<li><input type="button" value="용병신청리스트" onclick="goViewApplicants()" /></li>
								<%} if(membership_role.equals("2")){ %>
										<li><input type="button" value="용병신청" onclick="goApply()" /></li>
								<%}%>
								<%if(user_key.equals(mdto.getUser_key())) {%>
										<li><input type="button" value="수정" onclick="goModify()" /></li>
										<li><input type="button" value="삭제" onclick="goDelete()" /></li>
								<%}%> 
									</ul>
								</div>
							</div>
							<br/>
							<br/>
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
							                <th>이름</th>
							                <th>포지션</th>
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
	</div>
</body>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
<script	src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
<script>

function goList()
{
	var frm = document.myform;
   	frm.action="<%=request.getContextPath()%>/mercenary/list";
   	frm.submit();
}

function goApply()
{
	$("#mercenary_proc").val("1");
	var frmData = document.myform; 
	var queryString = $("form[name=myform]").serialize();
	$.ajax({
		url:"<%=request.getContextPath()%>/mercenary/apply",
		data:queryString,
		processData:false,
		type:"POST"
	})
	.done((result)=>{
		console.log(result);
		alert("신청이 완료되었습니다.");
		location.href="<%=request.getContextPath()%>/mercenary/list";
	})
	.fail((error)=>{
		console.log(error);
	})
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
function goViewApplicants()
{
	var frmData = new FormData(document.myform); 
	var queryString = $("form[name=myform]").serialize();
	$.ajax({
		url:"${commonURL}/mercenary/viewApplicants",
		data:queryString,
		processData:false,
		type:"POST"
	})
	.done((result)=>{
		$("#tbl_app").show();
		for(i=$("#tbl_applicants tr").length-2;i>=0;i--)
			$("#tbl_applicants tr:last").remove(); 
		
		var i=1;
		result.forEach( (item)=>{
			var data = "<tr>";
				data += "<td>"+ i+"</td>";
				data += "<td>"+item.user_name+"</td>";
				data += "<td>"+item.user_position+"</td>";
				data += "<td>"+item.app_date+"</td>";
				
				if(item.mercenary_proc == "1")
					data += "<td>"+"승인대기중";
				else if(item.mercenary_proc == "2")
					data += "<td>"+"용병신청 수락됨";
				else
					data += "<td>"+"용병신청 거절됨";
				
				data += "&nbsp&nbsp<button type='button' onclick=goApprove('"+item.mercenaryjoin_key+"')>고용</button>" 
					 + "&nbsp&nbsp<button type='button' onclick=goDecline('"+item.mercenaryjoin_key+"')>거절</button>" +"</td>";
				data += "</tr>";
				i++;
			$("#tbl_applicants > tbody:last").append(data);
			
		});
	})
	.fail((error)=>{
		console.log(error);
	})
}
function goApprove(mercenaryjoin_key)
{
	$("#mercenaryjoin_key").val(mercenaryjoin_key);
	$("#mercenary_proc").val("2");
	var frmData = document.myform; 
	var queryString = $("form[name=myform]").serialize();
	$.ajax({
		url:"<%=request.getContextPath()%>/mercenary/proc",
		data:queryString,
		processData:false,
		type:"POST"
	})
	.done((result)=>{
		console.log(result);
		alert("승인처리 완료되었습니다.");
		goViewApplicants();
	})
	.fail((error)=>{
		console.log(error);
	})
}
function goDecline(mercenaryjoin_key)
{
	$("#mercenaryjoin_key").val(mercenaryjoin_key);
	$("#mercenary_proc").val("3");
	var frmData = document.myform; 
	var queryString = $("form[name=myform]").serialize();
	$.ajax({
		url:"<%=request.getContextPath()%>/mercenary/proc",
		data:queryString,
		processData:false,
		type:"POST"
	})
	.done((result)=>{
		console.log(result);
		alert("거절처리 완료되었습니다.");
		goViewApplicants();
	})
	.fail((error)=>{
		console.log(error);
	})
}
</script>


