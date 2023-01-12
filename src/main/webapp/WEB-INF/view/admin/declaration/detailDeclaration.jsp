<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
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
<style>
    hr {
        height: 1px;
        background-color: lightgray;
    }
</style>
<script>
function init() {
	$('#confirmBtn').click(() => {
		if(${declaration.reviewNum} == 0) {
			$('#modalMsg').text("처리상태를 변경하시겠습니까?")
		} else if(document.getElementById('category').value == 2) {
			$('#modalMsg').text("대상글을 삭제하고 처리완료 하시겠습니까?")
		} else if(document.getElementById('category').value == 3) $('#modalMsg').text("처리취소 하시겠습니까?")
	})
	
	$('#delDeclarationOkBtn').click(() => {
		let declaration = {
			declarationNum: ${declaration.declarationNum},
			declarationStatusCode: $('#category').val()
		}
	
		$.ajax({
			type:'put',
			url:'fixDeclaration',
			data: JSON.stringify(declaration),
			contentType: 'application/json'
		}).done(function(){
			if(${declaration.reviewNum} == 0 || $('#category').val() == 3) {
				location.href='listDeclaration'
			} else {
				$.ajax({
					url: '${pageContext.request.contextPath}/review/del/' + '${declaration.reviewNum}',
					method: 'delete'
				}).done(function(){
					location.href='listDeclaration'
				})
			}
		})
	})
}
$(init)
</script>
</head>
<body>
	<%@ include file ='../../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>신고</h2>&ensp;
                    <h6>신고상세</h6>
    <%@ include file ='../../include/adminTop2.jsp'%>

            <div class='col' style='border: 1px solid'>
                <div class='border w-auto my-3' id='content'>
                    <div class='container mw-100 mt-5' style='width: 98%;'>
                        <div class='row mt-3'>
                            <label for='input' class='col-2 pr-2 col-form-label'>제목:</label>
                            <div class='col pl-1'>
                                <input type='text' class='form-control bg-light' id='noticeTitle' value='${declaration.declarationTitle}' disabled>
                            </div>
                        </div>
                        <div class='row mt-3'>
                            <label for='input' class='col-2 pr-2 col-form-label'>대상글:</label>
                            <div class='col pl-1'>
                            	<c:choose>
					                <c:when test="${declaration.reviewNum == 0}"><input type='text' class='form-control bg-light' id='noticeTitle' value='삭제된 리뷰입니다.' disabled></c:when>
					                <c:when test="${declaration.reviewNum != 0}"><a href='/review/detailReview?reviewNum=${declaration.reviewNum}'>
										<input type='text' class='form-control bg-light' id='noticeTitle' value='${declaration.reviewTitle}' disabled></a></c:when>
								</c:choose>
                            </div>
                        </div>
                        <div class='row mt-3'>
                            <label for='input' class='col-2 pr-2 col-form-label'>내용:</label>
                            <div class='col pl-1'>
                                <textarea class='form-control bg-light' id='noticeContent' style='height: 25.65rem' disabled>
${declaration.declarationContent}</textarea>
                            </div>
                        </div>
                        <hr>
						<div class='row mt-4 d-flex justify-content-end'>
						    <div class='col-3'>
						        <select class="form-control" name='category' id='category'>
						            <option value='2'>처리완료</option>
						            <option value='3'>처리취소</option>
						        </select>
						    </div>
						    <button type='button' id='confirmBtn' class='btn btn-secondary mr-3' data-toggle='modal' data-target='#declarationModal'>확인</button>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class='modal fade' id='declarationModal' tabindex='-1'>
        <div class='modal-dialog'>
            <div class='modal-content'>
                <div class='modal-header py-2'>
                    <p class='modal-title float-left' id='ModalLabel'>신고처리</p>
                    <button bype='button' class='close' data-dismiss='modal'>
                        <span>&times;</span>
                    </button>
                </div>
                <div class='modal-body text-center'>
                	<p id='modalMsg'></p>
                </div>
                <div class='modal-footer py-1'>
                    <button type='button' id='noBtn' class='btn btn-primary col-3' data-dismiss='modal'>아니오</button>
                    <button type='button' id='delDeclarationOkBtn' class='btn btn-danger col-3' data-dismiss='modal'>예</button>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file ='../../include/adminFooter.jsp'%>