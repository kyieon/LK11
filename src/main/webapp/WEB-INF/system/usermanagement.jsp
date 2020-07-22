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
                                    <form id="userForm">
                                        <div class="form-group row">
                                            <label for="inputID" class="col-sm-2 col-form-label">ID</label>
                                            <div class="col-sm-3">
                                                <input name="id" class="form-control" id="inputID">
                                            </div>
                                            <div class="col-sm-2">
                                                <button type="button" class="btn btn-primary" id="duplicateBtn" onclick="checkDuplicate()">중복 확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputPwd" class="col-sm-2 col-form-label">비밀번호</label>
                                            <div class="col-sm-4">
                                                <input name="pwd" type="password" class="form-control" id="inputPwd">
                                            </div>
                                            <label for="inputPwd2" class="col-sm-2 col-form-label">비밀번호 확인</label>
                                            <div class="col-sm-4">
                                                <input name="pwd2" type="password" class="form-control" id="inputPwd2">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputName" class="col-sm-2 col-form-label">이름</label>
                                            <div class="col-sm-4">
                                                <input name="name" class="form-control" id="inputName">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputType" class="col-sm-2 col-form-label">권한</label>
                                            <div class="col-sm-4">
                                                <select name="type" class="form-control" id="inputType">
                                                    <option value="utAdmin">관리자</option>
                                                    <option value="utUser">운영자</option>
                                                </select>                                
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="inputDesc" class="col-sm-2 col-form-label">설명</label>
                                            <div class="col-sm-10">
                                                <textarea name="desc" class="form-control" id="inputDesc" rows="3"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row" style="text-align: center; margin: 0 auto; display: inherit;">
                                        
                                            <button type="button" class="btn btn-primary" id="submitBtn" onclick="applyForm()">등록</button>
                                            <button type="button" class="btn btn-outline-secondary" onclick="clearForm();">취소</button>
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

    	var selectionData = null
    	var checkId = null
    	
    	function applyForm() {
        	if(!selectionData) {
            	add()
           	} else {
                set()
            }
        }

        function checkDuplicate() {
            var id = $("#userForm input[name='id']").val()
        	$.Advisor.get('/api/v1/user/exist/' + id, {
        		success: function(data) {
                    checkId = false
					alert('아이디가 중복 되었습니다.')
				},
				fail: function(data) {
					checkId = true
					$("#userForm input[name='id']").attr('readonly', true)
				},
				error: function(e) {
					checkId = null
					alert(e)
				}
            });
        }
        
    	function add() {
        	
			$.Advisor.postByForm($('#userForm'), {
				url: '/api/v1/user/create',
				validation: function(data) {
		        	console.log(data)

		    		var id = (_.find(data, (data) => data.name == 'id') || '').value
		    		if(!id) {
						alert('아이디를 입력 해 주세요.')
						return false
		            }

		            if(!checkId) {
		            	alert('아이디 중복체크를 해 주세요.')
						return false
			        }

		    		var pwd = (_.find(data, (data) => data.name == 'pwd') || '').value
		            if(!pwd) {
						alert('비밀번호를 입력 해 주세요.')
						return false
		            }
						
		            var pwd2 = (_.find(data, (data) => data.name == 'pwd2') || '').value
		            if(!pwd2) {
		            	alert('비밀번호 확인을 입력 해 주세요.')
		            	return false
		            }
		                
					if(pwd != pwd2) {
						alert('비밀번호가 맞지 않습니다.')
						return false
		            }

					var name = (_.find(data, (data) => data.name == 'name') || '').value
		    		if(!name) {
						alert('이름을 입력 해 주세요.')
						return false
		            }
		            
		            return true
				},
				success: function(res) {
					alert('등록 성공')
					location.reload();
				},
				error: function(message) {
					alert('등록 실패 : ' + message)
				}
			})
        }

        
        function set() {
        	$.Advisor.postByForm($('#userForm'), {
				url: '/api/v1/user/modify',
				validation: function(data) {
		        	console.log(data)

		    		var id = (_.find(data, (data) => data.name == 'id') || '').value
		    		if(!id) {
						alert('아이디를 입력 해 주세요.')
						return false
		            }
					
		    		var pwd = (_.find(data, (data) => data.name == 'pwd') || '').value
		            if(!pwd) {
						alert('비밀번호를 입력 해 주세요.')
						return false
		            }
						
		            var pwd2 = (_.find(data, (data) => data.name == 'pwd2') || '').value
		            if(!pwd2) {
		            	alert('비밀번호 확인을 입력 해 주세요.')
		            	return false
		            }
		                
					if(pwd != pwd2) {
						alert('비밀번호가 맞지 않습니다.')
						return false
		            }

					var name = (_.find(data, (data) => data.name == 'name') || '').value
		    		if(!name) {
						alert('이름을 입력 해 주세요.')
						return false
		            }
		            
		            return true
				},
				success: function(res) {
					alert('수정 성공')
					location.reload();
				},
				error: function(message) {
					alert('수정 실패' + message)
				}
			})
        }

        function clearForm() {
            if(!selectionData) {
	        	checkId = null
	        	$("#userForm")[0].reset();
	        	$("#userForm input[name='id']").attr('readonly', false)
            } else {
            	$("#userForm input[name='id']").val(selectionData.id)
            	$("#userForm input[name='pwd']").val('')
            	$("#userForm input[name='pwd2']").val('')
            	$("#userForm input[name='name']").val(selectionData.name)
            	$("#userForm select[name='type']").val(selectionData.type)
            	$("#userForm textarea[name='desc']").val(selectionData.desc)
            }
        }
        
        function del(id) {
            $.Advisor.delete('/api/v1/user/' + id , {
				success: function(res) {
					alert('삭제 성공')
					location.reload();
				},
				error: function(message) {
					alert('삭제 실패' + message)
				}
            })
        }
        
        function enable(id, isEnable) {
        	$.Advisor.put('/api/v1/user/enable', {
            	data: JSON.stringify({
                	id: id,
					enable: isEnable
                }),
				success: function(res) {
					alert('수정 성공')
					location.reload();
				},
				error: function(message) {
					alert('수정 실패' + message)
				}
            })
        }

        function lock(id) {
        	enable(id, false)
        }
        
        function unLock(id) {
        	enable(id, true)
        }

        $(document).ready(function() {
            var table = $('#example').DataTable({
                        "bInfo" : false
                        , "paging": false
                        , "select": true
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
                            {title: '잠김해제', data: 'enable', "render": function ( data, type, row, meta ) {
                                if(data) {
                                    return '<input type="button" onClick="lock(\'' + row.id + '\')" value="잠김"/>';
                                }
                                return '<input type="button" onClick="unLock(\'' + row.id + '\')" value="해제"/>';
                            }},
                        ]
            });

            table.on('select', function ( e, dt, type, indexes ) {
                if ( type === 'row' ) {
                	var data = table.rows( indexes ).data()[0]
                	selectionData = data
                	
                	$('#submitBtn').text('수정')
                	
                	$("#userForm input[name='id']").attr('readonly', true)
                	$("#userForm #duplicateBtn").css('display', 'none')
                	
                	clearForm()
                }
            });

            table.on('deselect', function ( e, dt, type, indexes ) {
                if ( type === 'row' ) {
                	selectionData = null
                	
                	$('#submitBtn').text('등록')

                	$("#userForm input[name='id']").attr('readonly', false)
                	$("#userForm #duplicateBtn").css('display', '')

                	clearForm()
                }
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