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
let emailDouble = 1
let cert = 1
let code
	
function goPopup(){
  var pop = window.open("/user/jusoPopup","pop","scrollbars=yes, resizable=yes")
}
	
function jusoCallBack(basicAddress,detailAddress,zipCode){
	document.form.basicAddress.value = basicAddress
	document.form.detailAddress.value = detailAddress
	document.form.zipCode.value = zipCode
}
   
function chkIdChange(val) {
	idDouble = 0
}
	
function chkEmailChange(val) {
	emailDouble = 0
}

function chkCertChange(val) {
	cert = 0
}
   
$(document).on("keyup", "input[onlyEngNum]", function() {
	$(this).val( $(this).val().replace(/[^a-zA-Z0-9]/gi,""))
})

$(document).on("keyup", "input[phoneNum]", function() {
	$(this).val( $(this).val().replace(/[^0-9]/g, '').replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, ""))			
})

function handleOnInput(el, maxlength) {
	if(el.value.length > maxlength) el.value = el.value.substr(0, maxlength)
}

document.addEventListener("mouseup", function(event) {
	if (document.getElementsByName("emailCert").length == 1){
		var obj = document.getElementById("confirmBtn")
		if (obj.contains(event.target)) {
			const email = $('#email').val()
			
			$.ajax({
				type : 'get',
				url : '<c:url value ="/user/emailCheck?email="/>'+email,
				success : function (data) {
					code = data;
				}			
			})
		}
	}
})

function init() {
	$('#emailDoubleCheck').click(() => {
		var email = $('#email').val()
		if(email) {
		$.ajax({
			url: '${pageContext.request.contextPath}/user/emailDoubleCheck',
			data:{
				email:email
			}
		}).done(isGood => {
				if(isGood) {
					$('#modalLabel').text("이메일 중복확인")
					$('#modalMsg').text("사용 가능한 이메일입니다.")
					$('#modal').addClass("emailDoubleModal")
					$('#confirmBtn').attr({
						name: "emailCert"
					})
					$('#modal').modal()
					emailDouble = 1
				} else {
					$('#modalLabel').text("이메일 중복확인")
					$('#modalMsg').text("중복된 이메일입니다.")
					$('#modal').modal()
					emailDouble = 0
				}
			})	
		}
	})
	
	$(document).on("click", "button[name='emailCert']", function () {
		$('#emailSendModal').modal()
    	$('#confirmBtn').removeAttr('name')
		$('#modal').removeClass("emailDoubleModal")
	})	
	
	$('#emailCertConf').click(() => {
		var certNum = $('#certNum').val()
		if(certNum == code) {
			$('#modalLabel').text("이메일 인증확인")
			$('#modalMsg').text("인증이 완료됐습니다.")
			$('#modal').modal()
			cert = 1
		} else {
			$('#modalLabel').text("이메일 인증확인")
			$('#modalMsg').text("인증에 실패했습니다.")
			$('#modal').modal()
			cert = 0				
		}
	})
}

function chkFixUser() {
	let addrIsGood
	if($('#zipCode').val() && $('#basicAddress').val() && $('#detailAddress').val()) {
		addrIsGood = 1
	} else addrIsGood = 0
	
	if((emailDouble * cert * addrIsGood) == 1) {
		let user = {
			password: $('#password').val(),
			userName: $('#userName').val(),
			email: $('#email').val(),
			phoneNum: $('#phoneNum').val(),
			zipCode: $('#zipCode').val(),
			basicAddress: $('#basicAddress').val(),
			detailAddress: $('#detailAddress').val()
		}
		$.ajax({
			type:'put',
			url:'fixUser',
			data: JSON.stringify(user),
			contentType: 'application/json'
		})
	} else {
		$('#modalLabel').text("회원수정")
		$('#modalMsg').text("빈 칸이 있거나, 인증상태가 올바르지 않습니다.")
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
        <h3>회원수정</h3>
    </div>
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
<form id='form' name='form' action='completeFixUser' method='POST' onsubmit='return chkFixUser();'>
    <div id='mainContainerAddSub' class='container'>
        <div style='width: 1px; height: 1px;'></div>
        <div class='row inputBox mt-1'>
            <label for='input' class='col-3 col-form-label'>이름</label>
            <div class='col pl-1'>
                <input type='text' class='form-control' id='userName' name='userName' required oninput='handleOnInput(this, 29)' value='${user.userName}'>
            </div>
        </div>
        <div class='row inputBox'>
            <label for='input' class='col-3 col-form-label'>이메일</label>
            <div class='col pl-1'>
                <input type='email' class='form-control' id='email' name='email' required oninput='handleOnInput(this, 30)' onchange='chkEmailChange(this.value)' value='${user.email}'>
            </div>
        </div>
        <div class='row inputBox'>
            <label class='col-3 col-form-label' style='margin-right: 4px;'></label>
            <div class='col d-flex mx-auto pl-0'>
                <button type='button' id='emailDoubleCheck' class='btn btn-primary flex-fill'>중복확인</button>
            </div>
        </div>
        <div class='row inputBox'>
            <label for='input' class='col-3 col-form-label' style='font-size: 93%'>인증번호</label>
            <div class='col pl-1'>
                <input type='number' class='form-control' id='certNum' name='certNum' oninput='handleOnInput(this, 6)' onchange='chkCertChange(this.value)'>
            </div>
        </div>
        <div class='row inputBox'>
            <label class='col-3 col-form-label' style='margin-right: 4px;'></label>
            <div class='col d-flex mx-auto pl-0'>
                <button type='button' id='emailCertConf' class='btn btn-primary flex-fill'>인증확인</button>
        </div>
        </div>
        <div class='row inputBox'>
            <label for='input' class='col-3 col-form-label'>연락처</label>
            <div class='col pl-1'>
                <input type='text' class='form-control' id='phoneNum' name='phoneNum' maxlength='13' pattern='.{13,13}' required phoneNum value='${user.phoneNum}'>
            </div>
        </div>
        <div class='row inputBox'>
            <label class='col-3 col-form-label' style='font-size: 93%'>우편주소</label>
            <div class='col px-1'>
                <input type='text' class='form-control' id='zipCode' name='zipCode' readonly value='${user.zipCode}'>
            </div>
            <div class='col-4 pl-0'>
                <input class='btn btn-primary float-right' type='button' onClick="goPopup();" value='주소검색'>
            </div>
        </div>
        <div class='row inputBox'>
            <label for='input' class='col-3 col-form-label'>주소</label>
            <div class='col pl-1'>
                <input type='text' class='form-control' id='basicAddress' name='basicAddress' readonly value='${user.basicAddress}'>
            </div>
        </div>
        <div class='row inputBox'>
            <label for='input' class='col-3 col-form-label' style='font-size: 93%'>상세주소</label>
            <div class='col pl-1'>
                <input type='text' class='form-control' id='detailAddress' name='detailAddress' readonly value='${user.detailAddress}'>
            </div>
        </div>
        <div class='row inputBox my-3'>
            <label class='col-3 col-form-label' style='font-size: 70%'>새 비밀번호</label>
            <div class='col pl-1'>
                <input type='text' class='form-control' id='password' name='password' placeholder='비밀번호는 6자리 이상의 영문/숫자' pattern='.{6,20}' oninput='handleOnInput(this, 20)' onlyEngNum>
            </div>
        </div>
        <div class='row d-flex mx-auto'>
            <button type='submit' class='btn btn-primary flex-fill'>확인</button>
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

<div class='modal fade' id='emailSendModal' tabindex='-1'>
    <div class='modal-dialog'>
        <div class='modal-content'>
            <div class='modal-header py-2'>
                <p class='modal-title float-left'>이메일 인증발송</p>
                <button type='button' class='close' data-dismiss='modal'>
                    <span>&times;</span>
                </button>
            </div>
            <div class='modal-body text-center'>
                <p>인증메일이 발송됐습니다.</p>
            </div>
            <div class='modal-footer py-1'>
                <button type='button' class='btn btn-primary col-3' data-dismiss='modal'>확인</button>
            </div>
        </div>
    </div>
</div>

</body>

<%@ include file ='../include/footer.jsp'%>

</html>