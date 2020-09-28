<link type="text/css" href="css/pagination.css" rel="stylesheet" />
<script src="script/jquery.pagination.js" type="text/javascript"></script>
<%@page import="com.zwhs.chattel.utils.PageTools"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
PageTools pageTools = (PageTools)request.getAttribute("page");
Integer pageCount = pageTools.getPageCount();
Integer resultCount = pageTools.getResultCount();
Integer pageSize = pageTools.getPageSize();
Integer thisPage = pageTools.getThisPage();
Integer prePage = pageTools.getPrePage();
Integer nextPage = pageTools.getNextPage();
Integer firstPage = pageTools.getFirstPage();
Integer lastPage = pageTools.getLastPage();
Integer[] pageSizeType = pageTools.getPageSizeType();
%>
<SCRIPT>
function pageselectCallback(page_index, jq){
		document.getElementById("thisPage").value = page_index+1;
		document.forms[0].submit();
    
    // Prevent click eventpropagation
    return false;
}
function getOptionsFromForm(){
    var opt = {callback: pageselectCallback};
    var thispage=<%=thisPage%>;
    if(thispage==0){
    	opt.current_page=0;
    }else{
    	opt.current_page=<%=thisPage-1%>;
    }
    
    opt.items_per_page=<%=pageSize%>;
    return opt;
}

$(document).ready(function(){
    // Create pagination element with options from form
   var optInit = getOptionsFromForm();
    $("#Pagination").pagination(<%=resultCount%>, optInit);


});

</SCRIPT>
</head>
	
	<div id="Pagination" class="pagination" >
           
    </div>
    <div>
	<input type="hidden" id="thisPage" name="thisPage" value="<%=thisPage %>" > 
	</div>
