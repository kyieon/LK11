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
				<select class="form-control" id="exampleFormControlSelect1">
					<option value="1">상위운영장치</option>
					<option value="2">이더넷 스위치</option>
					<option value="3">SNTP</option>
					<option value="4">IED</option>
				</select>

				<form style="margin-top: 40px;">
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
				<button type="button" class="btn btn-outline-primary" onClick="create()">OK</button>	 
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
				<button type="button" class="btn btn-outline-primary" onClick="modify()">OK</button>	 
				<button type="button" class="btn btn-outline-primary" onClick="$.modal.close()">Close</button>
			</div>
		</div>

		<div id="deleteDialog" class="modal" style="height: auto;">
			<div class="modal-header">
				<h4 class="modal-title">삭제하시겠습니까?</h4>
			</div>
			<input type="hidden" id="deleteKey">
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary" onClick="remove()">OK</button>	 
				<button type="button" class="btn btn-outline-primary" onClick="$.modal.close()">Close</button>
			</div>
		</div>
	</div>
    
	<script type="text/javascript">
	
		function create() {
			debugger

			$.modal.close()
		}
		
		function modify() {
			debugger

			$.modal.close()
		}

		function remove() {
			var key = $('#deleteKey').val();
			console.log('delete', key)
			debugger
			$.modal.close()
		}

		$(document).ready(function() {

			$('#exampleFormControlSelect1').change(function() {
				if($(this).val() != '4') {
					$(this).parent().find('form > div:gt(2)').css('display', 'none')
				} else {
					$(this).parent().find('form > div:gt(2)').css('display', '')
				}
				return false;
			});

			var dataSet = [
			    ["1" , "상위운영장치" , "SA 운영장치" , "10.1.1.1", 1, '', '', '' ],
			    ["2" , "상위운영장치" , "SA 운영장치" , "10.1.1.2", 1, '', '', '' ],
			    ["3" , "상위운영장치" , "SA 운영장치" , "10.1.1.3", 1, '', '', '' ],
			    ["4" , "상위운영장치" , "SA 운영장치" , "10.1.1.4", 1, '', '', '' ],
			    ["5" , "이더넷스위치" , "액세스(주)" , "10.1.1.5", 24, '', '', '' ],
			    ["6" , "이더넷스위치" , "액세스(예비)" , "10.1.1.6", 24, '', '', '' ],
			    ["7" , "SNTP" , "SNTP" , "10.1.1.1", 1, '', '', '' ],
			    ["8" , "IED" , "IED_01" , "10.1.1.1", 2, 'IED_01.cid', 'IED_01.xlsx', '' ],
			    ["9" , "IED" , "IED_02" , "10.1.1.1", 2, 'IED_02.cid', 'IED_02.xlsx', '' ],
			    ["10" , "상위운영장치" , "SA 운영장치" , "10.1.1.1", 1, '', '', '' ],
			    ["11" , "상위운영장치" , "SA 운영장치" , "10.1.1.1", 1, '', '', '' ],
			    
			];

			var table =	$('#example').DataTable({
				"data" : dataSet
				, "bInfo" : false
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
							console.log(data[0]);
							console.log(data[1]);
							console.log(data[2]);
							console.log(data[3]);

							$('#deleteKey').val(data[0]);
							
							$("#deleteDialog").modal();
		                }
		            }
		        ]
				, "columns" : [
					{title: 'NO'},
					{title: '장치종류'},
					{title: '장치이름'},
					{title: 'IP 주소'},
					{title: '포트 개수'},
					{title: 'SCL 파일'},
					{title: 'IET 파일'},
					{title: '설명'},
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
		});
	</script>
</body>

</html>