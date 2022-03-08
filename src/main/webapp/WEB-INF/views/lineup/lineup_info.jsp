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
		Map<Integer, LineupDto> lineupDic = new HashMap<Integer, LineupDto>();
		for(int i = 0; i < lineups.size(); i++)
		{
			lineupDic.put(Integer.valueOf(lineups.get(i).getLineup_index()), lineups.get(i));	
		}
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
						int curRowNum = 0;
						for(int i =0; i<maxRegularCount; i++)
						{
							String id = "";
							String name = "";
							String position = "";
							String player_key = "";
							
							if(lineupDic.containsKey(curRowNum))
							{
								
								id = lineupDic.get(curRowNum).getPlayerDto().getUser_id();
								name = lineupDic.get(curRowNum).getPlayerDto().getUser_name();
								position = lineupDic.get(curRowNum).getCode_key();
								player_key = lineupDic.get(curRowNum).getUser_key();
							}
						%>
							<tr>
								<td><%=(curRowNum+1)%></td>
								<td><%=position%></td>
								<td><a href="#none" onclick="goPlayerInfo('<%=player_key%>')"><%=id%></a></td>
								<td><%=name%></td>
							</tr>
						<%
							curRowNum++;
						}
						%>
						
					
					<tr> 
						<td colspan="999" class="text-center">
							<hr style="border: dashed 1px;">
						</td>
					</tr>
					
					<%
						for(int i =0; i<maxBenchCount; i++)
						{
							String id = "";
							String name = "";
							String position = "";
							String player_key = "";
							if(lineupDic.containsKey(curRowNum))
							{
								id = lineupDic.get(curRowNum).getPlayerDto().getUser_id();
								name = lineupDic.get(curRowNum).getPlayerDto().getUser_name();
								position = lineupDic.get(curRowNum).getCode_key();
								player_key = lineupDic.get(curRowNum).getUser_key();
							}
						%>
							<tr>
								<td>후보</td>
								<td><%=position%></td>
								<td><a href="#none" onclick="goPlayerInfo('<%=player_key%>')"><%=id%></a></td>
								<td><%=name%></td>
							</tr>
						<%
							curRowNum++;
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
	if(id == "")
		return;
	
	let frm = document.myform;
	frm.id.value=id;
	frm.method="get";
    frm.action="${pageContext.request.contextPath}/lineup/lineup_playerinfo";
	frm.submit();
}

function goModify()
{
	let frm = document.myform;
	frm.method="get";
 	frm.action="${pageContext.request.contextPath}/lineup/modify";
	frm.submit();
}

</script>