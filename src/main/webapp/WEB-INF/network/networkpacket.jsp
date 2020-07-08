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
			<%@ include file="/WEB-INF/common/navigation.jsp"%>
		</div>
		<div class="dash-app">
			<%@ include file="/WEB-INF/common/toolbar.jsp"%>
			<main class="dash-content">
				<div class="container-fluid">
					<h1 class="dash-title">네트워크 패킷</h1>
					<div class="card easion-card">
						<div class="card-body ">
							<form>
								<div class="form-group">
									<label for="">시작 시간 : </label> <input type="text" class=""
										id="" style="width: 150px;"> <i
										class="fas fa-calendar-alt" style="padding-left: 10px;"></i>
									<button type="button" class="btn btn-primary mb-1">조회</button>
								</div>
								<div class="form-group">
									<label for="">종료 시간 :</label> <input type="text" class="" id=""
										style="width: 150px;"> <i class="fas fa-calendar-alt"
										style="padding-left: 10px;"></i>
									<button type="button" class="btn btn-outline-dark mb-1">+5분</button>
									<button type="button" class="btn btn-outline-dark mb-1">+10분</button>
									<button type="button" class="btn btn-outline-dark mb-1">+20분</button>
									<button type="button" class="btn btn-outline-dark mb-1">+30분</button>
									<button type="button" class="btn btn-outline-dark mb-1">+1시간</button>
									<button type="button" class="btn btn-primary mb-1">초기화</button>
								</div>

							</form>
						</div>
					</div>
					<table id="example" class="display" style="width: 100%"></table>

					<div style="margin-top: 2em; float: right;">
						<div style="width: 200px; float: left; margin: 5px 10px; border: 1px solid">
							<div class="custom-radio" style="left: 30px; float: left; position: relative;">
								<input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
								<label class="custom-control-label" for="customRadio3">선택 추출</label>
							</div>
							<div class="custom-radio" style="float: right">
								<input type="radio" id="customRadio4" name="customRadio" class="custom-control-input">
								<label class="custom-control-label" for="customRadio4">전체 추출</label>
							</div>
						</div>
						<button type="button" class="btn btn-primary" style="float: right;">추출하기</button>
					</div>
				</div>
			</main>
		</div>
	</div>



	<script type="text/javascript">
		$(document).ready(function() {

			var dataSet = [
			    ["", "이더넷스위치", "메인스위치M", "10.1.1.1" ],
			    ["", "이더넷스위치", "메인스위치B", "10.1.1.2" ],
			    ["", "HMI", "메인스위치M", "10.1.1.3" ],
			    ["", "이더넷스위치", "메인스위치M", "10.1.1.4" ],
			    ["", "이더넷스위치", "메인스위치M", "10.1.1.5" ],
			    ["", "이더넷스위치", "메인스위치M", "10.1.1.6" ],
			    ["", "이더넷스위치", "메인스위치M", "10.1.1.7" ],
			    ["", "이더넷스위치", "메인스위치M", "10.1.1.7" ],
			    ["", "이더넷스위치", "메인스위치M", "10.1.1.7" ],
			    ["", "이더넷스위치", "메인스위치M", "10.1.1.7" ],
			    ["", "이더넷스위치", "메인스위치M", "10.1.1.7" ],
			    ["", "이더넷스위치", "메인스위치M", "10.1.1.7" ],
			    ["", "이더넷스위치", "메인스위치M", "10.1.1.7" ],
			];

		var table =	$('#example').DataTable({
				"data" : dataSet
				, "bInfo" : false
			    , "ordering": false
			    , "orderCellsTop": true
		        , "fixedHeader": true
				,"columns" : [
					{title: ''}
					,{title: '장치종류'}
					,{title: '장치이름'}
					,{title: 'IP주소'}
				]
		 		,  "columnDefs": [ {
		            orderable: false,
		            className: 'select-checkbox',
		            targets:   0
		        } ]
		 		 ,select: {
		             style:    'multi',
		             selector: 'td:first-child'
		         }
		         ,order: [[ 1, 'asc' ]]
			});

	 	$('#example thead tr').clone(true).appendTo( '#example thead' );
	    $('#example thead tr:eq(1) th').each( function (i) {

	    	if(i == "0"){ 
		         $(this).html(''); 
		         return true;
		    } else if(i == "1"){
					var st = '<select> <option value="">전체</option> <option value="이더넷스위치">이더넷 스위치</option> <option value="HMI">HMI</option><option value="정보연계장치M">정보연계장치M</option><option value="정보연계장치B">정보연계장치B</option>  </select>';
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

		//테이블 serch 박스 숨김
		$("#example_filter").hide();
	});
	</script>
</body>

</html>