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
	
		<form name="myform">

			<!-- Header -->
			<%@include file="../include/nav.jsp"%>
	
			<h1>Dummy Datas</h1>
	 		
	 		<a href="#none" onclick="makePlayerDummyDatas()" class="btn btn-secondary">사용자 더미 만들기</a><br/><br/>	 		
	 		<a href="#none" onclick="makeTeamDummyDatas()" class="btn btn-secondary">팀 더미 만들기</a><br/><br/>
	 		<a href="#none" onclick="makeMembershipDummyDatas()" class="btn btn-secondary">멤버쉽 더미 만들기</a><br/><br/>
	 		<a href="#none" onclick="makeGameDummyDatas()" class="btn btn-secondary">경기 더미 만들기</a><br/><br/>
	 		
	 		<a href="#none" onclick="makeLineupDummyDatas()" class="btn btn-secondary">라인업 더미 만들기</a><br/><br/>
 		
		</form> 
      
	</div>
</body>
</html>

<script>
function makePlayerDummyDatas()
{	
	alert("사용자 더미 만들기");
	location.href = "${commonURL}/lineup/insert_userDummy";
}

function makeTeamDummyDatas()
{	
	alert("팀 더미 만들기");
	location.href = "${commonURL}/lineup/insert_teamDummy";
}

function makeMembershipDummyDatas()
{	
	alert("멤버쉽 더미 만들기");
	location.href = "${commonURL}/lineup/insert_membershipDummy";
}

function makeGameDummyDatas()
{	
	alert("경기 더미 만들기");
	location.href = "${commonURL}/lineup/insert_gameDummy";
}

function makeLineupDummyDatas()
{	
	alert("라인업 더미 만들기");
	location.href = "${commonURL}/lineup/insert_lineupDummy";
}
</script>