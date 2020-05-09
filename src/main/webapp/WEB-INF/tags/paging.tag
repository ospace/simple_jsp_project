<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="pagination" type="com.tistory.ospace.simplejsp.repository.PaginationDto" required="true" %>

<%-- 참고: https://gangzzang.tistory.com/entry/JSP-%EC%BB%A4%EC%8A%A4%ED%85%80-%ED%83%9C%EA%B7%B8Custom-Tag --%>
<ul class="pagination">
    <c:if test="${pagination.startPage != 1}">
        <li class='page-item'><a href='javascript:goPage(1)' class='page-link'>First </a></li>
        <li class='page-item'><a href='javascript:goPage(${pagination.startPage-1})' class='page-link'>Prev</a></li>
    </c:if>
    
    <c:if test="${pagination.startPage == 1}">
        <li class='page-item disabled'><a class='page-link' href='#'>First </a></li>
        <li class='page-item disabled'><a class='page-link' href='#'>Prev</a></li>
    </c:if>
    
    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
        <c:if test="${pagination.pageNo == i}">
            <li class='page-item active'><a href='#' class='page-link' >${i}<span class='sr-only'>(current)</span></a></li>
        </c:if>
        <c:if test="${pagination.pageNo != i}">
            <li class='page-item'><a href='javascript:goPage(${i})' class='page-link'>${i}</a></li>
        </c:if>
    </c:forEach>
    
    <c:if test="${pagination.endPage != pagination.totalPage}">
        <li class='page-item'><a href='javascript:goPage(${pagination.endPage+1})' class='page-link'>Next</a></li>
        <li class='page-item'><a href='javascript:goPage(${pagination.totalPage})' class='page-link'>Last </a></li>
    </c:if>
    
    <c:if test="${pagination.endPage == pagination.totalPage}">
        <li class='page-item disabled'><a class='page-link' href='#'>Next</a></li>
        <li class='page-item disabled'><a class='page-link' href='#'>Last </a></li>
    </c:if>
</ul>
