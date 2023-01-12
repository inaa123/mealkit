<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<html>

<head>
<title>EZEN MEALKIT</title>
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
<script>
	function init() {
		$('#delBtn').click(() => {
			if($('#mealkitNum:checked').val()) {
            	$('#modalMsg').text('밀키트를 삭제하시겠습니까?') 
            	$('#confirmBtn').hide()
 				$('#noBtn').show()
 				$('#delFavoriteBtn').show()
            	$('#modal').modal()
        	} else {
        		$('#modalMsg').text('삭제할 밀키트를 선택해주세요.')
        		$('#confirmBtn').show()
 				$('#noBtn').hide()
 				$('#delFavoriteBtn').hide()
            	$('#modal').modal()
        	}
    	})

    	$(document).on("click", "button[id='delFavoriteBtn']", function () {
			for (var i = 0; i < $('#mealkitNum:checked').length; i++) {
				$.ajax({
					url: 'delFavorite/' + $('#mealkitNum:checked').eq(i).val(),
					method: 'delete'
				})
			}
			location.reload()
		})
	}
	
	$(init)
</script>

<style>
tr, td {
   border: 1px solid lightgray;
}

#favorite1 {
	width: 100%;
	text-align: center;
}
</style>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
	<a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
	<div id='menuName'>
	    <h3>찜한 상품</h3>
	</div>            
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
	<div class='container' id='mainContainerAddSub'>
		<form>
            <div class='row mt-5'>    
                <div class='col'>
                    <table id='favorite1'>
                        <tbody class='favoriteList'>
                        <c:if test="${mealkits.size() == 0}"> <hr class='my-5'><h3 style='text-align: center'>찜한 상품이 없습니다.</h3><hr class='my-5'></c:if>
                       	<c:forEach var='favorite' items='${favorites}'> 
	                    	<c:forEach var='mealkit' items='${mealkits}'>
	                        	<c:if test="${mealkit.mealkitNum == favorite.mealkitNum}">
				                        <tr>
				                        	<td>
												<input type='checkbox' name='mealkitNum' id='mealkitNum' value='${mealkit.mealkitNum}'/>
											</td>
											<td class='mealkitImage'>
												<a href='http://localhost/mealkit/detailMealkit?mealkitNum=${mealkit.mealkitNum}'>
													<img style='width:150px; height:150px;' src='<c:url value="/attach/${mealkit.mealkitImgfileName}"/>'/>
												</a>
											</td>
											<td>
												${mealkit.mealkitName}<br><br><br>가격 : ${mealkit.price}원
											</td>
										<tr>
									</c:if>
								</c:forEach>
							</c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class='row justify-content-end mt-3 mr-2'>
                <button type='button' id='delBtn' class='btn btn-secondary mr-2'>삭제</button>
            </div>
        </form>
	</div>
    <div class='modal fade' id='modal' tabindex='-1'>
	    <div class='modal-dialog'>
	        <div class='modal-content'>
	            <div class='modal-header py-2'>
	                <p class='modal-title float-left' id='modalLabel'></p>
	                <button type='button' class='close' data-dismiss='modal'>
	                    <span>&times;</span>
	                </button>
	            </div>
	            <div class='modal-body text-center'>
	                <p id='modalMsg'></p>
	            </div>
	            <div class='modal-footer py-1'>
	                <button type='button' id='confirmBtn' class='btn btn-primary col-3' data-dismiss='modal'>확인</button>
	                <button type='button' id='noBtn' class='btn btn-danger col-3' data-dismiss='modal'>아니오</button>
	                <button type='button' class='btn btn-primary col-3' id='delFavoriteBtn' 
                    		onclick="location.href='<%=request.getContextPath() %>/favorite/listFavorite'">예</button>
	            </div>
	        </div>
	    </div>
	</div>
</body>
<%@ include file ='../include/footer.jsp'%>
</html>