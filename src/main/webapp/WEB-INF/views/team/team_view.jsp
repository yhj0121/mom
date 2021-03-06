<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mom.momhome.member.*"%>
<%@page import="com.mom.momhome.team.*"%>
<%@page import="com.mom.momhome.mercenary.*"%>
<%@page import="com.mom.momhome.common.*"%>
<html>
<head>
<title>Man of the match</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.actions {
	justify-content: center;
}

textarea {
	text-align: left !important;
	resize: none;
}

table th {
	text-align: center !important;
}

table {
	margin-top: 40px !important;
}

table td {
	padding: .4rem .75em;
}

table td:not(.introduction) {
	text-align: center;
}
</style>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<%@include file="../include/nav.jsp"%>
		<%
			String key = StringUtil.nullToValue(request.getParameter("key"), "1");
		%>
		<%
			TeamDto dto = (TeamDto)request.getAttribute("teamDto");
			List<TeamDto> list = (List<TeamDto>) request.getAttribute("getTeamViewList");
		%>
		
		<!-- Main -->
		<div id="main">
			<form name="myform">
			<input type="hidden" name="team_name" value="<%=dto.getTeam_name()%>"/>
			<input type="hidden" name="team_key" value="<%=dto.getTeam_key() %>"/>
			<input type="hidden" name="user_key" value="${userkey}"/>
		
			
			
			
			<!-- Post -->
			<article class="post">
			
				<header style="max-height: 250px;">
					
					<div class="title" align="center">
						<h2>
							<a href="single.html"><%=dto.getTeam_name() %></a>
						</h2>
					</div>
					<div class="meta">
						<time class="published">SINCE :<%=dto.getTeam_fdate()%></time>
					</div>
					<div class="meta" style="padding: 0;">
						<img
							src="../upload/<%=dto.getTeam_emblem() %>"
							alt="??? ?????????" style="width: 100%; height: 100%;" />
					</div>
				</header>
				
				<div class="row gtr-uniform" align="center">
					<div class="col-6 col-12-medium">
						<p>
							<h2>??? ??????</h2>
							<div><%=dto.getTeam_intro() %></div>
						</p>
						<br>
						<p>
							<h2>??????</h2>
							<div><%=dto.getTeam_city() %></div>
						</p>
						<br>
						<p>
							<h2>??????</h2>
							<div><%=dto.getUser_name() %></div>
						</p>
						<br>
						<p>
							<h2>????????????</h2>
							<div><%if(dto.getTeam_recruit_yn().equals("1")){%>?????????<%}else{%>????????????<%} %></div>
						</p>
					</div>
				
					<div class="col-6 col-12-medium">
						<p>
							<h2>????????????</h2>
							<div><%=dto.getTeam_notice() %></div>
						</p>
						<br>
						<p>
							<h2>??????(???)</h2>
							<div><%=dto.getTeam_fee() %>???</div>
						</p>
						<br>
						<p>
							<h2>??????</h2>
							<div><%=dto.getTeam_num() %>???</div>
						</p>
						<br>
					
					</div>
				</div>
				<br>
				
				<table>
					<tr>
						<td>??? ?????? ??????</td>
						<td>??????</td>
						<td>???????????????</td>
					</tr>
					<tr>
					<%
					for(TeamDto teamDto : list) {
					%>
						<td><%=teamDto.getUser_name() %></td>
						<td><%if(teamDto.getMembership_role().equals("1")){ %>??????<%}else{%>??????<%} %></td>
						<td><%=teamDto.getUser_position() %></td>
					</tr>	
					<%} %>
				</table>
				

				<ul class="actions" style=" margin-top: 200px; justify-content:unset;">
					<li><input type="button" value="??????" onClick="location.href='${commonURL}/team/list'" /></li>
					<%
					if(membership_role.equals("")){ %>
					<li><input type="button" value="??? ??????????????????" onclick="goapply()" /></li>
					<%} %>
				</ul>
				
			</article>
			
			<!-- Footer -->
			<%@include file="../include/footer.jsp"%>
			</form>
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
	<script>
		
	</script>

</body>
</html>
<script>
function goapply()
{	 
	var queryString = $("form[name=myform]").serialize();
	$.ajax({
		url:"<%=request.getContextPath()%>/team/checkJoinDuplicate",
		data:queryString,
		processData:false,
		type:"POST"
	})
	.done((result)=>{
		console.log("checkJoinDuplicate: " + result);
		if(result===0)
		{
			goJoin();
		}
		else
		{	
			alert("?????? ?????????????????????.");
			return false;
		} 
	})
	.fail((error)=>{
		console.log(error);
	})		
}

	function goJoin()
	{
		var user_key = `${user_key}`;
		var frm = document.myform;
		frm.action="<%=request.getContextPath()%>/team/teamJoin";
		frm.method="post";
		console.log('user_key');
		alert("??? ?????? ????????? ?????????????????????.");
		frm.submit();
	}
</script>