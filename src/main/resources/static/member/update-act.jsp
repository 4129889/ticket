<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tha103.newview.act.model.*"%>
<%@ page import="com.tha103.newview.act.service.*"%>
<%@ page import="com.tha103.newview.act.controller.*"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat"%>
<%@ page import="com.tha103.newview.cityaddress.model.*"%>
<%@ page import="com.tha103.newview.actcategory.model.*"%>
 

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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>編輯活動</title>

</head>
<body>
	<h1>編輯活動</h1>
	<c:if test="${not empty actWithPicsList}">
		<form action="<%=request.getContextPath()%>/SearchSe"
			method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="prepareDelete();">

			<c:forEach items="${actWithPicsList}" var="actData">
				
				<input type="hidden" name="actId" value="${actData.actID}" />
				<label for="actName">Act Name:</label>
				<input type="text" name="actName" value="${actData.actName}" />
				<br />
				<label for="actPrice">Price:</label>
				<input type="text" name="actPrice" value="${actData.actPrice}" />
				<br />

				<label for="actCategory">Category:</label>
				<select name="actCategory">
					<c:forEach var="category" items="${categories}">
						<option value="${category.actCategoryID}">${category.actCategoryName}</option>
					</c:forEach>
				</select>
				<br />

				<label for="publisher">Publisher:</label>
				<input type="text" name="publisher" value="${actData.pubName}" />
				<br />

				<label for="time">Time:</label>
				<input type="text" name="time" value="${actData.time}" />
				<br />
				<label for="actContent">Act Content:</label>
				<textarea name="actContent">${actData.actContent}</textarea>
				<br />
				<label for="cityName">City:</label>
				<select name="cityName">
					<c:forEach var="cityItem" items="${city}">
						<option value="${cityItem.actAdressID}">${cityItem.cityName}</option>
					</c:forEach>
				</select>
				<br />
				<label for="actIntroduce">Introduce:</label>
				<textarea name="actIntroduce">${actData.actIntroduce}</textarea>
				<br />
				<label for="actDate">Date:</label>
				<input type="text" name="actDate" value="${actData.actDate}" />
				<br />
				<label for="approvalCondition">Approval Condition:</label>
				<select name="approvalCondition">
					<option value="0"
				${actData.approvalCondition == '0' ? 'selected' : ''}>true</option>
			<option value="1"
				${actData.approvalCondition == '1' ? 'selected' : ''}>false</option>
				<option value="2"
				${actData.approvalCondition == '2' ? 'selected' : ''}>nothinh</option>
				</select>
				<br />

				<c:forEach items="${actData.images}" var="imageData"
					varStatus="status">
					<img src="data:image/gif;base64,${imageData.base64Image}"
						alt="Image" />
					<input type="hidden" name="imageIndex" value="${status.index}" />
					<input type="hidden" name="imageId_${status.index}"
						value="${imageData.actPicID}" />
					<input type="file" name="imageNEW_${status.index}" />
					<input type="checkbox" name="deleteImageCheckbox" value="${imageData.actPicID}"> 刪除<br/>



				</c:forEach>

			</c:forEach>




			<label for="newImage">New Image:</label> <input type="file"
				name="newImage" id="newImage" /> 
				<input type="hidden" name="action" value="UP" />
				
				<input type="hidden" name="toDelete" value="" />
				<input type="submit" value="Update" />
		</form>
	</c:if>
	<script type="text/javascript">
	function prepareDelete() {
	    var selectedImages = document.getElementsByName('deleteImageCheckbox');
	    var imageIdsToDelete = [];
	    for(var i = 0; i < selectedImages.length; i++) {
	        if(selectedImages[i].checked) {
	            imageIdsToDelete.push(selectedImages[i].value);
	        }
	    }
	    document.getElementsByName('toDelete')[0].value = imageIdsToDelete.join(',');
	}

	</script>

</body>
</html>
