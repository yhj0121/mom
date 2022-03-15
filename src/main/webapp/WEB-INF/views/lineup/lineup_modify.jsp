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
		
		<%
		GameDto gameDto = (GameDto)request.getAttribute("gameDto");
// 		System.out.println("modify.jsp/ gamekey : " + gameDto.getGame_key());
		List<LineupDto> lineups = (List<LineupDto>)request.getAttribute("lineupList");
		%>
		
		<article class="post" style="overflow:unset">
				<header>
					<div class="title">
						<h2>
							<a href="#">라인업 수정</a>
						</h2>
						<p>감독 권한으로 출전 라인업을 수정/저장 하는 페이지</p>
					</div>
					<div class="meta">
						<a href="#" class="logo"><img
							src="${pageContext.request.contextPath}/resources/images/lineup_icon.png"
							alt="" /></a>
					</div>
				</header>
				
      	<form name="myform">
      		<input type="hidden" name="game_key" id="game_key" value="<%=gameDto.getGame_key()%>"/>
			<input type="hidden" name="team_key" id="team_key" value="<%=gameDto.getTeam_key()%>"/>
			<input type="hidden" name="team_side" id="team_side" value="<%=gameDto.getTeam_side()%>"/> 
			
          <section>
			<div class="table-wrapper">
				
				<select id="formation" name="formation" onChange="onFormationChanged()" style="width:250px; margin-left:31%;"> 
					<option id="formation_opt">원하는 포메이션을 선택하세요.</option>
				</select>
				<br/>

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
					%>
						<tr>
							<td><%=curRowNum+1%></td>
							<td>
								<select id="positionList<%=curRowNum%>" name="positionList">
									<option id="positionList_opt">원하는 포지션을 선택해주세요.</option>
								</select>
							</td>
							<td>
								<select id="<%=curRowNum%>" name="playerList" onChange="onPlayerSelectChanged(this.id)">
									<option id="playerList_opt">원하는 선수를 선택해주세요.</option>
								</select>
							</td>
							<td> <a id = "playerName<%=curRowNum%>" name="playerName" href ="#none"></a> </td>
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
					%>
						<tr>
							<td>후보</td>
							<td>
								<select id="positionList<%=curRowNum%>" name="positionList">
									<option id="positionList_opt">원하는 포지션을 선택해주세요.</option>
								</select>
							</td>
							<td>
								<select id="<%=curRowNum%>" name="playerList" onChange="onPlayerSelectChanged(this.id)">
									<option id="playerList_opt">원하는 선수를 선택해주세요.</option>
								</select>
							</td>
							<td> <a id = "playerName<%=curRowNum%>" name="playerName" href ="#none"></a> </td>
						</tr>
					<%
						curRowNum++;
					}
					%>
					</tbody>
				</table>
			</div>
			
			<div class="container mt-3" style="text-align:right;">
				<button class="button large previous" type="button" onclick="goLineupInfo()">뒤로가기</button>
            	<button  type="button" class="button large icon solid fa-save" onclick="saveLineup()">저장</button>
          	</div>
             
		</section>
       </form>
      </article>
      
      <!-- Footer -->
	  <%@include file="../include/footer.jsp"%>
		
	</div>
</body>
</html>



<script>

// let tr_length = $('#tb tr').length-1;//맨위 테이블 행은 빼줘야한다.
// let tab_td = $('#tb td');//tb 테이블의 td들 불러오기
// let maxColumn = Math.ceil((tab_td.length-1) / tr_length);

const formationNames=["4-4-2", "4-3-3", "4-2-4"];
const formationPositions=[
	["GK", "RB", "CB", "CB", "LB", "CDM", "CM", "CM", "CAM", "ST", "ST"],
	["GK", "RB", "CB", "CB", "LB", "CDM", "CM", "CM", "RW", "ST", "LW"],
	["GK", "RB", "CB", "CB", "LB", "CM", "CM", "RW", "ST", "ST", "LW"]
];

let formationSelect;
let positionSelectList;
let playerSelectList;
let playerDictionary = {};

$(()=>{
	initPositionSelectList(()=>{
		initPlayerDictionary(()=>{
			loadLineup();
			initFormation();	
		});
	});
})

function initPositionSelectList(callback){
	
 	//console.log("getPositionList()");
	
	$.ajax({
		url: "${commonURL}/member/selectPosition",
		contentType: false,
		processData: false,
		type: "POST"
	})
	.done( (result) => {
		//console.log("getPositionList().result.length: " + result.length); 
		positionSelectList = document.getElementsByName("positionList")
 	    //console.log(positionSelectList.length); 
		for(select of positionSelectList)
    	{
	    	for(item of result)
	    		select.options[select.options.length] = new Option(item.position, item.position);
    	}
		
		callback();
	})
	.fail( (error) => {
		alert("정보 가져오기 실패");
	})
}

function initPlayerDictionary(callback)
{
	$.ajax({
		url: "${commonURL}/lineup/modify/getPlayerList",
		data:{team_key: <%=membershipDto.getTeam_key()%>},
		type: "POST",
		dataType:"JSON"
	})
	.done( (result) => {
		
		if(result.length == 0)
			return;
		
		for(item of result)
		{
			playerDictionary[item.user_id] = item;
		}
// 		for(key of Object.keys(playerDictionary)){
// 			console.log(key);
// 		}	

		initPlayerSelectListInit(callback);
	})
	.fail( (error) => {
		alert("정보 가져오기 실패");
	})
}

function initPlayerSelectListInit(callback)
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

 	if(playerDictionary.hasOwnProperty(selectedUserId))
 	{
 		//새롭게 선택한곳에 유저 아이디 넣기.
 		$("#playerName"+id).text(playerDictionary[selectedUserId].user_name);
 		addPlayerNameClickEvent(id, playerDictionary[selectedUserId].user_key);
 		
 		//기존에 있던 유저아이디, 유저이름 제거
 		let i = 0;
 		for(select of playerSelectList)
 		{
 			if(select.id != id)
			{
				if(select.value ==  selectedUserId)
				{
					select.value = select.options[0].value;
					$("#playerName"+i).text("");
					positionSelectList[i].value = positionSelectList[i].options[0].value; 
				}
			}
 			i++;
 		}
 	}
	else
	{
		$("#playerName"+id).text("");
	}
}

function loadLineup(){
	<%
	for(int i =0; i <lineups.size(); i++)
	{
		LineupDto lineup = lineups.get(i);
		int idx = Integer.valueOf(lineup.getLineup_index());
		String name = lineup.getPlayerDto().getUser_name();
		String userkey = lineup.getPlayerDto().getUser_key();
	%> 
	
		position = "<%=lineup.getCode_key()%>";
		if(position == "")
			$("#positionList<%=i%> option:eq(0)").attr("selected", "selected");
		else
			$("#positionList<%=i%>").val(position).attr("selected", "selected");

		playerId = "<%=lineup.getPlayerDto().getUser_id()%>";
		mercenary_state = "<%=lineup.getMercenary_state()%>";	//1.팀원 2.용병 3.빈칸
		if(mercenary_state == "1") 
			$("#<%=i%>").val(playerId).attr("selected", "selected");
		else if(mercenary_state == "2")
			$("#<%=i%>").val("용병").attr("selected", "selected");
		else
			$("#<%=i%> option:eq(0)").attr("selected", "selected");	
			
<%-- 		$("select[name=playerList]").eq(<%=idx%>).val("<%=id%>").prop("selected", true); --%>
		$("[name=playerName]").eq(<%=idx%>).text("<%=name%>");
		addPlayerNameClickEvent(<%=idx%>, <%=userkey%>);
	<%
	}
	%>
}

function addPlayerNameClickEvent(idx, player_key)
{
	$("#playerName"+idx).on("click", function() {
		openPlayerInfo(player_key);
    });
}

function openPlayerInfo(player_key)
{
	console.log("info.player_key : " + player_key);
	if(player_key == "")
		return;
	
	let url = "${commonURL}/lineup/userInfo?user_key=" + player_key;
	
	const popupWidth = 700;
	const popupHeight = 800;  
	const popupX = (window.screen.width / 2) - (popupWidth / 2);
	const popupY= (window.screen.height / 2) - (popupHeight / 2);
	window.open(url, 'content', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
}


function initFormation()
{	
	formationSelect = document.getElementById("formation");	
   	for(item of formationNames)
   		formationSelect.options[formationSelect.options.length] = new Option(item, item);
}

function onFormationChanged()
{
	//console.log ($("#formation").val());
	//console.log ($("#formation option").index($("#formation option:selected")));
	let idx = $("#formation option").index($("#formation option:selected")) - 1;
	if(idx >= 0)
	{
		let i = 0;
		for(item of formationPositions[idx])
		{
			//console.log(item); 
			$("#positionList"+i).val(item).attr("selected", "selected");
			i++;
		}
	}
}

function saveLineup()
{
	//LINEUP_KEY 오토인크리먼트라 필요없음.	
// 	USER_KEY 	// playerSelectList에서 선택된 아이디 값 으로 playerDictionary에서 LineupPlayerDto.user_key 가져오기
// 	TEAM_KEY	// request.getAttributre 한것 있음.
// 	GAME_KEY	// request.getAttributre 한것 있음.
// 	CODE_KEY	//positionSelectList에서 선택된 값들 가져오기.
// 	TEAM_SIDE	// request.getAttributre 한것 있음.
// 	MERCENARY_STATE	// 직접 넣어줄것	

	let newLineupList = [];
	
 	let i = 0;
 	for(playerSelect of playerSelectList)
 	{
 		let lineup = {};
 		
 		let id = playerSelect.value;
 		lineup.user_key = "";
 		lineup.mercenary_state = "3"; 	//1.팀원 2.용병 3.빈칸
 		
		if(playerDictionary.hasOwnProperty(id))
		{
			lineup.user_key = playerDictionary[id].user_key;
			lineup.mercenary_state = "1";	
		}
		
		if(playerSelect.value == "용병")
			lineup.mercenary_state = "2";	
		
		lineup.code_key = "";
 		//console.log( i + ".positionSelectList[i].selectedIndex : " + positionSelectList[i].selectedIndex);
 		if(positionSelectList[i].selectedIndex > 0)
 			lineup.code_key = positionSelectList[i].value;
 		
 		lineup.team_key = $("#team_key").val();
 		lineup.game_key = $("#game_key").val(); 	
 		console.log("team_side: " + $("#team_side").val());
 		lineup.team_side = $("#team_side").val();
 		lineup.lineup_index = i;
 		
		newLineupList.push(lineup);
 		i++;
 	}
	
	console.table(newLineupList);
	//console.log(JSON.stringify(newLineupList));
	$.ajax({
		url:"${commonURL}/lineup/modify/save",
		data: {"newLineupList": JSON.stringify(newLineupList)},
		type:"POST",
		dataType:"json",
		success : function(data){
			console.log("ajax. send success : " + data);
		},
		error : function(request, status, error){ 
			console.log("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error); 
		}

	})
	.done((result)=>{
		//console.log(result);
		alert("성공적으로 저장되었습니다.");
		goLineupInfo();
	})
	.fail((error)=>{
		console.log(error);
	})
}

function goLineupInfo()
{
	let frm = document.myform;
	frm.method="get";
    frm.action="${commonURL}/lineup/info";
	frm.submit();
}


</script>