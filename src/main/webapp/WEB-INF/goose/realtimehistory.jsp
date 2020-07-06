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
            		 <h1 class="dash-title">GOOSE 실시간 이력</h1>
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
			    [ "1", "2020-02-21 19:13:40:111", "정상", "D308_C445ALRM/LLNO$GO&GOCBA",  "2020-02-21 19:13:40:111"  ,"111"],
			    [ "2", "2020-02-22 19:13:40:211", "정상", "D308_C445ALRM/LLNO$GO&GOCBA",  "2020-02-22 19:13:40:111" ,"222"],
			    [ "3", "2020-02-23 19:13:40:311", "비정상", "D308_C445ALRM/LLNO$GO&GOCBA",  "2020-02-23 19:13:40:111" ,"333"],
			    [ "4", "2020-02-22 19:13:40:211", "정상", "D308_C445ALRM/LLNO$GO&GOCBA",  "2020-02-22 19:13:40:111" ,"444"],
			    [ "5", "2020-02-23 19:13:40:311", "비정상", "D308_C445ALRM/LLNO$GO&GOCBA",  "2020-02-23 19:13:40:111","555"],
			    [ "6", "2020-02-22 19:13:40:211", "정상", "D308_C445ALRM/LLNO$GO&GOCBA",  "2020-02-22 19:13:40:111" ,"666"],
			    [ "7", "2020-02-23 19:13:40:311", "비정상", "D308_C445ALRM/LLNO$GO&GOCBA",  "2020-02-23 19:13:40:111" ,"777"],
			    [ "8", "2020-02-22 19:13:40:211", "정상", "D308_C445ALRM/LLNO$GO&GOCBA",  "2020-02-22 19:13:40:111" ,"888"],
			    [ "9", "2020-02-23 19:13:40:311", "비정상", "D308_C445ALRM/LLNO$GO&GOCBA", "2020-02-23 19:13:40:111" ,"999"],
			    [ "10", "2020-02-22 19:13:40:211", "정상", "D308_C445ALRM/LLNO$GO&GOCBA", "2020-02-22 19:13:40:111" ,"111"],
			    [ "11", "2020-02-23 19:13:40:311", "정상", "D308_C445ALRM/LLNO$GO&GOCBA", "2020-02-23 19:13:40:111" ,"222"],
			    [ "12", "2020-02-24 19:13:40:411", "비정상", "D308_C445ALRM/LLNO$GO&GOCBA",  "2020-02-24 19:13:40:111" ,"333"]
			   
			];
			
			$('#example').DataTable({
				"data" : dataSet
				, "bInfo" : false
			    , "searching": false
				,"columns" : [
					{title: 'No'},
					{title: '시간'},
					{title: '상태'},
					{title: '주소'},
					{title: 'GOOSE 시간'},
					{title: 'SeqNo.'}
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
			});
		});
	</script>
</body>

</html>