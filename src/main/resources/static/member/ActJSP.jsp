<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tha103.newview.act.model.*"%>
<%@ page import="com.tha103.newview.act.service.*"%>
<%@ page import="com.tha103.newview.actcategory.model.*"%>
<%@ page import="com.tha103.newview.cityaddress.model.*"%>
<%@ page import="com.tha103.newview.publisher.model.*"%>
<%@ page import="com.tha103.newview.act.controller.*"%>
<%
ActDAO actDAO = new ActDAOHibernateImpl(); 
ActService actSvc = new ActServiceImpl(actDAO); 
List<ActVO> list = actSvc.getAll(); 
List<ActCategory> categories = actSvc.getAllCategories();
List<CityAddress> city = actSvc.getAllCities();
pageContext.setAttribute("city", city);
pageContext.setAttribute("list", list);
pageContext.setAttribute("categories", categories);
%>

<html>
<head>
<meta charset="UTF-8">
<title>Act Data</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<h1>Act Data</h1>


	<c:forEach var="actData" items="${list}">
		<div>
			<h2>${actData.actName}</h2>
			<p>ID: ${actData.actID}</p>
			<p>Price: ${actData.actPrice}</p>
			<p>Category: ${actData.actCategory.actCategoryName}</p>
			<p>Publisher: ${actData.publisherVOs.pubName}</p>
			<p>Time: ${actData.time}</p>
			<p>City: ${actData.cityAddressID.cityName}</p>
			<p>Scope: ${actData.actScope}</p>
			<p>Introduce: ${actData.actIntroduce}</p>
			<p>Date: ${actData.actDate}</p>
			<p>Approval Condition: ${actData.approvalCondition}</p>
			<div id="imageContainer_${actData.actID}">
				<img src="" alt="Act Image" id="actImage_${actData.actID}" />
			</div>
			<a
				href="<%=request.getContextPath()%>/GetImageFromDB?actID=${actData.actID}">查看圖片</a>
			 <input type="hidden" name="imagePosition" value="${actData.actID}" />
	</c:forEach>





	<h2>新增 Act</h2>
	<form method="post"
		action="<%=request.getContextPath()%>/uploadImageServlet"
		enctype="multipart/form-data" accept-charset="UTF-8">
		<label for="actName">Act 名稱：</label> <input type="text" name="actName" /><br />

		<label for="actPrice">價格：</label> <input type="text" name="actPrice" /><br />

		<label for="actCategory">類別：</label> <select name="actCategory">
			<c:forEach var="category" items="${categories}">
				<option value="${category.actCategoryID}">${category.actCategoryName}</option>
			</c:forEach>
		</select><br /> <label for="publisher">發行商：</label> <input type="text"
			name="publisher" /><br /> <label for="actTime">時間：</label> <input
			type="text" name="actTime" /><br /> <label for="cityName">城市：</label>
		<select name="cityName">
			<c:forEach var="cityItem" items="${city}">
				<option value="${cityItem.actAdressID}">${cityItem.cityName}</option>
			</c:forEach>
		</select><br /> <label for="actIntroduce">介绍：</label>
		<textarea name="actIntroduce"></textarea>
		<br /> <label for="actDate">日期：</label> <input type="text"
			name="actDate" /><br /> <label for="approvalCondition">Approval
			Condition:</label> <select name="approvalCondition">
			<option value="0"
				${actData.approvalCondition == '0' ? 'selected' : ''}>true</option>
			<option value="1"
				${actData.approvalCondition == '1' ? 'selected' : ''}>false</option>
				<option value="2"
				${actData.approvalCondition == '2' ? 'selected' : ''}>nothinh</option>
		</select><br /> 
		<label for="actImage">上傳圖片：</label> 
		<input type="file"
			name="actImage" id="actImageInput" accept="image/*" /> <input
			type="hidden" name="action" value="addAct" /> <input type="submit"
			value="新增 Act" />
	<%
if ("actNameSame".equals(session.getAttribute("actNameError"))) {
%>
<span style="color: red;">該活動名稱已經存在</span>
<%
    session.removeAttribute("actNameError"); 
}
%>


	</form>



	<form method="post" action="<%=request.getContextPath()%>/SearchSe" e
		accept-charset="UTF-8">
		<label for="actName">Act Name:</label> <input type="text"
			name="actName" id="actName" /> <input type="hidden" name="action"
			value="search" /> <input type="submit" value="查詢" />
		<%
		if ("null".equals(request.getAttribute("actNameError"))) {
		%>
		<span style="color: red;">不能為空值</span>
		<%
		}
		%>
		<%
		if ("notFound".equals(request.getAttribute("actNameNotFound"))) {
		%>
		<span style="color: red;">沒有該筆資料</span>
		<%
		}
		%>
	</form>


	<form method="post" action="<%=request.getContextPath()%>/SearchSe"
		accept-charset="UTF-8">
		<label for="actID">Act ID:</label> <input type="text"
			name="actIDelete" id="actID" /> <input type="hidden" name="action"
			value="delete" /> <input type="submit" value="删除" />
	</form>
	<form method="post" action="<%=request.getContextPath()%>/SearchSe"
		accept-charset="UTF-8">
		<label for="actId">Act ID：</label> <input type="text" name="actId"
			id="actId" /> 
		<input type="hidden" name="action" value="update" />
		<input type="submit" value="修改" />
		<%
		if ("notFound".equals(request.getAttribute("actIdNotFound"))) {
		%>
		<span style="color: red;">沒有該筆資料</span>
		<%
		}
		%>
		<%
		if ("null".equals(request.getAttribute("actIdError"))) {
		%>
		<span style="color: red;">不能為空值</span>
		<%
		}
		%>
	</form>
	<script>
		<c:forEach var="actData" items="${list}">
		var actID = "${actData.actID}";
		var imageUrl = "${pageContext.request.contextPath}/GetImageFromDB?actID="
				+ actID;
		var imageContainer = document.getElementById("imageContainer_" + actID);
		var actImage = document.getElementById("actImage_" + actID);

		actImage.src = imageUrl;
		</c:forEach>
	</script>
</body>
</html>
