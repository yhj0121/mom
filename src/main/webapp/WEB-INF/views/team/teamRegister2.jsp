<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <head>
        <title>CSS Registration Form</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/assets/css/default.css"/>
    </head>
    <body>    
  		<!-- nav include-->
				<jsp:include page="../include/nav.jsp"/>
				
        <form action="" class="register">
            <h1><img src="${pageContext.request.contextPath}/resources/images/note.jpg"width="100" height="100">팀 생성 하기</h1>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;<h4>&nbsp;&nbsp;&nbsp;&nbsp;빈 칸에 알맞게 작성 해주세요.</h4>
            <br>
            <fieldset class="row1">
                <legend>기본정보작성
                </legend>
                <p>  
                    <label>팀 이름 *
                    </label>
                    <div>
                    <input type="text" id="tname" name="team_name">
                    <button class="btn btn-success" type="button" id="btnTeamDuplicate">팀 이름 중복체크</button></input>
                    </div>
                </p><br>
                <p>    
                    
                    <label>팀 앰블럼 *
                    </label>
                    <input type="file" id="emblem" name="team_emblem"/>
                	
                </p><br><br><br>
                <p>
                    <label>지역 *
                    </label>
                    <select id="cityList" name="team_city">
                        <option>지역 선택
                        </option>
                        <option value="1">전국
                        </option>
                    </select>
                    
                    <label>팀 창설 날짜 *
                    </label>
                    <input type="date" id="fdate" name="team_fdate"/>
                    
                </p>
                <br><br><br>
                <p>
                    <label>팀 인원 *
                    </label>
                    <input type="text" id="tnum" placeholder="몇 명 인지 숫자입력"/>
                    <label>팀 회비*
                    </label>
                    <input type="text" id="tfee" name="team_fee" placeholder="회비 금액 숫자입력(원)"/> 
                </p>
                <br><br><br>
              
            </fieldset>
            <fieldset class="row2">
                <legend>상세정보 작성
                </legend>
                <br><br>
                <p>
                    <label>팀 소개 글 *
                    </label>
                    <textarea id="tintro" name="team_intro" rows="8" placeholder="팀 소개를 간단하게 작성 하세요."></textarea>
                </p>
                <br><br>
                <p>
                    <label>회원 모집 여부*
                    </label>
                    <select id="recyn" name="team_recruit_yn">
                        <option>모집여부 선택
                        </option>
                        <option value="1">예
                        </option>
                        <option value="2">아니오
                        </option>
                    </select>
                </p>
                 
            </fieldset> 
            <fieldset class="row3">
                <legend>&nbsp;
                </legend>
                <br><br>
                <p>
                    <label>팀 공지 작성 *</label>
                    <textarea id="notice" name="team_notice" rows="8" placeholder="팀 공지를 간단하게 작성 하세요."></textarea>
                </p>
                <br><br><br><br><br><br>
            </fieldset>
        
        </form>
         <button class="button" onClick="location.href='/momhome/team/main'">돌아가기</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div><button class="button">팀 작성 완료 &raquo;</button></div>
    </body>
</html>

