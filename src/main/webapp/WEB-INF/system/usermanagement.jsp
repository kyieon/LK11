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
                    <h1 class="dash-title">사용자 계정</h1>

                    <div class="row" style="margin-bottom: 5em;">
                        <div class="col-xl-12">
                            <table id="example" class="display" style="width: 100%"></table>
                        </div>
                    </div>

            		<div class="row">
                        <div class="col-xl-12">
                            <div class="card easion-card">
                                <div class="card-body">
                                    <form>
                                        <div class="form-group row">
                                            <label for="inputName" class="col-sm-2 col-form-label">ID</label>
                                            <div class="col-sm-3">
                                                <input type="name" class="form-control" id="inputName">
                                            </div>
                                            <div class="col-sm-2">
                                                <button type="button" class="btn btn-primary">중복 확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputIP" class="col-sm-2 col-form-label">비밀번호</label>
                                            <div class="col-sm-4">
                                                <input type="name" class="form-control" id="inputIP">
                                            </div>
                                            <label for="inputIP" class="col-sm-2 col-form-label">비밀번호 확인</label>
                                            <div class="col-sm-4">
                                                <input type="name" class="form-control" id="inputIP">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputIP" class="col-sm-2 col-form-label">이름</label>
                                            <div class="col-sm-4">
                                                <input type="name" class="form-control" id="inputIP">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputRole" class="col-sm-2 col-form-label">권한</label>
                                            <div class="col-sm-4">
                                                <select class="form-control" id="inputRoles">
                                                    <option>관리자</option>
                                                    <option>운영자</option>
                                                </select>                                
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputDesc" class="col-sm-2 col-form-label">설명</label>
                                            <div class="col-sm-10">
                                                <textarea class="form-control" id="inputDesc" rows="3"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row" style="text-align: center; margin: 0 auto; display: inherit;">
                                            <button type="submit" class="btn btn-primary">등록</button>
                                            <button type="button" class="btn btn-outline-secondary">취소</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    
    <script type="text/javascript">
        function del(id) {
            debugger
        }
        
        function lock(id) {

        }

        function unLock(id) {
            debugger
        }

        $(document).ready(function() {
            var table = $('#example').DataTable({
                        "bInfo" : false
                        , "paging": false
                        , "searching": false
                        , "ordering": false
                        , "columns" : [
                            {title: 'ID', data: 'id'},
							{title: '이름', data: 'name'},
                            {title: '권한', data: 'type'},
                            {title: '등록시간', data: 'createTime'},
                            {title: '수정시간', data: 'updateTime'},
                            {title: '등록해제', data: null, "render": function ( data, type, row, meta ) {
                                return '<input type="button" onClick="del(\'' + row.id + '\')" value="삭제"/>'
                            }},
                            {title: '잠김해제', data: 'enabled', "render": function ( data, type, row, meta ) {
                                if(data) {
                                    return '<input type="button" onClick="unLock(\'' + row.id + '\')" value="잠김"/>';
                                }
                                return '<input type="button" onClick="unLock(\'' + row.id + '\')" value="해제"/>';
                            }},
                        ]
            });
                    
			$.Advisor.get('/api/v1/user', {
				success: function(dataSet) {
                    table.clear();
                    table.rows.add( dataSet ).draw();
				},
            });
        })
        
    </script>
</body>

</html>