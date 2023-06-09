<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTf-8">
<style>
    .reviews-container {
    background-color: rgba(24, 208, 8, 0.5);
    border: 1px solid black;
    border-radius: 10px;
    overflow-x: auto;  
    max-width: 100%;  
    white-space: nowrap;  
	}
  
</style>
<link rel="stylesheet" href="styles/exprofileboard.css">
<title>전문가 프로필 페이지 입니다.</title>
</head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
 <script language=JavaScript src="jsfile/expertprofileboard.js" charset="UTF-8"></script>
<body>

<%@include file = "header.jsp" %>
<%@ page import="java.util.ArrayList,Carepakage.*" %>
	<%
		String email = request.getParameter("email");
		expertProfileDBCP expertdb=new expertProfileDBCP(); //전문가의프로필 dbcp
		expertProfile expert=expertdb.getExpertprofile(email);
		String name = ""; 
		String sex ="";
		String phone="";
		String strengthpart="";
		int career=0;
		String place="";
		String introduction="";
		String serviceskill="";
		String onlineservice="";
		String servicecategory="";
		String experience="";
		String headline = "전문가 정보" ;
	
		name = expert.getName();
		sex  = expert.getSex();
		phone= expert.getPhone();
		strengthpart=expert.getStrengthpart();
		career=expert.getCareer();
		servicecategory=expert.getServicecategory();
		place=expert.getPlace();
		introduction=expert.getIntroduction();
		serviceskill=expert.getServiceskill();
		onlineservice=expert.getOnlineservice();
		experience=expert.getExperience();
		
		if (strengthpart.equals("shoulder")) {
			strengthpart = "어깨";
		} 
		else if (strengthpart.equals("waist")) {
			strengthpart = "허리";
		}
		else if (strengthpart.equals("ankle")) {
			strengthpart = "발목";
		}
		else if (strengthpart.equals("wrist")) {
			strengthpart = "손목";
		}
		else if (strengthpart.equals("knee")) {
			strengthpart = "무릎";
		}
		else{
			strengthpart = "척추";
		}
		
		if(sex.equals("man"))
		{
			sex="남자";
		}
		else
		{
			sex="여자";		
		}
		if(servicecategory.equals("consult"))
		{
			servicecategory="상담 서비스";
		}
		else if(servicecategory.equals("service1"))
		{
			servicecategory="홈 케어 서비스";
		}
		else
		{
			servicecategory="의료 기관에 찾아오세요";
		}
    %>
    <div class="container">
		<div style="color:red; font-size:30px; text-align:center; padding:20px"><%=headline %></div>
            <div class="profile">
                
                <label for="name">이름</label>
                <input type="text" id="name" name="name" value="<%=name %>" readonly>
 			
 				<label for="career">경력</label>
                <input type="text" id="career" name="career" value="<%=career%>년" readonly>
                <label for="sex">성별</label>
                <input type=text id="sex" name="sex" value="<%=sex %>" readonly>
                <label for="strengthpart">강점 부위</label>
                <input type=text id="strengthpart" name="strengthpart" value="<%=strengthpart%>" readonly>
                <label for="place">소속 의료 기관</label>
                <input type="text" id="place" name="place" value="<%=place%>" readonly>
                <label for="experience">자격 사항</label>
                <textarea id="experience" name="experience" readonly><%=experience%></textarea>
               	<label for="introduction">소개</label>
                <textarea id="introduction" name="introduction" readonly><%=introduction%></textarea>
                
                <label for="serviceskill">서비스 기술</label>
                <textarea id="serviceskill" name="serviceskill" readonly><%=serviceskill%></textarea>
				<label for="servicecategory">가능한 서비스 유형</label>
                <input type="text" id="servicecategory" name="servicecategory" value="<%=servicecategory%>" readonly>
                <label for="onlineservice">온라인 서비스 유무</label>
                <input type="text" id="onlineservice" name="onlineservice" value="<%=onlineservice%>" readonly>
            	<label for="phone">전문가 번호</label>
                <input type="text" id="phone" name="phone" value="<%=phone%>" readonly>
                
            </div>
            <%
             reviewDBCP reviewdb = new reviewDBCP();
      		 ArrayList<reviewEntity> reviewlist = reviewdb.getReviewList(email);
            %>
  <div class="reviews-list" style="color:green; text-align:center;">리뷰 글 리스트</div>
  <div style="text-align:center;">
  <strong>총 평점:</strong><span style="font-size:20px;"><%=reviewdb.getAvgRating(email).getAvgrating() %></span></div>
  <div class="reviews-container">
 	
 <%
       
      		

        for (reviewEntity review : reviewlist) {
            String username = review.getUsername();
            int rating = review.getRating();
            String reviewtext = review.getReview();
            String star="★★★★★";
            
        	if(rating==1)
        	{
        	star="★";
        	}
        	else if(rating==2)
        	{
        	star="★★";
        	}
        	else if(rating==3)
        	{
        	star="★★★";
        	}
        	else if(rating==4)
        	{
        	star="★★★★";
        	}
        	else
        	{
        	star="★★★★★";
        	}
         	
    %>
        <div class="review"  
        style="display:inline-block; background-color: white; border:1px solid black; border-radius:10px;" 
         onmouseover="this.style.backgroundColor = 'red';"
    	 onmouseout="this.style.backgroundColor = 'white';">
            <p><strong>작성자:</strong><%=username%></p>
            <p><strong>평점:</strong><%=star%></p>
           <input type="hidden" class="modaldata" value=<%=username %>>
           <input type="hidden" class="modaldata" value=<%=reviewtext %>>
        </div>
       
   
    <%
        }
    %>
    <div class="Modal" style="display: none; background-color:rgba(24, 208, 8, 0.5); border: 5px solid black"></div>
  
            </div>

            <div class="btn-box"> 
            <form action="Review.jsp"> 
            	<input type="hidden" name="expertemail" value="<%=email%>">                 
            	<input type="submit" class="btn" value="리뷰 남기러 가기" >
            	<button type="button" class="btn" onclick="location.href='Matchingpage.jsp'">다시 매칭하러 가기</button>
                <input type="button" class="btn" value="채팅하기">
         	</form> 	
         		
            	
            
            </div>
      
    </div>
<%@include file = "footer.jsp" %>

</body>

</html>