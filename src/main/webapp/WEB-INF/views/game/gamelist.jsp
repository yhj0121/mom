 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@page import="java.util.List" %>   
 <%@page import="com.mom.momhome.game.*" %>
<%@page import="com.mom.momhome.common.*" %>
    
<!DOCTYPE html>
<html>
<head>
		<title>Man of the match</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../resources/assets/css/main.css" />
	</head>
	
<style>
.pagination {
    list-style:none;
    margin:0;
    padding:0;
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
   <input type="hidden" name="key" id="key" value="<%=key %>"/>
   <input type="hidden" name="pg"  id="pg" value="<%=pg%>"/>
   <input type="hidden" name="id"  id="id" value=""/>
   			
							<h2 style="text-align:center; font-size:large;">게시판 목록(${totalCnt})</h2>	
							
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
													<td><a href="#none" onclick="goView('<%=tempDto.getGAME_KEY()%>')"><%=tempDto.getGAME_TITLE()%><a/></td>
													<td><%=tempDto.getGAME_CONTENTS()%></td>
													<td><%=tempDto.getGAME_LOCATION()%></td>
													<td><%=tempDto.getGAME_FDATE()%></td>
													
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
			

 <div class="container mt-3">
       	  	<%=Pager.makeTag(request, 10, totalCnt)%>
       	  </div>
 			
       

<!-- Scripts -->
			<script src="../resources/assets/js/jquery.min.js"></script>
			<script src="../resources/assets/js/browser.min.js"></script>
			<script src="../resources/assets/js/breakpoints.min.js"></script>
			<script src="../resources/assets/js/util.js"></script>
			<script src="../resources/assets/js/main.js"></script>
			<script>
			function goView(id)
			{
				 	let frm = document.myform;
				 	frm.id.value=id;
				  	frm.method="get";
				    frm.action = "${pageContext.request.getContextPath()}/game/view";
				    frm.submit(); 
					
				
				
			}
		

			</script>


</body>
</html>