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
    <link rel='stylesheet' type='text/css' href='../res/lib.css'>
    <link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>
    <link rel='preconnect' href='https://fonts.googleapis.com'>
    <link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
    <link href='https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap' rel='stylesheet'>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
	<script>
	let orderNum = <%=request.getParameter("orderNum")%>
	
	function listOrders() {
		$.ajax({
			method:'get',
			url: "<%=request.getContextPath()%>/order/detailOrder",
			data: {
				orderNum : orderNum
			}
		}).done()				
	}
	$(listOrders)
	</script>
    <style>
        .orderInfoTitle1 {
            font-size: 12pt;
            text-align: left;
        }

        .orderInfoTitle2 {
            font-size: 9pt;
            text-align: left;

        }

        .orderInfoContent {
            font-size: 9pt;
            text-align: right;
        }
    </style>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
   <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
   <div id='menuName'>
       <h3>주문상세</h3>
   </div>            
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
   <div id='mainContainerAddSub' class='container'>
      <div class='row' id='orders'>
             <div class='col'>
                 <table class='table table-sm table-borderless ml-0 mb-0'>
                     <tr><th class='orderInfoTitle1'>주문번호</th><th style='font-size: 12pt; text-align: right;'>${order.orderNum}</th></tr>
                     <tbody>
                     	<c:forEach var='order' items='${orders}'>
	                        <c:forEach var='mealkit' items='${mealkitList}'>
	                        	<c:if test="${mealkit.mealkitNum == order.mealkitNum}">
			                        <tr>
			                           <td class='orderInfoTitle2'>주문상품</td>
			                           <td class='orderInfoContent'>${mealkit.mealkitName}</td>
			                        </tr>
			                        <tr>
			                            <td class='orderInfoTitle2'>수량</td>
			                            <td class='orderInfoContent'>${order.orderMealkitCount}개</td>  
			                         </tr>
			                         <tr style='border-bottom: 0.03rem solid #f0f0f5; border-top: none;'>
			                            <td class='orderInfoTitle2'>가격</td>
			                            <td class='orderInfoContent'>${mealkit.price * order.orderMealkitCount}원</td>
			                         </tr>
			                         <tr><td></td></tr>
			                	</c:if>
			            	</c:forEach>
			        	</c:forEach>                
			     	</tbody>
                 </table>

              <table class='table table-sm table-borderless ml-0'>
                  <tr><th class='orderInfoTitle1'>주문상세</th><th></th></tr>
                  <tbody>
                      <tr>
                          <td class='orderInfoTitle2'>주문일자</td>
                          <td class='orderInfoContent'>${orders[0].orderDate}</td>
                      </tr>
                      <tr>
                          <td class='orderInfoTitle2'>주문자</td>
                          <td class='orderInfoContent'>${user.userName}</td>
                      </tr>
                  </tbody>
              </table><hr class='mt-3 mb-2'>
      
              <table class='table table-sm table-borderless ml-0'>
                  <tr><th class='orderInfoTitle1'>결제상세</th><th></th></tr>
                  <tbody>
                      <tr>
                          <td class='orderInfoTitle2'>결제수단</td>
                          <td class='orderInfoContent'>${orders[0].paymentName}</td>
                      </tr>
                      <tr>
                          <td class='orderInfoTitle2'>주문금액</td>
                          <c:forEach var='order' items='${orders}' varStatus="status">
                          <c:set var='sum' value='${sum + mealkitList[status.index].price * orders[status.index].orderMealkitCount}'></c:set>                          
                          </c:forEach>
                          <td class='orderInfoContent'>${sum}원</td>
                      </tr>
                      <tr>
                          <td class='orderInfoTitle2'>배송비</td>
                          <td class='orderInfoContent'>무료</td>
                      </tr>
                      <tr>
                          <td class='orderInfoTitle2'><b>총 결제금액</b></td>
                          <td class='orderInfoContent'><b>${sum}원</b></td>
                      </tr>
                  </tbody>
              </table><hr class='mt-3 mb-2'>
      
              <table class='table table-sm table-borderless ml-0'>
                  <tr><th class='orderInfoTitle1'>배송지</th><th></th></tr>
                  <tbody>
                      <tr>
                          <td class='orderInfoTitle2'>수령인</td>
                          <td class='orderInfoContent'>${user.userName}</td>
                      </tr>
                      <tr>
                          <td class='orderInfoTitle2'>연락처</td>
                          <td class='orderInfoContent'>${user.phoneNum}</td>
                      </tr>
                      <tr>
                          <td class='orderInfoTitle2'>우편번호</td>
                          <td class='orderInfoContent'>${user.zipCode}</td>
                      </tr>
                      <tr>
                          <td class='orderInfoTitle2'>주소</td>
                          <td class='orderInfoContent'>${user.basicAddress}
                          <br>
                          <p class='orderInfoContent'>${user.detailAddress}</p></td>
                      </tr>
                      <tr>
                          <td class='orderInfoTitle2'>요청사항</td>
                          <td class='orderInfoContent'>${orders[0].request}</td>
                      </tr>
                  </tbody>
              </table><hr class='mt-5 mb-2'>
          </div>
      </div>
        <div class='row d-flex mx-auto mt-5'>
            <a href='listOrder' class='btn flex-fill bg-dark text-white mt-5 mb-4' role='button'>주문내역</a>
        </div>
    </div>
</body>

<%@ include file ='../include/footer.jsp'%>

</html>