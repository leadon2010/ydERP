<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.yedam.erp.common.Paging"%>
<%@ attribute name="jsfunc"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pagination">
	<c:if test="${paging.startPage>1}">
		<li><a href="javascript:${jsfunc}(${paging.startPage-1})">이전</a>
	</c:if>
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
		<c:if test="${i != paging.page}">
			<a href="javascript:${jsfunc}(${i})">${i}</a>
		</c:if>
		<c:if test="${i == paging.page}">
		 ${i}
	</c:if>
	</c:forEach>
	<c:if test="${paging.endPage<paging.totalPageCount}">
		<li><a href="javascript:${jsfunc}(${paging.endPage+1})">다음</a>
	</c:if>
</div>