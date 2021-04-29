<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style.css" type="text/css">
    <title> 문의 내역 </title>
    <style>
        body {
          background-color: #EEEFF1;
        }
        .contain {
            background-color: #EEEFF1;
        }
        .finish {
            background-color: #EEEFF1;
        }
      textarea {
          overflow:auto;
          vertical-align:top;
          padding:8px;
          box-sizing:border-box;
          border:solid 1px #aaa;
      }

      table {
          border-collapse: collapse;
          border-spacing: 0;
          table-layout: fixed;
          border-spacing: 0;
          width: 100%;
      }
      .tbData td {padding:14px 20px 14px 20px;}
      .tbData tbody th:first-child { border-left:none; }
      .tb-1 td.fm { padding-top:16px; padding-bottom:16px; }

    </style>
  </head>

<body>
  <%@include file = "/WEB-INF/views/layout/header.jsp" %>

  <div class=contain>
    <div class=left>
          <h2 class=tit>My QnA</h2>
            <ul class=menu>
          	  <li class="m1">
                <a href="/mypage/memberinfo">
                  <span>개인 정보</span>
                </a>
              </li>
              <li class="m2">
                <a href="/mypage/reservation">
                  <span>예약 확인/취소</span>
                </a>
              </li>
              <li class="m3">
                <a href="mypage_qna.html">
                  <span>문의 내역</span>
              </a>
            </li>
          </ul>
    </div>
    <div class=contents>
      <h1>My QnA</h1>
    </div>
    <div class="finish">
        <p> 사업자 번호: 110-10-12345<br/>
            사업장소재지: 경기도 이천시 마장면 장암리<br/>
            대표자: 홍길동<br/>
            Copyright ⓒ 2020 Hotel Group. All rights reserved.
        </p>
    </div>
  </div>

</body>
</html>
