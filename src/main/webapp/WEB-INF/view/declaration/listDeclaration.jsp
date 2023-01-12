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
table {
    text-align: center;
    font-size: smaller;
}
</style>
<script>
function listDeclarations() {
	$('input').not(':radio').val('')
	$('#declaration').empty()
	
	$.ajax({
		url: 'getDeclarations',
		dataType: 'json',
		success: declarations => {
			if(declarations.length) {
				const declarationArr = []					
				$.each(declarations, (i, declaration) => {
				    declarationArr.unshift(
				        `<tr>
				            <th><a href='/declaration/detailDeclaration?declarationNum=\${declaration.declarationNum}'>\${declaration.declarationTitle}</a></th>
                            <td>\${declaration.declarationRegdate}</td>
                            <td>\${declaration.declarationStatusName}</td>
				        </tr>`
				    )
				})
				
				$('#declarations').append(declarationArr.join(''))
			}
		}
	}).done(function(){if($('#declarations').find('tr').eq(0).length != 1) $('#declarations').append(`<tr><th colspan='3'>신고 내역이 없습니다.</th></tr>`)})
}
function init() {
	listDeclarations()	
}

$(init)
</script>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
    <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
    <div id="menuName">
        <h3>신고 내역</h3>
    </div>
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
    <div id='mainContainerAddSub' class='container'>
        <div style='width: 1px; height: 1px;'></div>
        <table class='table table-sm mt-4'>
            <thead>
            <tr class='table-active'>
                <th scope='col'>제목</th>
                <th scope='col'>작성일</th>
                <th scope='col'>처리상태</th>
              </tr>
            </thead>
            <tbody id='declarations'>
            </tbody>
          </table>
		<hr style='margin-top: -1rem'>
    </div>
</body>

<%@ include file ='../include/footer.jsp'%>

</html>