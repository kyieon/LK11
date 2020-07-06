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
			    [ "1", "2020-02-21 19:13:40:111", "백업 스위치M", "4" , "UP" ,"미등록포트"],
			    [ "2", "2020-02-22 19:13:40:211", "백업 스위치M", "5" ,"DOWN" ,"HMI"],
			    [ "3", "2020-02-23 19:13:40:311", "백업 스위치M", "6" ,"UP" ,"미등록포트"],
			    [ "4", "2020-02-22 19:13:40:211", "백업 스위치M", "7" ,"DOWN" ,"HMI2"],
			    [ "5", "2020-02-23 19:13:40:311", "메인 스위치S", "8" ,"UP" ,"HMI"],
			    [ "6", "2020-02-22 19:13:40:211", "백업 스위치M", "9" ,"DOWN" ,"미등록포트"],
			    [ "7", "2020-02-23 19:13:40:311", "메인 스위치S", "10" ,"UP" ,"HMI2"],
			    [ "8", "2020-02-22 19:13:40:211", "백업 스위치M", "11" ,"DOWN","미등록포트" ],
			    [ "9", "2020-02-23 19:13:40:311", "백업 스위치M", "12" ,"UP" ,"HMI2"],
			    [ "10", "2020-02-22 19:13:40:211", "메인 스위치S", "13" ,"DOWN" ,"HMI2"],
			    [ "11", "2020-02-23 19:13:40:311", "백업 스위치M", "14" ,"UP" ,"미등록포트"],
			    [ "12", "2020-02-24 19:13:40:411", "백업 스위치M", "15" ,"DOWN" ,"HMI" ]
			   
			];
			
			$('#example').DataTable({
				"data" : dataSet,
				"columns" : [
					{title: 'No'},
					{title: '시간'},
					{title: '이더넷스위치'},
					{title: '포트주소'},
					{title: '상태'},
					{title: '연결장치'}
				],
				 "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
		                if ( aData[4] == "UP" )
		                {
		                    $(nRow).find('td:eq(4)').css('background-color', 'green')
		                }
		                else 
		                {
		                    $(nRow).find('td:eq(4)').css('background-color', 'red')
		                }
				 }
			});
		});
	</script>
</body>

</html>