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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		
	</head>
	
	<body class="single is-preload"> 
			
		<!-- Wrapper -->
			<div id="wrapper">
			
			<!-- nav include-->
				<jsp:include page="../include/nav.jsp"/>
				
					
				<!-- Main -->
				<form name="myform" method="post" enctype="multipart/form-data">
					<input type="hidden" name="" value=""/>
					
					<table border="1" >
				
				        <div id="title">
				        	<h3><img src="${pageContext.request.contextPath}/resources/images/note.jpg"width="100" height="100"> 내 팀 정보를 작성하고 등록 합니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;빈 칸을 알맞게 채워주세요.</h3>
				        </div>
				       
				              <tr height="50">
				                <td width="150" align="center">팀 이름</td>
				                <td width="250" align="center">
				                    <div class="col-10" style="margin-top:13px;">
				                        <input type="text" name="team_name" id="tname" placeholder="팀 이름을 입력하세요" size="5"/><br>
				                        <button class="btn btn-success" type="button" id="btnTeamDuplicate">팀 이름 중복체크</button>
				                    </div>
				                </td>
				              </tr>   
				              
				              <tr>
				                <td>팀 창설 날짜</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="date" name="team_fdate" id="fdate"  value="" />   
				                    </div>
				                </td>
				              </tr>  
				              
				              <tr>
				                <td>팀 회비</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="text" name="team_fee" id="fee" placeholder="원 , 회비를 입력하세요" ></input>
				                    </div>
				                </td>
				              </tr> 
				              
				              <tr>
				               <td>지역</td>
				                <td>
				                    <div class="mb-3">
				                    	<select id="cityList" name="city">
				                    		<option id="cityOption" value="NN">지역을 선택 해주세요.</option>
				                    	</select>
				                        
				                    </div>
				                </td>
				              </tr> 
				              
				                <tr>
				                <td>팀 소개 글</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <textarea type="text" name="team_intro" id="tintro"  placeholder="팀 소개를 간단히 써주세요." rows="3"></textarea>
				                    </div>
				                </td>
				              </tr> 
				              
				              <tr>
				                <td>팀 앰블럼</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="file" name="team_emblem" id="emblem" placeholder="이미지를 업로드하세요">
				                    </div>
				                </td>
				              </tr>  
				              
				              <tr>
				                <td>팀 공지 글</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <textarea type="text" name="team_notice" id="notice"  placeholder="팀 공지를 간단하게 써주세요." rows="4"></textarea>
				                    </div>
				                </td>
				              </tr> 
				                  
				                <tr>
				                <td>팀 인원</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="text" name="team_num" id="num" placeholder="명, 팀 인원을 써주세요."></input>
				                    </div>
				                </td>
				              </tr>
				              
				              <tr>
				                <td>팀 모집 여부</td>
				                <td>
				                    
				                     <p>팀원 모집 여부</p>
										  <label><input type="checkbox" name="team_recruit_yn" id="recyn" value="y"> y</label>
										  <label><input type="checkbox" name="team_recruit_yn" id="recyn" value="n"> n</label>
										  <p><input type="submit" value="Submit">
				                        <input type="checkbox" name="team_recruit_yn" id="recyn" value="y"></input>
				                    
				                </td>
				              </tr>
				               
				            
				          </table>
				    
       
          	<div class="container mt-3" style="text-align:right;">
            	<input type="button" value="등록" onclick="goWrite()">
         	</div>
					
				
				</form>
		</div>
			<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
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