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
let mealkitNamesTmp = []
function selectMealkitName() {
	$.ajax({
		url: '${pageContext.request.contextPath}/order/selectMealkitNames/${orders[0].orderNum}',
		dataType: 'json',
		async: false,
		success: mealkitNames => {
			if(mealkitNames.length > 1) {
				mealkitNamesTmp.push(mealkitNames[0].mealkitName + " 외 " + (mealkitNames.length-1) + "개")
			} else mealkitNamesTmp.push(mealkitNames[0].mealkitName)
		}
	})
	$("#mealkitName").text(mealkitNamesTmp)
}

function init() {

	$('#applyBtn').click(() => {
			let refund = {
					refundContent: $('#refundContent').val(),
					orderNum: ${orders[0].orderNum},
					refundReasonCode: $('#refundReasonCode').val()
				}
			$.ajax({
				type:'post',
				url:'applyRefund',
				data: JSON.stringify(refund),
				contentType: 'application/json'
			}).done(function tmp() {
				location.href='listRefund'
			})
		})
	
	
	
}

$(init)
$(selectMealkitName)
</script>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
    <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
    <div id="menuName">
        <h3>환불신청</h3>
    </div>
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
    <div id='mainContainerAddSub' class="container">
        <form class='refund-request mt-5 ml-2 mb-2'>
            <div class='row'>
                <div class='col-5 mt-3 ml-3'>
                환불상품
                </div>
                <div class='col mt-3' id='mealkitName'>
                </div>
            </div>
            <div class='row'>
                <div class='col-5 mt-3 ml-3'>
                    <br>환불사유<span style='font-size:12px'>(필수)</span>
                </div>
                <div class='col mt-4' id='refundReason'> 
                    <select id='refundReasonCode' name='refundReasonCode' style='width:8rem; height:3rem' required>
                        <option value='1'>품질 이상</option>
                        <option value='2'>오배송</option>
                        <option value='3'>기타</option>
                    </select>
                </div>
            </div>
            <div class='row'>
                <div class='col ml-3'>
                    <br>상세사유<span style='font-size:12px' id='refundDetailReason'>(필수)</span><br>
                    <textarea maxlength='1300' style='resize: none;' cols='34' rows='5' placeholder='내용을 입력해주세요.'
                        id='refundContent' name='refundContent' required></textarea>
                </div>
            </div> 

            <div class='row justify-content-end mr-1'>
                <div class='col-5 mt-2 '>
                    <button type='button' class='btn btn-secondary btn-sm'
                        onclick='location.href="../order/listOrder"'>취소</button>
                    <button id='applyBtn' type='button' class='btn btn-secondary btn-sm'>신청</button>
                </div>
            </div>
        </form>
    </div>
    
</body>

<%@ include file ='../include/footer.jsp'%>

</html>