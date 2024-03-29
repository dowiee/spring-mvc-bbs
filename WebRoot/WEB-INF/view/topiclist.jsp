<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
  <head>
    <title>英语学习</title>
    <%@ include file="/common.jsp"%>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
  </head>
     
 <script type="text/javascript">
 $(document).ready(function(){
	 parent.document.all("rightfra").style.height=document.body.scrollHeight;
	});
 
function keyPress() {  
    var keyCode = event.keyCode;  
    if ((keyCode >= 48 && keyCode <= 57))  
    {  
        event.returnValue = true;  
    } else {  
        event.returnValue = false;  
    }  
}

function goToPage(page){
	location='<%=basePath%>topic.do?method=list&forumID=${forum.id}&page='+page;
}
 </script>         
     
 <body>
	<jsp:include page="banner.jsp"></jsp:include>
	<jsp:include page="showlogin.jsp"></jsp:include>
    
    <!-- 导航区 -->
    <div class="position">
    	 <a href="forumgroup.do?method=listForumGroups">【论坛首页】</a>&nbsp;-&nbsp;
	     <a href="forumgroup.do?method=listForumGroups&forumgroupid=${forum.forumGroup.id}">【${forum.forumGroup.name}】</a>&nbsp;-&nbsp;
	  	  帖子列表
    </div>

    <span class="floatright">本版帖子数:${forum.totalTopics}</span><a href="topic.do?method=add&forumID=${forum.id}"><img src="images/postnew.jpg" border="0">&nbsp;</a>
    <br>

   <!-- 帖子列表区 -->
		<table cellSpacing="1" cellpadding="4" class="tb">	
			<tr>
				<Th colSpan="5">
				<span style="float:right">
				版主：<c:forEach items="${forum.masters}" var="mst">${mst.userID}&nbsp;&nbsp;</c:forEach>
				</span>
				【${forum.name}】
				</th>
			</tr>

			<tr class="trtitle">
				<TD style="WIDTH: 2%">&nbsp;</TD>
				<TD align="center">主题</TD>
				<TD style="WIDTH: 9%" align="center">作者</TD>
				<TD style="WIDTH: 8%" align="center">回复数</TD>
				<TD style="WIDTH: 25%" align="center">最新回复</TD>
			</tr>
			
		<c:forEach items="${tpcList.data}" var="tpc">
			<tr>
				<TD><IMG src="images/topic.gif" border=0></TD>
				<TD style="FONT-SIZE: 13px"><A href="topic.do?method=view&forumID=${forum.id}&topicID=${tpc.topicID}" title="${tpc.title}">${tpc.title}</A></TD>
				<TD align="center">${tpc.author.id}</TD>
				<TD align="center">${tpc.totalReply}</TD>
				<TD  align="center"><span style="font-size:10pt;white-space: nowrap;"><fmt:formatDate value="${tpc.lastReplyDate}" pattern="yyyy-MM-dd HH:mm:ss"/> / ${tpc.lastReplyUserID}</span></TD>
			</tr>
		  </c:forEach>
		</table>
	
     <!-- 分页区 共显示9页，当前页前后四页 -->  
	 <div class="t3">
		 <table width="100%" align="center" cellspacing="0" cellpadding="0">
			<tr>
			<td align="left" valign="middle"><div class="pages">
			<c:choose>
				<c:when test="${page>1}"><a href="javascript:void(0);" onclick="goToPage(${page-1})">【上一页】</a></c:when>
				<c:otherwise><a href="javascript:alert('已经是第一页.')">【上一页】</a></c:otherwise>
			</c:choose>
		     
			<a href="javascript:void(0);" onclick="goToPage(1)" title ="首页" style="font-weight:bold">&laquo;</a>
			
			<c:forEach items="${tpcList.pageList}" var="num">
				<c:choose>
					<c:when test="${num eq page}">${num}</c:when>
					<c:otherwise><a href="topic.do?method=list&forumID=${forum.id}&page=${num}">${num}</a></c:otherwise>
				</c:choose>
			</c:forEach>
			  	
			<input type="text" size="3" onkeypress="keyPress()" onkeydown="javascript: if(event.keyCode==13){goToPage(this.value);}"> 	
			<a href="javascript:void(0);" onclick="goToPage(${tpcList.totalPageCount})" title="尾页" style="font-weight:bold">&raquo;</a> 
		    
		    <c:choose>
		    	<c:when test="${page<tpcList.totalPageCount}"><a href="javascript:void(0);" onclick="goToPage(${page+1})">【下一页】</a></c:when>
		    	<c:otherwise><a href="javascript:alert('已经是最后一页.')">【下一页】</a></c:otherwise>
		    </c:choose>
			Pages: ( ${page} of ${tpcList.totalPageCount} )
			</div>
			</td>
			
			<td>
		    </td>
			</tr>
		</table>
	</div>
	<br/>
	<%@include file="copyright.jsp"%>
 </body>
</html>
