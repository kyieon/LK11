<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<%@ include file="/WEB-INF/common/header.jsp"%>
</head>

<body>
    <div class="dash">
        <div class="dash-nav dash-nav-dark">
            <%@ include file="/WEB-INF/common/navigation.jsp" %>
        </div>
        <div class="dash-app">
        	<%@ include file="/WEB-INF/common/toolbar.jsp" %>
            <main class="dash-content">
            	<div class="container-fluid">
            		<h1 class="dash-title">환경 설정</h1>
            		<div class="row">
                        <div class="col-xl-12">
                            <div class="card easion-card">
                                <div class="card-body">
                                    <form>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">NTP IP</label>
                                                <input type="text" class="form-control" id="inputEmail4">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputPassword4">동기화 주기(분)</label>
                                                <input type="text" class="form-control" id="inputPassword4">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">HDD 저장패킷 용량</label>
                                                <input type="text" class="form-control" id="inputEmail4">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputPassword4">파일 삭제 정책(%)</label>
                                                <input type="text" class="form-control" id="inputPassword4">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">Report 미송신 기준(배수)</label>
                                                <input type="text" class="form-control" id="inputEmail4">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputPassword4">Report 시간동기 이상검출(초)</label>
                                                <input type="text" class="form-control" id="inputPassword4">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">Report 스캔 수행시 최대 동작</label>
                                                <input type="text" class="form-control" id="inputEmail4">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputPassword4">상태 기간(일)</label>
                                                <input type="text" class="form-control" id="inputPassword4">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">GOOSE 미송신 검출기준(배수)</label>
                                                <input type="text" class="form-control" id="inputEmail4">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputPassword4">상태 기간(일)</label>
                                                <input type="text" class="form-control" id="inputPassword4">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">1차 지연기준(%)</label>
                                                <input type="text" class="form-control" id="inputEmail4">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputPassword4">2차 지연기준(%)</label>
                                                <input type="text" class="form-control" id="inputPassword4">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">전송시간 최소 기본값</label>
                                                <input type="text" class="form-control" id="inputEmail4">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="inputPassword4">전송시간 최대 기본값</label>
                                                <input type="text" class="form-control" id="inputPassword4">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="inputEmail4">실시간 이력 새로고침(초)</label>
                                                <input type="text" class="form-control" id="inputEmail4">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
	                                           	<label for="inputAddress">외부연계(IEC61850서버) IET</label>
	                                            <div class="form-inline">
			                                       <div class="form-group" style="width: calc(100% - 200px)">
			                                           	<input type="text" class="form-control" style="width: 100% !important" id="inputAddress">
			                                       </div>
			                                       <div class="form-group" style="margin-left: 15px">
			                                           	<button type="submit" class="btn btn-primary">다운로드</button>
			                                           	<button type="submit" class="btn btn-primary" style="margin-left: 10px">업로드</button>
			                                       </div>
	                                            </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
	                                            <label for="inputAddress">외부연계(IEC61850서버) SCL</label>
	                                            <div class="form-inline">
			                                       <div class="form-group" style="width: calc(100% - 200px)">
			                                           	<input type="text" class="form-control" style="width: 100% !important" id="inputAddress">
			                                       </div>
			                                       <div class="form-group" style="margin-left: 15px">
			                                           	<button type="submit" class="btn btn-primary">다운로드</button>
			                                           	<button type="submit" class="btn btn-primary" style="margin-left: 10px">업로드</button>
			                                       </div>
	                                            </div>
                                            </div>
                                        </div>
                                        
                                        <button type="submit" class="btn btn-primary">적용</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>

</html>