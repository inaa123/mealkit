<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<html>
<head>
<title>mealkitList</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' />
<link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>
<link rel='preconnect' href='https://fonts.googleapis.com'>
<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
<link href='https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap' rel='stylesheet'>
<link rel='stylesheet' type='text/css' href='../res/lib.css'>
<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/js/paging.js"></script>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<style>
.pagination {
    margin-bottom: 4rem;
    justify-content: center;
}

.page-link {
  color: #000;
  background-color: #fff;
  border: 1px solid #ccc;
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;

}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa;
  border-color: #ccc;
}

#mealkits img {
	width: 140px;
	height: 90px;
}
</style>
<script>
function listMealkits() {
	$('#mealkits').empty()
	
	$.ajax({
		metod:'post',
		url: "<%=request.getContextPath()%>/mealkit/listMealkits"
	}).done(mealkits => {
		if(mealkits.length) {
			const mealkitArr = []
			
			$.each(mealkits, (i, mealkit) => {
				mealkitArr.unshift(
                	`<tr>
                        <td class='align-middle'>
                        	<a href='detailMealkit?mealkitNum=\${mealkit.mealkitNum}'>
                        		<img src='/attach/\${mealkit.mealkitImgfileName}'/>
                        	</a>
                        </td>
                        <td class='align-middle'>\${mealkit.mealkitName}</td>                     
                        <td class='align-middle'>\${mealkit.price}원</td>
                        <td class='align-middle'>\${mealkit.description}</td>
                    </tr>`		
				);
			})
			
			$('#mealkits').append(mealkitArr.join(''))
		} else {
			$('#mealkits').append('<tr><td colspan=4 class=text-center>판매중인 밀키트가 없습니다.</td></tr>')
		}
	})
}

$(listMealkits)

</script>
</head>
<%@ include file ='../include/headerTop.jsp'%>
    <div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
        <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
        <div id="menuName">
            <h3>전체밀키트</h3>
        </div>
    </div>
<%@ include file ='../include/headerBottom.jsp'%>
<body>
    <div id='mainContainerAddSub' class="container">
        <div class='row mt-2'>
            <div class='col'>
                <table class='table table-sm' style='font-size: 75%;'>
                	<colgroup>
                         <col width='15%'>
                         <col width='20%'>
                         <col width='20%'>
                         <col width='20%'>
                     </colgroup>
                    <thead>
                    	<tr>
           	               <th scope='col'>상품</th>
                           <th scope='col'>이름</th>
                           <th scope='col'>판매가</th>
                           <th scope='col'>설명</th>
                    	</tr>
                    </thead>
                    <tbody id='mealkits'>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <nav aria-label='Page navigation example'>
        <ul class='pagination'>
            <li class='page-item'><a class='page-link' href='#'>&lt;</a></li>
            <li class='page-item'><a class="page-link" href='#'>1</a></li>
            <li class='page-item'><a class='page-link' href='#'>&gt;</a></li>
        </ul>
    </nav>
</body>
<%@ include file ='../include/footer.jsp'%>
</html>