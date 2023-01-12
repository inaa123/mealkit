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
	$('#fixNoticeBtn').click(() => {
			let noticeNum = <%=request.getParameter("noticeNum")%>
			let noticeTitle = $('#noticeTitle').val()
			let noticeContent = $('#noticeContent').val()
			let noticeImgFile = $('#noticeImgFile').val()
			
			$.ajax({
				type:"post",
				url:"<%=request.getContextPath() %>/admin/notice/fixNotice",
				data: {
					noticeNum: noticeNum,
					noticeTitle: noticeTitle,
					noticeContent: noticeContent,
					noticeImgFile: noticeImgFile
				}
			})
		}
	})
}
$(init)
</script>

<style>
    hr {
        height: 1px;
        background-color: lightgray;
    }

</style>
</head>
<body>
	<%@ include file ='../../include/adminTop1.jsp'%>
                    <h2 style='display: inline'>공지</h2>&ensp;
                    <h6>공지수정</h6>                 
    <%@ include file ='../../include/adminTop2.jsp'%>
            <div class='col' style='border: 1px solid'>
                <div class='border w-auto my-3' id='content'>
                    <form id='form' method='post' encType='multipart/form-data'>
                        <div class='container mw-100 mt-5' style='width: 98%;'>
                            <div class='row mt-3'>
                                <label for='input' class='col-2 pr-2 col-form-label'>제목:</label>
                                <div class='col pl-1'>
                                    	<input type='text' class='form-control' id='noticeTitle' name='noticeTitle' maxlength='100' 
                                        	required placeholder='제목을 입력해주세요.' value='${notice.noticeTitle}'>
                                </div>
                            </div>
                            <div class='row mt-3'>
                                <label for='input' class='col-2 pr-2 col-form-label'>내용:</label>
                                <div class='col pl-1'>
                                    	<textarea class="form-control" placeholder="내용을 입력해주세요." id='noticeContent' name='noticeContent' style="height: 410px; resize:none" 
                                        	maxlength='1300' required>${notice.noticeContent}</textarea>
                                </div>
                            </div>
                            <div class='row mt-3'>
                                <label for='input' class='col-2 pr-2 col-form-label'>이미지:</label>
                                <div class='col pl-1'>
                                    <input type='file' class='form-control' id='noticeImgFile' name='noticeImgFile' required>
                                </div>
                            </div>
                            <hr>
                            <div class='row mx-auto justify-content-end'>
                                <div class='row mt-2 d-flex justify-content-end'>
                                    <div class='col'>
                                        <button type='button' class='btn btn-secondary' onClick='history.back()'>취소</button>
                                        <button type='submit' class='btn btn-secondary' id='fixNoticeBtn' name='fixNoticeBtn'>수정</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<%@include file ='../../include/adminFooter.jsp'%>