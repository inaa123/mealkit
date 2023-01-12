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
	function listNotices() {
		$('#notices').empty();
		
		$.ajax({
			method:'post',
			url:"<%=request.getContextPath() %>/admin/notice/getNotices"
		}).done(notices => {
				if(notices.length) {
					const noticeArr = []
					
					$.each(notices, (i, notice) => {
						noticeArr.unshift(
							`<tr>
								<td><input type='checkbox' name='noticeNum' id='noticeNum'
										value='\${notice.noticeNum}'/></td>
								<td>\${notice.noticeNum}</td>
								<td><a href='detailNotice?noticeNum=\${notice.noticeNum}'>
										\${notice.noticeTitle}</td>
								<td>\${notice.noticeRegdate}</td>
							 </tr>`
						);
					})
					$('#notices').append(noticeArr.join(''))
				} else {
					$('#notices').append('<tr><td colspan=6 class=text-center>공지사항이 없습니다.</td></tr>')	
				}
		})
	}
	
    function init() {
		$(listNotices)
        
        $('#delBtn').click(() => {
			if($('#noticeNum:checked').val()) {
				$('#delModalLabel').empty();
				$('#delModalLabel').text('공지삭제');
        		$('#modalMsg').empty();
         		$('#modalMsg').text('선택한 공지를 삭제하시겠습니까?');
         		$('#deleteModal').modal();
         		$('#okBtn').hide();
         		$('#noBtn').show();
         		$('#delNoticeBtn').show();
      		} else {
				$('#delModalLabel').empty();
				$('#delModalLabel').text('공지삭제');
         		$('#modalMsg').empty();
         		$('#modalMsg').text('삭제할 공지를 선택해주세요.');
         		$('#deleteModal').modal();
         		$('#okBtn').show();
         		$('#noBtn').hide();
         		$('#delNoticeBtn').hide();
      		}
   		})
   
		$('#delNoticeBtn').click(() => {
			$('#deleteModal').modal('hide')
        	for (var i = 0; i < $('#noticeNum:checked').length; i++) {
            	$.ajax({
               		url: 'del/' + $('#noticeNum:checked').eq(i).val(),
               		method: 'delete'
            	}).done(function() {
            		if(i == $('#noticeNum:checked').length) listNotices()
            	})
         	}      
      	})

		$('#searchBtn').click(() => {
			if($('#searchTitle').val() == '') {
				$('#delModalLabel').empty();
				$('#delModalLabel').text('공지검색');
         		$('#modalMsg').empty();
         		$('#modalMsg').text('검색할 공지제목을 입력해주세요.');
         		$('#deleteModal').modal();
         		$('#okBtn').show();
         		$('#noBtn').hide();
         		$('#delNoticeBtn').hide();
         		$(listNotices)
			} else if($('#searchTitle').val() != '') {
				$('#notices').empty();
				let keyword = $('#searchTitle').val();
				
				$.ajax({
					url: 'searchNotices/' + keyword,
					dataType: 'json',
					success: notices => {
						if(notices.length) {
							const userArr = []					
							$.each(notices, (i, notice) => {
							    userArr.unshift(
							    	`<tr>
										<td><input type='checkbox' name='noticeNum' id='noticeNum'
												value='\${notice.noticeNum}'/></td>
										<td>\${notice.noticeNum}</td>
										<td><a href='detailNotice?noticeNum=\${notice.noticeNum}'>
												\${notice.noticeTitle}</td>
										<td>\${notice.noticeRegdate}</td>
									 </tr>`
							    )
							})						
							$('#notices').append(userArr.join(''))
						}
					}				
				}).done(function(){if($('#notices').find('tr').eq(0).length != 1) $('#notices').append(`<tr><th colspan='5'>검색 결과가 없습니다.</th></tr>`)})
			}
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
                    <h2 style='display: inline'>공지</h2>&ensp;
                    <h6 style='display: inline'>공지목록</h6>
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
                    	<form>
                        <div class='row mt-3'>
                            <label class='col-2 col-form-label' style='text-align: right; font-weight: 600;'>검색:</label>
                            <div class='col px-0'>
                                <input type='text' id='searchTitle' name='searchTitle' class='form-control' id='serchBox' placeholder='제목을 입력해주세요.'>
                            </div>
                            <div class='col-2 d-flex'>
                                <button type='button' id='searchBtn' class='btn btn-secondary'>검색</button>
                            </div>
                        </div>
                        </form>
                        <div class='row mt-5'>
                            <div class='col'>
                                <table class='table table-hover my-0'>
                                    <colgroup>
                                        <col width='5%'>
                                        <col width='15%'>
                                        <col width='60%'>
                                        <col width='20%'>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope='col'></th>
                                            <th scope='col'>번호</th>
                                            <th scope='col'>제목</th>
                                            <th scope='col'>작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody id='notices'>
                                        <tr>
                                            <th><input type='checkbox'></th>
                                            <td>0007</td>
                                            <td id='noticeTitle' onclick='location.href="<%=request.getContextPath()%>/admin/notice/detailNotice"'>[공지] 10월 13일(목) EZEN MEALKIT 페이지 구현 일정 안내</td>
                                            <td id='noticeRegdate'>2022.10.12</td>
                                        </tr>
                                        <tr>
                                            <th><input type='checkbox'></th>
                                            <td>0006</td>
                                            <td>[공지] 추석 이벤트 안내 ${notice.noticeTitle}</td>
                                            <td>2022.10.11</td>
                                        </tr>
                                        <tr>
                                            <th><input type='checkbox'></th>
                                            <td>0005</td>
                                            <td>[당첨자발표] 오픈이벤트 당첨자 발표 안내</td>
                                            <td>2022.10.10</td>
                                        </tr>
                                        <tr>
                                            <th><input type='checkbox'></th>
                                            <td>0004</td>
                                            <td>[배송] 명절 배송지연 안내</td>
                                            <td>2022.10.09</td>
                                        </tr>
                                        <tr>
                                            <th><input type='checkbox'></th>
                                            <td>0003</td>
                                            <td>[공지] EZEN MEALKIT 업데이트 일정 안내</td>
                                            <td>2022.10.08</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <hr class='mt-0'>
                            </div>
                        </div>
                    </div>
                </div>
                <hr style='position: relative; bottom: 13%;'>
                <div id='bottomBtnGroup'>
                    <button type='button' id='addNoticeBtn' class='btn btn-secondary mr-2' onclick='location.href="./addNotice"'>작성</button>
                    <button type='button' id='delBtn' class='btn btn-secondary' data-toggle='modal' data-target='#deleteModal'>삭제</button>
                </div>
            </div>
        </div>
    </div>

	<div class='modal fade' id='deleteModal' tabindex='-1'>
        <div class='modal-dialog'>
            <div class='modal-content'>
                <div class='modal-header py-2'>
                    <p class="modal-title float-left" id='delModalLabel'>공지삭제</p>
                    <button type='button' class='close' data-dismiss='modal'><span>&times;</span></button>
                </div>
                <div class='modal-body'>
                    <p id='modalMsg' style='text-align: center'></p>
                </div>
                <div class='modal-footer py-1'>
                    <button type='button' id='noBtn' class='btn btn-primary col-3' data-dismiss='modal'>아니오</button>
                    <a class='btn btn-danger col-3' id='delNoticeBtn' role='button'>예</a>
                <button type='button' class='btn btn-primary col-3' data-dismiss='modal' id='okBtn'>확인</button>
                </div>
            </div>
        </div>
    </div>

</body>
<%@include file ='../../include/adminFooter.jsp'%>
