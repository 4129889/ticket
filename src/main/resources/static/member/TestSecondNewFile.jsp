<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tha103.newview.act.*"%>
<%@ page import="com.tha103.newview.act.model.*"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%	
	ActDAO dao = new ActDAOHibernateImpl();
	// 從後端 Java取得活動列表
	List<Act> list = dao.getAll();

	// 將活動列表轉換為 JSON 格式
	ObjectMapper objectMapper = new ObjectMapper();
	String activityDataJSON = objectMapper.writeValueAsString(list);
	pageContext.setAttribute("activityList", list); // 修改此行

%>

<html>
<head>
<title>所有員工資料 - listAllEmp.jsp</title>

</head>
<body bgcolor='white'>

	
	
<c:forEach var="Act" items="${activityList}"> <!-- 修改此行 -->
  <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${Act.actCategoryID} block2">
    <!-- Block2 -->
    <div class="block2">
      <div class="block2-pic hov-img0">
        <img src="${activity.imageUrl}" alt="IMG-PRODUCT" />
        <a href="${activity.activityLink}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
          活動詳細
        </a>
      </div>

      <div class="block2-txt flex-w flex-t p-t-14">
        <p style="font-size: 11px" id="activity-datetime">
          活動日期: ${activity.activityTime} ${activity.Time}
        </p>

        <div class="block2-txt-child1 flex-col-l">
          <div style="width: 100%; overflow: hidden">
            <div style="float: left">
              <a href="product-detail.html" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" id="activity-name">
                ${activity.actName}
              </a>
            </div>
            <div style="float: right">
              <span class="stext-105 cl3" id="activity-price">
                TWD ${activity.activityPrice}
              </span>
            </div>
          </div>
          <hr style="margin-top: 0" size="8px" align="center" width="100%" />
          <div style="width: 100%; overflow: hidden">
            <div style="float: left">
              <a href="${activity.activityLink}">
                <img src="./images/icons/iStock-902788474 (1).png" alt="" />
                ${activity.activityAddress}
              </a>
            </div>
            <div style="float: right" class="block2-txt-child2 flex-r p-t-3">
              <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                <img class="icon-heart1 dis-block trans-04" src="images/icons/icon-heart-01.png" alt="ICON" />
                <img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icons/icon-heart-02.png" alt="ICON" />
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</c:forEach>

<!-- 将您的 JavaScript 代码放在此 -->
 <script>
    var activityData = <%=activityDataJSON%>; 
           console.log(activityData); 
           
            /*圖檔測試*/
          /*  function getImageUrlFromServer(actPicID) {
 			var xhr = new XMLHttpRequest();
  			xhr.open("GET", "images/icons/aazt4-zd3be.png" , true);
  			xhr.onreadystatechange = function () {
    		if (xhr.readyState === 4 && xhr.status === 200) {
     		var imageUrl = xhr.responseText;
     		 // 在這裡調用 addAct 函數，將 imageUrl 傳給它
      		
    			}
  			};
 			 xhr.send();
			}*/
            
            
             /*圖檔測試*/
            // 使用迴圈將每筆資料新增到頁面
           
           for (var i = 0; i < activityData.length; i++) {
 		   var data = activityData[i];
  		   addAct(
    	   data.actName,
           data.actPrice,
    	   data.actDate, 
    	   data.time,
    	   data.cityAddress,
    	   123, 
    	   "images/icons/aazt4-zd3be.png", 
   		   data.actCategoryID
  			);
				}
            //------------------------TEST-------------------------------
          </script>
</body>
</html>
