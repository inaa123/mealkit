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

    </style>
</head>

<%@ include file ='../include/headerTop.jsp'%>
<div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
	<a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
	<div id='menuName'>
	    <h3>로그인</h3>
	</div>            
</div>
<%@ include file ='../include/headerBottom.jsp'%>

<body>
    <form action='login' method='post'>
        <div id='mainContainerAddSub' class='container'>
            <div style='width: 1px; height: 1px;'></div>
            <div class='row mt-4'>
                <label for='staticEmail' class='col-3 col-form-label'>아이디</label>
                <div class='col'>
                    <input type='text' class='form-control' name='userId' id='userId'>
                </div>
            </div>
            <div class='my-3 row'>
                <label for='inputPassword' class='col-3 col-form-label' style='font-size: 93%'>비밀번호</label>
                <div class='col'>
                    <input type='password' class='form-control' name='password' id='password' autoComplete='on'>
                </div>
            </div>
        <div class='row d-flex mx-auto'>
        	<button type='submit' class='btn btn-primary flex-fill'>로그인</button>
		</div>
			<%
				if(session.getAttribute("errMsg") != null) {
			%>
					<br> <h5 style='color: red; text-align: center;'> <%= session.getAttribute("errMsg") %> </h5>
			<%
				}
			%>
		</div>
	</form>
        <br>
	<div class='row'>
	    <div id='loginSubNav' class='col'>
	        <a href='findId'>아이디 찾기 |&nbsp;</a>
	        <a href='findPassword'>비밀번호 찾기 |&nbsp;</a>
	        <a href='signUp'> 회원가입</a>
	    </div>
	</div>   
</body>

<%@ include file ='../include/footer.jsp'%>

</html>