 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@page import="java.util.List" %>   
 <%@page import="com.mom.momhome.game.*" %>
<%@page import="com.mom.momhome.common.*" %>
    
<!DOCTYPE html>
<html>
<head>
		<title>경기 매칭 테이블</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../resources/assets/css/main.css" />
	</head>
	
<style>
.pagination {
    list-style:none;
    margin:0;
    padding:0;
    display:block;
    justify-content: center;
	margin:auto;
    text-align:center;
    
}

.page-item {
	margin: auto;
	padding: 10px;
    border : 0;
	display: inline-block;
}

.btn{
    display:block;
    width:80px;
    line-height:30px;
    text-align:center;
    background-color:#222;
    color:#fff;
}


</style>
<body>
				<%@include file="../include/nav.jsp"%>

<%
String key = StringUtil.nullToValue(request.getParameter("key"), "1");
String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
int totalCnt = (Integer)request.getAttribute("totalCnt");


%>

 

<form name="myform" method="get">
  								<input type="hidden" name="team_key" id="team_key" value="1"/>
							   	<input type="hidden" name="pg"  id="pg" value="<%=pg%>"/>
							   	<input type="hidden" name="key" id="key" value="<%=key%>"/>
							   	<input type="hidden" name="game_key" id="game_key" value=""/>
							   	
   			
							<h2 style="text-align:center; font-size:large;">게시판 목록(${totalCnt})</h2>	
							 	<div class="row gtr-uniform">
									<div class="col-3 col-6-xsmall">
											<select name="searchItem" id="searchItem">
												<option value="">- 선택하세요 -</option>
												<option value="1">제목</option>
												<option value="2">내용</option>
												<option value="3">제목+내용</option>
											</select>
									</div>
									<div class="col-7 col-12-xsmall">
											<input type="text" class="form-control" placeholder="검색어를 입력하세요"
								               name="keyword" id="keyword" value="<%=keyword%>">
								    </div>
								    <div class="col-2 col-4-xsmall">
								            <input type="button" style="width:100%" value="검색" onclick="goSearch()"/>
									</div>
								</div>
									<div class="table-wrapper">
										<table>
											<thead>
												<tr>
										             <th>번호</th>
													<th>제목</th>
													<th>내용</th>
													<th>지역</th>
													<th>날짜</th>
												</tr>
											</thead>
											<tbody>
											 <%
            
         									   List<GameDto> list = (List<GameDto>)request.getAttribute("boardList");
            								  for(GameDto tempDto : list){
          									  %>
          									  
          			
												<tr>
													<td><%=totalCnt - tempDto.getRnum()+1%></td>
													<td><a href="#none" onclick="goView('<%=tempDto.getGame_key()%>')"><%=tempDto.getGame_title()%></a></td>
													<td><%=tempDto.getGame_contents()%></td>
													<td><%=tempDto.getGame_location()%></td>
													<td><%=tempDto.getGame_fdate()%></td>
													
												</tr>
												            <%}%>
												
											</tbody>
										
										</table>
		
		
          
    </div>			
    
    			
</form>
 <div class="container mt-3">
      <a href="<%=request.getContextPath()%>/game/write" 
       class="btn">글쓰기</a>
          </div>
			

	<div class="container" style="display: flex; justify-content: center;">
				<%=Pager.makeTag(request,10,totalCnt) %>
				</div>
 			
       

<!-- Scripts -->
			<script src="../resources/assets/js/jquery.min.js"></script>
			<script src="../resources/assets/js/browser.min.js"></script>
			<script src="../resources/assets/js/breakpoints.min.js"></script>
			<script src="../resources/assets/js/util.js"></script>
			<script src="../resources/assets/js/main.js"></script>
			<script>
			function goSearch(){
			   let frm = document.myform;
				   frm.pg.value=0; 
				   frm.action = "<%=request.getContextPath()%>/game/list";
				   frm.method="get";
				   frm.submit();
				}

				function goPage(pg)
				{
					frm = document.myform;
					frm.pg.value=pg;
					frm.method="get";
					frm.action="${pageContext.request.contextPath}/game/list";
					frm.submit();
				}
				function goView(id)
				{
					frm = document.myform;
					frm.game_key.value=id;
					frm.method="get";
					frm.action="${pageContext.request.contextPath}/game/view";
					frm.submit();
				}
				function goWrite()
				{
					var frm = document.myform;
					frm.action="${pageContext.request.contextPath}/game/write";
					frm.submit();
				}

		

			</script>


</body>
</html>