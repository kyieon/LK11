<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<%@ include file="/WEB-INF/common/header.jsp"%>

<style type="text/css">
.portDiv70 button[type="button"] {
	cursor: default !important;
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
					<div class="card easion-card">
						<div class="card-body ">
							<div class="easion-demo-badges">
								<span class="badge1 badge-success mb-1">&nbsp;&nbsp;&nbsp;&nbsp;MMS
									통신상태&nbsp;&nbsp;&nbsp;</span> <span class="badge1 badge-success mb-1">GOOSE
									미송신 상태</span> <span class="badge1 badge-success mb-1">GOOSE 미등록
									상태</span> <span class="badge1 badge-success mb-1">Report 미송신 상태</span>
							</div>
							<div class="easion-demo-badges mt-3">
								<span class="badge1 badge-success mb-1">네트워크 포트 상태</span> <span
									class="badge1 badge-success mb-1">&nbsp;&nbsp;&nbsp;시각
									동기화 상태&nbsp;&nbsp;&nbsp;</span> <span class="badge1 badge-danger mb-1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주요기능
									상태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <span> &nbsp;&nbsp;범례 :
								</span> <span class="badge1 badge-success mb-1"
									style="padding: 1em 3em;">&nbsp;정상&nbsp; </span> <span
									class="badge1 badge-danger mb-1" style="padding: 1em 3em;">
									비정상</span>

							</div>
						</div>
					</div>
					
					<div id="switchBody" style="overflow:auto;  height:500px;margin-bottom:10px">
					
					</div>
					
					<!-- 테이블  -->
					<div class="row">
						<div class="col-lg-6">
							<div class="card easion-card">

								<div class="card-body ">
									<table class="table table-in-card">
										<thead>
											<tr>
												<th scope="col">상태</th>
												<th scope="col">프로세스</th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><span class="badge1 badge-warning"
													style="padding: 1em 2em;">중지 </span></td>
												<td>패킷저장</td>
												<td>
													<button type="button" class="btn btn-outline-dark mb-1">시작</button>
													<button type="button" class="btn btn-outline-dark mb-1">정지</button>
													<button type="button" class="btn btn-outline-dark mb-1">재시작</button>
												</td>
											</tr>
											<tr>
												<td><span class="badge1 badge-success"
													style="padding: 1em 2em;">동작중 </span></td>
												<td>네트워크 상태감시</td>
												<td>
													<button type="button" class="btn btn-outline-dark mb-1">시작</button>
													<button type="button" class="btn btn-outline-dark mb-1">정지</button>
													<button type="button" class="btn btn-outline-dark mb-1">재시작</button>
												</td>
											</tr>
											<tr>
												<td><span class="badge1 badge-success"
													style="padding: 1em 2em;">동작중 </span></td>
												<td>MMS 메시지 관리</td>
												<td>
													<button type="button" class="btn btn-outline-dark mb-1">시작</button>
													<button type="button" class="btn btn-outline-dark mb-1">정지</button>
													<button type="button" class="btn btn-outline-dark mb-1">재시작</button>
												</td>
											</tr>
											<tr>
												<td><span class="badge1 badge-success"
													style="padding: 1em 2em;">동작중 </span></td>
												<td>GOOSE메시지 관리</td>
												<td>
													<button type="button" class="btn btn-outline-dark mb-1">시작</button>
													<button type="button" class="btn btn-outline-dark mb-1">정지</button>
													<button type="button" class="btn btn-outline-dark mb-1">재시작</button>
												</td>
											</tr>
											<tr>
												<td><span class="badge1 badge-success"
													style="padding: 1em 2em;">동작중 </span></td>
												<td>시각동기상태</td>
												<td>
													<button type="button" class="btn btn-outline-dark mb-1">시작</button>
													<button type="button" class="btn btn-outline-dark mb-1">정지</button>
													<button type="button" class="btn btn-outline-dark mb-1">재시작</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card easion-card">

								<div class="card-body ">
									<table class="table table-hover table-in-card">
										<thead>
											<tr>
												<th scope="col">Drive</th>
												<th scope="col">Gage</th>
												<th scope="col">%</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>C:</td>
												<td>-</td>
												<td>30%</td>
											</tr>
											<tr>
												<td>D:</td>
												<td>-</td>
												<td>70%</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

	<script type="text/javascript">

	
		function checkPortStatus(portStatus) {
			var result = "btn-secondary";
			if (portStatus == "portReady") {
				result = "btn-warning";
			} else if (portStatus == "portUpLink") {
				result = "btn-success";
			} else if (portStatus == "portDownLink") {
				result = "btn-danger";
			} else if (portStatus == "portUnused") {
				result = "btn-secondary";
			}
			return result;
		}

		function numberPad(n, width) {
			n = n + '';
			return n.length >= width ? n : new Array(width - n.length + 1)
					.join('0')
					+ n;
		}

		//devSwitch
		function makeDevSwitch(portInfo) {
			var appendHtml = "<div class='card easion-card'>";
			appendHtml+= "  <div class='card-body' > ";
			appendHtml+= "<h5 style='text-align: center;'>"+portInfo.devName+"</h5>";
			appendHtml+= "<div class='mt-3'>";
			for(var i= 1 ; i< 25 ;i++){
				appendHtml+= "	<div class='portDiv70'>";
				appendHtml+= "	<div><button type='button' connectionTargetIdx ='' class='btn btn-secondary mb-1' id='"+(portInfo.devIdx + '_' + i)+"'>"+numberPad(i, 2)+"</button></div>";
				appendHtml+= "	</div>";
			}
	
			appendHtml+= "</div></div></div>";
		
			$("#switchBody").append(appendHtml);


			for(var i = 0 ; i < portInfo.portList.length ; i++){
				var onePortInfo = portInfo.portList[i];
				var id = portInfo.devIdx + '_' + onePortInfo.portNum;
				$("#"+id).attr('class',"btn "+checkPortStatus(onePortInfo.portStatus)+"  mb-1");
				$("#"+id).attr('title',onePortInfo.targetName+"("+onePortInfo.targetIp+") TargetPort : "+onePortInfo.targetPort);
				$("#"+id).attr('connectionTargetIdx',onePortInfo.targetIdx);

			}
		}

		function init() {
			getSwitch()
		}
		
		function getSwitch() {
			//포트 전체 정보
			$.Advisor.get('/api/v1/home/switch', {
				success : function(dataSet) {
					$("#switchBody").empty()
					for (var i = 0; i < dataSet.length; i++) {
						var portInfo = dataSet[i];
						if (portInfo.devType == 'devSwitch') {// devSwitch
							makeDevSwitch(portInfo);
						}
					}
				},
				fail: function() {

					//Test
					var dataSet = [
					    {
					        "devType": "devSwitch",
					        "devIdx": 10,
					        "devName": "Swtich01",
					        "devIp": "10.34.52.13",
					        "portList": [
					          {
					            "portNum": Math.floor(Math.random() * 20),
					            "portStatus": "portDownLink",
					            "targetIdx": 6,
					            "targetPort": 1,
					            "targetName": "Oper01",
					            "targetIp": "192.168.0.100"
					          },
					          {
					            "portNum": 2,
					            "portStatus": "portDownLink",
					            "targetIdx": 6,
					            "targetPort": 2,
					            "targetName": "Oper01",
					            "targetIp": "192.168.0.100"
					          }
					        ]
					      },
					      {
					        "devType": "devSwitch",
					        "devIdx": 11,
					        "devName": "Swtich02",
					        "devIp": "10.34.52.12",
					        "portList": [
					          {
					            "portNum": 8,
					            "portStatus": "portUpLink",
					            "targetIdx": 15,
					            "targetPort": 1,
					            "targetName": "Oper04",
					            "targetIp": "192.168.0.103"
					          }
					        ]
					      }
					    ]
				    
					$("#switchBody").empty()
					for (var i = 0; i < dataSet.length; i++) {
						var portInfo = dataSet[i];
						if (portInfo.devType == 'devSwitch') {// devSwitch
							makeDevSwitch(portInfo);
						}
					}
				}
			})
		}
		
		$(document).ready(function() {
			$(document).tooltip();

			init();
			
			setInterval(function() {
				init();
			}, 3000)
		})
	</script>
</body>

</html>