<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>

<footer>
    <nav class='navbar fixed-bottom navbar-light bg-light'>
        <div class='container-fluid'>
            <a class='navbar-brand' href='<%=request.getContextPath()%>/'><span class='material-icons'>home</span></a>
            <a class='navbar-brand' href='<%=request.getContextPath()%>/mealkit/listMealkit'><span class='material-icons'>restaurant_menu</span></a>
            <a class='navbar-brand' href='<%=request.getContextPath()%>/review/listReview'><span class='material-icons'>rate_review</span></a>
            <a class='navbar-brand' href='<%=request.getContextPath()%>/user/mypage'><span class='material-icons'>person</span></a>
            <a class='navbar-brand' href='<%=request.getContextPath()%>/latest/history'><span class='material-icons'>history</span></a>
        </div>
    </nav>
</footer>
