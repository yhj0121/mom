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
		List<LineupPlayerDto> playersInTeam = (List<LineupPlayerDto>)request.getAttribute("lineupPlayerList");
		String team_key = (String)request.getAttribute("team_key");
		%>
			      
          <section>
			<h1>라인업 수정</h1>
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
							<td>
								<select id="positionList" name="positionList">
									<option id="positionList_opt" value="NN">원하는 포지션을 선택해주세요.</option>
								</select>
							</td>
							<td>
								<select id="<%=i%>>" name="playerList" onChange="onPlayerSelectChanged(this.id)">
									<option id="playerList_opt" value="NN">원하는 선수를 선택해주세요.</option>
								</select>
							</td>
							<td><%=name%></td>
<%-- 							<a href="#none" onclick="goPlayerInfo('<%=lineups.get(i).getUser_key()%>')"><%=id%></a> --%>
						</tr>
					<%
					}
					%>
					</tbody>
				</table>
			</div>
			
			<div class="container mt-3" style="text-align:right;">
            	<a href="<%=request.getContextPath()%>/lineup/modify" class="btn btn-secondary">저장</a>
          	</div>
          
		</section>
          
	</div>
</body>
</html>



<script>
let playerSelectList;

$(()=>{
	positionSelectListInit();
	playerSelectListInit();
})

function goPlayerInfo(id)
{
	let frm = document.myform;
	frm.id.value=id;
	frm.method="get";
    frm.action="${pageContext.request.contextPath}/lineup/lineup_playerinfo";
	frm.submit();
}

function goSave()
{
	//저장하면 info페이지로 이동
	let frm = document.myform;
	frm.id.value=id;
	frm.method="get";
    frm.action="${pageContext.request.contextPath}/lineup/lineup_playerinfo";
	frm.submit();
}

function positionSelectListInit(){
	
// 	console.log("getPositionList()");
	
	$.ajax({
		url: "${commonURL}/member/selectPosition",
		contentType: false,
		processData: false,
		type: "POST"
	})
	.done( (result) => {
	    let selects = document.getElementsByName("positionList")
// 	    console.log(selects.length);
	    
		for(select of selects)
    	{
	    	//select.append(data);
	    	for(item of result)
	    		select.options[select.options.length] = new Option(item.position, item.position);
    	}
	})
	.fail( (error) => {
		alert("정보 가져오기 실패");
	})
}

function playerSelectListInit()
{
<%-- 	console.log("getPlayerList().team_key : " + <%=team_key%>); --%>
	
	$.ajax({
		url: "${commonURL}/lineup/modify/getPlayerList",
		data:{team_key:<%=team_key%>},
		type: "POST",
		dataType:"JSON"
	})
	.done( (result) => {
		playerSelectList = document.getElementsByName("playerList")
  
		for(select of playerSelectList)
    	{
	    	for(item of result)
	    		select.options[select.options.length] = new Option(item.user_id, item.user_id);

	    	select.options[select.options.length] = new Option("용병", "용병");
    	}
	})
	.fail( (error) => {
		alert("정보 가져오기 실패");
	})
}

function onPlayerSelectChanged(id)
{
// 	console.log("onPlayerSelectChanged.id: " + id);
	
	for(select of playerSelectList)
	{
		if(select.id != id)
		{
			if(select.value ==  playerSelectList[parseInt(id)].value)
			{
				select.value = select.options[0].value;
			}
		}
	}
}
</script>