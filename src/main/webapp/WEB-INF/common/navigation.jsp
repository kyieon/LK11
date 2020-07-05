<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<header>
	<a href="/" class="easion-logo"><i class="fas fa-sun"></i> <span>LK11</span></a>
</header>

<nav class="dash-nav-list">
	<!-- 
	<a href="/home" class="dash-nav-item dash-nav-dropdown-toggle">홈</a>
	 -->
	<a href="/home" class="dash-nav-item">홈</a>
	<div class="dash-nav-dropdown">
		<a href="#!" class="dash-nav-item dash-nav-dropdown-toggle">???</a>
		<div class="dash-nav-dropdown-menu">
			<a href="chartjs.html" class="dash-nav-dropdown-item">소프트웨어 이력</a>
			<a href="chartjs.html" class="dash-nav-dropdown-item">이더넷스위치 이력</a>
			<a href="chartjs.html" class="dash-nav-dropdown-item">이더넷스위치 상태</a>
			<a href="chartjs.html" class="dash-nav-dropdown-item">IEC61850 연결상태</a>
		</div>
	</div>
	<div class="dash-nav-dropdown ">
		<a href="#!" class="dash-nav-item dash-nav-dropdown-toggle">GOOSE 집중 관리</a>
		<div class="dash-nav-dropdown-menu">
			<a href="chartjs.html" class="dash-nav-dropdown-item">실시간 이력</a>
			<a href="chartjs.html" class="dash-nav-dropdown-item">GOOSE 상태</a>
		</div>
	</div>
	<div class="dash-nav-dropdown">
		<a href="#!" class="dash-nav-item dash-nav-dropdown-toggle">MMS 집중 관리</a>
		<div class="dash-nav-dropdown-menu">
			<a href="chartjs.html" class="dash-nav-dropdown-item">실시간 이력</a>
			<a href="chartjs.html" class="dash-nav-dropdown-item">Report 상태</a>
		</div>
	</div>
	<a href="#!" class="dash-nav-item">네트워크 패킷</a>
	<div class="dash-nav-dropdown">
		<a href="#!" class="dash-nav-item dash-nav-dropdown-toggle">시스템</a>
		<div class="dash-nav-dropdown-menu">
			<a href="chartjs.html" class="dash-nav-dropdown-item">시스템 장치</a>
			<a href="chartjs.html" class="dash-nav-dropdown-item">포트 설정</a>
			<a href="chartjs.html" class="dash-nav-dropdown-item">네트워크 카드(NIC)</a>
			<a href="chartjs.html" class="dash-nav-dropdown-item">패킷처리 제외</a>
			<a href="chartjs.html" class="dash-nav-dropdown-item">사용자 계정</a>
			<a href="/system/configuration" class="dash-nav-dropdown-item">환경 설정</a>
		</div>
	</div>
	<div class="dash-nav-dropdown">
		<a href="#!" class="dash-nav-item dash-nav-dropdown-toggle">유효성 검사</a>
		<div class="dash-nav-dropdown-menu">
			<a href="chartjs.html" class="dash-nav-dropdown-item">운영기준 검사</a>
			<a href="chartjs.html" class="dash-nav-dropdown-item">IET 검사</a>
		</div>
	</div>
</nav>