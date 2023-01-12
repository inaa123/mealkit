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
.infoLabel {
    margin-top: 1.5rem;
    margin-bottom: 0;
    font-size: small;
}

.infoValue {
    margin-top: 0;
    margin-bottom: 0;
}

hr {
    margin: 0;
}
</style>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
    <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
    <div id="menuName">
        <h3>마이페이지</h3>
    </div>
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
    <form>
        <div id='mainContainerAddSub' class='container'>
            <div style='width: 1px; height: 1px;'></div>
            <div class='row mt-4'>
                <div class='col'>
                    <p class='infoLabel'>이름</p>
                    <p class='infoValue'>${user.userName}</p>
                    <hr>

                    <p class='infoLabel'>아이디</p>
                    <p class='infoValue'>${user.userId}</p>
                    <hr>

                    <p class='infoLabel'>이메일</p>
                    <p class='infoValue'>${user.email}</p>
                    <hr>                    
                    
                    <p class='infoLabel'>연락처</p>
                    <p class='infoValue'>${user.phoneNum}</p>
                    <hr>

                    <p class='infoLabel'>주소</p>
                    <p class='infoValue'>${user.basicAddress} (${user.zipCode})</p>
                    <hr>
                    <p class='infoValue'>${user.detailAddress}</p>
                    <hr>
                </div>
            </div>
            <div class='row mt-5'>
                <div id='loginSubNav' class='col'>
                    <a href='../order/listOrder'>주문내역 |&nbsp;</a>
                    <a href='../favorite/listFavorite'>찜한상품 |&nbsp;</a>
                    <a href='fixUser'>회원수정 |&nbsp;</a>
                    <a href='#' data-toggle='modal' data-target='#emailCertModal'> 회원탈퇴</a>
                </div>
            </div>
        </div>
    </form>
    <div class='modal fade' id='emailCertModal' tabindex='-1'>
        <div class='modal-dialog'>
            <div class='modal-content'>
                <div class='modal-header py-2'>
                    <p class='modal-title float-left' id='emailCertModalLabel'>회원탈퇴</p>
                    <button bype='button' class='close' data-dismiss='modal'>
                        <span>&times;</span>
                    </button>
                </div>
                <div class='modal-body text-center'>
                    <p>회원탈퇴 하시겠습니까?</p>
                </div>
                <div class='modal-footer py-1'>
                    <button type='button' class='btn btn-primary col-3' data-dismiss='modal'>아니오</button>
                    <a class='btn btn-danger col-3' href="withdrawal" role="button">예</a>
                </div>
            </div>
        </div>
    </div>
</body>

<%@ include file ='../include/footer.jsp'%>

</html>