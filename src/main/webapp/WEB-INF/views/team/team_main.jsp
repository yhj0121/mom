
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.mom.momhome.membership.*" %>
<%@page import="com.mom.momhome.member.*"%>
<%@page import="com.mom.momhome.common.*"%>
<% String membership_role = StringUtil.nullToValue(session.getAttribute("membership_role"),""); %>
<!DOCTYPE html>
<html>
<head>
<title>팀 정보 를 보여드립니다.</title>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />


<style>
	.imageWrap {
		display: flex;
		flex-wrap: wrap;
	}
	
	.imageWrap > div {
		width: 19%;
		max-height: 240px;
		border: 1px solid #ccc;
		border-radius: 15px;
		padding: 8px; 
		overflow: hidden;
		margin: 3px; 
	} 
	
		.imageWrap > div:hover{
			cursor: pointer;
		border: 1px solid #2ebaae;
		}
		
		.imageWrap > div:hover img{ 
			transition: .4s;
			transform: scale(1.05);
		}
		.imageWrap > div > img{
		width: 100%;
		height: 100%;
	}
	
	h2.title.titleh2 {
	    display: flex;
	    flex-direction: row;
	    align-items: center;
	    padding: 0;
	}
</style>
</head>

<body class="single is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- nav include-->
		<jsp:include page="../include/nav.jsp" />

		<!-- Main -->
		<div id="main">

			<!-- Post -->
			<article class="post">
				<header>
					<div class="title" style="border-right: solid 1px rgba(160, 160, 160, 0.3)">
						<h2 class="title titleh2">
							<img src="${pageContext.request.contextPath}/resources/images/uniform.jpg"
								width="100" height="100">
								<a href="#">Football Club </a>
						</h2>

						<h4>
							전국에 등록된 모든 팀의 정보를 확인 할수 있습니다.<br>참여를 희망하는 지역의 팀을 찾아서 함께
							해보세요.<br>당신을 반겨줄 동료가 기다리고 있습니다.
						</h4>
						<% if(membership_role.equals("")){%>
						<input type="button" class="btn btn-secondary" value="팀 구경 하러가기"
							onClick="location.href='/momhome/team/list'">
						<%}else{%> 
							<input type="button" class="btn btn-secondary" value="내 팀 정보 보기"
									onClick="location.href='/momhome/team/view'"><%}%>
							
						<br>
						<br>
					</div>
					<div class="title">
						<h2 class="title titleh2">
							<img src="${pageContext.request.contextPath}/resources/images/note.jpg"
								width="100" height="100">Make your team
						</h2>
						
						<h4>
							이미 함께하는 동료가 있나요?<br>팀을	등록 해서 운영해보고 싶다면,<br>등록은	여기입니다.
						</h4>
						<!--  <input type="button" class="btn btn-secondary" value="팀 생성 하러가기" onClick="location.href='/momhome/team/write'"><br><br> -->
						<input type="button" class="btn btn-secondary" value="팀 생성 하러가기"
							onClick="team_check();"><br>
						<br>

					</div>


				</header>

				<div class="main">

					<h1>전국의 모든 지역의 팀을 볼수 있습니다.</h1>
					<h2>지역의 이미지를 클릭 하면 해당 지역의 팀들을 볼 수 있어요.</h2>
					<br>
					<div class="imageWrap">
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=서울';" src="${pageContext.request.contextPath}/resources/images/citylogo/seoul.jpg" />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=인천';" src="${pageContext.request.contextPath}/resources/images/citylogo/incheon.jpg"  />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=경기';" src="${pageContext.request.contextPath}/resources/images/citylogo/gyeonggi.jpg" />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=세종';" src="${pageContext.request.contextPath}/resources/images/citylogo/sejong.jpg" />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=부산';" src="${pageContext.request.contextPath}/resources/images/citylogo/busan.jpg" />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=울산';" src="${pageContext.request.contextPath}/resources/images/citylogo/ulsan.jpg" />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=대구';" src="${pageContext.request.contextPath}/resources/images/citylogo/daegu.jpg" />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=대전';" src="${pageContext.request.contextPath}/resources/images/citylogo/daejeon.jpg" />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=광주';" src="${pageContext.request.contextPath}/resources/images/citylogo/gwangju.jpg" />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=강원';" src="${pageContext.request.contextPath}/resources/images/citylogo/gangwon.jpg" />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=충북';" src="${pageContext.request.contextPath}/resources/images/citylogo/chungbuk.jpg" />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=충남';" src="${pageContext.request.contextPath}/resources/images/citylogo/chungnam.jpg" />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=전북';" src="${pageContext.request.contextPath}/resources/images/citylogo/jeonbuk.jpg"  />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=전남';" src="${pageContext.request.contextPath}/resources/images/citylogo/jeonnam.jpg" />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=경북';" src="${pageContext.request.contextPath}/resources/images/citylogo/gyeongbuk.jpg"  />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=경남';" src="${pageContext.request.contextPath}/resources/images/citylogo/gyeongnam.jpg"  />
						</div>
						<div>
							<img onclick="javascript:location.href='/momhome/team/list?pg=0&team_key=&key=1&keyword=제주';" src="${pageContext.request.contextPath}/resources/images/citylogo/jeju.jpg" />
						</div>
					</div>
				</div>
			</article>

		</div>

		<!-- Footer -->
		<section id="footer">
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon solid fa-rss"><span
						class="label">RSS</span></a></li>
				<li><a href="#" class="icon solid fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>
			<p class="copyright">
				&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>.
				Images: <a href="http://unsplash.com">Unsplash</a>.
			</p>
		</section>

	</div>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

</body>
</html>
<script>
	//membership_role 세션 체크 해서 팀 중복 생성 막기
	function team_check() {
		var membership_role = `${membership_role}`;

		if (membership_role == "") {
			location.href = '/momhome/team/write'
			console.log('membership_role');
		} else {
			alert("팀은 중복 생성이 안됩니다.");
		}

	}
</script>