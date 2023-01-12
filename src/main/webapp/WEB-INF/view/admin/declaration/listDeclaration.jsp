<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<head>
<title>EAZEN MEALKIT</title>
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
<link rel='stylesheet' type='text/css' href='../../res/admin.css'>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<style>

</style>
<script>
function listDeclarations() {
	$('#declarations').empty()
	$.ajax({
		url: 'getDeclarations',
		dataType: 'json',
		success: declarations => {
			if(declarations.length) {
				const declarationArr = []					
				$.each(declarations, (i, declaration) => {
				    declarationArr.unshift(
				        `<tr>
				        	<td>\${declaration.declarationNum}</td>
				            <td><a href='/admin/declaration/detailDeclaration?declarationNum=\${declaration.declarationNum}'>\${declaration.declarationTitle}</a></td>
                            <td>\${declaration.declarationRegdate}</td>
                            <td>\${declaration.declarationStatusName}</td>
				        </tr>`
				    )
				})
				$('#declarations').append(declarationArr.join(''))
			}
		}
	}).done(function(){if($('#declarations').find('tr').eq(0).length != 1) $('#declarations').append(`<tr><th colspan='4'>신고 내역이 없습니다.</th></tr>`)})
}

function init() {
	listDeclarations()
	
	$('#searchBtn').click(() => {
		$('#declarations').empty()
		let keyword = $('#searchDeclarationTitle').val()
		let category = $('#category').val()
		
		if(keyword != "" && category != "none") {
			$.ajax({
				url: 'searchDeclarations?keyword=' + keyword + '&&category=' + category,
				dataType: 'json',
				success: declarations => {
					if(declarations.length) {
						const declarationArr = []					
						$.each(declarations, (i, declaration) => {
						    declarationArr.unshift(
						        `<tr>
						        	<td>\${declaration.declarationNum}</td>
						            <td><a href='/admin/declaration/detailDeclaration?declarationNum=\${declaration.declarationNum}'>\${declaration.declarationTitle}</a></td>
		                            <td>\${declaration.declarationRegdate}</td>
		                            <td>\${declaration.declarationStatusName}</td>
						        </tr>`
						    )
						})
						$('#declarations').append(declarationArr.join(''))
					}
				}				
			}).done(function(){if($('#declarations').find('tr').eq(0).length != 1) $('#declarations').append(`<tr><th colspan='4'>검색 결과가 없습니다.</th></tr>`)})
		} else listDeclarations()
	})
}

$(init)
</script>
</head>
<body>
	<%@ include file ='../../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>신고</h2>&ensp;
                    <h6>신고목록</h6>
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
                        <form>
                            <div class='row'>
                                <div class='col-2'>
                                    <select class='form-control' id='category' name='category'>
                                        <option value='none' selected hidden>검색기준</option>
                                        <option value='declaration_num'>번호</option>
                                        <option value='declaration_title'>제목</option>
                                        <option value='declaration_status_name'>처리상태</option>
                                    </select>
                                </div>
                                <div class='col px-0'>
                                    <input type='text' class='form-control' id='searchDeclarationTitle' name='searchDeclarationTitle' placeholder='내용을 입력해주세요.'>
                                </div>
                                <div class='col-2 d-flex'>
                                    <button type='button' id='searchBtn' class='btn btn-secondary flex-fill'>검색</button>
                                </div>
                            </div>
                        </form>
                        <div class='row mt-5'>
                            <div class='col'>
                                <table class='table table-hover my-0'>
                                    <colgroup>
                                        <col width='15%'>
                                        <col width='51%'>
                                        <col width='17%'>
                                        <col width='17%'>
                                    </colgroup>
                                    <thead class='table-info'>
                                        <tr>
                                            <th scope='col'>번호</th>
                                            <th scope='col'>제목</th>
                                            <th scope='col'>작성일</th>
                                            <th scope='col'>상태</th>
                                        </tr>
                                    </thead>
                                    <tbody id='declarations'>
                                    </tbody>
                                </table>
                                <hr class='mt-0'>
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