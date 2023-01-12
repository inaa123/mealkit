<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<html>
<head>
<title>mealkit</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script
	src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet'
	href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' />
<link href='https://fonts.googleapis.com/icon?family=Material+Icons'
	rel='stylesheet'>
<link rel='preconnect' href='https://fonts.googleapis.com'>
<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
<link
	href='https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap'
	rel='stylesheet'>
<link rel='stylesheet' type='text/css' href='../res/lib.css'>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<style>
</style>
<script>
function init() {
	 var price;
	 var amount;
	 
	 price = $('input[name="price"]').val();
	 
	$('#plusBtn').click(() => {
		amount = $('input[name="amount"]').val();
		$('input[name="amount"]').val(parseInt(amount) + 1);
		
		$('input[name="price"]').val(parseInt(price) * (parseInt(amount)+1));
		$('input[name=mealkitsStr]').attr('value',"${mealkitList[0].mealkitNum}_" + $('input[name="amount"]').val() + "_${mealkitList[0].mealkitName}_" + ($('input[name="amount"]').val() * ${mealkitList[0].price}));
	})
	
	$('#minusBtn').click(() => {
		amount = $('input[name="amount"]').val();
		if(parseInt(amount) > 1) {
			$('input[name="amount"]').val(parseInt(amount) - 1);
			$('input[name="price"]').val(parseInt(price) * (parseInt(amount)-1));
			$('input[name=mealkitsStr]').attr('value',"${mealkitList[0].mealkitNum}_" + $('input[name="amount"]').val() + "_${mealkitList[0].mealkitName}_" + ($('input[name="amount"]').val() * ${mealkitList[0].price}));
		} else {
			$('input[name="amount"]').val(1);
		}	
	});
	
    $('.favorite').click(function () {
    	let favorite = {
    		mealkitNum: $('#mealkitNum').val()
    	}
    	
    	$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/favorite/addFavorite',
			data: JSON.stringify(favorite),
			contentType: 'application/json'
		})
		
        let check = $('.favorite').find('#favoriteIcon');
        if (check.hasClass('on')) {
            check.css('color', 'black');
        } else {
            check.css('color', 'red');
            $('#mealkitModal').modal()
            $('#modalMsg').empty();
			$('#modalMsg').text('찜하기되었습니다.');
			$('#confirmModal').modal();
			$('#favoriteOkBtn').show();
			$('#cartOkBtn').hide();
        }
        check.toggleClass('on', 'off');
    });
    
    $('#cartBtn').click(() => {
    	let cart = {
    		mealkitNum: $('#mealkitNum').val(),
    		mealkitCount: $('#amount').val()
    	}
		
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/cart/addCart',
			data: JSON.stringify(cart),
			contentType: 'application/json'
		})
    	
        $('#mealkitModal').modal()
        $('#modalMsg').empty();
		$('#modalMsg').text('장바구니에 담았습니다.');
		$('#confirmModal').modal();
		$('#favoriteOkBtn').hide();
		$('#cartOkBtn').show();
    })
}

$(init);
</script>
</head>
<%@ include file='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
	<a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
	<div id="menuName">
		<c:forEach var='mealkit' items='${mealkitList}'>
			<h3>${mealkit.mealkitName}</h3>
		</c:forEach>
	</div>
</div>
<%@ include file='../include/headerBottom.jsp'%>
<body>
	<div id='mainContainerAddSub' class='container'>
		<div class='row mt'>
			<div class='col'>
				<c:forEach var='mealkit' items='${mealkitList}'>
					<img style="height: 220px; width: 100%;"
						src='<c:url value="/attach/${mealkit.mealkitImgfileName}"/>' />
					<p>
						<input type='hidden' id='mealkitNum' name='mealkitNum'
							value='${mealkit.mealkitNum}' readonly />
					</p>
				</c:forEach>
			</div>
		</div>
		<div class='row'>
			<div class='col'>
				<div class='border-bottom w-auto'>
					<c:forEach var='mealkit' items='${mealkitList}'>
						<h6 class='mt-1 mb-1'>${mealkit.description}</h6>
					</c:forEach>
				</div>
				<div class='border-bottom w-auto'>
					<c:forEach var='mealkit' items='${mealkitList}'>
						<h5 class='mt-1 mb-1' style='display: inline;'>${mealkit.price}</h5>
					</c:forEach>
					<span>원</span>
				</div>
				<div class='border-bottom w-auto'>
					<span>수량 :</span>
					<button type='button' class='btn btn-secondary btn-sm'
						id='minusBtn'>-</button>
					<input type='text' style='border: none; width: 48px;'
						class='col-3 text-center' name='amount' id='amount' value='1'
						readonly='readonly' />
					<button type='button' class='btn btn-secondary btn-sm' id='plusBtn'>+</button>
					<c:forEach var='mealkit' items='${mealkitList}'>
						<input type='text' style='border: none; float: right;'
							class='col-3 text-center' name='price' id='price'
							value='${mealkit.price}' readonly='readonly' />
					</c:forEach>
				</div>
				<div class='border w-auto mt-2 mb-1'>
					<c:forEach var='mealkit' items='${mealkitList}'>
						<pre>
${mealkit.ingredient}
</pre>
					</c:forEach>
				</div>
				<form action='<%=request.getContextPath() %>/order/addOrder' method="post">
							<input type='hidden' name='mealkitsStr' id='mealkitsStr' value='${mealkitList[0].mealkitNum}_1_${mealkitList[0].mealkitName}_${mealkitList[0].price}'>
							
				<div>
					<div class='favorite' style='display: inline'>
						<span id='favoriteIcon' class="material-icons"
							style='font-size: 3rem;'>favorite</span>
					</div>
					<div style='display: inline;'>
						<a type='button' class='btn btn-secondary ml-5 mb-4' id='cartBtn'
							data-toggle='modal' data-target='#mealkitModal'>담기</a>
						<button type='submit' id='buyBtn' class='btn btn-secondary ml-2 mb-4'>구매</button>					
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
<%@ include file='../include/footer.jsp'%>
<div class='modal fade' id='mealkitModal' tabindex='-1'>
	<div class='modal-dialog'>
		<div class='modal-content'>
			<div class='modal-header py-2'>
				<p class='modal-title float-left' id='myModalLabel'>상품안내</p>
				<button bype='button' class='close' data-dismiss='modal'>
					<span>&times;</span>
				</button>
			</div>
			<div class='modal-body text-center'>
				<p id='modalMsg' style='text-align: center'></p>
			</div>
			<div class='modal-footer py-1'>
				<button type='button' class='btn btn-primary col-3'
						data-dismiss='modal' id='favoriteOkBtn'>확인</button>
				<c:forEach var='mealkit' items='${mealkitList}'>
					<button type='button' class='btn btn-primary col-3'
						data-dismiss='modal' id='cartOkBtn'
						onclick="location.href='listMealkit'">확인</button>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<%@ include file='../include/footer.jsp'%>
</html>