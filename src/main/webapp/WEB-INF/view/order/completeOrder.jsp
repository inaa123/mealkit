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
        #orderComplete {
            text-align: center
        }

        h5 {
            color: #0f56ba
        }
    </style>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<%@ include file ='../include/headerBottom.jsp'%>

<body><br>
    <div class='container' id='mainContainer'>
        <div class='row mt-5' id='orderComplete'>
            <div class='col'>
                <h5><b>결제완료</b></h5>
                <hr><br><br>
                <div class='row justify-content-center' style='height:30px'>
                    <p>결제완료 되었습니다.<br>이용해 주셔서 감사합니다 :)</p>
                </div>
                <div class='row justify-content-center' >
                    <a href='<%=request.getContextPath()%>/mealkit/listMealkit' class='mt-4'>
                        <button type='button' class='btn btn-outline-secondary justify-content-center'>쇼핑더하기</button>
                    </a>
                    <a href='<%=request.getContextPath()%>/order/listOrder' class='ml-4 mt-4'>
                        <button type='button' class='btn btn-outline-secondary col-12 justify-content-center'>주문조회</button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
<%@ include file ='../include/footer.jsp'%>
</html>