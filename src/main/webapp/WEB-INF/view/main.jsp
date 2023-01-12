<%@page import="com.my.mealkit.domain.Mealkit"%>
<%@page import="java.util.List"%>
<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<html lang='ko'>
<head>
<title>EAZEN MEALKIT</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' />
<link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel='stylesheet' type='text/css' href='../res/lib.css'>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alkalami&family=Black+Han+Sans&family=Jua&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@700&display=swap" rel="stylesheet">
<style>
	#event_list a {
		color: rgb(0, 0, 0);
	}
	
	#footer_text {
		margin-bottom: 3.5rem;
		font-size: x-small;
	}

	#footer_text a {
		color: white;
	}

	#footer_text dl dt {
		float: left;
	}

	#footer_ul {
		list-style: none;
		padding: 0px;
	}

	#footer_ul li {
		float: left;
	}

	footer span {
		color: black;
	}

	dd {
		margin-top: 0;
		margin-bottom: 0;
	}

	dt {
		margin-top: 0;
		margin-bottom: 0;
	}

	dl {
		margin-top: 0;
		margin-bottom: 0;
	}	
</style>
<script>
function listNotices() {
	$('#notices').empty();
	$.ajax({
		type:'post',
		url:"<%=request.getContextPath() %>/notice/getNotices"
	}).done(notices => {
			if(notices.length) {
				const noticeArr = []
				for(i = notices.length; i > 0; i--) {
					if(i == notices.length) {
						noticeArr.push(
								`<div class='carousel-item active'>
									<a href='/notice/detailNotice?noticeNum=\${notices[i-1].noticeNum}'><strong>공지]</strong>
									<small>\${notices[i-1].noticeTitle}</small></a></div>`
							);
					}
					if(notices.length != i && i > notices.length-4) {
						noticeArr.push(
							`<div class='carousel-item'>
									<a href='/notice/detailNotice?noticeNum=\${notices[i-1].noticeNum}'><strong>공지]</strong>
									<small>\${notices[i-1].noticeTitle}</small></a></div>`
						);
					}
				}
				$('#notices').append(noticeArr.join(''))
			} else {
				$('#notices').append(`<div class='carousel-item active'><small>공지사항이 없습니다.</small></div>`)	
			}
	})
}

$(listNotices)   
</script>
</head>

<%@ include file ='include/headerTop.jsp'%>
<%@ include file ='include/headerBottom.jsp'%>
<body>
	<div class='container' id='mainContainer'>
		<p class='navbar-title flex-fill mr-1 my-0 p-0' style="font-family: 'Black Han Sans', cursive; height: 50px;">
			신규밀키트
		</p>
		<div class='carousel slide border w-auto' data-ride="carousel" id='mealkit_list' style='height: 300px; display: flex; justify-content: center; align-items: center; text-align: center;' >
			<div class='carousel-inner'>
			<c:forEach var='mealkit' items='${mealkitList}' varStatus='status'>
				<c:choose>
					<c:when test='${status.last}'>
						<div class='carousel-item active'>
							<a href='mealkit/detailMealkit?mealkitNum=${mealkit.mealkitNum}'>						
								<img style="height:300px; width: 100%;" src='<c:url value="/attach/${mealkit.mealkitImgfileName}"/>'/>
							</a>	
						</div>
					</c:when>
					<c:otherwise>
						<div class='carousel-item'>
							<a href='mealkit/detailMealkit?mealkitNum=${mealkit.mealkitNum}'>
								<img style="height:300px; width: 100%;" src='<c:url value="/attach/${mealkit.mealkitImgfileName}"/>'/>
							</a>	
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>	
			</div>
		</div>
		<hr>
		<p class='navbar-title flex-fill mr-1 my-0 p-0' style="font-family: 'Black Han Sans', cursive; height: 25px;">
			판매밀키트
		</p>	
		<div id='product_list' class='carousel slide mt-0' data-ride='carousel' data-interval='20000'>		
			<div class='carousel-inner'>
			<c:forEach var='mealkit' items='${mealkitList}' varStatus='status'>
				<c:choose>
					<c:when test='${status.first}'>
						<div class='carousel-item active'>
							<a href='mealkit/detailMealkit?mealkitNum=${mealkit.mealkitNum}'>	
								<img style="height:300px; width: 328px;" src='<c:url value="/attach/${mealkit.mealkitImgfileName}"/>'/>
							</a>	
						</div>
					</c:when>
					<c:otherwise>
						<div class='carousel-item'>
							<a href='mealkit/detailMealkit?mealkitNum=${mealkit.mealkitNum}'>	
								<img style="height:300px; width: 328px;" src='<c:url value="/attach/${mealkit.mealkitImgfileName}"/>'/>
							</a>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>	
			</div>	
			<a href='#product_list' class='carousel-control-prev' data-slide='prev'>
				<span class='carousel-control-prev-icon'></span>
			</a>
			<a href='#product_list' class='carousel-control-next' data-slide='next'>
				<span class='carousel-control-next-icon'></span>
			</a>
		</div>	
		<div class='row mt-2'>
			<div class='col'>
				<div class='jumbotron p-2 m-0'>
					<div class='carousel slide' data-ride='carousel' data-interval='5000' id='event_list' style='font-size: 88%'>
						<div class='carousel-inner' id='notices'>

						</div>
					</div>
				</div>
			</div>
		</div>		
		<div id='footer_text' class='bg-dark text-light'>
			<nav id='footer_nav'>
				<ul id='footer_ul'>
					<li><a href="#">이용약관 |&nbsp;</a></li>
					<li><a href="#"><strong> 개인정보처리방침 |&nbsp;</strong></a></li>
					<li><a href="#"> 법적고지 |&nbsp;</a></li>
					<li><a href="#"> 고객행복센터</a></li>
				</ul>
			</nav>
			<br>
			<div class="comp_info">
				<p class="company my-0">이젠밀키트(주)</p>
				<div class="line_wrap">
					<dl>
						<dt>대표이사 :</dt>
						<dd>&nbsp;최한석, 한아름</dd>
					</dl>
				</div>
				<div class="line_wrap">
					<dl>
						<dd>
							<address class="my-0">서울시 관악구 신림로 340 이젠밀키트 (우) 08754 (ezan@gmail.com)</address>
						</dd>
					</dl>
				</div>
				<div class="line_wrap">
					<dl>
						<dt>사업자등록번호 :</dt>
						<dd><span class="ff_avr">&nbsp;123-45-67890</span></dd>
					</dl>
				</div>
				<div class="line_wrap">
					<dl>
						<dt>통신판매업신고</dt>
						<dd>&nbsp;중구 제 07767호&nbsp;
							<a href="#"><strong>사업자정보확인</strong></a>
						</dd>
					</dl>
				</div>
				<div class="line_wrap">
					<dl>
						<dt>개인정보보호책임자 :</dt>
						<dd>&nbsp;양승일</dd>
					</dl>
					<dl>
						<dt>호스팅제공자 :</dt>
						<dd>&nbsp;이젠밀키트㈜ </dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file ='include/footer.jsp'%>
</html>