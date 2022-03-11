<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.mom.momhome.member.*"%>
<%@page import="com.mom.momhome.team.*"%>
<%@page import="com.mom.momhome.teamjoin.*"%>
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

table th {
	text-align: center !important;
}

table td {
	padding: .4rem .75em;
}

table td:not(.introduction) {
	text-align: center;
}

a.link{
	margin-left: 20px; 
	font-size: .9rem;
	color: rgb(46, 174, 173);
}
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<%@include file="../include/nav.jsp"%>

		<%
		String key = StringUtil.nullToValue(request.getParameter("key"), "");
		String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
		String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
		int totalCnt = (Integer) request.getAttribute("totalCnt");
		%>
		<!-- Main -->
		<div id="main">
		<form name="myform">
			<input type="hidden" name="pg" id="pg" value="<%=pg%>" /> 
			<input type="hidden" name="team_key" id="team_key" /> 
			<input type="hidden" name="user_key" id="user_key" value="" />
			<!-- Post -->
			<article class="post">
				<header>
					<div class="title">
						<h2>팀 상세 내역</h2>
						<p>감독에게는 우리 팀에 가입을 신청하거나 탈퇴를 신청한 회원 내역을 보여주고, 일반 회원에게는 나의 팀 내역을 보여줍니다.</p>
					</div>
				</header>

				<section>
				<h3>나의 팀</h3>
					<div class="table-wrapper">
						<table>
							 <colgroup>
								<col width="*" />
								<col width="12%" />
								<col width="12%" />
								<col width="12%" />
								<col width="12%" />
								<col width="12%" />
								<col width="17%" />
							</colgroup> 
							<thead>
								<tr>
									<th>팀이름</th>
									<th>지역</th>
									<th>인원</th>
									<th>회비</th>
									<th>모집여부</th>
									<th>나의 역할</th>
									<th>팀 생성일</th>
								</tr>
							</thead>
							<tbody>
								<%
								List<TeamDto> teamList = (List<TeamDto>) request.getAttribute("teamList");
								if( !teamList.isEmpty()) {
								for (TeamDto tempDto : teamList) {
									if( tempDto.getMembership_role().equals("1")) {
								%>
								<tr>
									<td><a href="#none"
											onclick="goView('<%=tempDto.getTeam_key()%>')"><%=tempDto.getTeam_name()%></a></td>
									<td><%=tempDto.getTeam_city()%></td>
									<td><%=tempDto.getTeam_num()%></td>
									<td><%=tempDto.getTeam_fee()%></td>
									<td><%if(tempDto.getTeam_recruit_yn().equals("1")){ %>모집중<%} else {%>모집마감<%} %></td>
									<td><%if(tempDto.getMembership_role().equals("1")){ %>감독<%} else {%>팀원<%} %></td>
									<td><%=tempDto.getTeam_fdate()%></td>
								</tr>
								<%} else { %>
								<tr>
									<td><a href="#none"
											onclick="goView('<%=tempDto.getTeam_key()%>')"><%=tempDto.getTeam_name()%></a></td>
									<td><%=tempDto.getTeam_city()%></td>
									<td><%=tempDto.getTeam_num()%></td>
									<td><%=tempDto.getTeam_fee()%></td>
									<td><%if(tempDto.getTeam_recruit_yn().equals("1")){ %>모집중<%} else {%>모집마감<%} %></td>
									<td><%if(tempDto.getMembership_role().equals("1")){ %>감독<%} else {%>팀원<%} %></td>
									<td><%=tempDto.getTeam_fdate()%></td>
								</tr>
									<% }}} else { %>
								<tr>
									<td colspan="7"><div class="title" >아직 소속된 팀이 없습니다. <a href="${pageContext.request.contextPath}/team/main" class="link"> >> 팀 구경하러 가기 << </a></div></td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
					<%
					for (TeamDto tempDto : teamList) {
					if( tempDto.getMembership_role().equals("1") ) { %>
					<hr />
					
					<h3>가입 신청내역</h3>
					<div class="table-wrapper">
						<table>
							<colgroup>
								<col width="5%" />
								<col width="13%" />
								<col width="13%" />
								<col width="*" />
								<col width="15%" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>선호 포지션</th>
									<th>자기소개</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
							<%
								List<TeamjoinDto> teamjoinlist = (List<TeamjoinDto>) request.getAttribute("teamjoinlist");
								if( !teamjoinlist.isEmpty()) {
								for (TeamjoinDto joinDto : teamjoinlist) {
									if( joinDto.getTeamjoin_proc().equals("1")) {
								%>
								<tr>
									<td><%=joinDto.getTeamjoin_key()%></td>
									<td><%=joinDto.getUser_name()%></td>
									<td><%=joinDto.getUser_position()%></td>
									<td class="introduction"><%=joinDto.getUser_intro()%></td>
									<td><button href="javascript:void(0)" type="button"
										style="line-height: 0; padding: 1rem; height: auto;" onclick="teamjoinAccept('<%=joinDto.getUser_key()%>',<%=joinDto.getTeam_key()%>)">승인</button>
										<button type="button"
										style="line-height: 0; padding: 1rem; height: auto;" onclick="teamjoinRefuse()">거절</button></td>
								</tr>
								<%}else { %>
								<tr>
									<td colspan="6"><div class="title" >아직 가입을 신청한 사람이 없습니다. </div></td>
								</tr>
								<%} }} %>
							</tbody>
						</table>
					</div>
					
					<hr />
					
					<h3>가입 승인 내역</h3>
					<div class="table-wrapper">
						<table>
							<colgroup>
								<col width="5%" />
								<col width="13%" />
								<col width="13%" />
								<col width="*" />
								<col width="13%" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>선호 포지션</th>
									<th>자기소개</th>
									<th>퇴출여부</th>
								</tr>
							</thead>
							<tbody>
							<%
								List<TeamjoinDto> teamjoinedlist = (List<TeamjoinDto>) request.getAttribute("teamjoinlist");
								if( !teamjoinedlist.isEmpty()) {
								for (TeamjoinDto joinedDto : teamjoinedlist) {
									if( joinedDto.getTeamjoin_proc().equals("2")) {
								%>
								<tr>
									<td><%=joinedDto.getTeamjoin_key()%></td>
									<td><%=joinedDto.getUser_name()%></td>
									<td><%=joinedDto.getUser_position()%></td>
									<td class="introduction"><%=joinedDto.getUser_intro()%></td>
									<td>
										<button type="button"
										style="line-height: 0; padding: 1rem; height: auto;" onclick="teamjoinRefuse()">퇴출</button></td>
								</tr>
								<%}else { %>
								<tr>
									<td colspan="4"><div class="title" >아직 가입을 승인한 사람이 없습니다. </div></td>
								</tr>
								<%} }} %>
							</tbody>
						</table>
					</div>

					<hr />

					<h3>탈퇴 신청내역</h3>
					<div class="table-wrapper">
						<table>
							<colgroup>
								<col width="5%" />
								<col width="13%" />
								<col width="13%" />
								<col width="*" />
								<col width="13%" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>포지션</th>
									<th>자기소개</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<%
								List<TeamjoinDto> teamoutlist = (List<TeamjoinDto>) request.getAttribute("teamjoinlist");
								if( !teamoutlist.isEmpty()) {
								for (TeamjoinDto teamOutDto : teamoutlist) {
									if( teamOutDto.getTeamjoin_proc().equals("3")) {
								%>
								<tr>
									<td><%=teamOutDto.getTeamjoin_key()%></td>
									<td><%=teamOutDto.getUser_name()%></td>
									<td><%=teamOutDto.getUser_position()%></td>
									<td class="introduction"><%=teamOutDto.getUser_intro()%></td>
									<td><button href="javascript:void(0)" type="button"
										style="line-height: 0; padding: 1rem; height: auto;" onclick="teamjoinAccept('<%=teamOutDto.getUser_key()%>',<%=teamOutDto.getTeam_key()%>)">승인</button>
										<button type="button"
										style="line-height: 0; padding: 1rem; height: auto;" onclick="teamjoinRefuse()">거절</button></td>
								</tr>
								<%} else { %>
								<tr>
									<td colspan="6"><div class="title" >아직 탈퇴를  신청한 사람이 없습니다. </div></td>
								</tr>
								<%}}} %>
							</tbody>
						</table>
					</div>
					
					<hr />

					<h3>탈퇴 승인 내역</h3>
					<div class="table-wrapper">
						<table>
							<colgroup>
								<col width="5%" />
								<col width="13%" />
								<col width="13%" />
								<col width="*" />
								<col width="13%" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>포지션</th>
									<th>자기소개</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<%
								List<TeamjoinDto> outlist = (List<TeamjoinDto>) request.getAttribute("teamjoinlist");
								if( !outlist.isEmpty()) {
								for (TeamjoinDto outDto : outlist) {
									if( outDto.getTeamjoin_proc().equals("5")) {
								%>
								<tr>
									<td><%=outDto.getTeamjoin_key()%></td>
									<td><%=outDto.getUser_name()%></td>
									<td><%=outDto.getUser_position()%></td>
									<td class="introduction"><%=outDto.getUser_intro()%></td>
									<td>완료</td>
								</tr>
								<%}else { %>
								<tr>
									<td colspan="6"><div class="title" >아직 탈퇴를 승인한 사람이 없습니다. </div></td>
								</tr>
								<%}}} %>
							</tbody>
						</table>
					</div>
							<hr />
					
					<h3>가입 내역</h3>
					<div class="table-wrapper">
						<table>
							<colgroup>
								<col width="5%" />
								<col width="13%" />
								<col width="13%" />
								<col width="*" />
								<col width="13%" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>선호 포지션</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
							<%
								List<TeamjoinDto> joinedlist = (List<TeamjoinDto>) request.getAttribute("teamjoinlist");
								if( !joinedlist.isEmpty()) {
								for (TeamjoinDto joinedDto : joinedlist) {
									if( joinedDto.getTeamjoin_proc().equals("1")) {
								%>
								<tr>
									<td><%=joinedDto.getTeamjoin_key()%></td>
									<td><%=joinedDto.getUser_name()%></td>
									<td><%=joinedDto.getUser_position()%></td>
									<td class="introduction"><%=joinedDto.getUser_intro()%></td>
									<td>
										<button type="button"
										style="line-height: 0; padding: 1rem; height: auto;" onclick="teamjoinRefuse()">퇴출</button></td>
								</tr>
								<%}else { %>
								<tr>
									<td colspan="4"><div class="title" >감독이 가입 승인을 고려중입니다. 조금만 기다려주세요. </div></td>
								</tr>
								<%} }} %>
							</tbody>
						</table>
					</div>
					<%}else {%>
					<hr />
					
					<h3>가입 신청내역</h3>
					<div class="table-wrapper">
						<table>
							<colgroup>
								<col width="5%" />
								<col width="13%" />
								<col width="13%" />
								<col width="*" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>선호 포지션</th>
									<th>자기소개</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
							<%
								List<TeamjoinDto> teamjoinlist = (List<TeamjoinDto>) request.getAttribute("teamjoinlist");
								if( !teamjoinlist.isEmpty()) {
								for (TeamjoinDto joinDto : teamjoinlist) {
									if( joinDto.getTeamjoin_proc().equals("2")) {
								%>
								<tr>
									<td><%=joinDto.getTeamjoin_key()%></td>
									<td><%=joinDto.getUser_name()%></td>
									<td><%=joinDto.getUser_position()%></td>
									<td class="introduction"><%=joinDto.getUser_intro()%></td>
								</tr>
								<%} }%>
								
								<tr>
									<td colspan="6"><div class="title" >아직 가입을 신청한 팀이 없습니다. </div></td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
					<% }  }%>
				</section>
			</article>
			</form>
			<!-- Footer -->
			<%@include file="../include/footer.jsp"%>
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
		function teamjoinAccept( uk, tk ) {
			var delConfirm = confirm("팀 가입을 승인하시겠습니까?");
			if (delConfirm) {
				$.ajax({
					url: "${ commonURL }/member/teamAccept",
					data:{ user_key: uk, team_key: tk },
					dataType: "json",
					type: "POST"
				})
				.done( (data)=>{
					alert("팀 가입을 승인했습니다.");
					location.href="${ commonURL }/member/teamdetail";
				})
				.fail( (error) => {
					alert("팀 가입 승인 실패, 관리자에게 문의해주세요.");
				})
			}
		}
		
		function teamjoinRefuse( uk, tk  ){
			var delConfirm = confirm("팀 가입을 거절하시겠습니까?");
			if (delConfirm) {
				$.ajax({
					url: "${ commonURL }/member/teamRefuse",
					data:{ user_key: uk, team_key: tk },
					dataType: "json",
					type: "POST"
				})
				.done( (data)=>{
					alert("팀 가입을 거절했습니다.");
					location.href="${ commonURL }/member/teamdetail";
				})
				.fail( (error) => {
					alert("팀 가입 거절 실패, 관리자에게 문의해주세요.");
				})
			}
		}
	</script>

</body>
</html>