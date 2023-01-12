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
let userId2 = <%=request.getParameter("userId")%>
function init() {
	$('#addBtn').click(() => {
		let questionNum = <%=request.getParameter("questionNum")%>
		let questionTitle = $('#questionTitle').val()
		let answerContent = $('#answerContent').val()
		let questionContent = $('#questionContent').val()
		
		$.ajax({
			url:"<%=request.getContextPath() %>/admin/question/addAdminQuestion",
			type:'post',
			data: {
				userId: userId2,
				questionNum: questionNum,
				questionTitle: questionTitle,
				questionContent: questionContent,
				answerContent: answerContent
			}
		}).done(() => {location.href='listQuestion'})
	})
}
$(init)
</script>

<body>
	<%@ include file ='../../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>1:1문의</h2>&ensp;
                    <h6>답변작성</h6>
    <%@ include file ='../../include/adminTop2.jsp'%>
<div class='col' style='border: 1px solid'>
                <div class='border w-auto my-3' id='content'>
                <c:forEach var="question" items="${questionList}">
                    <form id='form' method='post'>
                        <div class='container mw-100 mt-5' style='width: 98%;'>
                            <div class='row mt-3'>
                                <label for='input' class='col-2 pr-2 col-form-label'>제목:</label>
                                <div class='col pl-1'>
                                    <input type='text' class='form-control bg-light' id='questionTitle' placeholder='제목을 입력해주세요.' value='${question.questionTitle}' disabled>
                                </div>
                            </div>
                            <div class='row mt-3'>
                                <label for='input' class='col-2 pr-2 col-form-label'>내용:</label>
                                <div class='col pl-1'>
                                    <textarea class='form-control  bg-light' maxlength='1300' placeholder='내용을 입력해주세요.' id='questionContent' style='height: 230px' disabled>${question.questionContent}</textarea>
                                </div>
                            </div>
                            <div class='row mt-3'>
                                <label for='input' class='col-2 pr-2 col-form-label'>답변:</label>
                                <div class='col pl-1'>
                                    <textarea class='form-control  bg-light' maxlength='1300' placeholder='내용을 입력해주세요.' id='answerContent' style='height: 230px'>${question.answerContent}</textarea>
                                </div>
                            </div>
                            <hr>
                            <div class='row mx-auto justify-content-end'>
                                <div class='row mt-2 d-flex justify-content-end'>
                                    <div class='col'>
                                        <button type='button' class='btn btn-secondary' onClick='location.href="listQuestion"'>취소</button>
                                        <button type='submit' id='addBtn'class='btn btn-secondary'>작성</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>

<%@ include file ='../../include/adminFooter.jsp'%>

</html>