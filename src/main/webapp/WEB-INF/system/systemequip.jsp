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
				<form id="createForm">
					<select name="type" class="form-control" id="inputType">
						<option value="devOper">상위운영장치</option>
						<option value="devSwitch">이더넷 스위치</option>
						<option value="devSNTP">SNTP</option>
						<option value="devIED">IED</option>
					</select>
					
					<div style="margin-top: 40px;">
						<div class="form-group row">
							<label for="inputName" class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-10">
								<input name="name" class="form-control" id="inputName">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputIP" class="col-sm-2 col-form-label">IP</label>
							<div class="col-sm-10">
								<input name="ip" class="form-control" id="inputIP">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputDesc" class="col-sm-2 col-form-label">포트 개수</label>
							<div class="col-sm-10">
								<input name="ports" type="number" class="form-control" id="inputPorts">
							</div>
						</div>
						<div class="form-group row">
							<label for="inputDesc" class="col-sm-2 col-form-label">설명</label>
							<div class="col-sm-10">
								<textarea name="desc" class="form-control" id="inputDesc" rows="3"></textarea>
							</div>
						</div>
						<div class="form-group row" style="display: none">
							<label for="inputSCL" class="col-sm-2 col-form-label">SCL</label>
							<div class="col-sm-10">
								<input name="sclFile" type="file" class="form-control" id="inputSCL">
							</div>
						</div>
						<div class="form-group row" style="display: none">
							<label for="inputIET" class="col-sm-2 col-form-label">IET</label>
							<div class="col-sm-10">
								<input name="ietFile" type="file" class="form-control" id="inputIET">
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
				<form>
					<div class="form-group row">
						<label for="inputName" class="col-sm-2 col-form-label">이름</label>
						<div class="col-sm-10">
							<input type="name" class="form-control" id="inputName">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputIP" class="col-sm-2 col-form-label">IP</label>
						<div class="col-sm-10">
							<input type="name" class="form-control" id="inputIP">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputDesc" class="col-sm-2 col-form-label">설명</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="inputDesc" rows="3"></textarea>
						</div>
					</div>
					<div class="form-group row" style="display: none">
						<label for="inputSCL" class="col-sm-2 col-form-label">SCL</label>
						<div class="col-sm-10">
							<input type="file" class="form-control" id="inputSCL">
						</div>
					</div>
					<div class="form-group row" style="display: none">
						<label for="inputIET" class="col-sm-2 col-form-label">IET</label>
						<div class="col-sm-10">
							<input type="file" class="form-control" id="inputIET">
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
	
		function add() {
			$.Advisor.postByForm($('#createForm'), {
				url: '/api/v1/device/create',
				validation: function(data) {
		        	console.log(data)
		        	
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
				} else {
					$(this).parent().find('div.form-group:gt(3)').css('display', '')
				}
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
							console.log(data[0]);
							console.log(data[1]);
							console.log(data[2]);
							console.log(data[3]);
							
							var type = data[1];
							if(type != 'IED') {
								$('#modifyDialog .modal-body').find('form > div:gt(2)').css('display', 'none')
							} else {
								$('#modifyDialog .modal-body').find('form > div:gt(2)').css('display', '')
							}
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
					{title: '장치종류', data: 'type'},
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
						var st = '<select> <option value="">전체</option></select>';
						$(this).html( st );
						$( 'select', this ).on( 'change', function () {
								if ( table.column(i).search() !== this.value ) {
									table.column(i).search( this.value ).draw();
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