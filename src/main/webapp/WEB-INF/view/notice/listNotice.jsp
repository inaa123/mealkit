<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
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
        <script>
    	function listNotices() {
    		$('#notices').empty();
    		$.ajax({
    			type:'post',
    			url:"<%=request.getContextPath() %>/notice/getNotices"
    		}).done(notices => {
    				if(notices.length) {
    					const noticeArr = []
    					
    					$.each(notices, (i, notice) => {
    						noticeArr.unshift(
    							`<div id='noticeList' class='mt-2'>
    								<p id='noticeTitle'><a href='/notice/detailNotice?noticeNum=\${notice.noticeNum}'>
    								\${notice.noticeTitle}</a></p>
    								<p id='noticeInfo'>관리자<br/>
    								\${notice.noticeRegdate} &emsp;</p>
    							</div>
    							<hr>`
    						);
    					})
    					$('#notices').append(noticeArr.join(''))
    				} else {
    					$('#notices').append('<div class=text-center><p>공지사항이 없습니다.</p></div>')	
    				}
    		})
    	}
    	
    	$(listNotices)
        
        </script>
        
        <style>
            #noticeTitle {
                font-weight: bold;
                font-size:14.5px;
            }
            #noticeList {
                font-weight: lighter;
                font-size:small;
            }
            #noticeInfo {
                font-size:x-small;
            }
            #pagingDiv {
                background-color: white;
                justify-content : center;
            }
                    
			a { 
    			color: inherit;
    			text-decoration:none;
	    	}
	    	
	    	a:hover { color: black; text-decoration: underline;}
        </style>
    </head>
    <%@ include file ='../include/headerTop.jsp'%>
    
    <div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
        <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
        <div id="menuName">
            <h3>공지사항</h3>
        </div>
    </div>
    <%@ include file ='../include/headerBottom.jsp'%>
<body>
    <form>
        <div id='mainContainerAddSub' class="container">
            <div class='row'>
                <div class='col' id='notices'>
                </div>
            </div>
			<div class='row d-flex mx-auto fixed-bottom mb-5' id='pagingDiv'>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    </ul>
                </nav>
			</div>
        </div>
    </form>
</body>
<%@ include file ='../include/footer.jsp'%>