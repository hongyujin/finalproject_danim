<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel = "stylesheet" type = "text/css" href = "${initParam.root}fontium/css/fontium.css" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#commWrite").click(function() {
			location.href="community_write.do";
		});
		$(window).scroll(function() { // 스크롤하면 아래 코드 실행
			if ($(window).scrollTop() == $(document).height() - $(window).height()) {
				$("#btn").html("<button type='button' onclick='loadData()'>더보기</button>");
			}
		}); //scroll
		
		if("${commList.size()>0}"){
			if ($(window).scrollTop() == $(document).height() - $(window).height()) {
				$("#btn").html("<button type='button' onclick='loadData()'>더보기</button>");
			}
		}
		
		$("#commTable td").click(function() {
			var likeTD = $(this).parent().children().eq(1);
			if($(this).text()==likeTD.text()){
				var commNo = $(this).parent().prev().children().eq(0).text();
	 			$.ajax({
					type:"post",
					url:"comm_updateLike.do",
					data:"commNo="+commNo,
					success:function(data){
						likeTD.html("<input type='image' class='fonti um-heart' alt=' '>"+data);
					}//success
				});//ajax
			}
		});//table td click
	});//ready
	
	var rn = "${param.rownum}";
 	//var date = "${param.date}";
	rn = Number(rn);
 	function loadData() {
	 	var page_y = $(document).scrollTop();
			rn+=5;
			/* if(date==""){
				date = new Date();
				
	            var day = date.getDate();
	            var month = date.getMonth() + 1;
	            var year = date.getFullYear();
	
	            if (month < 10) month = "0" + month;
	            if (day < 10) day = "0" + day;
	
	            var today = year + "-" + month + "-" + day;
	            date = today;
	            //$("#date").attr("value", today);
			} */
			if ( window.location.href.indexOf('page_y') != -1 || page_y != -1) {
		        var match = window.location.href.split('?')[1].split("&")[0].split("=");
		        $('html, body').scrollTop( match[1] );
		    }
			window.location.href = "${initParam.root}community_list.do?page_y=" + page_y+"&rownum="+rn;
	}
</script>
<table border="1" id="commTable">
	<!-- <tr>
		<td>글번호</td>
		<td>작성자</td>
		<td>작성시간</td>
		<td>글내용</td>
		<td>좋아용</td>
	</tr> -->
<c:forEach var="list" items="${commList}">
	<tr>
		<td>${list.comm_no}</td>
		<td>${list.memberVO.id}</td>
		<td>${list.timePosted}</td>
	</tr>
	<tr>
		<td colspan="2">${list.content}</td>
		<td><input type="image" class="fonti um-heart" alt=" " onclick="updateLike('${list.comm_no}')">${list.likePosted}</td>
	</tr>
</c:forEach>
</table>
<c:if test="${commList.size() >= param.rownum}">
	<span id="btn"></span>
</c:if>
<c:if test="${sessionScope.mvo!=null}">
	<input type="image" class="fonti um-pencil" alt="글작성" id="commWrite">
	<!-- id="commWrite" alt="글작성"  -->
</c:if>