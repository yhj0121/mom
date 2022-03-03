<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.mom.momhome.team.*" %>
<%@page import="com.mom.momhome.common.*" %>
<!DOCTYPE html>
<html>
<head>
		<title>팀 생성 하기</title>
		
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		
	</head>
	
	<body class="single is-preload"> 
			
		<!-- Wrapper -->
			<div id="wrapper">
			
				<!-- nav include-->
				<jsp:include page="../include/nav.jsp"/>
				
				<%
					TeamDto dto = (TeamDto)request.getAttribute("teamDto");
				
				%>
					
				<!-- Main -->
				<form name="myform" method="post" enctype="multipart/form-data">
					<input type="hidden" name="" value=""/>
					<div id="wrapper">
						 <table class="table table-hover " style="margin-top: 30px;">
				            <colgroup>
				                <col width="25%">
				                <col width="*">
				            </colgroup>
				        <div id="title">
				        	<h3><img src="resources/images/note.jpg"width="100" height="100"> 내 팀 정보를 작성하고 등록 합니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;빈 칸을 알맞게 채워주세요.</h3>
				        </div>
				            <tbody>
				              <tr>
				                <td>팀 이름</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="text" class="form-control" id="title" name="title" 
				                        placeholder="팀 이름을 입력하세요" value="<%=dto.getTeam_name() %>" >
				                    </div>
				                </td>
				              </tr>   
				              
				              <tr>
				                <td>팀 앰블럼</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="file" class="form-control" id="upload" name="upload" 
				                        placeholder="이미지를 업로드하세요" value="<%=dto.getTeam_emblem() %>">
				                    </div>
				                </td>
				              </tr>  
				              
				              <tr>
				                <td>지역</td>
				                <td>
				                    <div class="col-12">
				                        <select id="cityList" name="cityList">
				                        	<option id="opt1" value="cityList">원하는 지역을 선택해주세요.</option>
				                        </select>
				                    </div>
				                </td>
				              </tr>         
				                  
				              <tr>
				                <td>회비</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="text" class="form-control" id="writer" name="writer" 
				                        placeholder="회비를 입력하세요" value="<%=dto.getTeam_fee() %>">
				                    </div>
				                </td>
				              </tr>      
				              <tr>
				                <td>팀 소개</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                      <textarea class="form-control" rows="5" id="comment" name="comment"><%=dto.getTeam_intro() %></textarea>
				                    </div>
				                </td>
				              </tr>         
				               
				                  
				            </tbody>
				          </table>
       
          		<div class="container mt-3" style="text-align:right;">
            	<input type="button" class="btn btn-secondary" value="등록" onclick="goWrite()">
          </div>
					
				</div>
				</form>
		</div>
			<!-- Scripts -->
			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/browser.min.js"></script>
			<script src="resources/assets/js/breakpoints.min.js"></script>
			<script src="resources/assets/js/util.js"></script>
			<script src="resources/assets/js/main.js"></script>
		</body>
		
</html>

<script>

function getCityList(){
	$.ajax({
		url: "${commonURL}/selectCity",
		contentType: false,
		processData: false,
		type: "POST"
	})
	.done( (result) => {
		var i=1;
	
	  result.forEach( (item)=>{
	    	var data = "<option "+"value='"+item.city+"'>";
	    	    data +=  item.city ;
	    	    data += "</option>";
	    	i++;
	      	$("#opt1").after(data);
	})
	})
	.fail( (error) => {
		alert("정보 가져오기 실패");
	})
}


function goWrite()
{
	var frm = document.myform;
	if(frm.team_name.value.trim().length<10)
		{
			alert("이름을 3글자 이상 작성하세요.");
			frm.title.focus();
			return false;
		}
	
		if(frm.writer.value.trim().length==0)
		{
			alert("이름을 작성하세요.");
			frm.writer.focus();
			return false;
		}
		
		if(frm.comment.value.trim().length<10)
		{
			alert("내용을 10글자 이상 작성하세요.");
			frm.contents.focus();
			return false;
		}
		frm.action="<%=request.getContextPath()%>/gallery/save";
		frm.method="post";
		frm.submit(); //서버로 전송하기
}

</script>