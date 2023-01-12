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
	$('#regBtn').click(() => {
		let declaration = {
				declarationTitle: $('#declarationTitle').val(),
				declarationContent: $('#declarationContent').val(),
				reviewNum: ${declaration.reviewNum}
			}
		$.ajax({
			type:'post',
			url:'addDeclaration',
			data: JSON.stringify(declaration),
			contentType: 'application/json'
		}).done(function tmp() {
			location.href='listDeclaration'
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
        <h3>상품평 신고</h3>
    </div>
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
    <div id='mainContainerAddSub' class='container'>
        <div style='width: 1px; height: 1px;'></div>
        <div class='row inputBox mt-3'>
            <label for='input' class='col-2 pr-2 col-form-label'>대상:</label>
            <div class='col pl-1'>
                <input type='text' class='form-control' id='targetReview' value='${reviewTitle}' disabled required>
            </div>
        </div>
        <div class='row inputBox mt-3'>
            <label for='input' class='col-2 pr-2 col-form-label'>제목:</label>
            <div class='col pl-1'>
                <input type='text' class='form-control' id='declarationTitle' name='declarationTitle' placeholder='내용을 입력해주세요' required>
            </div>
        </div>
        <div class='row inputBox mt-3'>
            <label for='input' class='col-2 pr-2 col-form-label'>내용:</label>
            <div class='col pl-1'>
                <textarea class='form-control' id='declarationContent' name='declarationContent' rows='10' placeholder='내용을 입력해주세요' required></textarea>
            </div>
        </div>
        <div class='row mt-4 d-flex justify-content-end'>
			<button type='button' class='btn btn-danger mr-2 col-2' onClick='history.back()'>취소</button>
			<button type='button' class='btn btn-primary mr-3 col-2' id='regBtn'>등록</button>
        </div>
    </div>
</body>

<%@ include file ='../include/footer.jsp'%>

</html>