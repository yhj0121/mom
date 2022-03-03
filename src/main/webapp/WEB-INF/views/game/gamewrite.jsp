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
<style>
.form_input {
width:100%;
padding:10px;
font-size:20px;
border: 1px solid black;
boarder-radius: 5px;
box-sizing: border-box;

}

input,textarea {
	box-sizing: border-box;
}

#button {
background-Color:#ffe6f2;  
font-weight:bold;   
margin:auto;

}

</style>

<body>
				<%@include file="../include/nav.jsp"%>


	<%
   GameDto dto = (GameDto)request.getAttribute("GameDto");
   %>
   
   	<form  name="myform" action="<%=request.getContextPath()%>/game/save" method="post">
   <input type="hidden" name="GAME_KEY" value="<%=dto.getGAME_KEY() %>" />
    <input type="hidden" name=""TEAM_KEY""      id="TEAM_KEY"      value="<%=dto.getTEAM_KEY()%>" />
    <div class="container" style="margin-top:80px">
        <h2 style="text-align:center; font-size:large;">게시판 글쓰기</h2>
        <h3 style="text-align:center">게시판에 글을 써보세요</h3>
  </div>
        <table class="table table-hover " style="margin-top: 30px;">
          
        
            <tbody style="padding:30px;">
              <tr>
                <td>제목</td>
                <td>
                    <div  style="margin-top:13px; float:left width:30%;">
                        <input type="text" class="form_input" id="GAME_TITLE" name="GAME_TITLE" 
                        placeholder="제목을 입력하세요">
                    </div>
                </td>
              </tr>       
                  <tr>
                  <div style="width:50%; float:left;">
                <td>경기날짜</td>
                <td>
                    <div  style="margin-top:13px;">
                        <input type="datetime-local" class="form-control" id="GAME_FDATE" name="GAME_FDATE">
                    </div>
                </td>
                </div>
                
                                <td>지역</td>
                                <td>
                    <div style="margin-top:13px; width:50%; float:left;">
                    
                        <select name="GAME_LOCATION" id="GAME_LOCATION" >
    					<option value="kr">지역선택</option>
   		      			 <option value="SU">SU</option>
    					<option value="BS">BS</option>
    					<option value="TK">TK</option>
    			    	<option value="IC">IC</option>
    			    	<option value="GJ">GJ</option>
    			    	<option value="US">US</option>
    			    	<option value="SJ">SJ</option>
    			    	<option value="GG">GG</option>
    			    	<option value="GW">GW</option>
  			    		<option value="CB">CB</option>
      					<option value="CN">CN</option>
    					
						</select>
							</div>
						</td>
					
                  
                
              </tr>   
              
    
              <tr>
                <td>내용</td>
                <td>
                    <div class="mb-3" style="margin-top:13px;">
                      <textarea class="form-control" rows="5" id="GAME_CONTENTS" name="GAME_CONTENTS"></textarea>
                    </div>
                </td>
              </tr>          
            </tbody>
          </table>
       
          <div class="container mt-3">
            <input id="button" type="submit" class="btn btn-secondary" value="등록" onclick="goWriter()">
          </div>
          
    </div>
   
       </form>
   
</body>
</html>
<script src="../resources/assets/js/jquery.min.js"></script>
			<script src="../resources/assets/js/browser.min.js"></script>
			<script src="../resources/assets/js/breakpoints.min.js"></script>
			<script src="../resources/assets/js/util.js"></script>
			<script src="../resources/assets/js/main.js"></script>
			<script>
			
<script>
function goWriter()
{
	let frm = document.myform;
	
	if( frm.GAME_TITLE.value.trim().length==0)
	{
		alert("제목을 입력해주세요");
		frm.GAME_TITLE.focus();
		return false;
	}
	
	
	
	if( frm.GAME_CONTENTS.value.trim().length==10)
	{
		alert("내용을 적어주세요");
		frm.comment.focus();
		return false;
	}


	frm.action="<%=request.getContextPath()%>/game/save";
	frm.method="post";
	frm.submit();
	}




</script>

