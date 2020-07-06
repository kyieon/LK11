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
            		 <h1 class="dash-title">MMS 실시간 이력</h1>
            		 <div class="card easion-card">
	            		 <div class="card-body ">
	            		 	<form>
	            		 		<div class="form-group">
                                    <label for="">시작 시간 : </label>
                                    <input type="text" class="" id="" style ="width:150px;">
                                    <i class="fas fa-calendar-alt" style ="padding-left:10px;"></i>
                                    <button type="button" class="btn btn-primary mb-1">조회</button>
                                    <button type="button" class="btn btn-primary mb-1">CSV 파일 저장</button>
                                </div>
                                <div class="form-group">
                                    <label for="">종료 시간 :</label>
                                    <input type="text" class="" id="" style ="width:150px;">
                                    <i class="fas fa-calendar-alt" style ="padding-left:10px;"></i>
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
                </div>
            </main>
        </div>
    </div>
    
    
    
    <script type="text/javascript">
		$(document).ready(function() {

			var dataSet = [
			    [ "1", "2020-02-21 19:13:40:111", "IED_01", "SA 운영장치",  "Report"  ,"복귀_ReportID","1"],
			    [ "2", "2020-02-23 19:13:40:311", "IED_02", "SA 운영장치", "Report" ,"장애_ReportID","2"],
			    [ "3", "2020-02-24 19:13:40:411", "IED_03", "SA 운영장치",  "Report" ,"복귀_ReportID","3"]
			   
			];
			
		var table =	$('#example').DataTable({
				"data" : dataSet
				, "bInfo" : false
				, "ordering": false
				, "orderCellsTop": true
			    , "fixedHeader": true
				,"columns" : [
					{title: 'No'},
					{title: '시간'},
					{title: 'Source Device'},
					{title: 'Destination'},
					{title: '서비스'},
					{title: '비고'}
				]
				,"fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
		                if ( aData[6] == "1" )
		                {
		                    $(nRow).find('td:eq(5)').css('background-color', 'green')
		                }
		                else if ( aData[6] == "2" )
		                {
		                    $(nRow).find('td:eq(5)').css('background-color', 'red')
		                }else{

				        }
				 }
			});



			$('#example thead tr').clone(true).appendTo( '#example thead' );
		    $('#example thead tr:eq(1) th').each( function (i) {
			    if(i == "0"){  $(this).html( ''); return true};
		        var title = $(this).text();

		        if(i == "0"){ 
			         $(this).html( ''); return true
			    }else if(i == "4"){
					var st = '<select> <option value="Report">Report</option> <option value="1">연결요청</option> <option value="2">연결해제</option>  <option value="3">연결요청응답</option>  </select>';
					$(this).html( st );
					   $( 'select', this ).on( 'change', function () {
				            if ( table.column(i).search() !== this.value ) {
				                table.column(i).search( this.value ).draw();
				            }
				     } );
				}else{
			    	$(this).html( '<input type="text"  placeholder="Search '+title+'" />' );
			    	   $( 'input', this ).on( 'keyup change', function () {
					        
				            if ( table.column(i).search() !== this.value ) {
				                table.column(i).search( this.value ).draw();
				            }
				     } );
				}
		        
		        
		 		
		     
		    } ); 

			//테이블 serch 박스 숨ㄱ미
			$("#example_filter").hide();
		});
	</script>
</body>

</html>