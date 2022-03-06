<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
	<head>
		<title>Man of the match</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
				<%@include file="../include/nav.jsp"%>

				

				<!-- Main -->
					<div id="main">

						<!-- title 작성 -->
							
								<header>
									<div class="title" align="center">
									<img src="${pageContext.request.contextPath}/resources/images/team.jpg" width="100" height="100"/>
									<h2>Team List </h2>
									<p>등록된 모든 팀을 볼 수 있습니다.</p>
									</div>	
								</header>		

					<section>
					<!-- 게시판 작성 -->
					<form name="myform">
						<%-- <input type="hidden" name="user_key" id="user_key" value="<%=user_key%>"/> --%>
						<input type="hidden" name="pg" id="pg" value="" /> <input
							type="hidden" name="mercenary_key" id="mercenary_key" value="" />
						
						<div class="row gtr-uniform">
							<div class="col-3 col-6-xsmall">
							
								<select name="key" id="key">
									<option value="">- 선택하세요 -</option>
									<option value="1">제목</option>
									<option value="2">내용</option>
									<option value="3">제목+내용</option>
								</select>
							</div>
							  
							<div class="col-7 col-12-xsmall">
								<input type="text" class="form-control" placeholder="검색어를 입력하세요"
									name="keyword" id="keyword" value="">
							</div>
							<div class="col-2 col-4-xsmall">
								<input type="button" style="width: 100%" value="검색"
									onclick="goSearch()" />
							</div>
							
						</div>
						
						<div class="table-wrapper">
							<table>
								<colgroup>
									<col width="8%">
									<col width="8%">
									<col width="*">
									<col width="12%">
									<col width="12%">
								</colgroup>
								<thead class="table-secondary">
									<tr>
										<th>번호</th>
										<th>지역</th>
										<th>팀이름</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>

							<div class="col-12" style="text-align: right;">
								<ul class="actions">
									<li style="margin-left: auto"><input type="button"
										value="글쓰기" onclick="goWrite()" /></li>
								</ul>
							</div>
						</div>
					</form>
				</section>
					</div>	
					

				<!-- Sidebar -->
					<section id="sidebar">

						<!-- Intro -->
							<section id="intro">
								<a href="#" class="logo"></a>
								<header>
									<h2>Man of the match</h2>
									
								</header>
							</section>

						<!-- Mini Posts -->
							<section>
								<div class="mini-posts">

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
											<p>( 매칭 광고 )</p>
												<h3><a href="single.html">대전 무궁화 구장</a></h3>
												<time class="published" datetime="2022-03-02">2022/03/02</time>
												<div>
												<img src="${pageContext.request.contextPath}/resources/images/ground.jpg" width="370" height="150"/>
												<br><br>
												<p>3월 3주차 경기 뛰실 팀 클릭하세요</p>
												</div>
											</header>
											
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
											<p> ( 팀 모집 광고 )</p>
												<h3><a href="single.html">SMfc 축구클럽</a></h3>
												<time class="published" datetime="2022-03-01">2022/03/01</time>
												<div>
												<img src="${pageContext.request.contextPath}/resources/images/jogi.jpg" width="370" height="150"/>
												<br><br>
												<p>레프트백 포지션 구합니다(강제회식X)</p>
												</div>
											</header>
											
										</article>

									<!-- Mini Post -->
										<article class="mini-post">
											<header>
											<p> ( 동네 광고 )</p>
												<h3><a href="single.html">한양체육사</a></h3>
												<time class="published" datetime="2022-02-25">2022/02/25</time>
												<div>
												<img src="${pageContext.request.contextPath}/resources/images/hanyang.jpg" width="370" height="150"/>
												<br><br>
												<p>한양체육사 축구용품 40% 할인중!</p>
												<p>man of the match 할인 코드 제시!</p>
												</div>
											</header>
											
										</article>
								</div>
							</section>

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

					</section>

			</div>

		<!-- Scripts -->
			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/browser.min.js"></script>
			<script src="resources/assets/js/breakpoints.min.js"></script>
			<script src="resources/assets/js/util.js"></script>
			<script src="resources/assets/js/main.js"></script>

	</body>
</html>
