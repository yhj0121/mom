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
	<link rel="stylesheet" href="../resources/assets/css/main.css" />
	<title>Insert title here</title>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<%@include file="../include/nav.jsp"%>
		
		<%
		List<LineupDto> lineups = (List<LineupDto>)request.getAttribute("lineupList");
		%>
			      
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
					
					for(int i =0; i<11; i++)
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
            	<a href="<%=request.getContextPath()%>/lineup/modify" class="btn btn-secondary">수정</a>
          	</div>
          
		</section>
          
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

</script>