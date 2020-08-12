<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<%@ include file="/WEB-INF/common/header.jsp"%>

<style type="text/css">
.easion-card .card-header {
	min-height: 45px !important;
}

/* input file type */
.input-file {
  display: inline-block;
}

.input-file [type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0 none;
}
.input-file .file-label {
  display: inline-block;
  min-width: 53px;
  height: 27px;
  line-height: 24px;
  padding: 0 10px;
  border-radius: 2px;
  font-size: 13px;
  background-color: #333;
  color: #fff;
  text-align: center;
}
.input-file .file-name {
  width: 300px;
  background: #f5f5f5;
  height: 27px;
  line-height: 26px;
  text-indent: 5px;
  border: 1px solid #bbb;
}
</style>

</head>

<body>
	<div class="dash">
		<div class="dash-nav dash-nav-dark">
			<%@ include file="/WEB-INF/common/navigation.jsp"%>
		</div>
		<div class="dash-app">
			<%@ include file="/WEB-INF/common/toolbar.jsp"%>
			<main class="dash-content">
				<div class="container-fluid">
					<h1 class="dash-title">환경 설정</h1>
					<div class="row">
						<div class="col-xl-12">
							<div class="card easion-card">
								<div class="card-header">
									<div class="easion-card-title">NTP 설정</div>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="form-row col-md-4" style="float: left;">
											<label class="col-sm-4 col-form-label">NTP IP</label>
											<div class="col-sm-8">
												<input name="ntpip" type="text" class="form-control">
											</div>
										</div>
										<div class="form-row col-md-4" style="float: left;">
											<label class="col-sm-4 col-form-label">NTP 포트</label>
											<div class="col-sm-8">
												<input name="ntpport" type="number" min="0" max="65535" class="form-control">
											</div>
										</div>
										<div class="form-row col-md-4" style="float: left;">
											<label class="col-sm-4 col-form-label">동기화 주기(분)</label>
											<div class="col-sm-8">
												<input name="ntpsyncmin" type="number" min="0" class="form-control">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="card easion-card">
								<div class="card-header">
									<div class="easion-card-title">저장 설정</div>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">HDD 저장패킷 용량(%)</label>
											<div class="col-sm-8">
												<input name="syshddsaveper" type="number" min="0" max="100"
													class="form-control">
											</div>
										</div>
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">파일 삭제 정책(%)</label>
											<div class="col-sm-8">
												<input name="syshdddeleteper" type="number" min="0" max="100" 
													class="form-control">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="card easion-card">
								<div class="card-header">
									<div class="easion-card-title">Report 설정</div>
								</div>
								<div class="card-body">
									<div class="form-group row">
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">Report 미송신
												기준(배수)</label>
											<div class="col-sm-8">
												<input name="rptunsent" type="number" min="0"
													class="form-control">
											</div>
										</div>
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">Report 시간동기
												이상검출(초)</label>
											<div class="col-sm-8">
												<input name="rpttimesyncsec" type="number" min="0"
													max="100" class="form-control">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">Report 스캔 수행시
												최대 동작</label>
											<div class="col-sm-8">
												<input name="rptscanmax" type="number" min="0"
													class="form-control">
											</div>
										</div>
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">상태 기간(일)</label>
											<div class="col-sm-8">
												<input name="rptpacketday" type="number" min="1" class="form-control">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="card easion-card">
								<div class="card-header">
									<div class="easion-card-title">Goose 설정</div>
								</div>
								<div class="card-body">

									<div class="form-group row">
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">GOOSE 미송신
												검출기준(배수)</label>
											<div class="col-sm-8">
												<input name="gseunsent" type="number" min="0"
													class="form-control">
											</div>
										</div>
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">상태 기간(일)</label>
											<div class="col-sm-8">
												<input name="gsepacketday" type="number" min="1" class="form-control">
											</div>
										</div>
									</div>
									<div class="form-group row">
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">1차 지연기준(%)</label>
											<div class="col-sm-8">
												<input name="gsedelay1" type="number" min="0"
													max="100" class="form-control">
											</div>
										</div>
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">2차 지연기준(%))</label>
											<div class="col-sm-8">
												<input name="gsedelay2" type="number" min="0"
													max="100" class="form-control">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">전송시간 최소 기본값</label>
											<div class="col-sm-8">
												<input name="gsesenttimemin" type="number" min="0"
													class="form-control">
											</div>
										</div>
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">전송시간 최대 기본값</label>
											<div class="col-sm-8">
												<input name="gsesenttimemax" type="number" min="0" 
													class="form-control">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="card easion-card">
								<div class="card-header">
									<div class="easion-card-title">실시간 이력</div>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">실시간 이력 새로고침(초)</label>
											<div class="col-sm-8">
												<input name="sysrealsyncsec" type="number" min="0"
													class="form-control">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="card easion-card">
								<div class="card-header">
									<div class="easion-card-title">외부연계 파일</div>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">외부연계(IEC61850서버)
												IET File</label>
											<div class="input-file col-sm-8">
												<input name="sysexternaliet" type="text" class="form-control" disabled>
												<input type="file" id="inputIETFile" class="file-upload" />								
												<div class="form-group row"
													style="text-align: center; margin-top: 5px; display: inherit;">
													
													<button type="button" class="btn btn-primary" onclick="downloadIETFile()">다운로드</button>
													<label for="inputIETFile" class="btn btn-primary" style="margin: 0 auto">업로드</label>
												</div>
											</div>
										</div>
										<div class="form-row col-md-6" style="float: left;">
											<label class="col-sm-4 col-form-label">외부연계(IEC61850서버)
												SCL File</label>
											<div class="input-file col-sm-8">
												<input name="sysexternalscl" type="text" class="form-control" disabled>
												<input type="file" id="inputSCLFile" class="file-upload" />		
												<div class="form-group row"
													style="text-align: center; margin-top: 5px; display: inherit;">
													
													<button type="button" class="btn btn-primary" onclick="downloadSCLFile()">다운로드</button>
													<label for="inputSCLFile" class="btn btn-primary" style="margin: 0 auto">업로드</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group row"
								style="text-align: center; margin: 0 auto; display: inherit;">

								<button type="button" class="btn btn-primary" id="submitBtn"
									onclick="apply()">등록</button>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

 <script type="text/javascript">

		function init(data) {
			if(!data) {
				return;
			}
			data.forEach(function(d) {
  				$('input[name="' + d.sysItemId + '"').val(d.sysItemValue)
			})
 		}
	 
    	function apply() {

    		var datas = []

    		$('input.form-control:enabled').each(function() { 
	    		datas.push({
	    	    	'sysItemId': $(this).attr('name'),
	    	    	'sysItemValue': $(this).val()
	    	    })
        	})
    	    
    		$.Advisor.post('/api/v1/configuration', {
    			data: JSON.stringify(datas),
				validation: function(data) {
		        	console.log(data)

		    		var id = (_.find(data, (data) => data.name == 'id') || '').value
		    		if(!id) {
						alert('아이디를 입력 해 주세요.')
						return false
		            }

		            if(!checkId) {
		            	alert('아이디 중복체크를 해 주세요.')
						return false
			        }

		    		var pwd = (_.find(data, (data) => data.name == 'pwd') || '').value
		            if(!pwd) {
						alert('비밀번호를 입력 해 주세요.')
						return false
		            }
						
		            var pwd2 = (_.find(data, (data) => data.name == 'pwd2') || '').value
		            if(!pwd2) {
		            	alert('비밀번호 확인을 입력 해 주세요.')
		            	return false
		            }
		                
					if(pwd != pwd2) {
						alert('비밀번호가 맞지 않습니다.')
						return false
		            }

					var name = (_.find(data, (data) => data.name == 'name') || '').value
		    		if(!name) {
						alert('이름을 입력 해 주세요.')
						return false
		            }
		            
		            return true
				},
				success: function(res) {
					alert('등록 성공')
					location.reload();
				},
				error: function(message) {
					alert('등록 실패 : ' + message)
				}
    		})
        }

    	function downloadIETFile() {
        	var fileName = $('input[name="sysexternaliet"]').val()
			window.location = 'download/' + fileName
        }

        function downloadSCLFile() {
        	var fileName = $('input[name="sysexternalscl"]').val()
			window.location = 'download/' + fileName
        }
        
        function uploadIETFile() {
        	var formData = new FormData();
        	formData.append("ietFile", $('#inputIETFile')[0].files[0]);

			$.Advisor.post('/api/v1/configuration/upload/iet', {
				data: formData,
				success: function(res) {
					$('input[name="sysexternaliet"]').val(res)
				},
				fail: function(data, message) {
					alert('업로드 실패 : ' + message)
				},
				error: function(message) {
					alert('업로드 실패 : ' + message)
				},
			})
        }

        function uploadSCLFile() {
        	var formData = new FormData();
        	formData.append("sclFile", $('#inputSCLFile')[0].files[0]);

			$.Advisor.post('/api/v1/configuration/upload/scl', {
				data: formData,
				success: function(res) {
					$('input[name="sysexternalscl"]').val(res)
				},
				fail: function(data, message) {
					alert('업로드 실패 : ' + message)
				},
				error: function(message) {
					alert('업로드 실패 : ' + message)
				},
			})
        }
        
    	$(document).ready(function() {
        	$('#inputIETFile').change(function(e) {
        		uploadIETFile()
            })
            
            $('#inputSCLFile').change(function(e) {
            	uploadSCLFile()
            })
            
			$.Advisor.get('/api/v1/configuration', {
				success: function(data) {
             		init(data);       
				},
            });
    	})
    </script>
</body>

</html>