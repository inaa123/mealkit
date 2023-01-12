<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>

<header>
    <nav class='navbar fixed-top navbar-light bg-light navbar-expand-sm p-0'>
        <div class='container-fluid'>
            <a class='navbar-brand ml-2' href='<%=request.getContextPath()%>/'>
                <img style='width: 121px; height: 48px;' src='<c:url value="/attach/logo.png"/>'/>
            </a>

			<div>
				<p class='navbar-title flex-fill mr-1 my-0' style="font-family: 'Nanum Pen Script', cursive;">집밥을 특별하게</p>
				<p class='navbar-title flex-fill mr-1 my-0' style="font-family: 'Nanum Pen Script', cursive;">쉐프의 밀키트</p>
			</div>

            <a class='text-dark flex-fill text-right mr-3' href='<%=request.getContextPath()%>/cart/listCart'>
                <span class='material-icons'>shopping_cart</span>
            </a>

            <button class='navbar-toggler mr-4' type='button' data-toggle='collapse' data-target='#menu'>
                <span class='navbar-toggler-icon'></span>
            </button>
        </div>