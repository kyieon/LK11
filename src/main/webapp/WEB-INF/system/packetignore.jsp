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
            		 <h1 class="dash-title">패킷처리 제외</h1>
            		
            		 <table id="example" class="display" style="width: 100%"></table>
            		
                </div>
            </main>
        </div>
				
		
	</div>
    
	<script type="text/javascript">
	
		$(document).ready(function() {

			var dataSet = [
				["1" , "IED" , 'IED_01', "10.1.1.1", "적용" ],
				["2" , "IED" , 'IED_02', "10.1.1.2", "제외" ],
				
			];

			var table =	$('#example').DataTable({
				"data" : dataSet
				, "bInfo" : false
			    , "searching": false
			    , "dom" : 'Bfrtip'
		        , "buttons": [
		            {
		                text: '점검 완료',
		                action: function () {
							debugger
		                }
					}	
		        ]
				, "columns" : [
					{title: 'NO'},
					{title: '장치종류'},
					{title: '디바이스 이름'},
					{title: 'IP 주소'},
					{title: '상태'},
				], "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
		                if ( aData[4] == "적용" )
		                {
		                    $(nRow).find('td:eq(4)').css('background-color', 'green')
		                }
		                else 
		                {
		                    $(nRow).find('td:eq(4)').css('background-color', 'red')
		                }
				 }
				 
			});

			// 버튼을 변경 한다 .
			$(table.buttons().container()).children("button").removeClass().addClass("btn btn-outline-dark  mb-1");

		});
	</script>
</body>

</html>