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
function NoMultiChk(chk){
  	var obj = document.getElementsByName('mealkitNum');
   	for(var i=0; i<obj.length; i++){
     	if(obj[i] != chk){
       	obj[i].checked = false;
     	}
   	}
}

function init() {
	$('#delBtn').click(() => {
		if($('#mealkitNum:checked').val()) {
			$('#modalMsg').empty();
			$('#modalMsg').text('밀키트를 삭제하시겠습니까?');
			$('#confirmModal').modal();
			$('#okBtn').hide();
			$('#noBtn').show();
			$('#yesBtn').show();
		} else {
			$('#modalMsg').empty();
			$('#modalMsg').text('삭제하실 밀키트를 선택해주세요.');
			$('#confirmModal').modal();
			$('#noBtn').hide();
			$('#yesBtn').hide();
			$('#okBtn').show();
		}
	})
	
	$('#yesBtn').click(() => {
		$('#confirmModal').modal('hide')
		$.ajax({
			url: 'del/' + $('#mealkitNum:checked').val(),
			method: 'delete'
		}).done(listMealkits)
	})
	
	$('#fixBtn').click(() => {
		if($('#mealkitNum:checked').val()) {
			location.href='fixMealkit?mealkitNum='+ $('#mealkitNum:checked').val()
		} else {
			$('#modalTitle').text('밀키트 수정');
			$('#modalMsg').text('수정하실 밀키트를 선택해주세요.');
			$('#confirmModal').modal();
			$('#noBtn').hide();
			$('#yesBtn').hide();
			$('#okBtn').show();
		}
	})
	
	$('#serchBtn').click(() => {
		if($('#search').val() == '' && $('#searchCategory').val() == 0) {
			$('#modalTitle').text('밀키트 검색');
			$('#modalMsg').text('검색하실 밀키트를 입력하세요.');
			$('#confirmModal').modal();
			$('#noBtn').hide();
			$('#yesBtn').hide();
			$('#okBtn').show();
		} else if($('#search').val() != '') {
			location.href='searchMealkit?search='+ $('#search').val()
		} else if($('#searchCategory').val() != 0) {
			location.href='searchCategory?searchCategory='+ $('#searchCategory').val()
		}
	})
}

$(init)
</script>
<style>
	img {
		width: 140px;
		height: 90px;
	}
</style>
</head>
<body>
	<%@ include file ='../../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>상품목록</h2>&ensp;
    <%@ include file ='../../include/adminTop2.jsp'%>

            <div class='col' style='border: 1px solid'>
                <div class='border w-auto mt-3 my-3' id='content'>
                    <div id='pageGroup'>
                        <nav id='page'>
                            <ul class='pagination mb-0'>
                                <li class='page-item'>
                                    <a class='page-link' href='#' aria-label='previous'>
                                        <span aria-hidden='true'>&lt;</span>
                                    </a>
                                </li>
                                <li class='page-item'><a class='page-link' href='#'>1</a></li>
                                <li class='page-item'><a class='page-link' href='#'>2</a></li>
                                <li class='page-item'>
                                    <a class='page-link' href='#' aria-label='next'>
                                        <span aria-hidden='true'>&gt;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>                     
                    </div>
                    <div class='container mw-100 mt-5' style='width: 98%;'>
                    <form>
                        <div class='row'>
                            <div class='col-2'>
                                <select class='form-control' id='searchCategory' name='searchCategory'>
                                    <option value='0' selected hidden>카테고리</option>
                                    <option value='1'>한식</option>
                                    <option value='2'>중식</option>
                                    <option value='3'>일식</option>
                                    <option value='4'>양식</option>
                                    <option value='5'>기타</option>
                                </select>
                            </div>
                            <div class='col px-0'>
                                <input type='text' class='form-control' id='search' name='search' placeholder='상품명을 입력해주세요.'>
                            </div>
                            <div class='col-2 d-flex'>
                                <button type='button' id='serchBtn' class='btn btn-secondary flex-fill'>검색</button>
                            </div>

                        </div>
                    </form>
                    <div class='row mb-2' style='float: right'>
	               		<button type='button' class='btn btn-secondary mr-1'
	                        onclick='location.href="addMealkit"'>등록</button>
	                    <a class='btn btn-secondary btn mr-1' id='fixBtn'>수정</a>
	                    <a class='btn btn-secondary btn mr-3' id='delBtn'>삭제</a>                  
	                </div>
                    <div class='mt-5'>
                        <table class='table table-sm'>
                            <colgroup>
                                <col width='5%'>
                                <col width='15%'>
                                <col width='15%'>
                                <col width='15%'>
                                <col width='15%'>
                                <col width='15%'>
								<col width='15%'>
                            </colgroup>
                            <thead class='table-info'>
                                <tr>
                                	<th></th>
                                    <th scope='col'>상품</th>
                                    <th scope='col'>이름</th>
                                    <th scope='col'>설명</th>
                                    <th scope='col'>판매가</th>
                                    <th scope='col'>등록일</th>
                                    <th scope='col'>카테고리</th>
                                </tr>
                            </thead>
                            <c:forEach var='mealkit' items='${mealkitList}'>
	                            <tbody id='mealkits'>
	                            	<tr>
				                		<td class='align-middle'> 
											<input type='checkbox' value='${mealkit.mealkitNum}' name='mealkitNum' id='mealkitNum' onclick='NoMultiChk(this)'/>
										</td>
				                        <td class='align-middle'><img src='/attach/${mealkit.mealkitImgfileName}'/></td>
				                        <td class='align-middle'>${mealkit.mealkitName}</td>
				                        <td class='align-middle'>${mealkit.description}</td>
				                        <td class='align-middle'>${mealkit.price}원</td>
				                        <td class='align-middle'>${mealkit.mealkitRegDate}</td>
				                        <td class='align-middle'>${mealkit.foodTypeName}</td>
                   					 </tr>
	                            </tbody>
                            </c:forEach>
                        </table>
                    <hr style='margin-top: -1rem;'>
                    </div>
                </div>
                </div>       		
                <hr style='position: relative; bottom: 13%;'>
            </div>
        </div>
    </div>
</body>
<%@ include file ='../../include/adminFooter.jsp'%>
<div class='modal fade' id='confirmModal' tabindex='-1'>
    <div class='modal-dialog'>
        <div class='modal-content'>
            <div class='modal-header py-2'>
                <p class='modal-title float-left' id='delModalLabel'>밀키트관리</p>
                <button type='button' class='close' data-dismiss='modal'>
                    <span>&times;</span>
                </button>
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