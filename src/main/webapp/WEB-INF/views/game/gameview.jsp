 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@page import="java.util.List" %>   
 <%@page import="com.mom.momhome.game.*" %>
<%@page import="com.mom.momhome.common.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Man of the match</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../resources/assets/css/main.css" /></head>
<body class="is-preload">

				<%@include file="../include/nav.jsp"%>
		<%
		String key = StringUtil.nullToValue(request.getParameter("key"), "1");
		String keyword = StringUtil.nullToValue(request.getParameter("keyword"), "");
		String pg = StringUtil.nullToValue(request.getParameter("pg"), "0");
	%>
	<%
	GameDto dto = (GameDto)request.getAttribute("GameDto");
	%>
	
	<form name="myform">
		<input type="hidden" name="id"      value="<%=dto.getGAME_KEY()%>" >
		<input type="hidden" name="pg"      value="<%=pg%>" >
		<input type="hidden" name="key"     value="<%=key%>" >
		<input type="hidden" name="keyword" value="<%=keyword%>" >
		
    <div class="container" style="margin-top:80px">
        <h2 style="text-align:center; font-size:large;">게시판 상세보기</h2>
        <table class="table table-hover " style="margin-top:30px;">
            <tbody>
              <tr class="table-secondary">
                <th >제목</th>
                <td colspan="3"><%=dto.getGAME_TITLE()%></td>
              </tr>
              <tr >
                <th>작성일</th>
                <td><%=dto.getGAME_DATE()%></td>
       
              </tr>
                 <tr >
                <th>경기날짜</th>
                <td><%=dto.getGAME_FDATE()%></td>
       
              </tr>
              <tr>
                <th>내용</td>
                       <td><%=dto.getGAME_CONTENTS()%></td>
              </tr>
           
            </tbody>
          </table>

 
       
          <div class="container mt-3" style="text-align:center; padding:100px;">
            <a href="#none" onclick="goList()" class="btn btn-secondary" style="margin:10px">목록</a>
         	<a href="#none" onclick="goModify()" class="btn btn-secondary" style="margin:10px">수정</a>
         	<a href="#none" onclick="goDelete()" class="btn btn-secondary" style="margin:10px">삭제</a>
          </div>
          
    </div>
    
    </form>
    <!-- Scripts -->
			<script src="../resources/assets/js/jquery.min.js"></script>
			<script src="../resources/assets/js/browser.min.js"></script>
			<script src="../resources/assets/js/breakpoints.min.js"></script>
			<script src="../resources/assets/js/util.js"></script>
			<script src="../resources/assets/js/main.js"></script>
    
</body>
</html>

<script>
function goList()
{
	var frm = document.myform;
	frm.action="<%=request.getContextPath()%>/game/list";
	frm.submit();
}

$(()=>{
    $("#joinornot").click(()=>{
       $.ajax({
          url:"${commonURL}/game/joinornot", //요청 url정보
          data:{userid:$("#userid").val()},   //서버로 전달할 데이터정보: JSON형태
          dataType:"json",  //결과를 jSON으로 받겠다. 결과가 text로 온다
          type:"POST"
       })
       .done((data)=>{
          //데이터가 정상적으로 수신되면 done메서드 호출되면서 매개변수는 전달받은 값
          //값은 dataType 속성을 안주면 text로 온다.
          console.log(data.result);
         if(data.result == "true") //중복
         {
            alert("이미 사용중인 아이디입니다.")
         }
         else
         {
            alert("사용가능합니다.")
            $("#idcheck").val("Y");
            $("#userid").prop("readonly", true);   //수정못하게 막는 기능
            
         }
       })
       .fail((error)=>{
          //통신에러, 오류에 관한 것
             console.log(error)
       })
    })
 })





</script>












