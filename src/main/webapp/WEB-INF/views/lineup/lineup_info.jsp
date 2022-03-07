<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mom.momhome.lineup.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<!-- 	<link rel="stylesheet" href="../resources/assets/css/main.css" /> -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	
	<title>Insert title here</title>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="main">

		<!-- Header -->
		<%@include file="../include/nav.jsp"%>
		
		<%
		List<LineupDto> lineups = (List<LineupDto>)request.getAttribute("lineupList");
		%>
			  
	    <form name="myform"> 	
			<input type="hidden" name="game_key" id="game_key" value="1"/> <!-- 로그인세션에서 팀키가져오자 -->
			<input type="hidden" name="team_key" id="team_key" value="1"/>
			<input type="hidden" name="team_side" id="team_side" value="1"/> 
          
	          <section>
				<h1>라인업</h1>
				<div class="table-wrapper">
					<table class="alt">
						<thead>
							<tr>
								<th>번호</th>
								<th>포지션</th>
								<th>아이디</th>
								<th>이름</th>
								
							</tr>
						</thead>
						<tbody>
						<%
						int maxLineupCount = 11;
						for(int i =0; i<maxLineupCount; i++)
						{
							String id = lineups.get(i).getPlayerDto().getUser_id();
							String name = lineups.get(i).getPlayerDto().getUser_name();
							String position = lineups.get(i).getCode_key();
						%>
							<tr>
								<td><%=(i+1)%></td>
								<td><%=position%></td>
								<td><a href="#none" onclick="goPlayerInfo('<%=lineups.get(i).getUser_key()%>')"><%=id%></a></td>
								<td><%=name%></td>
							</tr>
						<%
						}
						%>
						</tbody>
					</table>
				</div>
				
				<div class="container mt-3" style="text-align:right;">
	            	<button class="btn btn-success" type="button" onclick="goModify()">수정</button>
	          	</div>
	          	
			</section>
		</form>
	</div>
</body>
</html>

<script>
function goPlayerInfo(id)
{
	let frm = document.myform;
	frm.id.value=id;
	frm.method="get";
    frm.action="${pageContext.request.contextPath}/lineup/lineup_playerinfo";
	frm.submit();
}

function goModify()
{
	let frm = document.myform;
// 	frm.game_key.value= $("#game_key").val();
// 	frm.team_key.value= $("#team_key").val();
	frm.method="get";
 	frm.action="${pageContext.request.contextPath}/lineup/modify";
	frm.submit();
}

</script>