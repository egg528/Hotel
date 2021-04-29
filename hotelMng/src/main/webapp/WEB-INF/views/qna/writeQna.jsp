<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
  <head>

      <style>
          * {
              font-family: 'Noto Sans KR', sans-serif;
          }
      </style>

      <meta charset="utf-8">
      <link rel="stylesheet" href="/resources/css/style_qna.css" type="text/css">
      <title>QnA Write</title>

      <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
      <script type="text/javascript" src='/resources/js/jquery.form.js'></script>
      <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
      <script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/190107/1546836247227/190107.js"></script>
  </head>
  


<body>
    <%@include file = "/WEB-INF/views/layout/header.jsp" %>
    <div class=contain>
        <div class=left>
            <h2 class=tit>문의 사항</h2>
            <ul class=menu>
                <li class="m1">
                    <a href="/qna/list.do">
                        <span>게시판</span>
                    </a>
                </li>
                <li class="m2">
                    <a href="/qna/write.do">
                        <span>문의하기</span>
                    </a>
                </li>
            </ul>
        </div>

    <div class=contents>
      <h1>문의하기</h1>
       <form  id="form1" name="form1" action="/qna/insert.do" method="post">

           <h3 class="tit_">● 문의사항</h3>

           <div class="col_one_third">
               <h3 class="join_title">작성자</h3>
               <div class="d_form large">${dto.getUserId()}</div>
           </div>
           
           <div class="col_two_third">
               <h3 class="join_title">제목</h3>
			   <input name="qnatitle" id="qnatitle" size="80" class="d_form large" placeholder="제목을 입력하세요">
           </div>

<!--            <div class="col_one_third col_last">
               <h3 class="join_title"><label for="question_type">질문유형</label></h3>
               <select id="question_type" name="question_type" class="box">
                   <option value="">-- Select One --</option>
                   <option value="satisfy">만족</option>
                   <option value="compliment">칭찬</option>
                   <option value="requirement">요구</option>
                   <option value="improvement">개선요청</option>
                   <option value="complaint">불만</option>
                   <option value="etc">기타</option>
               </select>
           </div> -->

          <div class="clear"></div>

          <div class="col_full">
              <h3 class="join_title_write">작성</h3>
              <textarea id="qnacontent" name="qnacontent" rows="10" cols="80"
              placeholder="내용을 입력하세요."></textarea>
          </div>

          <div class="btn_area">
              <input type="submit" id="btnSave" value = "접수" onclick="location.href='/qna/insert.do'">
          </div>

      </form>
      </div>




    </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>

</body>
</html>