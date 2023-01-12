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
        #paging_div {
                background-color: white;
                justify-content : center;
            }
        
            .pagination_section {
                position: relative;
                margin-bottom: 15px;
                width: 80%;
            }
      
            .pagination_section a {
                color: black;
                padding: 10px 18px;
                text-decoration: none;
            }
      
            .pagination_section a:hover:not(.active) {
                background-color: #031F3B;
                color: white;
            }
</style>
<script>
	function listQuestions() {
		$('#questions').empty();
		
		$.ajax({
			method: 'post',
			url: "<%=request.getContextPath()%>/question/getQuestions"
		}).done(questions => {
			if(questions.length) {
				const questionArr = []
				
				$.each(questions, (i, question) => {
					questionArr.unshift(
						`<tr>
							<td><a href='detailQuestion?questionNum=\${question.questionNum}'>
								\${question.questionTitle}</td>
							<td>\${question.questionRegdate}</td>
						</tr>`
					);
				})
				
				$('#questions').append(questionArr.join(''))
			} else {
				$('#questions').append(
					'<tr><td colspan=4 class=text-center>문의가 없습니다.</td></tr>')
			}
		})
	}
$(listQuestions)
</script>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
    <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
    <div id="menuName">
        <h3>1:1문의내역</h3>
    </div>
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
    <div id='mainContainerAddSub' class='container'>
        <div class='row'>
            <div class='col'>
                <table class='table table-sm table-hover text-center mt-3'>
                    <thead class='thead-light'>
                        <tr><th>제목</th><th>작성일</th></tr>
                    </thead>
                    <tbody id='questions'>
                    	<tr>
                    		<td id='questionTitle' onclick='location.href="<%=request.getContextPath()%>/quesetion/detailQuestion"'></td>
                    		<td id='questionRegdate'></td>
                    	</tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class='row justify-content-end'>
            <div class='col d-flex justify-content-end'>
                <button type='button' class='btn btn-secondary' onclick='location.href="addQuestion"'>작성</button>
        	</div>
    	</div>
    </div>
    <div class='row d-flex mx-auto fixed-bottom mb-5' id='paging_div'>
        <nav aria-label='Page navigation example'>
            <ul class='pagination'>
                <li class='page-item'><a class='page-link' href='#'>&lt;</a></li>
                <li class='page-item active'><a class='page-link' href='#'>1</a></li>
                <li class='page-item'><a class='page-link' href='#'>&gt;</a></li>
            </ul>
        </nav>
    </div>
</body>

<%@ include file ='../include/footer.jsp'%>
</html>