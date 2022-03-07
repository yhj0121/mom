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
			      
          <section>
			<h1>라인업 수정</h1>
			<div class="table-wrapper">
				<table id="tb" class="alt">
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
					%>
						<tr>
							<td><%=curRowNum+1%></td>
							<td>
								<select id="positionList" name="positionList">
									<option id="positionList_opt">원하는 포지션을 선택해주세요.</option>
								</select>
							</td>
							<td>
								<select id="<%=curRowNum%>" name="playerList" onChange="onPlayerSelectChanged(this.id)">
									<option id="playerList_opt">원하는 선수를 선택해주세요.</option>
								</select>
							</td>
							<td> <a id = "playerName<%=curRowNum%>" name="playerName" href ="#none"></a> </td>
<%-- 							<a href="#none" onclick="goPlayerInfo('<%=lineups.get(i).getUser_key()%>')"><%=id%></a> --%>
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
					%>
						<tr>
							<td>후보</td>
							<td>
								<select id="positionList" name="positionList">
									<option id="positionList_opt">원하는 포지션을 선택해주세요.</option>
								</select>
							</td>
							<td>
								<select id="<%=curRowNum%>" name="playerList" onChange="onPlayerSelectChanged(this.id)">
									<option id="playerList_opt">원하는 선수를 선택해주세요.</option>
								</select>
							</td>
							<td> <a id = "playerName<%=curRowNum%>" name="playerName" href ="#none"></a> </td>
<%-- 							<a href="#none" onclick="goPlayerInfo('<%=lineups.get(i).getUser_key()%>')"><%=id%></a> --%>
						</tr>
					<%
						curRowNum++;
					}
					%>
					</tbody>
				</table>
			</div>
			
			<div class="container mt-3" style="text-align:right;">
            	<button  type="button" class="btn btn-secondary" onclick="test()">테스트</a>
          	</div>
          	
			<div class="container mt-3" style="text-align:right;">
            	<a href="<%=request.getContextPath()%>/lineup/modify" class="btn btn-secondary">저장</a>
          	</div>
          
		</section>
          
	</div>
</body>
</html>



<script>

let game_key = <%=(String)request.getAttribute("game_key")%>;
let team_key = <%=(String)request.getAttribute("team_key")%>;
let team_side = <%=(String)request.getAttribute("team_side")%>;

let tr_length = $('#tb tr').length-1;//맨위 테이블 행은 빼줘야한다.
let tab_td = $('#tb td');//tb 테이블의 td들 불러오기
let maxColumn;

let playerSelectList;
let playerDictionary = {};

$(()=>{
	maxColumn = tab_td.length / tr_length;
	
	positionSelectListInit();
	playerDictionaryInit(loadLineup);
})

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
	    	for(item of result)
	    		select.options[select.options.length] = new Option(item.position, item.position);
    	}
	})
	.fail( (error) => {
		alert("정보 가져오기 실패");
	})
}

function playerDictionaryInit(callback)
{
	$.ajax({
		url: "${commonURL}/lineup/modify/getPlayerList",
		data:{team_key: team_key},
		type: "POST",
		dataType:"JSON"
	})
	.done( (result) => {
		
		for(item of result)
		{
			playerDictionary[item.user_id] = item;
		}
// 		for(key of Object.keys(playerDictionary)){
// 			console.log(key);
// 		}	

		playerSelectListInit(callback);
	})
	.fail( (error) => {
		alert("정보 가져오기 실패");
	})
}

function playerSelectListInit(callback)
{
	playerSelectList = document.getElementsByName("playerList")
	  
	for(select of playerSelectList)
	{
		//select.options[select.options.length] = new Option("원하는 선수를 선택해주세요.", select.options.length);
		
 		for(key of Object.keys(playerDictionary)){
 			select.options[select.options.length] = new Option(key, key);
 		}
    	
    	select.options[select.options.length] = new Option("용병", "용병");
	}
	
	callback();
}

function onPlayerSelectChanged(id)
{
 	//console.log("onPlayerSelectChanged.id: " + id);

	let selectedUserId = playerSelectList[parseInt(id)].value;
	let nameTdIdx = id * maxColumn + (maxColumn - 1);
	
	if(playerDictionary.hasOwnProperty(selectedUserId))
	{
		//새롭게 선택한곳에 유저 아이디 넣기.
	    tab_td.eq(nameTdIdx).text(playerDictionary[selectedUserId].user_name);
			    
		for(select of playerSelectList)
		{
			if(select.id != id)
			{
				//기존에 있던 유저아이디, 유저이름 제거
				if(select.value ==  selectedUserId)
				{
					select.value = select.options[0].value;
				    nameTdIdx = select.id * maxColumn + (maxColumn - 1);
				    tab_td.eq(nameTdIdx).text("");
				    break;
				}
			}
		}
	}
	else
	{
		tab_td.eq(nameTdIdx).text("");
	}
}

function loadLineup(){
	<%
	for(int i =0; i <lineups.size(); i++)
	{
		String id = lineups.get(i).getPlayerDto().getUser_id();
		if(id == "")
			id = "원하는 선수를 선택해주세요.";
		String name = lineups.get(i).getPlayerDto().getUser_name();
		String position = lineups.get(i).getCode_key();
		if(position == "")
			position = "원하는 포지션을 선택해주세요.";
	%> 
<%-- 		console.log("<%=name%>"); --%>
		$("select[name=positionList]").eq(<%=i%>).val("<%=position%>").prop("selected", true);
		$("select[name=playerList]").eq(<%=i%>).val("<%=id%>").prop("selected", true);
		$("[name=playerName]").eq(<%=i%>).text("<%=name%>");
<%-- 		console.log($("[name=playerName]").eq(<%=i%>).text()); --%>
		
	<%
	}
	%>
}

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
</script>