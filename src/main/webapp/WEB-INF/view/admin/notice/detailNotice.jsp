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
<script>
function init() {	
    $('#delBtn').click(() => {
    		$('#modalMsg').empty();
     		$('#modalMsg').text('해당 공지를 삭제하시겠습니까?');
     		$('#deleteModal').modal();
     		$('#noBtn').show();
     		$('#delNoticeBtn').show();
		})

	$('#delNoticeBtn').click(() => {
		$('#deleteModal').modal('hide')
      	$.ajax({
        	url: 'del/' + <%=request.getParameter("noticeNum")%>,
         	method: 'delete'
		}).done(() => {
			location.href='listNotice'
		})
	})
	
	$('#fixNoticeBtn').click(() => {
		location.href='fixNotice?noticeNum=' + <%=request.getParameter("noticeNum") %>
	})
}
 
$(init)
</script>

<style>
    hr {
        height: 1px;
        background-color: lightgray;
    }
    #contentLogo {
        height: 3.5rem;
        width: 115px;
        margin:0 auto;
        justify-content: center;
        align-items: center;
    }
    
    img {
		width: 140px;
		height: 80px;
	}
</style>
</head>
<body>
	<%@ include file ='../../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>공지</h2>&ensp;
                    <h6 style='display: inline'>공지상세</h6>
    <%@ include file ='../../include/adminTop2.jsp'%>
            <div class='col' style='border: 1px solid;'>
                <div class='border w-auto my-3' id='content'>
                    <div class='container mw-100 mt-5' style='width: 98%;'>
	                        <div class='row mt-3'>
	                            <label for='input' class='col-2 pr-2 col-form-label'>제목:</label>
	                            <div class='col pl-1'>
	                                <input type='text' class='form-control bg-white' id='noticeTitle' placeholder='제목을 입력해주세요.' value='${notice.noticeTitle}' disabled>
	                            </div>
	                        </div>
	                        <div class='row mt-3'>
	                            <label for='input' class='col-2 pr-2 col-form-label'>내용:</label>
	                            <div class='col pl-1'>
	                                <div class='form-control' id='noticeContent' style='overflow-y:scroll; height: 29rem;'>
	                                    <div class='row my-5' id='contentLogo'>
	                                        <div class='col'>
	                                           	<img style="width:150px; height:150px;"src='/attach/${notice.noticeImgFileName}'/>
	                                        </div>
	                                    </div>
	                                    <div class='col pl-1 pt-5'>
			                                <textarea class='form-control' placeholder='내용을 입력해주세요.' id='noticeContent' style='height: 25.65rem; border: none; background-color:transparent; resize: none;' disabled>${notice.noticeContent}</textarea>
			                            </div>
	                                </div>
	                            </div>
	                        </div>
	                        <hr>
	                        <div class='row mt-4 d-flex justify-content-end'>
	                            <button type='button' class='btn btn-secondary mr-1' onClick="location.href='<%=request.getContextPath()%>/admin/notice/listNotice'">목록</button>
	                            <button type='button' id='fixNoticeBtn' class='btn btn-secondary mr-1'>수정</button>
	                            <button type='button' class='btn btn-secondary mr-3' data-toggle='modal' data-target='#deleteModal'>삭제</button>
	                        </div>
                    </div>
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
                    <p id='modalMsg' style='text-align: center'>해당 공지를 삭제하시겠습니까?</p>
                </div>
                <div class='modal-footer py-1'>
                	<button type='button' id='noBtn' class='btn btn-primary col-3' data-dismiss='modal'>아니오</button>
                    <a class='btn btn-danger col-3' id='delNoticeBtn' role='button'>예</a>
                </div>
            </div>
        </div>
    </div>
</body>
<%@include file ='../../include/adminFooter.jsp'%>
