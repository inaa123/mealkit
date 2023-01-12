<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<html>
<head>
<meta charset='utf-8'>
<title>EAZEN MEALKIT</title>
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
</head>
<script>
	function listQuestions() {
		$('#questions').empty();
		
		$.ajax({
			method: 'post',
			url: "<%=request.getContextPath()%>/admin/question/getAdminQuestions"
		}).done(questions => {
			if(questions.length) {
				const questionArr = []
				
				$.each(questions, (i, question) => {
					questionArr.unshift(
						`<tr>
                         	<th><input type='checkbox' id='questionNum' name='questionNum'
                         		value='\${question.questionNum}'></th>
                            <td>\${question.questionNum}</td>
                            <td><a href='detailQuestion?questionNum=\${question.questionNum}'>
                            		\${question.questionTitle}</td>
                            <td>\${question.userId}</td>
                            <td>\${question.questionRegdate}</td>
                        </tr>`
					);
				})
				
				$('#questions').append(questionArr.join(''))
			} else {
				$('#questions').append(
					'<tr><td colspan=5 class=text-center>문의가 없습니다.</td></tr>')
			}
		})
	}

function init() {
	$(listQuestions)
	
	$('#delBtn').click(() => {
		if($('#questionNum:checked').val()) {
			$('#delModalLabel').empty();
			$('#delModalLabel').text('문의삭제');
    		$('#modalMsg').empty();
     		$('#modalMsg').text('선택한 문의를 삭제하시겠습니까?');
     		$('#deleteModal').modal();
     		$('#okBtn').hide();
     		$('#noBtn').show();
     		$('#delQuestionBtn').show();
		} else {
			$('#delModalLabel').empty();
			$('#delModalLabel').text('문의삭제');
     		$('#modalMsg').empty();
     		$('#modalMsg').text('삭제할 문의를 선택해주세요.');
     		$('#deleteModal').modal();
     		$('#okBtn').show();
     		$('#noBtn').hide();
     		$('#delNoticeBtn').hide();
  		}
	})
	
	$('#delQuestionBtn').click(() => {
		$('#deleteModal').modal('hide')
		for (var i = 0; i < $('#questionNum:checked').length; i++) {
        	$.ajax({
           		url: 'del/' + $('#questionNum:checked').eq(i).val(),
           		method: 'delete'
        	}).done(function() {
        		if(i == $('#questionNum:checked').length) listQuestions()
        	})
     	} 
	})
}
$(init)
</script>
<body>
     <%@ include file ='../../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>1:1문의</h2>
                    <h6>문의목록</h6>
     <%@ include file ='../../include/adminTop2.jsp'%>
<div class='col' style='border: 1px solid;'>
                <div class='border w-auto my-3' id='content'>
                    <div id='pageGroup'>
                        <nav id='page'>
                            <ul class="pagination mb-0">
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="previous">
                                        <span aria-hidden="true">&lt;</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#" aria-label="next">
                                        <span aria-hidden="true">&gt;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class='container mw-100 mt-5' style='width: 98%;'>
                        <div class='row'>
                            <div class='col'>
                                <table class='table table-hover my-0'>
                                    <colgroup>
                                        <col width='8%'>
                                        <col width='13%'>
                                        <col width='47%'>
                                        <col width='16%'>
                                        <col width='16%'>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope='col'></th>
                                            <th scope='col'>번호</th>
                                            <th scope='col'>제목</th>
                                            <th scope='col'>작성자</th>
                                            <th scope='col'>작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody id='questions'>
                                        <tr>
                                            <th><input type='checkbox'></th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <hr class='mt-0'>
                            </div>
                        </div>
                    </div>
                </div>
                <hr style='position: relative; bottom: 13%;'>
                <div id='bottomBtn'>
                    <button type='button' id='delBtn' class='btn btn-secondary' data-toggle='modal'
                        data-target='#deleteModal'>삭제</button>
                </div>
            </div>
        </div>
    </div>

	
	<div class='modal fade' id='deleteModal' tabindex='-1'>
        <div class='modal-dialog'>
            <div class='modal-content'>
                <div class='modal-header py-2'>
                    <p class="modal-title float-left" id='delModalLabel'>문의삭제</p>
                    <button type='button' class='close' data-dismiss='modal'><span>&times;</span></button>
                </div>
                <div class='modal-body'>
                    <p id='modalMsg' style='text-align: center'></p>
                </div>
                <div class='modal-footer py-1'>
                    <button type='button' id='noBtn' class='btn btn-primary col-3' data-dismiss='modal'>아니오</button>
                    <a class='btn btn-danger col-3' id='delQuestionBtn' role='button'>예</a>
                <button type='button' class='btn btn-primary col-3' data-dismiss='modal' id='okBtn'>확인</button>
                </div>
            </div>
        </div>
    </div>
</body>


<%@ include file ='../../include/adminFooter.jsp'%>

</html>