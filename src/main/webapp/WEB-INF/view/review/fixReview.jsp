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
	function init() {
		$('#fixBtn').click(() => {
			let reviewNum = <%=request.getParameter("reviewNum")%>
			let rate = $('#rate').val()
			let reviewTitle = $('#reviewTitle').val()
			let reviewContent = $('#reviewContent').val()
			let reviewImgfile = $('#reviewImgfile').val()
			
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/review/fixReview',
				data:{
					reviewNum: reviewNum,
					rate: rate,
					reviewTitle: reviewTitle,
					reviewContent: reviewContent,
					reviewImgfile: reviewImgfile
				}
			})
		})
	}
	$(init)
</script>
    </head>
    <%@ include file ='../include/headerTop.jsp'%>
            <div id='subOuter' class='row d-block d-sm-none d-flex mx-0'>
                <a class='material-icons hBack m-2' onClick='history.back()'>arrow_back_ios</a>
                <div id="menuName">
                    <h3>리뷰수정</h3>
                </div>
            </div>
	<%@ include file ='../include/headerBottom.jsp'%>
<body>
    <div id='mainContainerAddSub' class="container">
    	<c:forEach var='review' items='${reviewList}'>
        <form id='form' name='form' method='post' encType='multipart/form-data'>
         <div class='row mb-2'>
         	<label for='input' class='col-2 pr-2 col-form-label'>별점:</label>
         	<div class='col pl-1'>
         		<select class="form-control" name='rate' id='rate'>
         			<option value='5'>★★★★★</option>
         			<option value='4'>★★★★</option>
         			<option value='3'>★★★</option>
         			<option value='2'>★★</option>
         			<option value='1'>★</option>
         		</select>
         	</div> 
         </div>
        <div class='row'>
            <label for='input' class='col-2 pr-2 col-form-label'>제목:</label>
            	<div class='col pl-1'>
                    <input type='text' class='form-control' id='reviewTitle' name='reviewTitle' placeholder='제목을 입력해주세요.' value='${review.reviewTitle}' required>
            	</div>
       	</div>
        <div class='row mt-2'>
            <label for='input' class='col-2 pr-2 col-form-label'>내용:</label>
            <div class='col pl-1'>
   				<textarea class="form-control" placeholder='내용을 입력해주세요.' id='reviewContent' name='reviewContent' style='height: 220px; resize: none;' required>${review.reviewContent}</textarea>
            </div>
       	</div>
        <div class='row mt-3'>
        <label for='input' class='col-3 pr-2 col-form-label'>이미지:</label>
	        <div class='col pl-1'>
		        <input type='file' class='form-control' id='reviewImgfile' name='reviewImgfile'>
		        <div class="select_img"><img src="" /></div>
			        <script>
				    	$("#reviewImgfile").change(function(){
				        	if(this.files && this.files[0]) {
				        		var reader = new FileReader;
					    		reader.onload = function(data) {
				        			$(".select_img img").attr("src", data.target.result).width(100);        
				        		}
				        			reader.readAsDataURL(this.files[0]);
				        		}
					    });
			        </script>
	        </div>
        </div>
        <hr>
        <br>
        <div class='row justify-content-end'>
            <div class='col d-flex justify-content-end'>
                <button type='button' class='btn btn-secondary' onclick='location.href="<%=request.getContextPath()%>/review/listReview"'>취소</button>
                &nbsp;
                <button type='submit' class='btn btn-secondary' id='fixBtn'>수정</button>
            </div>
        </div>
        </form>
        </c:forEach>
    </div>
</body>
<%@ include file ='../include/footer.jsp'%>
</html>