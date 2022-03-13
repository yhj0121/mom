<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mom.momhome.lineup.*" %>
<%@ page import="com.mom.momhome.game.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<!-- 	<link rel="stylesheet" href="../resources/assets/css/main.css" /> -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	
	<title>Insert title here</title>
	
<style>
	@media(min-width:700px)
	{
		table{
			width:700px !important;
		}
	}
	
	table{
		margin-bottom:0 !important;
	}
	
	table thead tr th{
		text-align: center;
	}
	td {
 		text-align: center;
 		padding:0 !important;
	}
	hr{
		padding:0 !important;
		margin-top:5px !important;
		margin-bottom:5px !important;
	}
</style>

</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="main">

		<!-- Header -->
		<%@include file="../include/nav.jsp"%>
		
		<article class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">라인업</a>
						</h2>
						<p>게임에서 쓰일 라인업을 볼 수 있는 페이지</p>
					</div>
					<div class="meta">
						<a href="#" class="logo"><img
							src="${pageContext.request.contextPath}/resources/images/lineup_icon.png"
							alt="" /></a>
					</div>
				</header>
				
		<%
		GameDto gameDto = (GameDto)request.getAttribute("gameDto");
		String gameJoinResult = StringUtil.nullToValue((String)request.getAttribute("gameJoinResult"), "");
		
		List<LineupDto> lineups = (List<LineupDto>)request.getAttribute("lineupList");
		Map<Integer, LineupDto> lineupDic = new HashMap<Integer, LineupDto>();
		for(int i = 0; i < lineups.size(); i++)
		{
			lineupDic.put(Integer.valueOf(lineups.get(i).getLineup_index()), lineups.get(i));	
		}
		%>
			  
	    <form name="myform"> 	
			<input type="hidden" name="game_key" id="game_key" value="<%=gameDto.getGame_key()%>"/>
			<input type="hidden" name="team_key" id="team_key" value="<%=gameDto.getTeam_key()%>"/>
			<input type="hidden" name="team_side" id="team_side" value="<%=gameDto.getTeam_side()%>"/> 
	          <section>
				<div class="table-wrapper"> 
					<table class="alt" style="width:700px; margin-left:auto; margin-right:auto;"> 
						<colgroup>
							<col width="10%">
							<col width="16%">
							<col width="*">      
							<col width="30%">
						</colgroup>
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
							String mercenary_state = "";
							
							if(lineupDic.containsKey(curRowNum))
							{
								LineupDto lineup = lineupDic.get(curRowNum);
								player_key = lineup.getUser_key();
								position = lineup.getCode_key();
								mercenary_state = lineup.getMercenary_state();
								
								if(mercenary_state.equals("1"))
								{
									id = lineup.getPlayerDto().getUser_id();
									name = lineup.getPlayerDto().getUser_name();
								}
								else if(mercenary_state.equals("2"))
									id = "용병";
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
						</tbody>
				</table>
						
						<!-- 					<tr>  -->
<!-- 						<td colspan="999" class="text-center"> -->
							<hr style="border: dashed 1px; width:700px; margin-left:auto; margin-right:auto;">
<!-- 						</td> -->
<!-- 					</tr> -->

				<table class="alt" style="width:700px; margin-left:auto; margin-right:auto;"> 
						<colgroup>
							<col width="10%">
							<col width="16%">
							<col width="*">      
							<col width="30%">
						</colgroup>
					<tbody>
					<%
						for(int i =0; i<maxBenchCount; i++)
						{
							String id = "";
							String name = "";
							String position = "";
							String player_key = "";
							String mercenary_state = "";
							
							if(lineupDic.containsKey(curRowNum))
							{
								LineupDto lineup = lineupDic.get(curRowNum);
								player_key = lineup.getUser_key();
								position = lineup.getCode_key();
								mercenary_state = lineup.getMercenary_state();
								
								if(mercenary_state.equals("1"))
								{
									id = lineup.getPlayerDto().getUser_id();
									name = lineup.getPlayerDto().getUser_name();
								}
								else if(mercenary_state.equals("2"))
									id = "용병";
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
					<%
// 					System.out.println("membershipDto.getTeam_key() : " + membershipDto.getTeam_key());
// 					System.out.println("gameDto.getTeam_key(): " + gameDto.getTeam_key());
// 					System.out.println("membershipDto.getTeam_key() : " + membershipDto.getTeam_key());
					if(membership_role.equals("1"))
					{
						if( (membershipDto.getTeam_key().equals(gameDto.getTeam_key()) && gameDto.getTeam_side().equals("1")) || (gameJoinResult.equals("2") && gameDto.getTeam_side().equals("2")) )
						{%>	
		            		<button class="button large next" type="button" onclick="goModify()">수정</button> 
						<%}
		          	}
		          	%>
	          	</div>
	          	
			</section>
			</article>
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