<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.tha103.newview.mylike.model.*"%>

<% //見com.tha103.newview.mylike.controller.MyLikeServlet.java存入req的myLikeVO物件 (此為輸入格式有錯誤時的myLikeVO物件)
   MyLikeVO myLikeVO = (MyLikeVO) request.getAttribute("myLikeVO");
%>
--<%= empVO==null %>--${empVO.deptno}-- <!-- line 100 (這行是什麼意思)--> 
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>我的最愛新增(測試) - addMyLike.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>我的最愛新增(測試) - addMyLike.jsp</h3></td><td>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="emp.do" name="form1">
<table>
	

	
	<jsp:useBean id="actSvc" scope="page" class="com.tha103.newview.act.service.ActServiceImpl" />
	<tr>
		<td>actID 活動編號:</td>
		<td><select size="1" name="actID">
			<c:forEach var="actVO" items="${actSvc.all}">
				<option value="${actVO.actID}" ${(myLikeVO.actID==actVO.actID)? 'selected':'' } >${actVO.actName}
			</c:forEach>
		</select></td>
	</tr>





</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>

</body>
