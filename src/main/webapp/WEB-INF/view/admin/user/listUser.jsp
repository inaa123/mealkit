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
table {
    text-align: center;
    font-size: smaller;
}
</style>
<script>
function listUsers() {
	$('input').not(':radio').val('')
	$('#users').empty()
	
	$.ajax({
		url: 'getUsers',
		dataType: 'json',
		success: users => {
			if(users.length) {
				const userArr = []					
				$.each(users, (i, user) => {
				    userArr.unshift(
				        `<tr>
				            <th><input type='checkbox' class='mt-3' name='userId' id='userId'
				                    value='\${user.userId}'/></th>
		                    <td class='align-middle'>\${user.userId}</td>
                               <td class='align-middle'>\${user.userName}</td>
                               <td class='align-middle'>\${user.phoneNum}</td>
                               <td>\${user.basicAddress}<br>\${user.detailAddress} (\${user.zipCode})</td>
				        </tr>`
				    )
				})
				
				$('#users').append(userArr.join(''))
			}
		}
	})
}

function init() {
	listUsers()
	
	$('#delUserOkBtn').click(() => {
		for (var i = 0; i < $('#userId:checked').length; i++) {
			$.ajax({
				url: 'delUser/' + $('#userId:checked').eq(i).val(),
				method: 'delete'
			}).done(function(){if(i == $('#userId:checked').length) listUsers()})
		}		
	})
	
	$('#searchBtn').click(() => {
		$('#users').empty()		
		let keyword = $('#searchUserId').val()
		
		if(keyword != "") {
			$.ajax({
				url: 'searchUsers/' + keyword,
				dataType: 'json',
				success: users => {
					if(users.length) {
						const userArr = []					
						$.each(users, (i, user) => {
						    userArr.unshift(
						        `<tr>
						            <th><input type='checkbox' class='mt-3' name='userId' id='userId'
						                    value='\${user.userId}'/></th>
				                    <td class='align-middle'>\${user.userId}</td>
		                               <td class='align-middle'>\${user.userName}</td>
		                               <td class='align-middle'>\${user.phoneNum}</td>
		                               <td>\${user.basicAddress}<br>\${user.detailAddress} (\${user.zipCode})</td>
						        </tr>`
						    )
						})						
						$('#users').append(userArr.join(''))
					}
				}				
			}).done(function(){if($('#users').find('tr').eq(0).length != 1) $('#users').append(`<tr><th colspan='5'>검색 결과가 없습니다.</th></tr>`)})
		} else listUsers()
	})
}

$(init)
</script>
</head>

<body>
	<%@ include file ='../../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>회원조회</h2>&ensp;
                    <h6>회원목록</h6>
    <%@ include file ='../../include/adminTop2.jsp'%>

            <div class='col' style='border: 1px solid;'>
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
                        <div class='row mt-3'>
                            <label class='col-2 col-form-label' style='text-align: right; font-weight: 600;'>검색:
                            </label>
                            <div class='col px-0'>
                                <input type='text' class='form-control' id='searchUserId' name='searchUserId' placeholder='회원아이디를 입력해주세요.'>
                            </div>
                            <div class='col-2 d-flex'>
                                <button type='button' id='searchBtn' name='searchBtn' class='btn btn-secondary'>검색</button>
                            </div>
                        </div>

                        <div class='row mt-5'>
                            <div class='col'>
                                <table class='table table-hover my-0'>
                                    <colgroup>
                                        <col width='5%'>
                                        <col width='15%'>
                                        <col width='15%'>
                                        <col width='20%'>
                                        <col width='45%'>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope='col'></th>
                                            <th scope='col'>아이디</th>
                                            <th scope='col'>이름</th>
                                            <th scope='col'>연락처</th>
                                            <th scope='col'>주소</th>
                                        </tr>
                                    </thead>
                                    <tbody id='users'>

                                    </tbody>
                                </table>
                                <hr class='mt-0'>
                            </div>
                        </div>
                    </div>
                </div>
                <hr style='position: relative; bottom: 13%;'>
                <div id='bottomBtn'>
                    <button type='button' id='delUser' class='btn btn-secondary' data-toggle='modal'
                        data-target='#userDelModal'>삭제</button>
                </div>
            </div>
        </div>
    </div>

    <div class='modal fade' id='userDelModal' tabindex='-1'>
        <div class='modal-dialog'>
            <div class='modal-content'>
                <div class='modal-header py-2'>
                    <p class='modal-title float-left' id='ModalLabel'>삭제</p>
                    <button bype='button' class='close' data-dismiss='modal'>
                        <span>&times;</span>
                    </button>
                </div>
                <div class='modal-body text-center'>
                    <p>선택한 회원을 삭제하시겠습니까?</p>
                </div>
                <div class='modal-footer py-1'>
                    <button type='button' class='btn btn-primary col-3' data-dismiss='modal'>아니오</button>
                    <button type='button' id='delUserOkBtn' class='btn btn-danger col-3' data-dismiss='modal'>예</button>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file ='../../include/adminFooter.jsp'%>