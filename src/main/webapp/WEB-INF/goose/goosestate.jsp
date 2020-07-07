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
            		 <h1 class="dash-title">GOOSE 상태</h1>
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
            		<div style="overflow:scroll; width:1570px; height:500px;">
            			<table id="example" class="display" style="width: 100%"></table>
            		 </div>
                </div>
            </main>
        </div>
    </div>
    
    
    
    <script type="text/javascript">
		$(document).ready(function() {

			
			var dataSet = [
			    [ "1","정상","D433_C6065_", "2020-02-21 19:13:40:111", "2", "122","D433_C","01:0c:cd:01:00","1000","1027","1024","0","0","0" ],
			    [ "2","비정상","D433_C6061_", "2020-02-21 19:13:40:111", "2", "122","D433_C","04:0c:cd:04:00","1000","1027","1024","0","0","0" ]
			   
			];



			 
			
		var table =	$('#example').DataTable({
				"data" : dataSet
				, "bInfo" : false
				, "paging": false
			    , "ordering": false
			    , "orderCellsTop": true
		        , "fixedHeader": true
				,"columns" : [
					{title: 'No'}
					,{title: '상태'}
					,{title: 'GOOSE주소'}
					,{title: 'GOOSE시간'}
					,{title: '상태번호'}
					,{title: '순서번호'}
					,{title: 'IED'}
					,{title: 'MAC'}
					,{title: 'IED전송주기'}
					,{title: '최대전송주기'}
					,{title: '평균전송시간'}
					,{title: '미송신'}
					,{title: '1차'}
					,{title: '2차'}
				]
				,"fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
		                if ( aData[1] == "정상" )
		                {
		                    $(nRow).find('td:eq(1)').css('background-color', 'green')
		                }
		                else 
		                {
		                    $(nRow).find('td:eq(1)').css('background-color', 'red')
		                }
				 }
			});


	 	$('#example thead tr').clone(true).appendTo( '#example thead' );
	    $('#example thead tr:eq(1) th').each( function (i) {
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