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
<script>
function listFaqs() {
	$('#faqs').empty();
	$.ajax({
		method:'post',
		url:"<%=request.getContextPath() %>/admin/faq/getFaqs"
	}).done(faqs => {
		if(faqs.length) {
			const faqArr = []
			
			$.each(faqs, (i, faq) => {
				faqArr.unshift(
                    `<tr>
                        <th><input type='checkbox' value='\${faq.faqNum}' name='faqNum' id='faqNum' onclick='checkOnly(this)'></th>
                        <td>\${faq.faqNum}</td>
                        <td><a href='detailFaq?faqNum=\${faq.faqNum}'>
                        	\${faq.faqTitle}</td>
                    </tr>`
				);
			})
			$('#faqs').append(faqArr.join(''))
		} else {
			$('#faqs').append('<tr><td colspan=5 class=text-center>Q&A가 없습니다.</td></tr>')
		}
	}) 
}

function checkOnly(element) {
  	const checkboxes = document.getElementsByName("faqNum");
  	
  	checkboxes.forEach((cb) => {
  		cb.checked = false;
  	})
  	
  	element.checked = true;
}

function init() {
	$(listFaqs)
    
    $('#delBtn').click(() => {
		if($('#faqNum:checked').val()) {
    		$('#modalMsg').empty();
     		$('#modalMsg').text('선택한 Q&A 항목을 삭제하시겠습니까?');
     		$('#deleteModal').modal();
     		$('#okBtn').hide();
     		$('#noBtn').show();
     		$('#delFaqBtn').show();
  		} else {
     		$('#modalMsg').empty();
     		$('#modalMsg').text('삭제할 Q&A 항목을 선택해주세요.');
     		$('#deleteModal').modal();
     		$('#okBtn').show();
     		$('#noBtn').hide();
     		$('#delFaqBtn').hide();
  		}
	})

	$('#delFaqBtn').click(() => {
		$('#deleteModal').modal('hide')
      	$.ajax({
        	url: 'del/' + $('#faqNum:checked').val(),
         	method: 'delete'
		}).done(listFaqs)
	})
}
$(init)

</script>
<style>
    table {
        text-align: center;
    }
    
    a { 
    	color: inherit;
    	text-decoration:none;
    }
</style>
</head>
<body>
	<%@ include file ='../../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>FAQ</h2>&ensp;
                    <h6>Q&A목록</h6>
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
                        <div class='row mt-5'>
                            <div class='col'>
                                <table class='table table-hover my-0'>
                                    <colgroup>
                                        <col width='5%'>
                                        <col width='15%'>
                                        <col width='80%'>
                                    </colgroup>
                                    <thead class='table-info'>
                                        <tr>
                                            <th scope='col'></th>
                                            <th scope='col'>번호</th>
                                            <th scope='col'>제목</th>
                                        </tr>
                                    </thead>
                                    <tbody id='faqs'>
                                    </tbody>
                                </table>
                                <hr class='mt-0'>
                            </div>
                        </div>
                    </div>
                </div>
                <hr style='position: relative; bottom: 13%;'>
                <div id='bottomBtnGroup'>
                    <button type='button' id='addFaqBtn' class='btn btn-secondary mr-2' onclick='location.href="./addFaq"'>작성</button>
                    <button type='button' id='delBtn' class='btn btn-secondary' data-toggle='modal' data-target='#deleteModal'>삭제</button>
                </div>
            </div>
        </div>
    </div>

	<div class='modal fade' id='deleteModal' tabindex='-1'>
        <div class='modal-dialog'>
            <div class='modal-content'>
                <div class='modal-header py-2'>
                    <p class="modal-title float-left" id='delModalLabel'>Q&A삭제</p>
                    <button type='button' class='close' data-dismiss='modal'><span>&times;</span></button>
                </div>
                <div class='modal-body'>
                    <p id='modalMsg' style='text-align: center'></p>
                </div>
                <div class='modal-footer py-1'>
                    <button type='button' id='noBtn' class='btn btn-primary col-3' data-dismiss='modal'>아니오</button>
                    <a class='btn btn-danger col-3' id='delFaqBtn' role='button'>예</a>
                <button type='button' class='btn btn-primary col-3' data-dismiss='modal' id='okBtn'>확인</button>
                </div>
            </div>
        </div>
    </div>
</body>
<%@include file ='../../include/adminFooter.jsp'%>
