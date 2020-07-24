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
            		 <h1 class="dash-title">시스템 장치</h1>
            		
            		 <table id="example" class="display" style="width: 100%"></table>
            		
                </div>
            </main>
        </div>
				
		<!-- Dialog -->
		<div id="createDialog" class="modal" style="height: auto;">
			<div class="modal-header">
				<h4 class="modal-title">생성</h4>
			</div>
			<div class="modal-body">
			
				<select class="form-control" id="inputType">
					<option value="devOper">상위운영장치</option>
					<option value="devSwitch">이더넷 스위치</option>
					<option value="devSNTP">SNTP</option>
					<option value="devIED">IED</option>
				</select>
				
				<form id="createForm">
					
					<input name="type" type="hidden" value="devOper">
					
					<div style="margin-top: 40px;">
						<div class="form-group row">
							<label for="inputName" class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-10">
								<input name="name" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputIP" class="col-sm-2 col-form-label">IP</label>
							<div class="col-sm-10">
								<input name="ip" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputDesc" class="col-sm-2 col-form-label">포트 개수</label>
							<div class="col-sm-10">
								<input name="ports" type="number" value="1" min="1" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputDesc" class="col-sm-2 col-form-label">설명</label>
							<div class="col-sm-10">
								<textarea name="desc" class="form-control" rows="3"></textarea>
							</div>
						</div>
						<div class="form-group row" style="display: none">
							<label for="inputSCL" class="col-sm-2 col-form-label">SCL</label>
							<div class="col-sm-10">
								<input name="sclFile" type="file" class="form-control" disabled>
							</div>
						</div>
						<div class="form-group row" style="display: none">
							<label for="inputIET" class="col-sm-2 col-form-label">IET</label>
							<div class="col-sm-10">
								<input name="ietFile" type="file" class="form-control" disabled>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" onClick="add()">OK</button>	 
				<button type="button" class="btn btn-outline-primary" onClick="$.modal.close()">Close</button>
			</div>
		</div>

		<div id="modifyDialog" class="modal" style="height: auto;">
			<div class="modal-header">
				<h4 class="modal-title">수정</h4>
			</div>
			<div class="modal-body">
				<form id="modifyForm">
					<div class="form-group row">
						<label for="inputName" class="col-sm-2 col-form-label">이름</label>
						<div class="col-sm-10">
							<input name="name" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputIP" class="col-sm-2 col-form-label">IP</label>
						<div class="col-sm-10">
							<input name="ip" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputDesc" class="col-sm-2 col-form-label">포트 개수</label>
						<div class="col-sm-10">
							<input name="ports" type="number" value="1" min="1" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputDesc" class="col-sm-2 col-form-label">설명</label>
						<div class="col-sm-10">
							<textarea name="desc" class="form-control" rows="3"></textarea>
						</div>
					</div>
					<div class="form-group row" style="display: none">
						<label for="inputSCL" class="col-sm-2 col-form-label">SCL</label>
						<div class="col-sm-10">
							<input name="sclFile" type="file" class="form-control" disabled>
						</div>
					</div>
					<div class="form-group row" style="display: none">
						<label for="inputIET" class="col-sm-2 col-form-label">IET</label>
						<div class="col-sm-10">
							<input name="ietFile" type="file" class="form-control" disabled>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" onClick="set()">OK</button>	 
				<button type="button" class="btn btn-outline-primary" onClick="$.modal.close()">Close</button>
			</div>
		</div>

		<div id="deleteDialog" class="modal" style="height: auto;">
			<div class="modal-header">
				<h4 class="modal-title">삭제하시겠습니까?</h4>
			</div>
			
			<input type="hidden" id="deleteType">
			<input type="hidden" id="deleteIp">
			
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" onClick="del()">OK</button>	 
				<button type="button" class="btn btn-outline-primary" onClick="$.modal.close()">Close</button>
			</div>
		</div>
	</div>
    
	<script type="text/javascript">
	
		function convertDevName(type) {
			return (_.find([
				{type: 'devOper', name: '상위운영장치'},
				{type: 'devSwitch', name: '이더넷 스위치'},
				{type: 'devSNTP', name: 'SNTP'},
				{type: 'devIED', name: 'IED'}
			], (data) => data.type == type) || '').name
		}
	
		function add() {
			var $form = $('#createForm');
			var type = (_.find($form.serializeArray(), (data) => data.name == 'type') || '').value
			
			$.Advisor.postByForm($form, {
				url: '/api/v1/device/create/' + type,
				validation: function(data) {
		        	console.log(data)

		        	var name = (_.find(data, (data) => data.name == 'name') || '').value
		    		if(!name) {
						alert('이름을 입력 해 주세요.')
						return false
		            }
					
		    		var ip = (_.find(data, (data) => data.name == 'ip') || '').value
		            if(!ip) {
						alert('IP를 입력 해 주세요.')
						return false
		            }
		    		var ports = (_.find(data, (data) => data.name == 'ports') || '').value
		            if(!ports) {
						alert('포트 개수를 입력 해 주세요.')
						return false
		            }

		    		var desc = (_.find(data, (data) => data.name == 'desc') || '').value
		            if(!desc) {
						alert('설명을 입력 해 주세요.')
						return false
		            }

		        	var type = (_.find(data, (data) => data.name == 'type') || '').value
		    		if(type == 'devIED') {
		    			var sclFile = (_.find(data, (data) => data.name == 'sclFile') || '').value
			    		if(!sclFile) {
							alert('SCL 파일을 선택 해 주세요.')
							return false
			            }
						
		    			var ietFile = (_.find(data, (data) => data.name == 'ietFile') || '').value
			    		if(!ietFile) {
							alert('IET 파일을 선택 해 주세요.')
							return false
			            }
				    }
		        	
		            return true
				},
				success: function(res) {
					alert('등록 성공')
					location.reload();
				},
				error: function(message) {
					alert('등록 실패 : ' + message)
				},
				complete: function() {
					$.modal.close()
				}
			})

		}
		
		function set() {
			debugger

			$.modal.close()
		}

		function del() {
			var type = $('#deleteType').val();
			var ip = $('#deleteIp').val();
			
			$.Advisor.delete('/api/v1/device?type=' + type + '&ip=' + ip, {
				success: function(res) {
					alert('삭제 성공')
					location.reload();
				},
				error: function(message) {
					alert('삭제 실패' + message)
				},
				complete: function() {
					$.modal.close()				
				}
            })
		}

		$(document).ready(function() {

			$('#inputType').change(function() {
				if($(this).val() != 'devIED') {
					$(this).parent().find('div.form-group:gt(3)').css('display', 'none')
					$(this).parent().find('div.form-group:gt(3)').find('input[type="file"]').attr('disabled', true)
				} else {
					$(this).parent().find('div.form-group:gt(3)').css('display', '')
					$(this).parent().find('div.form-group:gt(3)').find('input[type="file"]').attr('disabled', false)
				}
				$("#createForm")[0].reset();
				$('#createForm input[name="type"]').val($(this).val());
				return false;
			});

			var table =	$('#example').DataTable({
				"bInfo" : false
			    , "ordering": false
			    , "dom" : 'Bfrtip'
				, "select": true
		        , "buttons": [
		            {
		                text: '추가',
		                action: function () {
							$("#createDialog").modal();
		                }
					},
					{
		                text: '수정',
		                action: function () {
		                	var data = 	table.rows( { selected: true } ).data()[0];
							if(data === undefined){
								alert("장치를 선택해 주세요.");
								return;
							}
							var type = data.type;
							if(type != 'devIED') {
								$('#modifyDialog .modal-body').find('form > div:gt(3)').css('display', 'none')
							} else {
								$('#modifyDialog .modal-body').find('form > div:gt(3)').css('display', '')
							}
							$("#modifyForm")[0].reset();
		                	$("#modifyDialog").modal();
		                }
					},
					{
		                text: '삭제',
		                action: function () {
		                	var data = 	table.rows( { selected: true } ).data()[0];
							if(data === undefined){
								alert("장치를 선택해 주세요.");
								return;
							}

							var type = data['type']
							var ip = data['ip']

							$('#deleteType').val(type);
							$('#deleteIp').val(ip);
							
							$("#deleteDialog").modal();
		                }
		            }
		        ]
					
				, "columns" : [
					{title: 'NO', data: 'idx'},
					{title: '장치종류', data: 'type', render: function(data, type, row, meta ) {
						return convertDevName(data);
					}},
					{title: '장치이름', data: 'name'},
					{title: 'IP 주소', data: 'ip'},
					{title: '포트 개수', data: 'ports'},
					{title: 'SCL 파일', data: 'scl'},
					{title: 'IET 파일', data: 'iet'},
					{title: '설명', data: 'desc'},
				]
				 
			});
			
			$('#example thead tr').clone(true).appendTo( '#example thead' );
			$('#example thead tr:eq(1) th').each( function (i) {

				if(i == "0" || i == '5' || i == '6' || i == '7'){ 
					$(this).html(''); 
					return true;
				} else if(i == "1"){
					var st = '<select>  <option value="">전체</option><option value="devOper">상위운영장치</option><option value="devSwitch">이더넷 스위치</option><option value="devSNTP">SNTP</option><option value="devIED">IED</option> </select>';
					$(this).html( st );
					$( 'select', this ).on( 'change', function () {
							if ( table.column(i).search() !== this.value ) {
								table.column(i).search( convertDevName(this.value) ).draw();
							}
					} );
				} else {
					var title = $(this).text();
					$(this).html( '<input type="text"  placeholder="Search '+title+'" />' );
					
					$( 'input', this ).on( 'keyup change', function () {
						if ( table.column(i).search() !== this.value ) {
							table.column(i).search( this.value ).draw();
						}
					});

				}
				
			});
			// 버튼을 변경 한다 .
			$(table.buttons().container()).children("button").removeClass().addClass("btn btn-outline-dark  mb-1");

			//테이블 serch 박스 숨김
			$("#example_filter").hide();


			$.Advisor.get('/api/v1/device', {
				success: function(dataSet) {
                    table.clear();
                    table.rows.add( dataSet ).draw();
				},
            });
			
		});
	</script>
</body>

</html>