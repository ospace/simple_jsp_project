<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tx" uri="/WEB-INF/tld/tx.tld"%>

<script src="/static/js/jquery.form.min.js"></script>
<style>
.fileDiv {padding:2px;}
#fileSize { margin-top:10px}
.progress { position:relative; width:250px; border: 1px solid #ddd;}
.bar { background-color: #83c0ff; width:0%; height:20px;}
.percent { position:absolute; display:inline-block; top:0px; left:48%; }
</style>

 <table class="table">
  <colgroup>
    <col width="12%">
    <col width="88%">
  </colgroup>
<tbody>
<form id="frm" name="frm">
<tr>
	<th>제목</th>
	<td><input type="text" class="form-control" name="title" id="title" value="${boardInfo.title }"></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea id="content" name="content" class="form-control" style="height: 150px">${boardInfo.content }</textarea></td>
</tr>
<input type="hidden" name="boardSrl" value="${board.boardSrl }">
<input type="hidden" name="fileInfo" id="fileInfo" value="">
</form>

<form id="fileFrm" name="fileFrm" method="post" action="/board/${flag}/multFileUpload" enctype="multipart/form-data">
<tr>
	<th>파일</th>
	<td>
	
		<c:forEach var="lst" items="${fileList }" varStatus="status">
		<div class="fileDiv">
			<a href="javascript:" onClick="fileDownLoad(${lst.boardFileSrl})"><i class="fa fa-fw fa-floppy-o"></i>  ${lst.fileRealNm }  (<tx:fileSize fileSize="${lst.fileSize }" />)</a>
			&nbsp;&nbsp;&nbsp;<a href="javascript:" onClick="deleteFile(this,'${lst.boardFileSrl}')"><i class="fa fa-fw fa-trash-o"></i> 삭제</a> 
		</div>
		</c:forEach>
		
		<c:forEach  varStatus="status" begin="${fn:length(fileList) +1}" end="3"  step="1">
		<div class="fileDiv"><input type="file" name="file"></div>
		</c:forEach> 
		
		<div id="fileSize">file size : </div>
		<div class="progress">
		    <div class="bar"></div >
		    <div class="percent">0%</div >
		</div>
	</td>
</tr>
</form>


</tbody>
</table> 

<div class="box-footer">
	<button type="button" class="btn btn-primary btn-sm" onClick="list()">목록</button>
	<button type="button" class="btn btn-primary btn-sm" id="save" onclick="save()">저장</button>
 </div>
	    

<form name="urlFrm" method="POST">
	<input type="hidden" name="page" id="page" value="${board.page }">
	<input type="hidden" name="boardSrl" id="boardSrl" value="${board.boardSrl }">
	<input type="hidden" name="searchKey" value="${board.searchKey }">
	<input type="hidden" name="searchValue" value="${board.searchValue }">
</form>

<script>

var fileSize = 0;
$(document).ready(function() { 
	$('input[type=file]').bind('change', function() {
		
		fileSize += this.files[0].size;
		
	  $("#fileSize").text("file size : " + com.formatBytes(fileSize) );
	});

});


function list(){
	document.urlFrm.action = "/board/${flag}/list";
	document.urlFrm.submit();
}
function view(){
	document.urlFrm.action = "/board/${flag}/view";
	document.urlFrm.submit();
}


var fileInfo = {
	insertFile : [],
	deleteFile : [] 
}

function save(){ 
	
	if( $("#title").val().trim() == "" ){
		alert("제목을 입력해주세요");
		$("#title").focus();
		return;
	}
	if( $("#content").val().trim() == "" ){
		alert("내용을 입력해주세요");
		return;
	}
	
	
	//--------------------------- 파일업로드 start
	var bar = $('.bar');
	var percent = $('.percent');

	$('#fileFrm').ajaxSubmit({
		
	    beforeSend: function() {
	    	percent.show();
	        var percentVal = '0%';
	        bar.width(percentVal)
	        percent.html(percentVal);
	        
	    },
	    uploadProgress: function(event, position, total, percentComplete) {
	        var percentVal = percentComplete + '%';
	        bar.width(percentVal)
	        percent.html(percentVal);
			//console.log(percentVal, position, total);
	    },
	    success: function(response, status, xhr) {
	        var percentVal = '100%';
	        bar.width(percentVal)
	        percent.html(percentVal);
	        
	        fileInfo.insertFile = response
	        
	    	send(fileInfo);
	         
	    },
		complete: function(xhr) {
			//status.html(xhr.responseText);
		}
	}); 
	
	//--------------------------- 파일업로드 end
	
	
}

function send(){
	
	$("#fileInfo").val(JSON.stringify(fileInfo));
	
	 com.requestAjax({
		type: "POST",
		url : "/board/${flag}/${action}",
		params : $("#frm").serializeObject(),
	},function(data){
		$("#boardSrl").val(data.boardSrl)
    	view();
	});
}


function deleteFile(obj, boardFileSrl){
	$(obj).parent().remove();
	fileInfo.deleteFile.push(boardFileSrl)
}


</script>
