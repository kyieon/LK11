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
            		 <h1 class="dash-title">IET 검사</h1>
            		
            		 <table id="example" class="display" style="width: 100%"></table>
            		
                </div>
            </main>
        </div>
    </div>
    
    
    
    <script type="text/javascript">
		$(document).ready(function() {

			var dataSet = [
			    ["1" , "IED_01" , "10.0.0.1" , "IED_01.xlsx" ],
			    ["2" , "IED_01" , "10.0.0.1" , "IED_01.xlsx" ],
			    ["3" , "IED_01" , "10.0.0.1" , "IED_01.xlsx" ],
			    ["4" , "IED_01" , "10.0.0.1" , "IED_01.xlsx" ],
			    ["5" , "IED_01" , "10.0.0.1" , "IED_01.xlsx" ],
			    ["6" , "IED_01" , "10.0.0.1" , "IED_01.xlsx" ],
			    ["7" , "IED_01" , "10.0.0.1" , "IED_01.xlsx" ],
			    ["8" , "IED_01" , "10.0.0.1" , "IED_01.xlsx" ],
			    ["9" , "IED_01" , "10.0.0.1" , "IED_01.xlsx" ]
			];
			
			var table =	$('#example').DataTable({
				"data" : dataSet
				, "bInfo" : false
				, "paging": false
			    , "searching": false
			    , "ordering": false
			    , "dom" : 'Bfrtip'
				, "select": true
		        , "buttons": [
		            {
		                text: 'IET 검사',
		                action: function () {
		                	var data = 	table.rows( { selected: true } ).data()[0];
							if(data === undefined){
								alert("IET 를 선택해 주세요.");
								return;
							}
							
		                	
		               		console.log(data[0]);
		               		console.log(data[1]);
		               		console.log(data[2]);
		               		console.log(data[3]);
							debugger;
		                }
		            }
		        ]
				, "columns" : [
					{title: 'NO'},
					{title: 'IED 이름'},
					{title: 'IP'},
					{title: 'IET 파일'}
				]
				 
			});

			// 버튼을 변경 한다 .
			$(table.buttons().container()).children("button").removeClass().addClass("btn btn-outline-dark  mb-1");

		});
	</script>
</body>

</html>