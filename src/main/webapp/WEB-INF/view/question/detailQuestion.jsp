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

</style>
<script>
function answerVal() {
	if($('#answerContent').val()) {
		$('#fixBtn').hide()
	} else {
		$('#fixBtn').show()
		$('#answerContent').append('답변이 없습니다.')
	}
}
function btn() {
	answerVal()
	
	$('#delBtn').click(() => {
		 $('#modalMsg').empty();
         $('#modalMsg').text('문의를 삭제하시겠습니까?');
         $('#confirmModal').modal();
         $('#noBtn').show();
         $('#delQuestionBtn').show();
	})
	
	$('#delQuestionBtn').click(() => {
		$('#deleteModal').modal('hide')
       	$.ajax({
        	url: 'del/' + <%=request.getParameter("questionNum")%>,
        	method: 'delete'
       	}).done(function() {
            location.href='listQuestion'
       	})
	})
	

	$('#fixBtn').click(() => {
		location.href='fixQuestion?questionNum=' + <%=request.getParameter("questionNum")%>
	})
}
$(btn)
</script>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
    <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
    <div id="menuName">
        <h3>1:1문의상세</h3>
    </div>
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
<div id='mainContainerAddSub' class='container'>
	<form id='form'method='post'>
	<c:forEach var='question' items='${questionList}'>
	<div class='container'>	
        <div class='row pt-4'>
        	<label for='input' class='col-3 pr-2 col-form-label'>제목:</label>
            <div class='col pl-1'>
	           	<input type='text' class='form-control bg-light' id='questionTitle' name='questionTitle' maxlength='15' disabled value='${question.questionTitle}'>
	        </div>
        </div>
        <div class='row mt-4'>
        	<label for='input' class='col-3 pr-2 col-form-label'>내용:</label>
            <div class='col pl-1'>
            	<textarea class='form-control bg-light' id='questionContent' name='questionContent'
            		style='height: 100px' maxlength='1300' disabled>${question.questionContent}</textarea>
         		</div>
        </div>
        <div class='row mt-4'>
        	<label for='input' class='col-3 pr-2 col-form-label'>답변:</label>
           	<div class='col pl-1'>
           	<textarea class='form-control bg-light' id='answerContent' name='answerContent'
           		style='height: 100px' maxlength='1300' disabled>${question.answerContent}</textarea>
        	</div>
        </div>
        
	</div>
<hr class='mt-5'>
	<div class='row mt-4 justify-contet-end'>
		<div class='col d-flex justify-content-end pb-0'>
          	<button type='button' class='btn btn-secondary' id='fixBtn'>수정</button>
          	&nbsp;
          	<button type='button' id='delBtn' class='btn btn-secondary' data-toggle='modal'
              	data-target='#deleteModal'>삭제</button>
      	</div>
  	</div>
  	</c:forEach>
    </form>
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
                    <button type='button' id='delQuestionBtn' class='btn btn-danger col-3' data-dismiss='modal' onClick='location.href="listQuestion"'>예</button>
                </div>
            </div>
        </div>
    </div>
</body>

<%@ include file ='../include/footer.jsp'%>
</html>