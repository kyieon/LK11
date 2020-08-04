<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<%@ include file="/WEB-INF/common/header.jsp"%>


<style>
.portDiv {
	padding: 0.55em;
	float:left;
}
.border {
	border-left: 1px solid #dee2e6;
	border-right: 1px solid #dee2e6;
}
.v-middle {
	vertical-align: -webkit-baseline-middle;
}
</style>

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
					<h3 class="dash-title">이더넷 스위치 (포트 설정) 
					<button type="button" class="btn btn-success mb-1 ml-5">업링크</button>
					<button type="button" class="btn btn-danger mb-1 ml-3" >다운링크</button>
					<button type="button" class="btn btn-warning mb-1 ml-3">연결할당</button>
					<button type="button" class="btn btn-secondary mb-1 ml-3">미사용</button>
					</h3>

					<div id="switchBody" style="overflow:auto;  height:800px;margin-bottom:10px">
					
					</div>
					
					<div class="row">
                        <div class="col-lg-12">
                            <div class="card easion-card">
                                <div class="card-body" id="bodyDiv" >
	                         
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    <!-- Dialog -->
   		
		<div id="createDialog" class="modal" style="max-width: 900px; height: auto;">
			<div class="modal-header">
				<h4 class="modal-title">이더넷 스위치 포트 설정</h4>
			</div>
			<div class="modal-body">
	          
	          <main class="dash-content-nopadding">
	         	<form id="portConnectionForm">
    			<input type="hidden" name="devIdx"  id="devIdx">
                <div class="container-fluid">
                    <div class="row">
			          <div class="col-lg-6">
		                   <div class="stats stats-light" style="min-height: 200px;margin-bottom : 0px">
		                       <h3 class="stats-title" style="font-size : 20px"> 이더넷 스위치 정보 </h3>
		                       <div class="stats-content" style="margin-top: 0px;">
		                     		
		                     		<div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">이름</label>
											<div class="col-sm-8">
												<input name="name" class="form-control" id="selectPortName" readonly>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">IP</label>
											<div class="col-sm-8">
												<input name="ip" class="form-control" id="selectPortIp" readonly>
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-sm-4 col-form-label">선택 포트</label>
											<div class="col-sm-3">
													<input name="devPort" class="form-control" id="selectPortNum" readonly>
											</div>
											</div>
										</div>
										
									</div>
		                     		
		                       </div>
		                 </div>
		      
               
			              <div class="col-lg-6">
		                   <div class="stats stats-light" style="min-height: 200px;margin-bottom : 0px">
		                       <h3 class="stats-title" style="font-size : 20px"> 연결포트 설정 </h3>
		                       <div class="stats-content" style="margin-top: 0px;">
		                     		
		                     		<div style="width:100%;">
										<div class="form-group row">
											<label class="col-sm-5 col-form-label">연결 장치 타입</label>
											<div class="col-sm-7">
												<select name="devType" class="form-control" id="selectDevType" >
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-sm-5 col-form-label">연결 장치 선택</label>
											<div class="col-sm-7">
												<select name="targetIdx" class="form-control" id="selectDevType1" >
												</select>
											</div>
										</div>
										
										<div class="form-group row">
											<label class="col-sm-5 col-form-label">연결 선택 포트</label>
											<div class="col-sm-7">
												<select name="targetPort" class="form-control" id="selectPort">
												</select>
											</div>
										</div>
									</div>
										
								</div>
		                     		
		                       </div>
		                 </div>
		              
		           </div>
	           	</div>
	           	</form>
	           </main>

			</div>
			<div class="modal-footer">
				<button type="button" style="display: none" id = "notConnetionB" class="btn btn-outline-primary" onClick="notPortConnetion();">연결 해제</button>	 
				<button type="button" class="btn btn-outline-primary" onClick="portConnetion();">확인</button>	 
				<button type="button" class="btn btn-outline-primary" onClick="$.modal.close()">취소</button>
			</div>
		</div>

    
    
    
 <script type="text/javascript">

		var tempDataSet;
 		function checkPortStatus(portStatus){
 	 		var result ="btn-secondary";
			if(portStatus == "portReady"){
				result ="btn-warning";
			}else if(portStatus == "portUpLink"){
				result ="btn-success";
	 		}else if(portStatus == "portDownLink"){
	 			result ="btn-danger";
			}else if(portStatus == "portUnused"){
				result ="btn-secondary";
			}

			return result;
		
 	 	}

 		function numberPad(n, width) {
 		    n = n + '';
 		    return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
 		}

 		

		function makeConnectionPortInfo(dataSet){
			tempDataSet = dataSet;
			$('#selectDevType option').remove();
			$('#selectDevType1 option').remove();
			$('#selectPort option').remove();
			
			$('#selectDevType ').append("<option value=''>선택해주세요</option>");	
			for(var i = 0 ; i < dataSet.length ; i++)
			{//연결장치 타입
				var info = dataSet[i];
				$('#selectDevType ').append("<option value='"+info.devType+"'>"+info.devType+"</option>");	
				
			}

			$('#selectDevType1').attr('disabled', 'true');
			$('#selectPort').attr('disabled', 'true');
		}
 		

		function openConnectionPop(devIdx , devName , devIp ,  portNum){
			$("#selectPortName").val(devName);
			$("#selectPortIp").val(devIp);
			$("#selectPortNum").val(portNum);
			$("#devIdx").val(devIdx);
		
			//연결 대상 리리스트 가져오기 
			$.Advisor.get('/api/v1/port/devs/port/connectable?devidx='+devIdx, {
				success: function(dataSet) {
					makeConnectionPortInfo(dataSet);
				},
				error: function(message) {
					alert( message)
				},
            });

			var check = $("#"+devIdx+portNum);

			if(check.attr("connectionTargetIdx") == ""){
				$("#notConnetionB").css('display', 'none');
			}else{
				$("#notConnetionB").css('display', '');
			}
						
			$("#createDialog").modal();
		}
 		


 		//devSwitch
 		function makeDevSwitch(portInfo){

			var appendHtml = "<div class='card easion-card'>";
			appendHtml+= "  <div class='card-body' > ";
			appendHtml+= "<h5 style='text-align: center;'>"+portInfo.devName+"</h5>";
			appendHtml+= "<div class='mt-3'>";
			for(var i= 1 ; i< 25 ;i++){
				appendHtml+= "	<div class='portDiv70'>";
				appendHtml+= "	<div><button type='button' connectionTargetIdx ='' class='btn btn-secondary mb-1' id='"+portInfo.devIdx+i+"'  onclick=openConnectionPop("+portInfo.devIdx+",'"+portInfo.devName+"','"+portInfo.devIp+"',"+i+")>"+numberPad(i, 2)+"</button></div>";
				appendHtml+= "	</div>";
			}
	
			appendHtml+= "</div></div></div>";
		
			$("#switchBody").append(appendHtml);


			for(var i = 0 ; i < portInfo.portList.length ; i++){
				var onePortInfo = portInfo.portList[i];
				var id = portInfo.devIdx+onePortInfo.portNum;
				$("#"+id).attr('class',"btn "+checkPortStatus(onePortInfo.portStatus)+"  mb-1");
				$("#"+id).attr('title',onePortInfo.targetName+"("+onePortInfo.targetIp+") TargetPort : "+onePortInfo.targetPort);
				$("#"+id).attr('connectionTargetIdx',onePortInfo.targetIdx);

			}
	 			

 	 	}



	
 		//devOper,DevIED
 		function makeOperIed(portInfo){

			var portOneStatus ="btn-secondary";
			var portTwoStatus ="btn-secondary";

			var titleOne = "";
			var titleTwo = "";

			for(var i = 0 ; i < portInfo.portList.length ; i++){
				var onePortInfo = portInfo.portList[i];
				if(onePortInfo.portNum == '1')
				{
					portOneStatus = checkPortStatus(onePortInfo.portStatus);

					titleOne = onePortInfo.targetName+"("+onePortInfo.targetIp+") TargetPort : "+onePortInfo.targetPort;
				}
				else if(onePortInfo.portNum == '2')
				{
					portTwoStatus = checkPortStatus(onePortInfo.portStatus);
					titleTwo = onePortInfo.targetName+"("+onePortInfo.targetIp+") TargetPort : "+onePortInfo.targetPort;
				}

			}
 			
   		
 			var appendHtml = "<div class='portDivWidthNoMargin border'>";
			appendHtml+= "<div class='card-body' role='alert'> ";
			appendHtml+= "<span class='v-middle'>"+portInfo.devName+"</span>";
			appendHtml+= "<div style='float: right'>";
			appendHtml+= "<button type='button' class='btn "+portOneStatus+" mb-1 mr-1' title='"+titleOne+"'>01</button>";
			appendHtml+= "<button type='button' class='btn "+portTwoStatus+"  mb-1' title="+titleTwo+">02</button>";
			appendHtml+= "</div></div></div>";
		
			$("#bodyDiv").append(appendHtml);
 			
 	 	}

	
		
		$(document).ready(function() {
			  $(document).tooltip();
			//포트 전체 정보
			$.Advisor.get('/api/v1/port', {
				success: function(dataSet) {
					for(var i =0 ; i < dataSet.length ; i++){
						var portInfo = dataSet[i];

						if(portInfo.devType == 'devSwitch')
						{// devSwitch
							makeDevSwitch(portInfo);
						}
						else
						{// devOper,DevIED
							makeOperIed(portInfo);
						}
						

					}
				},
            });
			

			$("#selectDevType").change(function(){
				if(this.value != ''){
					$('#selectDevType1 option').remove();	
					$('#selectDevType1 ').append("<option value=''>선택해주세요</option>");	
					$('#selectDevType1').removeAttr('disabled'); 

					$('#selectPort option').remove();
					$('#selectPort').attr('disabled', 'true');
	
					for(var i = 0 ; i < tempDataSet.length ; i++)
					{//연결장치 타입
						var info = tempDataSet[i];
						if(info.devType == this.value){
							for(var j = 0 ;  j <info.devConnectableList.length ; j++ ){
								var info1 = info.devConnectableList[j];
								$('#selectDevType1').append("<option value='"+info1.devIdx+"'>"+info1.devName+"</option>");	
							}
	
							break;
						}
					}
				}else{
					$('#selectDevType1 option').remove();
					$('#selectPort option').remove();
					$('#selectDevType1').attr('disabled', 'true');
					$('#selectPort').attr('disabled', 'true');
				}

				

				
			});

			$("#selectDevType1").change(function(){
				if(this.value != ''){
					$('#selectPort option').remove();
					$('#selectPort ').append("<option value=''>선택해주세요</option>");
					$('#selectPort').removeAttr('disabled');
				
					for(var i = 0 ; i < tempDataSet.length ; i++)
					{//연결장치 타입
						var info = tempDataSet[i];
						var tempValue = $("#selectDevType").val();

						if(info.devType == tempValue){
							
							for(var j = 0 ;  j <info.devConnectableList.length ; j++ ){
								var info1 = info.devConnectableList[j];
								if(info1.devIdx == this.value){
									for(var z = 0 ; z < info1.connectablePorts.length ; z++){
										var portNum = info1.connectablePorts[z];

										$('#selectPort').append("<option value='"+portNum+"'>"+portNum+"</option>");	
									}
									
									
									break;
								}

									
							}
	
							break;
						}
					}
					

					
				}else{
					$('#selectPort option').remove();
					$('#selectPort').attr('disabled', 'true');
				} 	
			});



			$('#selectDevType1').attr('disabled', 'true');
			$('#selectPort').attr('disabled', 'true');
	        
		});






		//연결
		function portConnetion() {
			
			$.Advisor.postByForm($('#portConnectionForm'), {
				url: '/api/v1/port/devs/ports/devSwitch',
				validation: function(data) {

					var devType = (_.find(data, (data) => data.name == 'devType') || '').value
		    		if(!devType) {
						alert('연결 장치 타입을  선택해주세요.')
						return false
		            }

					
		         	var tarIdx = (_.find(data, (data) => data.name == 'targetIdx') || '').value
		    		if(!tarIdx) {
						alert('연결 장치를 선택을 선택해주세요.')
						return false
		            }
				
		    		var tarPort = (_.find(data, (data) => data.name == 'targetPort') || '').value
		            if(!tarPort) {
						alert('연결 선택 포트를 선택해주세요.')
						return false
		            } 
		        	
		            return true
				},
				success: function(res) {
					alert('연결 성공')
					location.reload();
				},
				error: function(message) {
					alert('연결 실패 : ' + message)
				},
				complete: function() {
					$.modal.close()
				}
			})
		}

		//연결
		function notPortConnetion() {
			
			var devIdx = $('#devIdx').val();
			var devPort = $('#selectPortNum').val();
			
			$.Advisor.delete('/api/v1/port?devIdx=' + devIdx + '&devPort=' + devPort, {
				success: function(res) {
					alert('연결 해제 성공')
					location.reload();
				},
				error: function(message) {
					alert('연결 해제 실패' + message)
				},
				complete: function() {
					$.modal.close()				
				}
            })
		}
		
	</script>
</body>

</html>