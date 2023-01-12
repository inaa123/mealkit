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
        <script>
        
        </script>
        
        <style>
            #noticeTop {
                font-weight: 600;
                font-size: medium;
            }

            #noticeTitle {
                font-size:16.5px;
            }
            #noticeInfo {
                font-weight: lighter;
                font-size:x-small;
            }
            #contentLogo {
                height: 3.5rem;
                width: 115px;
                margin:0 auto;
                margin-top: 20px;
                justify-content: center;
                align-items: center;
            }
            
            #noticeLogo {
             	margin-right: 40px;
            	justify-content: center;
            }
            
            #noticeContent {
                margin-top: 30px;
                font-size:small;
            }
            #logoImg {
                height: 6rem;
                line-height: 35px;
                text-align: center;
            }
            
        </style>
    </head>
    <%@ include file ='../include/headerTop.jsp'%>
        <div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
            <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
            <div id="menuName">
                <h3>공지상세</h3>
            </div>
        </div>
    <%@ include file ='../include/headerBottom.jsp'%>

<body>
    <form>
        <div id='mainContainerAddSub' class="container">
            <div class='row'>
                <div class='col'>
					<div id='noticeTop'>
						<p id='noticeTitle'>${notice.noticeTitle}</p>
						<p id='noticeInfo'>관리자<br/>
						${notice.noticeRegdate}</p>
					</div>
					<hr>
                </div>
            </div>
            <div class='row' id='contentLogo'>
                <div class='col' id='noticeLogo'>
                    	<img style="width:200%; height:200%; object-fit:cover;"src='/attach/${notice.noticeImgFileName}'/>
                </div>
            </div>
            <div class='row pt-4' id='noticeContent'>
            	<textarea class='form-control' placeholder='내용을 입력해주세요.' id='noticeContent' style='height: 25.65rem; border: none; background-color:transparent; resize:none;' disabled>${notice.noticeContent}</textarea>
            </div>
            <div class='row'>
                <div class='col'>
                    <hr>
                </div>
            </div>
        </div>
    </form>
</body>
<%@ include file ='../include/footer.jsp'%>
</html>