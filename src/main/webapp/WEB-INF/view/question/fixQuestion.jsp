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
function init() {
	$('#fixBtn').click(() => {
		let questionNum = <%=request.getParameter("questionNum")%>
		let questionTitle = $('#questionTitle').val()
		let questionContent = $('#questionContent').val()
		
		$.ajax({
			type:'post',
			url:'<%=request.getContextPath() %>/question/fixQuestion',
			data: {
				questionNum: questionNum,
				questionTitle: questionTitle,
				questionContent: questionContent
			}
		}).done(() => {
			location.href='listQuestion'
		})
	})
}
$(init)
</script>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
    <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
    <div id="menuName">
        <h3>1:1문의수정</h3>
    </div>
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
    <div id='mainContainerAddSub' class='container'>
    	
    	<form id='form'method='post'>
    	<c:forEach var='question' items='${questionList}'>
	       	 <div class='row mt-3'>
	            <label for='input' class='col-2 pr-2 col-form-label'>제목:</label>
	            <div class='col pl-1'>
	           			<input type='text' class='form-control' id='questionTitle' name='questionTitle' placeholder='제목을 입력해주세요.' maxlength='15' required value='${question.questionTitle}'>
	            </div>
        	</div>
        	<div class='row mt-3'>
            	<label for='input' class='col-2 pr-2 col-form-label'>내용:</label>
            	<div class='col pl-1'>
            	<textarea class='form-control' placeholder='내용을 입력해주세요.' id='questionContent' name='questionContent'
            		style='height: 210px' maxlength='1300' required>${question.questionContent}</textarea>
         		</div>
        	</div>
	        <div class='row mt-2 justify-content-end '>
	            <div class='col d-flex justify-content-end'>
	                <button type='button' class='btn btn-secondary' onclick='location.href="<%=request.getContextPath()%>/question/listQuestion"'>취소</button>
	                &nbsp;
	                <button type='button' class='btn btn-secondary' id='fixBtn' name='fixBtn' onclick='location.href="listQuestion"'>수정</button>
	            </div>
	        </div>
	         </c:forEach>
        </form>
       
    </div>
</body>

<%@ include file ='../include/footer.jsp'%>

</html>