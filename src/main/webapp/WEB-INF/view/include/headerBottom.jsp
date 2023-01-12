<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
        <div class='collapse navbar-collapse' id='menu'>
            <ul class='navbar-nav mr-auto'>
                <li class='nav-item active'>
                <%
                	if(session.getAttribute("userId") == null) {
                %>
                		<a class='nav-link' href='<%=request.getContextPath()%>/user/login'>로그인</a>
                <%	
                	}                
                	else {
               	%>
               			<a class='nav-link' href='<%=request.getContextPath()%>/user/logout'>로그아웃</a>
               	<%	
                	}
                %>
                </li>
                <li class='nav-item active'>
                    <a class='nav-link' href='<%=request.getContextPath()%>/notice/listNotice'>공지사항</a>
                </li>
                <li class='nav-item dropdown'>
                    <a class='nav-link dropdown-toggle' data-toggle='dropdown'>고객센터</a>
                    <div class='dropdown-menu'>
                        <a class='dropdown-item' href='<%=request.getContextPath()%>/faq/listFaq'>자주묻는질문</a>
                        <a class='dropdown-item' href='<%=request.getContextPath()%>/question/listQuestion'>1:1문의</a>
                        <div class='dropdown-divider'></div>
                        <a class='dropdown-item' href='<%=request.getContextPath()%>/declaration/listDeclaration'>신고</a>
                    </div>
                </li>
            </ul>
            <form class='form-inline my-2 my-lg-0' action='<%=request.getContextPath()%>/mealkit/searchMealkit'>
                <input type='text' id='search' name='search' class='form-control mr-sm-2' placeholder='상품을 입력해주세요.'/>
                <button type='submit' id='submitBtn' class='btn btn-outline-dark my-2 my-sm-0'>검색</button>
            </form>
        </div>
    </nav>
</header>