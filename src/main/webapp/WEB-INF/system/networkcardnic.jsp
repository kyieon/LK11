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
				
		
	</div>
    
	<script type="text/javascript">
	
		$(document).ready(function() {

			var dataSet = [
				["1" , "\\Device\\NPF\\Network_down" , "10.1.1.1", '' ],
				["2" , "\\Device\\NPF\\Network_down" , "10.1.1.2", '' ],
			];

			var table =	$('#example').DataTable({
				"data" : dataSet
				, "bInfo" : false
				, "paging": false
			    , "ordering": false
			    , "dom" : 'Bfrtip'
				, "select": false
		        , "buttons": [
		            {
		                text: '갱신',
		                action: function () {
							
		                }
					},
					{
		                text: '적용',
		                action: function () {
		                	
		                }
					},
					
		        ]
				, "columns" : [
					{title: 'NO'},
					{title: '이름'},
					{title: 'IP 주소'},
					{title: '설명'},
				]
				 
			});
			$('#example thead tr').clone(true).appendTo( '#example thead' );
			$('#example thead tr:eq(1) th').each( function (i) {

				if(i == "0" || i == '3'){ 
					$(this).html(''); 
					return true;
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