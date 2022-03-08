
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   

    
<!DOCTYPE html>
<html>
	<head>
		<title>팀 정보 를 보여드립니다.</title>
		
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		
		
	</head>
	
	<body class="single is-preload"> 
			
		<!-- Wrapper -->
			<div id="wrapper">
			
				<!-- nav include-->
				<jsp:include page="../include/nav.jsp"/>
					
				<!-- Main -->
					<div id="main">

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
										<h2><img src="${pageContext.request.contextPath}/resources/images/uniform.jpg"width="100" height="100"><a href="#">Football Club </a></h2>
										
										<h4>전국에 등록된 모든 팀의 정보를 확인 할수 있습니다.<br>참여를 희망하는 지역의 팀을 찾아서 함께 해보세요.<br>당신을 반겨줄 동료가 기다리고 있습니다.</h4>
										<input type="button" class="btn btn-secondary" value="팀 구경 하러가기" onClick="location.href='/momhome/team/list'"><br><br>
									</div>
									<div class="title">
										
										<h3><img src="${pageContext.request.contextPath}/resources/images/note.jpg"width="100" height="100">이미 함께하는 동료가 있나요?<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;팀을 등록 해서 운영해보고 싶다면,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등록은 여기입니다.</h3>
										<!--  <input type="button" class="btn btn-secondary" value="팀 생성 하러가기" onClick="location.href='/momhome/team/write'"><br><br> -->
										<input type="button" class="btn btn-secondary" value="팀 생성 하러가기" onClick="team_check();"><br><br>
										
									</div>
									
									
								</header>
								
								<div class="main">
								
								<h1>전국의 모든 지역의 팀을 볼수 있습니다.</h1><br>
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/seoul.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/incheon.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/gyeonggi.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/sejong.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/busan.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/ulsan.jpg" width="150" height="200" /><br>
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/daegu.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/daejeon.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/gwangju.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/gangwon.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/chungbuk.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/chungnam.jpg" width="150" height="200" /><br>
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/jeonbuk.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/jeonnam.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/gyeongbuk.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/gyeongnam.jpg" width="150" height="200" />
								<img style="border:3px solid black; border-radius:7px; -moz-border-radius:7px; -webkit-border-radius:7px;"onclick="javascript:location.href='/momhome';" src="${pageContext.request.contextPath}/resources/images/citylogo/jeju.jpg" width="150" height="200" />
								</div>
								
							</article>

					</div>

				<!-- Footer -->
					<section id="footer">
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon solid fa-rss"><span class="label">RSS</span></a></li>
							<li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
						</ul>
						<p class="copyright">&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>. Images: <a href="http://unsplash.com">Unsplash</a>.</p>
					</section>

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
	function team_check()
	{
		var membership_role = '<%=session.getAttribute("membership_role")%>';
		
		if(membership_role == ""){
			location.href='/momhome/team/write'
			console.log('membership_role');
		}
		else{
			alert("팀은 중복 생성이 안됩니다.");
		}
		
	}


</script>