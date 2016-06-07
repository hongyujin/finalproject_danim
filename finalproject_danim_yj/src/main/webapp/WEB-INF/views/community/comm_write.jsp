<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${sessionScope.mvo!=null}">
<script type="text/javascript" src="${initParam.root}editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
$(document).ready(function(){
					nhn.husky.EZCreator.createInIFrame({
						oAppRef: oEditors,
						elPlaceHolder: "ir1",
						//SmartEditor2Skin.html 파일이 존재하는 경로
						sSkinURI: "${initParam.root}editor/SmartEditor2Skin.html",	
						htParams : {
							// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseToolbar : true,				
							// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
							bUseVerticalResizer : true,		
							// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
							bUseModeChanger : true,			
							fOnBeforeUnload : function(){
								
							}
						}, 
						fOnAppLoad : function(){
							//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
							oEditors.getById["ir1"].exec("PASTE_HTML", ["기존 DB에 저장된 내용을 에디터에 적용할 문구"]);
						},
						fCreator: "createSEditor2"
					});
	$("#save").click(function(){
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#frm").submit();
	});//save click
	
	$("#reset").click(function() {
		var sHTML = oEditors.getById["ir1"].getIR();
		if(sHTML != "") { 
			oEditors.getById["ir1"].exec("SET_CONTENTS", [""]); 
		}//if(내용이 공백이 아니라면 공백으로 초기화)
	});//reset click
});
</script>
		<form action="comm_write.do" method="post" id="frm">
		<table width="100%" id="test">
				<tr>
					<td>작성자</td>
					<td><input type="text" name="id" value="${sessionScope.mvo.nickname}" readonly/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="10" cols="30" id="ir1" name="content" style="width:766px; height:412px; "></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" id="save" value="저장"/>
						<input type="button" id="reset" value="취소"/>
					</td>
				</tr>
		</table>
		</form>	
	</c:when>
	<c:otherwise>
		<c:redirect url="home.do" />
		<%-- <c:import url="home.do" /> --%>
	</c:otherwise>
</c:choose>