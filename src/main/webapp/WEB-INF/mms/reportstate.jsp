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
            		 <h1 class="dash-title">Report 상태</h1>
            		 <div class="card easion-card">
	            		 <div class="card-body ">
	            		 	<form>
	            		 		<div class="form-group">
                                    <label for="">최종 업데이트 시간   </label>
                                    <input type="text" class="" id="" style ="width:350px;">
                                    <button type="button" class="btn btn-primary mb-1">일시중지</button>
                                </div>
	            		 	</form>
	                     </div>
                     </div>
                     <div>
                     	  <button type="button" class="btn btn-primary mb-1" style="float:left;">초기화</button>
                     	  <button type="button" class="btn btn-primary mb-1" style="float:right;">CSV 파일 저장</button>
                     </div>
            			<table id="example" class="display" style="width: 100%"></table>
                </div>
            </main>
        </div>
    </div>
    
    
    
    <script type="text/javascript">
		$(document).ready(function() {

			
			var dataSet = [
			    ["", "1", "정상","IDE_01_RptId","IED_01", "SA운영장치","2020-02-21 19:13:40:111", "1000", "1027","1024","0" ],
			    ["", "2", "비정상","IDE_02_RptId","IED_02", "SA정보연계장치(주)","2020-02-21 19:13:40:111", "1000", "1027","1024","0" ],
			    ["", "3", "정상","IDE_03_RptId","IED_03", "SA운영장치","2020-02-21 19:13:40:111", "1000", "1027","1024","0" ],
			    ["", "4", "비정상","IDE_04_RptId","IED_04", "SA정보연계장치(주)","2020-02-21 19:13:40:111", "1000", "1027","1024","0" ],
			    ["", "5", "정상","IDE_05_RptId","IED_05", "SA운영장치","2020-02-21 19:13:40:111", "1000", "1027","1024","0" ],
			    ["", "6", "비정상","IDE_06_RptId","IED_06", "SA정보연계장치(주)","2020-02-21 19:13:40:111", "1000", "1027","1024","0" ]
			   
			];



			 
			
		var table =	$('#example').DataTable({
				"data" : dataSet
				, "bInfo" : false
				, "paging": false
			    , "ordering": false
			    , "orderCellsTop": true
		        , "fixedHeader": true
				,"columns" : [
					{title: ''}
					,{title: 'No'}
					,{title: '상태'}
					,{title: 'RCB(Report ID)'}
					,{title: 'IED'}
					,{title: '상위장치'}
					,{title: '시간'}
					,{title: '전송횟수'}
					,{title: '미전송횟수'}
					,{title: '최소전송주기'}
					,{title: '최대정송주기'}
				]
				,"fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
		                if ( aData[2] == "정상" )
		                {
		                    $(nRow).find('td:eq(2)').css('background-color', 'green')
		                }
		                else 
		                {
		                    $(nRow).find('td:eq(2)').css('background-color', 'red')
		                }
				 }
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

	    	if(i != "2" && i != "3" && i != "4" && i != "5" && i != "6"){ 
		         $(this).html(''); 
		         return true;
		    }
		    
	        var title = $(this).text();
	        $(this).html( '<input type="text"  placeholder="Search '+title+'" />' );
	 		
	        $( 'input', this ).on( 'keyup change', function () {
		        
	            if ( table.column(i).search() !== this.value ) {
	                table.column(i).search( this.value ).draw();
	            }
	        } );
	    } ); 

		//테이블 serch 박스 숨ㄱ미
		$("#example_filter").hide();
		


		    
		});
	</script>
</body>

</html>