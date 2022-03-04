<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.mom.momhome.team.*" %>
<%@page import="com.mom.momhome.common.*" %>
<!DOCTYPE html>
<html>

  <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>팀 등록 하기</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/normalize.css">
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        
    </head>
    
    <body>
   

      <form action="index.html" method="post" align="center">
      
      
				
        <h1>팀 등록</h1>
        
        <table align="center">
        <fieldset>
          <legend><span class="number">1</span>기본정보입력</legend>
          <h4 for="name">팀 이름</h4>
          <input type="text" id="tname" name="team_name">
          
          <h4 for="emblem">앰블럼</h4>
           <h4>앰블럼 사진 파일을 선택 해주세요</h4>
          <input type="file" id="emblem" name="team_emblem"><br><br><br>
          
          <h4 for="city">지역</h4>
          <select id="cityList" name="team_city">
          	<option id="cityOption" value="NN">지역을 선택 해주세요</option>
          </select>	
          
          <h4>팀 창설 날짜를 선택하세요</h4>
          <input type="date" id="fdate" name="team_fdate">	
          
          <h4 for="num">팀 인원</h4>
          <h4>처음 팀을 구성할 인원이 몇명인지 입력해주세요</h4>
          <input type="text" id="tnum" name="team_num" placeholder="구성 인원을 입력해주세요"></input>
          
          <h4 for="fee">회비</h4>
          <input type="text" id="tfee" name="team_fee" placeholder="팀 회비를 입력해주세요"></input>
          
          
          <h4>모집여부</h4>
          <h4>팀원 모집 여부를 체크해주세요</h4>
          <input type="checkbox" id="recyn" value="under_13" name="team_recruit_yn"><label for="under_13" class="light">Yes</label><br>
          <input type="checkbox" id="recyn" value="under_13" name="team_recruit_yn"><label for="under_13" class="light">No</label><br>
          
        </fieldset>
        
        <fieldset>
          <legend><span class="number">2</span>팀 상세 정보를 입력합니다</legend>
          <h4>팀 소개</h4>
          <textarea id="tintro" name="team_intro" placeholder="팀 소개를 간단하게 작성하세요" rows="3"></textarea>
        </fieldset>
        <fieldset>
        <label for="job">Job Role:</label>
        <select id="job" name="user_job">
          <optgroup label="Web">
            <option value="frontend_developer">Front-End Developer</option>
            <option value="php_developor">PHP Developer</option>
            <option value="python_developer">Python Developer</option>
            <option value="rails_developer"> Rails Developer</option>
            <option value="web_designer">Web Designer</option>
            <option value="WordPress_developer">WordPress Developer</option>
          </optgroup>
          <optgroup label="Mobile">
            <option value="Android_developer">Androild Developer</option>
            <option value="iOS_developer">iOS Developer</option>
            <option value="mobile_designer">Mobile Designer</option>
          </optgroup>
          <optgroup label="Business">
            <option value="business_owner">Business Owner</option>
            <option value="freelancer">Freelancer</option>
          </optgroup>
          <optgroup label="Other">
            <option value="secretary">Secretary</option>
            <option value="maintenance">Maintenance</option>
          </optgroup>
        </select>
        
          <label>Interests:</label>
          <input type="checkbox" id="development" value="interest_development" name="user_interest"><label class="light" for="development">Development</label><br>
            <input type="checkbox" id="design" value="interest_design" name="user_interest"><label class="light" for="design">Design</label><br>
          <input type="checkbox" id="business" value="interest_business" name="user_interest"><label class="light" for="business">Business</label>
        
        </fieldset>
        <button type="submit">Sign Up</button>
        </table>
      </form>
      
    </body>
</html>
