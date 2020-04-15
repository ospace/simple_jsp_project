<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tx" uri="/WEB-INF/tld/tx.tld"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>


    
 <table class="table">
 <colgroup>
    <col width="50%">
    <col width="50%">
  </colgroup>
<tbody>
<tr>
	<td style="border-top:none">${boardInfo.userNm} <span style="font-size:12px;color:gray;">
		<fmt:formatDate value="${boardInfo.regDate}" pattern="yyyy.MM.dd hh:mm" /></span>
	</td>
	<td style="border-top:none;text-align:right;font-size:12px"> 조회 : ${boardInfo.readCnt}</td>
</tr>
<tr>
	<td colspan="2" style="border-top:2px solid #efefef;font-weight: bold;">${boardInfo.title }</td>
</tr>
<tr>
	<td colspan="2" style="height:200px;vertical-align: top;border-bottom:2px solid #efefef">${fn:replace(boardInfo.content, newLineChar, "<br> ")}</td>
</tr>
<tr>
	<td colspan="2" >
	<c:forEach var="lst" items="${fileList }">
		<p style="font-size: 13px"><a href="javascript:" onClick="fileDownLoad(${lst.boardFileSrl})"><i class="fa fa-fw fa-floppy-o"></i>  ${lst.fileRealNm }  (<tx:fileSize fileSize="${lst.fileSize }" />)</a></p>
	</c:forEach> 
	</td>
</tr>
</tbody>
</table>
   
   
<div class="box-footer">
	<button type="button" class="btn btn-primary btn-sm" onClick="list()">목록</button>
	<button type="button" class="btn btn-primary btn-sm" onClick="reply()">댓글</button>
	
	<c:if test="${boardInfo.userId eq userId}">
	<button type="button" class="btn btn-primary btn-sm" onClick="update()">수정</button>
	<button type="button" class="btn btn-primary btn-sm" onClick="remove()">삭제</button>
	</c:if>
	
 </div>
	 
	 

<form name="frm" method="POST">
	<input type="hidden" name="page" value="${board.page }">
	<input type="hidden" name="boardSrl" id="boardSrl" value="${board.boardSrl }">
	<input type="hidden" name="searchKey" value="${board.searchKey }">
	<input type="hidden" name="searchValue" value="${board.searchValue }">
</form>

<script>

function list(){
	document.frm.action = "/board/${flag}/list";
	document.frm.submit();
}

function update(){ 
	document.frm.action = "/board/${flag}/update/form"
	document.frm.submit();
}

function reply(){ 
	document.frm.action = "/board/${flag}/reply/form"
	document.frm.submit();
}

function remove(){
	
	if( confirm("삭제하겠습니까?") == false ) return;
	
	 com.requestAjax({
		type: "POST",
		url : "/board/${flag}/delete",
		params : {boardSrl : $("#boardSrl").val()},
	},function(data){
		document.frm.action = "/board/${flag}/list"
	   	document.frm.submit();
	});
	
}

function fileDownLoad(srl){ 
	document.location.href = "/fileDownLoad?srl=" + srl;
}	




</script>

