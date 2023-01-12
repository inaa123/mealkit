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
<link href='https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap' rel='stylesheet'>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<script>
let totalPrice
let orderNumSeq
let orderNumSeqStr
let mealkitNumStr
let mealkitCount
let orderMealkitNumStr
let orderMealkit

function init() {
	$.ajax({
		type:'post',
		url:'getOrderNumSeq',
		dataType: 'json',
		success: getOrderNumSeq => {
			orderNumSeq = getOrderNumSeq
			orderNumSeqStr = getOrderNumSeq+''
		}
	})
}
function test() {

}
function chkAdd() {
	order = {
			request : $('#request').val(),
			paymentCode : $('#payment').val()
		}
	$.ajax({
		type:'post',
		url:'plusOrder',
		data: JSON.stringify(order),
		contentType: 'application/json'
	}).done(function tmp() {
		<c:forEach var='cart' items='${carts}'>
		<c:forEach var='mealkit' items='${mealkits}'>
			<c:if test="${mealkit.mealkitNum == cart.mealkitNum}">
			orderMealkitNumStr = ''
				mealkitCount = ${cart.mealkitCount}
				mealkitNumStr = ${mealkit.mealkitNum} + ''
				if(orderNumSeqStr.length < 6) {	
					let str = ''
					for(i = 0; (6 - orderNumSeqStr.length) > i; i++) str += '0'
					orderNumSeqStr = str + orderNumSeqStr
				}
				if(mealkitNumStr.length < 6) {	
					let str = ''
					for(i = 0; (6 - mealkitNumStr.length) > i; i++) str += '0'
					mealkitNumStr = str + mealkitNumStr
				}
				orderMealkitNumStr = orderNumSeqStr + mealkitNumStr
				
				orderMealkit = {
						orderMealkitNum: orderMealkitNumStr,
						orderMealkitCount : mealkitCount,
						orderNum : orderNumSeq,
						mealkitNum : ${mealkit.mealkitNum}
					}
				$.ajax({
					type:'post',
					url:'addOrderMealkit',
					data: JSON.stringify(orderMealkit),
					contentType: 'application/json'
				})
			</c:if>
		</c:forEach>
	</c:forEach>
	})
}
$(init)
</script>
<style>
table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
    border: 1px solid lightgray;
}

th {
    border: 1px solid lightgray;
    padding: 20px;
}

td {
    border: 1px solid lightgray;
    padding: 10px;
}

table.total th {
  padding: 25px;
  width: 150px;
}

table.way {
	width: 50%;
    text-align: left;
}

table.way th {
    width: 10%;
    border: 1px solid #444444;
}

h5 {
	color: #0f56ba;
}

input.inVal {
	font-size: 75%
}

.col-form-label {
	font-size: 75%
}
</style>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
	<a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
	<div id='menuName'>
	    <h3>상품 결제</h3>
	</div>            
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
	<form action='<%=request.getContextPath() %>/order/completeOrder' method='post' onsubmit='return chkAdd();'>
		<div class='container' id='mainContainerAddSub'>
      		<div class='row d-flex justify-content-center mt-5'>
            	<div class='col'>
		            <div>
		                <h5><b>주문 상품</b></h5>
		                <table class='list'>
		   	                <thead>
		       	                <tr>
		           	                <th>상품</th><th>수량</th><th>금액</th>
		               	        </tr>
		                   	</thead>
		                   	<tbody>
		                   		<c:forEach var='cart' items='${carts}'>
		                   			<c:forEach var='mealkit' items='${mealkits}'>
		                   				<c:if test="${mealkit.mealkitNum == cart.mealkitNum}">
			                   				<tr>
												<td>${mealkit.mealkitName}</td>
												<td>${cart.mealkitCount}개</td>
												<td>${mealkit.price}원</td>
												<c:set var='result' value="${result + mealkit.price}"/>
											</tr>
										</c:if>
									</c:forEach>
								</c:forEach>
		                   	</tbody>
		               	</table>
		       		</div>
		       		<div>
		            	<h5 class='mt-5'><b>배송지</b>${mealkitNum}</h5>
			           	<div class="container">
			                <div class="row inputBox">
			                    <label for="input" class="col-3 col-form-label">수령인</label>
			                    <div class="col pl-1">
			                        <input type='text' class='form-control inVal' id='userName' value='${user.userName}' readonly>
			                    </div>
			                </div>
			                <div class="row inputBox">
			                    <label for="input" class="col-3 col-form-label">연락처</label>
			                    <div class="col pl-1">
			                        <input type='text' class='form-control inVal' id='phoneNum' value='${user.phoneNum}' required readonly>
			                    </div>
			                </div>
			                <div class="row inputBox">
			                    <label class="col-3 col-form-label">우편주소</label>
			                    <div class="col pl-1">
			                        <input type='number' class='form-control inVal' id='zipCode' value='${user.zipCode}' readonly>
			                    </div>
			                </div>
			                <div class="row inputBox">
			                    <label for="input" class="col-3 col-form-label">주소</label>
			                    <div class="col pl-1">
			                        <input type="text" class="form-control inVal" id="basicAddr" value='${user.basicAddress}' readonly>
			                    </div>
			                </div>
			                <div class="row inputBox">
			                    <label for="input" class="col-3 col-form-label">상세주소</label>
			                    <div class="col pl-1">
			                        <input type="text" class="form-control inVal" id="detailAddr" value='${user.detailAddress}' readonly>
			                    </div>
			                </div>
			                <div class="row inputBox">
			                    <label for="input" class="col-3 col-form-label">요청사항</label>
			                    <div class="col pl-1">
			                        <input type="text" class="form-control inVal" id="request" maxlength='1300'>
			                    </div>
			                </div>
			            </div>
			            <div class='row d-flex justify-content-center mt-5'>
			                <div class='col'>
			                    <h5><b>결제 합계</b></h5>
			                    <table class='total'>
			                        <tr>
			                            <th>상품 합계</th>
			                            <td>${result}원</td>
			                        </tr>
			                        <tr>
			                            <th>배송비</th>
			                            <td>무료</td>
			                        </tr>
			                        <tr>
			                            <th>결제 금액</th>
			                            <td>${result}원</td>
			                        </tr>
			                    </table>
			                </div>
			            </div>
			            <div class='row d-flex justify-content-center mt-5'>
			                <div class='col'>
			                    <h5><b>결제 방법</b></h5>
			                    <table class='way' name='paymentCode' id='paymentCode'>
			                        <tr>
			                            <th><input type='radio' id='payment' name='payment' value='1' required></th>
			                            <td>카드 결제</td>
			                        </tr>
			                        <tr>
			                            <th><input type='radio' id='payment' name='payment' value='2'></th>
			                            <td>무통장 입금</td>
			                        </tr>
			                        <tr>
			                            <th><input type='radio' id='payment' name='payment' value='3'></th>
			                            <td>휴대폰 결제</td>
			                        </tr>
			                    </table>
			                </div>
			            </div>
			            <div class='row d-flex justify-content-center mt-1'>
			                <button type='submit' id='orderCompleteBtn' name='orderCompleteBtn' class='btn btn-outline-secondary m-5 d-flex justify-content-center'
			                			>구매</button>
			            </div>
			    	</div>
    			</div>
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