<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<%@ include file="/WEB-INF/common/header.jsp"%>


<style>
.portDiv {
	padding: 0.55em;
	float:left;
}
.border {
	border-left: 1px solid #dee2e6;
	border-right: 1px solid #dee2e6;
}
.v-middle {
	vertical-align: -webkit-baseline-middle;
}
</style>

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
					<h3 class="dash-title">이더넷 스위치 (포트 설정)</h3>
                      
                    <div class="card easion-card">
                        <div class="card-body " >
							<h5 style="text-align: center;">Access(MAIN)</h5>
							<div class="mt-3">
								<c:forEach var="list" begin="1" end="24" step="1" varStatus="status">
								   	<div class="portDiv">
									   <c:choose>
										  <c:when test="${status.index%2 eq '0'}">
											  <div><button type="button" class="btn btn-success mb-1"><fmt:formatNumber pattern="00" value="${status.index}"/></button></div>
										  </c:when>
										  <c:otherwise>
											  <div><button type="button" class="btn btn-outline-secondary mb-1" ><fmt:formatNumber pattern="00" value="${status.index}"/></button></div>
										  </c:otherwise>
									  </c:choose>
								  </div>
								</c:forEach>
							</div>
                        </div>
					</div>
					<div class="card easion-card">
                        <div class="card-body " >
							<h5 style="text-align: center;">Access(Back Up)</h5>
							<div class="mt-3">
								<c:forEach var="list" begin="1" end="24" step="1" varStatus="status">
								   	<div class="portDiv">
									   <c:choose>
										  <c:when test="${status.index%2 eq '0'}">
											  <div><button type="button" class="btn btn-success mb-1"><fmt:formatNumber pattern="00" value="${status.index}"/></button></div>
										  </c:when>
										  <c:otherwise>
											  <div><button type="button" class="btn btn-outline-secondary mb-1" ><fmt:formatNumber pattern="00" value="${status.index}"/></button></div>
										  </c:otherwise>
									  </c:choose>
								  </div>
								</c:forEach>
							</div>
                        </div>
					</div>
					<div class="card easion-card">
                        <div class="card-body " >
							<h5 style="text-align: center;">BackBone(Main)</h5>
							<div class="mt-3">
								<c:forEach var="list" begin="1" end="24" step="1" varStatus="status">
								   	<div class="portDiv">
									   <c:choose>
										  <c:when test="${status.index%2 eq '0'}">
											  <div><button type="button" class="btn btn-success mb-1"><fmt:formatNumber pattern="00" value="${status.index}"/></button></div>
										  </c:when>
										  <c:otherwise>
											  <div><button type="button" class="btn btn-outline-secondary mb-1" ><fmt:formatNumber pattern="00" value="${status.index}"/></button></div>
										  </c:otherwise>
									  </c:choose>
								  </div>
								</c:forEach>
							</div>
                        </div>
					</div>
					<div class="card easion-card">
                        <div class="card-body " >
							<h5 style="text-align: center;">BackBone(Back Up)</h5>
							<div class="mt-3">
								<c:forEach var="list" begin="1" end="24" step="1" varStatus="status">
								   	<div class="portDiv">
									   <c:choose>
										  <c:when test="${status.index%2 eq '0'}">
											  <div><button type="button" class="btn btn-success mb-1"><fmt:formatNumber pattern="00" value="${status.index}"/></button></div>
										  </c:when>
										  <c:otherwise>
											  <div><button type="button" class="btn btn-outline-secondary mb-1" ><fmt:formatNumber pattern="00" value="${status.index}"/></button></div>
										  </c:otherwise>
									  </c:choose>
								  </div>
								</c:forEach>
							</div>
                        </div>
					</div>

					<div class="row">
                        <div class="col-lg-12">
                            <div class="card easion-card">
                     
                                <div class="card-body ">
                                    <table class="table table-in-card">
                                        
                                        <tbody>
                                            <tr>
                                                <td class="border">
													<span class="v-middle">SA운영장치</span>
													<div style="float: right">
														<button type="button" class="btn btn-success mb-1">01</button>
														<button type="button" class="btn btn-success mb-1">02</button>
													</div>
												</td>
                                                <td class="border">
													<span class="v-middle">SA정보연계장치(주)</span>
													<div style="float: right">
														<button type="button" class="btn btn-success mb-1">01</button>
														<button type="button" class="btn btn-success mb-1">02</button>
													</div>
												</td>
												<td class="border">
													<span class="v-middle">SA정보연계장치(예)</span>
													<div style="float: right">
														<button type="button" class="btn btn-success mb-1">01</button>
														<button type="button" class="btn btn-success mb-1">02</button>
													</div>
												</td>
												<td class="border">
													<span class="v-middle">시각동기화서버</span>
													<div style="float: right">
														<button type="button" class="btn btn-success mb-1">01</button>
														<button type="button" class="btn btn-success mb-1">02</button>
													</div>
												</td>
												<td class="border">
													<span class="v-middle">IED_01</span>
													<div style="float: right">
														<button type="button" class="btn btn-success mb-1">01</button>
														<button type="button" class="btn btn-success mb-1">02</button>
													</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="border">
													<span class="v-middle">IED_02</span>
													<div style="float: right">
														<button type="button" class="btn btn-outline-secondary mb-1">01</button>
														<button type="button" class="btn btn-outline-secondary mb-1">02</button>
													</div>
												</td>
												<td class="border">
													<span class="v-middle">IED_03</span>
													<div style="float: right">
														<button type="button" class="btn btn-outline-secondary mb-1">01</button>
														<button type="button" class="btn btn-outline-secondary mb-1">02</button>
													</div>
												</td>
												<td class="border">
													<span class="v-middle">IED_04</span>
													<div style="float: right">
														<button type="button" class="btn btn-outline-secondary mb-1">01</button>
														<button type="button" class="btn btn-outline-secondary mb-1">02</button>
													</div>
												</td>
												<td class="border">
													<span class="v-middle">IED_05</span>
													<div style="float: right">
														<button type="button" class="btn btn-outline-secondary mb-1">01</button>
														<button type="button" class="btn btn-outline-secondary mb-1">02</button>
													</div>
												</td>
												<td class="border">
													<span class="v-middle">IED_06</span>
													<div style="float: right">
														<button type="button" class="btn btn-outline-secondary mb-1">01</button>
														<button type="button" class="btn btn-outline-secondary mb-1">02</button>
													</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>

</html>