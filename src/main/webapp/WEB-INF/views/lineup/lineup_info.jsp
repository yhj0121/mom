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

		<h1>Lineup info</h1>
		
		<%
		List<LineupDto> lineups = (List<LineupDto>)request.getAttribute("lineupList");
		int length = lineups.size();
		
		for(int i =0; i<11; i++)
		{
		%>
		<%=(i+1) %>. 이름 (이름에 링크달기) <br/>
 		
 		<a href="#none" onclick="goPlayerInfo('<%=lineups.get(i).getUser_key()%>')"><%=lineups.get(i).getPlayerDto().getUser_id()%></a></td> 

		<%
		}
		%>
	
          <div class="container mt-3" style="text-align:right;">
            <a href="<%=request.getContextPath()%>/lineup/modify" class="btn btn-secondary">수정</a>
          </div>
          
	</div>
</body>
</html>

<script>
function goPlayerInfo(id)
{
	let frm = document.myform;
	frm.id.value=id;
	frm.method="get";
	frm.action="${pageContext.request.contextPath}/lineup/lineup_modify";
	frm.submit();
}
</script>