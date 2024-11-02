<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@page import="com.tha103.newview.mylike.service.*"%>
<%@page import="com.tha103.newview.mylike.model.*"%>

<%
MyLikeServiceImpl myLikeSvc = new MyLikeServiceImpl();
    List<MyLikeVO> list = myLikeSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>所有我的最愛資料</title>

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
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>

<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有我的最愛資料</h3>
		 <h4><a href="">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>我的最愛ID</th>
		<th>用戶編號</th>
		<th>活動編號</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="myLikeVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${myLikeVO.myLikeID}</td>
			<td>${myLikeVO.userID}</td>
			<td>${myLikeVO.actID}</td>

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="empno"  value="${myLikeVO.myLikeID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="myLikeID"  value="${myLikeVO.myLikeID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>