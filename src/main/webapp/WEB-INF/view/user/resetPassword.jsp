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
::placeholder {
            font-size: 0.8em;
            font-weight: 400;
}
</style>
<script>
$(document).on("keyup", "input[onlyEngNum]", function() {
	$(this).val( $(this).val().replace(/[^a-zA-Z0-9]/gi,""))
})

function handleOnInput(el, maxlength) {
	if(el.value.length > maxlength) el.value = el.value.substr(0, maxlength)
}
</script>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
    <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
    <div id="menuName">
        <h3>비밀번호 찾기</h3>
    </div>
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
	<form id='form' name='form' action='completeResetPassword' method='POST'>
	    <div class='container' id='mainContainerAddSub'>
	        <div class="row inputBox">
	            <label for="input" class="col-3 col-form-label mt-5" style='font-size: 70%'>새 비밀번호</label>
	            <div class="col pl-1 mt-5 mb-5">
	 				<input type='hidden' id='userId' name='userId' value='${user.userId}'>
	 				<input type='hidden' id='email' name='email' value='${user.email}'>
	                <input type='text' class='form-control' id='password' name='password' placeholder='비밀번호는 6자리 이상의 영문/숫자' pattern='.{6,20}' required oninput='handleOnInput(this, 20)' onlyEngNum>
	            </div>
	        </div>
            <div class='row d-flex mx-auto mt-5'>
                <button type='submit' class='btn btn-primary flex-fill' >비밀번호 변경</button>
            </div>
		</div>
	</form>
</body>

<%@ include file ='../include/footer.jsp'%>

</html>
