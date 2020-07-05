<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Main Page</title>

<%@ include file="/WEB-INF/common/header.jsp"%>

</head>
<body>
	<table id="example" class="display" style="width: 100%"></table>

	<script type="text/javascript">
		$(document).ready(function() {
			$.Advisor.get('/api/v1/user', {
				success: function(data) {
					$('#example').DataTable({
						"data" : data,
						"columns" : [
							{title: 'ID', data: 'id'},
							{title: 'Name', data: 'name'},
						]
					});
				},
			});
		});
	</script>
</body>
</html>