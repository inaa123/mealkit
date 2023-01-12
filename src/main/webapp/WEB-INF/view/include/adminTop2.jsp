<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
 			</div>
                <div style='float: right'><a href='<%=request.getContextPath()%>/user/logout'>로그아웃</a></div>
            </div>
        </div>
        <div class='row'>
            <div class='col-2' id='menu'>
                <ul class='mt-3 p-1'>
                    <li><a href='<%=request.getContextPath()%>/admin/mealkit/listMealkit'><span class='material-icons mr-2'>shopping_bag</span>상품</a></li>
                    <li><a href='<%=request.getContextPath()%>/admin/notice/listNotice'><span class='material-icons mr-2'>sell</span>공지사항</a></li>
                    <li><a href='<%=request.getContextPath()%>/admin/review/listReview'><span class='material-icons mr-2'>computer</span>리뷰</a></li>
                    <li><a href='<%=request.getContextPath()%>/admin/order/listOrder'><span class='material-icons mr-2'>article</span>주문</a></li>
                    <li><a href='<%=request.getContextPath()%>/admin/declaration/listDeclaration'><span class='material-icons mr-2'>report</span>신고</a></li>
                    <li><a href='<%=request.getContextPath()%>/admin/question/listQuestion'><span class='material-icons mr-2'>forum</span>문의</a></li>
                    <li><a href='<%=request.getContextPath()%>/admin/faq/listFaq'><span class='material-icons mr-2'>chat_bubble_outline</span>FAQ</a></li>
                    <li><a href='<%=request.getContextPath()%>/admin/user/listUser'><span class='material-icons mr-2'>people</span>회원조회</a></li>
                </ul>
            </div>