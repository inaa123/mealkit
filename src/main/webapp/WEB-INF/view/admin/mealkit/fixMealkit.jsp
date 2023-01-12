<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<head>
<title>EAZEN MEALKIT</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' />
<link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>
<link rel='preconnect' href='https://fonts.googleapis.com'>
<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
<link href='https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap' rel='stylesheet'>
<link rel='stylesheet' type='text/css' href='../../res/admin.css'>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<script>
function init() {
	$('#fixBtn').click(() => {
		let mealkitNum = <%=request.getParameter("mealkitNum") %>
		let mealkitName = $('#mealkitName').val();
		let price = $(#'price').val();
		let description = $('#description').val();
		let ingredient = $('#ingredient').val();
		let mealkitImgfile = $(#'mealkitImgfile').val();
		let foodTypeCode = $(#'foodTypeCode').val();
		
		$.ajax({
			type:'post',
			url: '${pageContext.request.contextPath}/admin/mealkit/fixMealkit',
			data: {
				mealkitNum: mealkitNum,
				mealkitName: mealkitName,
				price: price,
				description: description,
				ingredient: ingredient,
				mealkitImgfile: mealkitImgfile,
				foodTypeCode: foodTypeCode
			}
		})
	})
}
</script>
<style>
    hr {
        height: 1px;
        background-color: lightgray;
    }
</style>
</head>
<body>
	<%@ include file ='../../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>상품수정</h2>&ensp;
    <%@ include file ='../../include/adminTop2.jsp'%>
    
            <div class='col' style='border: 1px solid'>
                <div class='border w-auto my-3' id='content'>
                    <form id='form' method='post' encType='multipart/form-data'>               	    
                        <div class='container mw-100 mt-5' style='width: 98%;'>
                        	<div class='row mt-3'>
                                <label for='input' class='col-2 pr-2 col-form-label'>이미지:</label>
                                <div class='col pl-1'>
                                    <c:forEach var='mealkit' items='${mealkitList}'>
                   						 <img style='height:200px; width: 30%;' src='<c:url value="/attach/${mealkit.mealkitImgfileName}"/>'/>
                					</c:forEach>
                                </div>
                            </div>                 	
                            <div class='row mt-3'>
                                <label for='input' class='col-2 pr-2 col-form-label'>상품명:</label>                 
                                <div class='col pl-1'>
                                	<c:forEach var='mealkit' items='${mealkitList}'>
                                    	<input type='text' class='form-control' id='mealkitName' name='mealkitName' placeholder='상품명을 입력해주세요.' value='${mealkit.mealkitName}' required>
                                	</c:forEach>
                                </div>
                            </div>
                            <div class='row mt-3'>
                                <label for='input' class='col-2 pr-2 col-form-label'>판매가:</label>
                                <div class='col pl-1'>
                                	<c:forEach var='mealkit' items='${mealkitList}'>
                                    	<input type='number' class='form-control' id='price' name='price' placeholder='원' value='${mealkit.price}' required>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class='row mt-3'>
                                <label for='input' class='col-2 pr-2 col-form-label'>상품설명:</label>
                                <div class='col pl-1'>
                                	<c:forEach var='mealkit' items='${mealkitList}'>
                                    <input type='text' class='form-control' id='description' name='description' 
                                    	placeholder='내용을 입력해주세요.' value='${mealkit.description}' required>
                                    </c:forEach>	
                                </div>
                            </div>
                            <div class='row mt-3'>
                                <label for='input' class='col-2 pr-2 col-form-label'>내용:</label>
                                <div class='col pl-1'>
                                    <textarea class="form-control" placeholder='내용을 입력해주세요.' id='ingredient' name='ingredient' style='height: 248px' required><c:forEach var='mealkit' items='${mealkitList}'>${mealkit.ingredient}</c:forEach></textarea>
                                </div>
                            </div>
                            <div class='row mt-3'>
                                <label for='input' class='col-2 pr-2 col-form-label'>카테고리:</label>
                                <div class='col pl-1'>
                                    <select class="form-control" id='foodTypeCode' name='foodTypeCode' required>
                                        <option value='1'>한식</option>
                                        <option value='2'>중식</option>
                                        <option value='3'>일식</option>
                                        <option value='4'>양식</option>
                                        <option value='5'>기타</option>
                                    </select>
                                </div>
                            </div>
                            <hr>
                            <div class='row mx-auto justify-content-end'>
                                <div class='row mt-2 d-flex justify-content-end'>
                                    <div class='col'>
                                        <button type='button' class='btn btn-secondary' onClick='location.href="listMealkit"'>취소</button>
                                        <button type='submit' class='btn btn-secondary' id='fixBtn'>수정</button>
                                    </div>
                                </div>
                            </div>                        
                        </div>                                    
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file ='../../include/adminFooter.jsp'%>