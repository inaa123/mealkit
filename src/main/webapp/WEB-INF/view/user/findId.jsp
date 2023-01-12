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
let sendedEmail = 0
let code

function chkEmailChange(val) {
	sendedEmail = 0
}

function handleOnInput(el, maxlength) {
	if(el.value.length > maxlength) el.value = el.value.substr(0, maxlength)
}

function init() {
	$('#emailCert').click(() => {		
		const email = $('#email').val()		
		if(email) {
			$.ajax({
				url: '${pageContext.request.contextPath}/user/emailDoubleCheck',
				data:{
					email:email
				}
			}).done(isGood => {
				if(!isGood) {
					$.ajax({
						type : 'get',
						url : '<c:url value ="/user/emailCheck?email="/>'+email,
						success : function (data) {
							code = data;
						}			
					})						
					$('#modalLabel').text("이메일 인증발송")
					$('#modalMsg').text("인증메일이 발송됐습니다.")
					$('#modal').modal()
					sendedEmail = 1
				} else {
					$('#modalLabel').text("아이디 찾기")
					$('#modalMsg').text("가입하지 않은 이메일입니다.")
					$('#modal').modal()
				}
			})	
		}		
	})
}

function chkFindId() {
	var certNum = $('#certNum').val()
	if(certNum == code && sendedEmail == 1) {
	} else {
		$('#modalLabel').text("아이디 찾기")
		$('#modalMsg').text("인증번호가 올바르지 않습니다.")
		$('#modal').modal()
		return false
	}
}
$(init)
</script>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
    <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
    <div id="menuName">
        <h3>아이디 찾기</h3>
    </div>
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
<form id='form' name='form' action='completeFindId' method='POST' onsubmit='return chkFindId();'>
	<div id='mainContainerAddSub' class='container'>
	    <div style='width: 1px; height: 1px;'></div>
	    <div class='row inputBox mt-5'>
	        <label for='input' class='col-3 col-form-label'>이메일</label>
	        <div class='col pl-1'>
	            <input type='email' class='form-control' id='email' name='email' required oninput='handleOnInput(this, 30)' onchange='chkEmailChange(this.value)'>
	        </div>
	    </div>
	    <div class='row inputBox mb-4'>
	        <div class='col d-flex mx-auto'>
	            <button type='button' id='emailCert' class='btn btn-primary flex-fill'>인증발송</button>
	        </div>
	    </div>
	    <div class='row inputBox'>
	        <label for='input' class='col-3 col-form-label' style='font-size: 93%'>인증번호</label>
	        <div class='col pl-1'>
	            <input type='number' class='form-control' id='certNum' name='certNum' required oninput='handleOnInput(this, 6)'>
	        </div>
	    </div>
	    <div class='row d-flex mt-5 mx-auto'>
	        <button type='submit' id='findId' class='btn btn-primary flex-fill'>아이디 확인</button>
	    </div>
	</div>
</form>

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
            </div>
        </div>
    </div>
</div>
</body>

<%@ include file ='../include/footer.jsp'%>

</html>