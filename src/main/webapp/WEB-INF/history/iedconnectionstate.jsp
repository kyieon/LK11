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
            		 <h1 class="dash-title">이더넷스위치 이력</h1>
            		 <table id="example" class="display" style="width: 100%"></table>
            		 <table id="example1" class="display" style="width: 100%; padding-top:100px;"></table>
            		
                </div>
            </main>
        </div>
    </div>
    
    
    
    <script type="text/javascript">
		$(document).ready(function() {

			var dataSet = [
			    [ "IED_003", '<span class="badge1 badge-primary" style="padding: 1em 2em;">HMI</span>', '<span class="badge1 badge-primary" style="padding: 1em 2em;">정보연계장치M</span>', '<span class="badge1 badge-primary" style="padding: 1em 2em;">정보연계장치B </span>'  ],
			    [ "IED_004", '<span class="badge1 badge-primary" style="padding: 1em 2em;">HMI</span>', '<span class="badge1 badge-primary" style="padding: 1em 2em;">정보연계장치M</span>', '<span class="badge1 badge-primary" style="padding: 1em 2em;">정보연계장치B </span>']
			   
			];
			
			$('#example').DataTable({
				"data" : dataSet
				, "bInfo" : false
				, "paging": false
			    , "searching": false
			    , "ordering": false
				, "columns" : [
					{title: 'IED 비정상'},
					{title: 'SA 운영장치'},
					{title: '정보연계장치(주)'},
					{title: '정보연계장치(예비)'}
				],
				 
			});


			var dataSet1 = [
			    [ "IED_001", '<span class="badge1 badge-success" style="padding: 1em 2em;">HMI</span>', '<span class="badge1 badge-success" style="padding: 1em 2em;">정보연계장치M</span>', '<span class="badge1 badge-success" style="padding: 1em 2em;">정보연계장치B </span>'  ],
			    [ "IED_002", '<span class="badge1 badge-success" style="padding: 1em 2em;">HMI</span>', '<span class="badge1 badge-success" style="padding: 1em 2em;">정보연계장치M</span>', '<span class="badge1 badge-success" style="padding: 1em 2em;">정보연계장치B </span>'  ],
			    [ "IED_003", '<span class="badge1 badge-primary" style="padding: 1em 2em;">HMI</span>', '<span class="badge1 badge-primary" style="padding: 1em 2em;">정보연계장치M</span>', '<span class="badge1 badge-primary" style="padding: 1em 2em;">정보연계장치B </span>'  ],
			    [ "IED_004", '<span class="badge1 badge-primary" style="padding: 1em 2em;">HMI</span>', '<span class="badge1 badge-primary" style="padding: 1em 2em;">정보연계장치M</span>', '<span class="badge1 badge-primary" style="padding: 1em 2em;">정보연계장치B </span>'  ],
			    [ "IED_005", '<span class="badge1 badge-success" style="padding: 1em 2em;">HMI</span>', '<span class="badge1 badge-success" style="padding: 1em 2em;">정보연계장치M</span>', '<span class="badge1 badge-success" style="padding: 1em 2em;">정보연계장치B </span>'  ],
			    [ "IED_006", '<span class="badge1 badge-success" style="padding: 1em 2em;">HMI</span>', '<span class="badge1 badge-success" style="padding: 1em 2em;">정보연계장치M</span>', '<span class="badge1 badge-success" style="padding: 1em 2em;">정보연계장치B </span>'  ],
			    [ "IED_007", '<span class="badge1 badge-success" style="padding: 1em 2em;">HMI</span>', '<span class="badge1 badge-success" style="padding: 1em 2em;">정보연계장치M</span>', '<span class="badge1 badge-success" style="padding: 1em 2em;">정보연계장치B </span>'  ],
			    [ "IED_008", '<span class="badge1 badge-success" style="padding: 1em 2em;">HMI</span>', '<span class="badge1 badge-success" style="padding: 1em 2em;">정보연계장치M</span>', '<span class="badge1 badge-success" style="padding: 1em 2em;">정보연계장치B </span>']
			   
			];
			
			$('#example1').DataTable({
				"data" : dataSet1
				, "bInfo" : false
				, "paging": false
			    , "searching": false
			    , "ordering": false
				, "columns" : [
					{title: 'IED 비정상'},
					{title: 'SA 운영장치'},
					{title: '정보연계장치(주)'},
					{title: '정보연계장치(예비)'}
				],
				 
			});
		});
	</script>
</body>

</html>