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
        }
    </style>
    <script>
    function listReviews() {
        $('#reviews').empty();
        $.ajax({
           method: 'post',
           url: "<%=request.getContextPath()%>/admin/review/getReview"
        }).done(reviews => {
             if(reviews.length) {
                const reviewArr = []
                $.each(reviews, (i, review) => {
                   reviewArr.unshift(
                       	`<tr>
                           <td><input type='checkbox' name='reviewNum' id='reviewNum'
					                    value='\${review.reviewNum}' onclick='NoMultiChk(this)'/></td>
                           <td class='align-middle'>\${review.reviewNum}</td>
                           <td class='align-middle'>\${review.mealkitName}</td>
                           <td class='align-middle'><a href='/review/detailReview?reviewNum=\${review.reviewNum}'>\${review.reviewTitle}</td>
                           <td class='align-middle'>\${review.userId}</td>
                           <td class='align-middle'>\${review.reviewRegDate}</td>
                       </tr>`
                   );
                })
                
                $('#reviews').append(reviewArr.join(''))
             } else { 
                $('#reviews').append(
                   '<tr><td colspan=6 class=text-center>리뷰가 없습니다.</td></tr>')
             }
        })
     }

    function NoMultiChk(chk){
      	var obj = document.getElementsByName('reviewNum');
       	for(var i=0; i<obj.length; i++){
         	if(obj[i] != chk){
           	obj[i].checked = false;
         	}
       	}
    }
    
     function init() {
    	 $(listReviews)
    	 
    	 $('#delBtn').click(() => {
		if($('#reviewNum:checked').val()) {
			$('#modalMsg').empty();
			$('#modalMsg').text('리뷰를 삭제하시겠습니까?');
			$('#confirmModal').modal();
			$('#okBtn').hide();
			$('#noBtn').show();
			$('#yesBtn').show();
		} else {
			$('#modalMsg').empty();
			$('#modalMsg').text('리뷰를 선택해주세요.');
			$('#confirmModal').modal();
			$('#noBtn').hide();
			$('#yesBtn').hide();
			$('#okBtn').show();
		}
	})
	
	$('#yesBtn').click(() => {
		$('#confirmModal').modal('hide')
		$.ajax({
			url: 'del/' + $('#reviewNum:checked').val(),
			method: 'delete'
		}).done(listReviews)
	})
	
	$('#searchBtn').click(() => {
         if($('#searchTitle').val() == '') {
           		$('#delModalLabel').empty();
           		$('#delModalLabel').text('리뷰삭제');
                $('#modalMsg').empty();
                $('#modalMsg').text('상품명을 입력해주세요.');
                $('#confirmModal').modal();
                $('#okBtn').show();
                $('#noBtn').hide();
                $('#yesBtn').hide();
                $(listReviews)
         } else if($('#searchTitle').val() != '') {
            $('#reviews').empty();
            let keyword = $('#searchTitle').val();
            
            $.ajax({
               url: 'searchReviews/' + keyword,
               dataType: 'json',
               success: reviews => {
                  if(reviews.length) {
                     const reviewArr = []               
                     $.each(reviews, (i, review) => {
                         reviewArr.unshift(
                            `<tr>
                              <td><input type='checkbox' name='reviewNum' id='reviewNum'
				                    value='\${review.reviewNum}' onclick='NoMultiChk(this)'/></td>
				              <td class='align-middle'>\${review.reviewNum}</td>
			                  <td class='align-middle'>\${review.mealkitName}</td>
			                  <td class='align-middle'><a href='/review/detailReview?reviewNum=\${review.reviewNum}'>\${review.reviewTitle}</td>
			                  <td class='align-middle'>\${review.userId}</td>
			                  <td class='align-middle'>\${review.reviewRegDate}</td>
                            </tr>`
                         )
                     })                  
                     $('#reviews').append(reviewArr.join(''))
                  }
               }            
            }).done(function(){if($('#reviews').find('tr').eq(0).length != 1) $('#reviews').append('<tr><td colspan=6 class=text-center>리뷰가 없습니다.</td></tr>')})
         }
      })
     }
     
     $(init)
    </script>
</head>

<body>
	<%@ include file ='../../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>리뷰</h2>
                    <h6 style='display: inline'>리뷰목록</h6>
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
                                <input type='text' id='searchTitle' name='searchTitle' class='form-control' id='serchBox' placeholder='상품명을 입력해주세요.'>
                            </div>
                            <div class='col-2 d-flex'>
                                <button type='button' id='searchBtn' class='btn btn-secondary'>검색</button>
                            </div>
                        </div>
                        <div class='row mt-5'>
                            <div class='col'>
                                <table class='table table-hover my-0'>
                                    <colgroup>
                                        <col width='5%'>
                                        <col width='10%'>
                                        <col width='20%'>
                                        <col width='35%'>
                                        <col width='15%'>
                                        <col width='15%'>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope='col'></th>
                                            <th scope='col'>번호</th>
                                            <th scope='col'>상품명</th>
                                            <th scope='col'>제목</th>
                                            <th scope='col'>작성자</th>
                                            <th scope='col'>작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody id='reviews'>
                                    </tbody>
                                </table>
                                <hr class='mt-0'>
                            </div>
                        </div>
                    </div>
                </div>
                <hr style='position: relative; bottom: 13%;'>
                <div id='bottomBtn'>
                    <button type='button' class='btn btn-secondary' data-toggle='modal' data-target='#deleteModal' id='delBtn'>삭제</button>
                </div>
            </div>
        </div>
    </div>

    <div class='modal fade' id='confirmModal' tabindex='-1'>
        <div class='modal-dialog'>
            <div class='modal-content'>
                <div class='modal-header py-2'>
                    <p class="modal-title float-left" id='delModalLabel'>리뷰삭제</p>
                    <button type='button' class='close' data-dismiss='modal'><span>&times;</span></button>
                </div>
                <div class='modal-body'>
                    <p id='modalMsg' style='text-align: center'></p>
                </div>
                <div class='modal-footer py-1'>
                    <button type='button' id='noBtn' class='btn btn-primary col-3' data-dismiss='modal'>아니오</button>
                    <a class='btn btn-danger col-3' id='yesBtn' role='button'>예</a>
                <button type='button' class='btn btn-primary col-3' data-dismiss='modal' id='okBtn'>확인</button>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file ='../../include/adminFooter.jsp'%>