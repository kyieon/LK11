<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<header class="dash-toolbar">
	<a class="menu-toggle" style="cursor: pointer"> <i
		class="fas fa-bars"></i>
	</a>
	<div class="tools">
		<div class="dropdown tools-item">
			<a id="dropdownMenu1" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> <i
				class="fas fa-cog" style="cursor: pointer"></i>
			</a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="dropdownMenu1">
				<a href="/logout" class="dropdown-item">서버 윈도우 종료 </a>
				<a href="/logout" class="dropdown-item">서버 윈도우 재시작</a>
				<a href="/logout" class="dropdown-item">로그 아웃</a>
			</div>
		</div>
	</div>
</header>