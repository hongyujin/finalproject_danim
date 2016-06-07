<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#loginForm").submit(function(){
			if($("#loginForm :input[name=id]").val()==""){
				alert("아이디를 입력하세요!");
				return false;
			}else if($("#loginForm :input[name=password]").val()==""){
				alert("비밀번호를 입력하세요!");
				return false; 
			}
		});
	});
</script>
<h3><a href="${initParam.root}home.do">kosta</a></h3>
<c:if test="${sessionScope.mvo==null}">
<form id="loginForm" action="login.do" method="post">
아이디 <input type="text" name="id">
비밀번호  <input type="password" name="password">
<input type="submit" value="로그인">
</form>
</c:if>
<c:if test="${sessionScope.mvo!=null}">
${sessionScope.mvo.nickname}님 로그인 완료 | 
<a href="${initParam.root}logout.do">로그아웃</a>
</c:if>