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
<link rel='stylesheet' type='text/css' href='../res/admin.css'>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<style>
table {
    text-align: center;
    font-size: smaller;
}
</style>
<script>
function listDeclarations() {
	$('#declarationList').empty();
	$.ajax({
		url:'<%=request.getContextPath() %>/admin/declaration/getDeclarations',
		dataType: 'json',
		success: declarations => {
			if(declarations.length) {
				const declarationArr = []
				for(i = declarations.length; i > 0; i--) {
					if(i > declarations.length - 3) {
						declarationArr.push(
							`<tr>
							<td>\${declarations[i-1].declarationNum}</td>
							<td><a href='/admin/declaration/detailDeclaration?declarationNum=\${declarations[i-1].declarationNum}'>\${declarations[i-1].declarationTitle}</a></td>
							<td>\${declarations[i-1].userId}</td>
							<td>\${declarations[i-1].declarationStatusName}</td>
							</tr>`
						)
					}
				}
				$('#declarationList').append(declarationArr.join(''))
			} else {
				$('#declarationList').append(`<tr><td colspan='4'>등록된 신고가 없습니다.</td></tr>`)	
			}
		}
	})
}

function listQuestions() {
	$('#questionList').empty();
	$.ajax({
		url:'<%=request.getContextPath() %>/admin/question/getAdminQuestions',
		type:'post',
		success: questions => {
			if(questions.length) {
				const questionArr = []
				for(i = questions.length; i > 0; i--) {
					if(i > questions.length - 3) {
						let status
						if(questions[i-1].answerContent) {
							status = '답변완료'
						} else {
							status = '답변대기'
						}
						questionArr.push(
							`<tr>
							<td>\${questions[i-1].questionNum}</td>
							<td><a href='/admin/question/detailQuestion?questionNum=\${questions[i-1].questionNum}'>\${questions[i-1].questionTitle}</a></td>
							<td>\${questions[i-1].userId}</td>
							<td>\${status}</td>
							</tr>`
						)
					}
				}
				$('#questionList').append(questionArr.join(''))
			} else {
				$('#questionList').append(`<tr><td colspan='4'>등록된 문의가 없습니다.</td></tr>`)	
			}
		}
	})
}

$(listDeclarations)
$(listQuestions) 
</script>
</head>
<body>
	<%@ include file ='../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>MAIN</h2>&ensp;
    <%@ include file ='../include/adminTop2.jsp'%>           
            <div class='col' style='border: 1px solid'>
                <div class='border w-auto mt-3' id='content'>
                    <div class='mx-4 my-2' style='height: 16.5rem; border: 0.1rem; border-style: solid; position: relative;'>
                        <img style='width: 100%; height: 100%;' src='<c:url value="/attach/logo.png"/>'/>
                    </div>

                    <form action='addLogo'  class='d-flex justify-content-end' method='post' encType='multipart/form-data'>
                        <div class='row'>
                            <label for='input' class='col-2 px-0 mr-2 col-form-label' style='font-size: 70%;'>로고이미지:</label>
                            <div class='col-7 px-0 input-group input-group-sm'>
                                <input type='file' class='form-control' id='logo' name='logo' style='font-size: 70%;'>
                            </div>
                            <div class='col pl-1 mr-3'>
                                <button type='submit' class='btn btn-sm btn-secondary' style='font-size: 70%;'>변경</button>
                            </div>
                        </div>
                    </form>

                    <p class='ml-4'>[최근 문의]</p>
                    <div class='row mx-4'>
                        <table class='table table-sm'>
                            <colgroup>
                                <col width='15%'>
                                <col width='51%'>
                                <col width='17%'>
                                <col width='17%'>
                            </colgroup>
                            <thead>
                                <tr class='table-active'>
                                    <th scope='col'>글번호</th>
                                    <th scope='col'>제목</th>
                                    <th scope='col'>아이디</th>
                                    <th scope='col'>상태</th>
                                </tr>
                            </thead>
                            <tbody id='questionList'>
                                <tr>
                                    <td>3</td>
                                    <td><a href='question/03.html'>마라키트 많이 맵나요?</a></td>
                                    <td>seop2</td>
                                    <td>답변대기</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>배송문의 ㅠㅜ</td>
                                    <td>seop2</td>
                                    <td>답변완료</td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>재입고 문의드려용~</td>
                                    <td>rightarm</td>
                                    <td>답변완료</td>
                                </tr>
                                <tr><td></td><td></td><td></td><td></td></tr>
                            </tbody>
                        </table>
                    </div>

                    <p class='ml-4'>[최근 신고]</p>
                    <div class='row mx-4'>
                        <table class='table table-sm'>
                            <colgroup>
                                <col width='15%'>
                                <col width='51%'>
                                <col width='17%'>
                                <col width='17%'>
                            </colgroup>
                            <thead>
                                <tr class='table-active'>
                                    <th scope='col'>글번호</th>
                                    <th scope='col'>제목</th>
                                    <th scope='col'>아이디</th>
                                    <th scope='col'>상태</th>
                                </tr>
                            </thead>
                            <tbody id='declarationList'>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file ='../include/adminFooter.jsp'%>