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
            		 <h1 class="dash-title">운영기준 검사</h1>
            		 <div class="card easion-card">
	            		 <div class="card-body ">
	            		 	<form>
	            		 		<div class="form-group">
                                    <label for="">운영기준 :  </label>
                                    <select> 
                                    	<option value="1">운영기준1</option> 
                                    	<option value="2">운영기준2</option>  
                                    	<option value="3">운영기준3</option>  
                                    	<option value="3">운영기준4</option>  
                                    </select>
                                    <button type="button" class="btn btn-primary mb-1">적용</button>
                                    <button type="button" class="btn btn-outline-dark mb-1">운영기준 등록</button>
                                    <button type="button" class="btn btn-outline-dark mb-1">운영기준 수정</button>
                                    <button type="button" class="btn btn-outline-dark mb-1">운영기준 삭제</button>
                                </div>
	            		 	</form>
	                     </div>
                     </div>
            			
            			
            			<main class="">
			                <div class="container-fluid">
			                    <div class="row">
			                        <div class="">
			                            <div class="card easion-card">
			                                <div class="card-body ">
			                                    <table id="example" class="display table table-in-card" style="width: 100%">
						            				<thead>
											            <tr>
											                <th rowspan="2"></th>
											                <th rowspan="2">IED</th>
											                <th rowspan="2">RCB</th>
											                <th rowspan="2">Buffered</th>
											                <th rowspan="2">Buffer Time</th>
											                <th rowspan="2">Integrity<br>Period</th>
											                <th colspan="4">Trigger Option</th>
											                <th colspan="8">Option field</th>
											            </tr>
											            <tr>
											                <th>Dchg</th>
											                <th>Qchg</th>
											                <th>Dupd</th>
											                <th>Intpd</th>
											                <th>Seqnum</th>
											                <th>Timestamp</th>
											                <th>DataSet</th>
											                <th>Reason</th>
											                <th>DataRef</th>
											                <th>BufOvf</th>
											                <th>EntryId</th>
											                <th>ConfRev</th>
											            </tr>
											        </thead>
											        <tbody></tbody>
						            			</table>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </main>
            			
            			
            			
            			
                </div>
            </main>
        </div>
    </div>
    
    
    
    <script type="text/javascript">
		$(document).ready(function() {

			
			var dataSet = [
			    ["", "IED_01", "IED_01_Rcb","1","0", "","v", "", "", "v", "v", "v", "v", "", "", "", "v", "v"],
			    ["", "IED_02", "IED_02_Rcb","1","0", "5000","v", "", "v", "", "", "v", "v", "", "v", "", "v", "v"],
			    ["", "IED_013", "IED_03_Rcb","1","0", "","v", "", "", "v", "v", "v", "v", "", "", "", "v", "v"]
			   
			];



			 
			
		var table =	$('#example').DataTable({
				"data" : dataSet
				, "bInfo" : false
				, "paging": false
				, "searching": false
			    , "ordering": false
			    , "orderCellsTop": true
		        , "fixedHeader": true
				,"fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
		               /*  if ( aData[2] == "정상" )
		                {
		                    $(nRow).find('td:eq(2)').css('background-color', 'green')
		                }
		                else 
		                {
		                    $(nRow).find('td:eq(2)').css('background-color', 'red')
		                } */
				 }
		 		,  "columnDefs": [ {
		            orderable: false,
		            className: 'select-checkbox',
		            targets:   0
		        } ]
		 		, "select": {
		             style:    'multi',
		             selector: 'td:first-child'
		         }
		         ,order: [[ 1, 'asc' ]]
			});


	 	
		


		    
		});
	</script>
</body>

</html>