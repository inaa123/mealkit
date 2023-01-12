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
<script>
let ordersTmp
let mealkitNamesTmp = []
function listOrders() {
		$('#orders').empty();
		
		$.ajax({
			url: "<%=request.getContextPath()%>/admin/order/getAdminOrders",
			dataType: 'json',
			success: orders => {
				if(orders.length) {
					ordersTmp = orders
				}
			}
		}).done(orders => {
			$.each(orders, (i, order) => {
				$.ajax({
					url: 'selectMealkitNames/' + order.orderNum,
					dataType: 'json',
					async : false,
					success: mealkitNames => {
						if(mealkitNames.length > 1) {
							mealkitNamesTmp.push(mealkitNames[0].mealkitName + " 외 " + (mealkitNames.length-1) + "개")
						} else mealkitNamesTmp.push(mealkitNames[0].mealkitName)
					}
				})
			})
			listTest()
		}) 
	}

function listTest() {
	const orderArr = []
	for(i=0; i <= ordersTmp.length-1; i++) {
		
		orderArr.unshift(
			`<tr>
				<td class='align-middle'>\${ordersTmp[i].orderNum}</td>
				<td class='align-middle'>\${ordersTmp[i].userId}</td>
				<td class='align-middle'>\${mealkitNamesTmp[i]}</td>
				<td class='align-middle'>\${ordersTmp[i].orderDate}</td>
				<td class='align-middle'>\${ordersTmp[i].paymentName}</td>
				<td class='align-middle'>\${ordersTmp[i].orderStatusName}</td>
			<tr>`
		)
	}
	$('#orders').append(orderArr.join(''))
}

$(listOrders)
</script>
</head>
<body>
    <%@ include file ='../../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>주문</h2>
                    <h6><a href='listOrder' class='font-weight-bold' role='button'>주문리스트</a></h6>
                    <h6><a href='../exchange/listExchange' role='button'>교환리스트</a></h6>
                    <h6><a href='../refund/listRefund' role='button'>환불리스트</a></h6>
	<%@ include file ='../../include/adminTop2.jsp'%>
            <div class='col' style='border: 1px solid'>
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
                                        <col width='15%'>
                                        <col width='15%'>
                                        <col width='20%'>
                                        <col width='20%'>
                                        <col width='15%'>
                                        <col width='15%'>
                                    </colgroup>
                                    <thead class='table-info'>
                                        <tr>
                                            <th>주문번호</th>
                                            <th>아이디</th>
                                            <th>주문상품</th>
                                            <th>주문일자</th>
                                            <th>결제방법</th>
                                            <th>주문상태</th>
                                        </tr>
                                    </thead>
                                    <tbody id='orders'>
	                                   <tr>
	                                     <td></td>
	                                     <td></td>
	                                     <td></td>
	                                     <td></td>
	                                     <td></td>
	                                     <td></td>
	                                   </tr>
                                    </tbody>
                                </table>
                                <hr class='my-0'>
                            </div>
                        </div>
                    </div>
                </div>
                <hr style='position: relative; bottom: 13%;'>
        	</div>
        </div>
    </div>
</body>

<%@ include file ='../../include/adminFooter.jsp'%>

</html>