<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>

<html>
<head>
<title>EAZEN MEALKIT</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' />
<link rel='stylesheet' type='text/css' href='../res/lib.css'>
<link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>
<link rel='preconnect' href='https://fonts.googleapis.com'>
<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
<link href='https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap' rel='stylesheet'>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<style>
tr, td {
   border: 1px solid lightgray;
}

table.latestList {
	width: 100%;
	text-align: center;
}
</style>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
	<a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
	<div id='menuName'>
	    <h3>최근 본 상품</h3>
	</div>            
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
	<div class='container' id='mainContainerAddSub'>
		<div class='row mt-5'>
			<div class='col'>
				<table class='latestList'>
					<tbody>
					<c:if test="${mealkits.size() == 0}"> <hr class='my-5'><h3 style='text-align: center'>최근 본 상품이 없습니다.</h3><hr class='my-5'></c:if>
						<c:forEach var='mealkit' items='${mealkits}'>
							<tr>
								<td class='mealkitImage'>
									<a href='${pageContext.request.contextPath}/mealkit/detailMealkit?mealkitNum=${mealkit.mealkitNum}'>
										<img style='width:150px; height:150px;' src='<c:url value="/attach/${mealkit.mealkitImgfileName}"/>'/>
									</a>
								</td>
								<td>
									${mealkit.mealkitName}<br><br><br>가격 : ${mealkit.price}원
								</td>
							</tr>
						</c:forEach>						
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<%@ include file ='../include/footer.jsp'%>
</html>