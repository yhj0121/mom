<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.*"%>
<%@page import="com.mom.momhome.HomeController"%>
<%@page import="com.mom.momhome.mercenary.*"%>
<%@page import="com.mom.momhome.game.*"%>
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
				<section class="col-6 col-12-medium" style="flex-grow: 1;">
					<h2>TEAM</h2>
					<ul class="posts">
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html">Lorem ipsum fermentum ut nisl vitae</a>
									</h3>
									<time class="published" datetime="2015-10-20">October
										20, 2015</time>
								</header>
								<a href="single.html" class="image"><img
									src="resources/images/icon_team.png" alt="팀 아이콘" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html">Convallis maximus nisl mattis nunc
											id lorem</a>
									</h3>
									<time class="published" datetime="2015-10-15">October
										15, 2015</time>
								</header>
								<a href="single.html" class="image"><img
									src="resources/images/icon_team.png" alt="팀 아이콘" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html">Euismod amet placerat vivamus
											porttitor</a>
									</h3>
									<time class="published" datetime="2015-10-10">October
										10, 2015</time>
								</header>
								<a href="single.html" class="image"><img
									src="resources/images/icon_team.png" alt="팀 아이콘"></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html">Magna enim accumsan tortor cursus
											ultricies</a>
									</h3>
									<time class="published" datetime="2015-10-08">October 8,
										2015</time>
								</header>
								<a href="single.html" class="image"><img
									src="resources/images/icon_team.png" alt="팀 아이콘" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html">Congue ullam corper lorem ipsum
											dolor</a>
									</h3>
									<time class="published" datetime="2015-10-06">October 7,
										2015</time>
								</header>
								<a href="single.html" class="image"><img
									src="resources/images/icon_team.png" alt="팀 아이콘" /></a>
							</article>
						</li>
					</ul>
				</section>


				<!-- Posts List -->
				<section class="col-6 col-12-medium" style="flex-grow: 1;">
					<h2>MATCH</h2>
					<ul class="posts">
					<%
						List<GameDto> gamelist = (List<GameDto>) request.getAttribute("gamelist");
						if( gamelist != null ) {
						for (GameDto tempDto : gamelist) {
						%>
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html"><%=tempDto.getGame_title()%></a>
									</h3>
									<time class="published"><%=tempDto.getGame_fdate()%></time>
								</header>
								<a href="single.html" class="image"><img
									src="resources/images/icon_mercenary.png" alt="용병 아이콘" /></a>
							</article>
						</li>
						<%} } else {%>
						<li>
							<article style="height: 100%;">
									<h3>
										아직 게시글이 없습니다.
									</h3>
							</article>
						</li>
						<%} %>
					</ul>
				</section>


				<section class="col-6 col-12-medium" style="flex-grow: 1;">
					<h2>MERCENARY</h2>
					<ul class="posts">
						<%
						List<MercenaryDto> mercenarylist = (List<MercenaryDto>) request.getAttribute("mercenarylist");
						if( mercenarylist != null ) {
						for (MercenaryDto tempDto : mercenarylist) {
						%>
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html"><%=tempDto.getMercenary_title()%></a>
									</h3>
									<time class="published"><%=tempDto.getReg_date()%></time>
								</header>
								<a href="single.html" class="image"><img
									src="resources/images/icon_mercenary.png" alt="용병 아이콘" /></a>
							</article>
						</li>
						<%} } else {%>
						<li>
							<article style="height: 100%;">
									<h3>
										아직 게시글이 없습니다.
									</h3>
							</article>
						</li>
						<%} %>
					</ul>
				</section>

				<section class="col-6 col-12-medium" style="flex-grow: 1;">
					<h2>CUSTOMER SERVICE</h2>
					<ul class="posts">
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html">Lorem ipsum fermentum ut nisl vitae</a>
									</h3>
									<time class="published" datetime="2015-10-20">October
										20, 2015</time>
								</header>
								<a href="single.html" class="image"><img
									src="resources/images/icon_customerservice.png" alt="고객센터 아이콘" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html">Convallis maximus nisl mattis nunc
											id lorem</a>
									</h3>
									<time class="published" datetime="2015-10-15">October
										15, 2015</time>
								</header>
								<a href="single.html" class="image"><img
									src="resources/images/icon_customerservice.png" alt="고객센터 아이콘" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html">Euismod amet placerat vivamus
											porttitor</a>
									</h3>
									<time class="published" datetime="2015-10-10">October
										10, 2015</time>
								</header>
								<a href="single.html" class="image"><img
									src="resources/images/icon_customerservice.png" alt="고객센터 아이콘" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html">Magna enim accumsan tortor cursus
											ultricies</a>
									</h3>
									<time class="published" datetime="2015-10-08">October 8,
										2015</time>
								</header>
								<a href="single.html" class="image"><img
									src="resources/images/icon_customerservice.png" alt="고객센터 아이콘" /></a>
							</article>
						</li>
						<li>
							<article>
								<header>
									<h3>
										<a href="single.html">Congue ullam corper lorem ipsum
											dolor</a>
									</h3>
									<time class="published" datetime="2015-10-06">October 7,
										2015</time>
								</header>
								<a href="single.html" class="image"><img
									src="resources/images/icon_customerservice.png" alt="고객센터 아이콘" /></a>
							</article>
						</li>
					</ul>
				</section>

			</div>
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
	</script>

</body>
</html>