<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mom.momhome.HomeController"%>
<%@page import="com.mom.momhome.mercenary.*"%>
<%@page import="com.mom.momhome.game.*"%>
<%@page import="com.mom.momhome.team.*"%>
<%@page import="com.mom.momhome.cscenter.*"%>
<%
request.setAttribute("commonURL", request.getContextPath());
%>
<html>
<head>
<title>Man of the match</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<style>
section {
	margin-top: 3em !important;
}

.swiper-button-prev::after {
	content: ''!importnant;
	display: none !important;
}

.swiper-button-next:after {
	content: ''!importnant;
	display: none !important;
}

section.mypost {
	margin-top: 0 !important;
	padding: 3rem !important;
}

section.mypost:not(:last-child) {
	border-bottom: solid 1px rgba(160, 160, 160, 0.3);
}

section.mypost:nth-child(odd) {
	border-right: solid 1px rgba(160, 160, 160, 0.3);
}

@media(max-width: 980px) {
	section.mypost:nth-child(odd) {
		border-right: 0;
	}
}

@media(min-width: 981px) {
	section.mypost:nth-child(3), 
	section.mypost:nth-child(4) {
		border-bottom: 0;
	}
}
</style>
</head>
<body class="is-preload" style="overflow-x: hidden;">

	<!-- Slider main container -->
	<div class="swiper-container main-slider" id="myCarousel">
		<div class="swiper-wrapper">
			<div class="swiper-slide slider-bg-position"
				style="display: flex; flex-direction: column; background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('resources/images/main_slide1.jpg')"
				data-hash="slide1">
				<h2>팀을 만들고 싶으시다면</h2>
				<a href="${commonURL}/team/main" class="button"
					style="color: #fafafa !important;">팀 생성하기</a>
			</div>
			<div class="swiper-slide slider-bg-position"
				style="display: flex; flex-direction: column; background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('resources/images/main_slide3.jpg')"
				data-hash="slide1">
				<h2>경기 매칭을 원하신다면</h2>
				<a href="${commonURL}/game" class="button"
					style="color: #fafafa !important;">경기 매칭하기</a>
			</div>
			<div class="swiper-slide slider-bg-position"
				style="display: flex; flex-direction: column; background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('resources/images/main_slide2.jpg')"
				data-hash="slide1">
				<h2>용병을 찾고 계시다면</h2>
				<a href="${commonURL}/game" class="button"
					style="color: #fafafa !important;">용병 찾기</a>
			</div>
		</div>
		<div class="swiper-button-prev">
			<i class="fa fa-chevron-left"></i>
		</div>
		<div class="swiper-button-next">
			<i class="fa fa-chevron-right"></i>
		</div>
	</div>


	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<%@include file="include/nav.jsp"%>

		<!-- Main -->
		<div id="main">
			<form name="myform">
				<input type="hidden" name="mercenary_key" id="mercenary_key" 	value="" />
				<input type="hidden" name="game_key" id="game_key" 	value="" />
				<!-- Intro -->
				<section id="intro">
					<a href="#" class="logo"><img src="resources/images/logo.jpg"
						alt="" /></a>
					<header>
						<h2>Man of the match</h2>
						<p>쉬운 경기 매칭 서비스 및 팀 관리 서비스를 제공합니다.</p>
					</header>
				</section>

				<hr>


				<!-- About -->
				<section class="blurb">
					<h2>About US</h2>
					<p>저희는 경기 매칭과 팀 관리를 원활하게 할 수 있는 플랫폼을 제공하고 있습니다.</p>
				</section>

				<div class="d-flex row" style="justify-content: space-between;">


					<!-- Posts List -->
					<section class="mypost col-6 col-12-medium" style="flex-grow: 1; ">
						<h2>TEAM</h2>
						<ul class="posts">
						<%
							List<TeamDto> teamlist = (List<TeamDto>) request.getAttribute("teamlist");
							if (!teamlist.isEmpty()) {
								for (TeamDto tempDto : teamlist) {
							%>
							<li>
								<article>
									<header>
										<h3>
											<a href="#none"
												onclick="goMercenaryView('<%=tempDto.getTeam_key()%>')"><%=tempDto.getTeam_name()%></a>
										</h3>
										<time class="published"><%=tempDto.getTeam_city()%></time>
									</header>
									<a href="single.html" class="image"><img
										src="resources/images/icon_team.png" alt="팀 아이콘" /></a>
								</article>
							</li>
							<li style="text-align: center;">
								<button class="button small " onclick="location.href='${pageContext.request.contextPath}/team/list'">모든 글 보러 가기</button>
							</li>
							<% }	} else { %>
							<li>
								<article style="height: 100%;">
									<h3>아직 게시글이 없습니다.</h3>
								</article>
							</li>
							<% } %>
						</ul>
					</section>


					<!-- Posts List -->
					<section class="mypost col-6 col-12-medium" style="flex-grow: 1;">
						<h2>MATCH</h2>
						<ul class="posts">
							<%
							List<GameDto> gamelist = (List<GameDto>) request.getAttribute("gamelist");
							if (!gamelist.isEmpty()) {
								for (GameDto tempDto : gamelist) {
							%>
							<li>
								<article>
									<header>
										<h3>
											<a href="#none"
												onclick="goGameView('<%=tempDto.getGame_key()%>')"><%=tempDto.getGame_title()%></a>
										</h3>
										<time class="published">장소: <%=tempDto.getGame_location()%> / 시간: <%=tempDto.getGame_date()%></time>
									</header>
									<a href="#none"
										onclick="goGameView('<%=tempDto.getGame_key()%>')"
										class="image"><img
										src="resources/images/icon_soccerball.png" alt="게임 아이콘" /></a>
								</article>
							</li>
							<li style="text-align: center;">
								<button class="button small " onclick="location.href='${pageContext.request.contextPath}/game/list'">모든 글 보러 가기</button>
							</li>
							<% }	} else { %>
							<li>
								<article style="height: 100%;">
									<h3>아직 게시글이 없습니다.</h3>
								</article>
							</li>
							<% } %>
						</ul>
					</section>


					<section class="mypost col-6 col-12-medium" style="flex-grow: 1;">
						<h2>MERCENARY</h2>
						<ul class="posts">
							<%
							List<MercenaryDto> mercenarylist = (List<MercenaryDto>) request.getAttribute("mercenarylist");
							if ( !mercenarylist.isEmpty()) {
								for (MercenaryDto tempDto : mercenarylist) {
							%>
							<li>
								<article>
									<header>
										<h3>
											<a href="#none"
												onclick="goMercenaryView('<%=tempDto.getMercenary_key()%>')"><%=tempDto.getMercenary_title()%></a>
										</h3>
										<time class="published"><%=tempDto.getReg_date()%></time>
									</header>
									<a href="#none"
										onclick="goMercenaryView('<%=tempDto.getMercenary_key()%>')"
										class="image"><img src="resources/images/icon_mercenary.png" alt="용병 아이콘" /></a>
								</article>
							</li>
							<li style="text-align: center;">
								<button class="button small " onclick="location.href='${pageContext.request.contextPath}/mercenary/list'">모든 글 보러 가기</button>
							</li>
							<% }} else { %>
							<li style="text-align: center;">
								<h3 style=" margin: 100px 0;">아직 게시글이 없습니다.</h3>
								<button  class="button small ">글 쓰러 가기</button>
							</li>
							<% } %>
						</ul>
					</section>

					<section class="mypost col-6 col-12-medium" style="flex-grow: 1;">
						<h2>CUSTOMER SERVICE</h2>
						<ul class="posts">
						
						<%
							List<CSCenterDto> cscenterlist = (List<CSCenterDto>) request.getAttribute("cscenterlist");
							if (!cscenterlist.isEmpty()) {
								for (CSCenterDto tempDto : cscenterlist) {
							%>
							<li>
								<article>
									<header>
										<h3>
											<a href="#none"
												onclick="goMercenaryView('<%=tempDto.getCscenter_key()%>')"><%=tempDto.getCscenter_title()%></a>
										</h3>
										<time class="published"><%=tempDto.getCscenter_date()%></time>
									</header>
									<a href="single.html" class="image"><img
										src="resources/images/icon_customerservice.png" alt="고객센터 아이콘" /></a>
								</article>
							</li>
							<li style="text-align: center;">
								<button class="button small " onclick="location.href='${pageContext.request.contextPath}/cscenter/list'">모든 글 보러 가기</button>
							</li>
							<% }	} else { %>
							<li style="text-align: center;">
								<h3 style=" margin: 100px 0;">아직 게시글이 없습니다.</h3>
								<button  class="button small ">글 쓰러 가기</button>
							</li>
							<% } %>
						</ul>
					</section>

				</div>
			</form>
		</div>

	</div>
	<!-- Footer -->
	<%@include file="include/footer.jsp"%>

	<!-- Scripts -->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/browser.min.js"></script>
	<script src="resources/assets/js/breakpoints.min.js"></script>
	<script src="resources/assets/js/util.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
	<script src="resources/assets/js/main.js"></script>
	<script>
		//메인 슬라이드
		const swiper = new Swiper('#myCarousel', {
			// Optional parameters
			loop : true,
			speed : 1500,

			// If we need pagination
			pagination : {
				el : '.swiper-pagination',
			},
			autoplay : {
				disableOnInteraction : false
			},
			speed : 1500,

			// Navigation arrows
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
		});
		function goMercenaryView(id) {
			frm = document.myform;
			frm.mercenary_key.value = id;
			frm.method = "get";
			frm.action = "${pageContext.request.contextPath}/game/view";
			frm.submit();
		}
		function goGameView(id) {
			frm = document.myform;
			frm.game_key.value = id;
			frm.method = "get";
			frm.action = "${pageContext.request.contextPath}/game/view";
			frm.submit();
		}
	</script>
</body>
</html>