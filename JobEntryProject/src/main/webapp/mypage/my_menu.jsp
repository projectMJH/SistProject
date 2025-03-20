<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

      <h4>마이 페이지</h4>
      <ul class="nav flex-column">
        <!-- 1단계 메뉴 -->
        <li class="nav-item">
          <a class="nav-link active" href="#">My</a>
        </li>
        <!-- 2단계 하위 메뉴 (드롭다운) -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            계정
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">계정1</a></li>
            <li><a class="dropdown-item" href="#">계정2</a></li>
            <li><a class="dropdown-item" href="#">계정3</a></li>
          </ul>
        </li>
        <!-- 다른 메뉴들 -->
        <li class="nav-item">
          <a class="nav-link" href="#">리뷰</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="..resume/resume_detail.do">이력서</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">멤버십/결제</a>
        </li>
      </ul>

</body>
</html>