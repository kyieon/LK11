<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<%@ include file="/WEB-INF/common/header.jsp"%>
</head>

<body>
	<div class="form-screen">
		<div class="easion-logo">
			<span>
				<h1 style="text-align: center">㈜ LK11</h1>
				<h2>SA감시진단장치</h2>
			</span>
		</div>
		<div class="card account-dialog">
			<div class="card-header bg-primary text-white"
				style="text-align: center">사용자 로그인</div>
			<div class="card-body">
				<form method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="inputId" name="username" placeholder="아이디">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="inputPassword" name="password" placeholder="비밀번호">
					</div>
					
					<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
							<p class="error" style="color: red">사용자 아이디와 비밀번호가 맞지 않습니다.</p>
							<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
					</c:if>
					
					<div class="account-dialog-actions" style="float: right">
						<button type="submit" class="btn btn-primary">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>