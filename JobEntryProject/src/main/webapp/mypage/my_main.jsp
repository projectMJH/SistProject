<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
        <!-- Header Start -->
        <div class="container-xxl py-5 bg-dark page-header mb-5">
            <div class="container my-5 pt-5 pb-4">
                <h1 class="display-3 text-white mb-3 animated slideInDown">마이페이지</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb text-uppercase">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">${my_jsp }</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Header End -->
        
<div class="container-fluid">
  <div class="row">
    <!-- Left Sidebar -->
    <div class="col-lg-3 col-md-4 col-sm-12 bg-light p-3">
    <!-- 마이페이지 메뉴 시작 -->
	    <jsp:include page="my_menu.jsp"></jsp:include>
    <!-- 마이페이지 메뉴 끝 -->
    </div>
    
    <!-- Right Main Content -->
    <div class="col-lg-9 col-md-8 col-sm-12"> 
    <!-- 마이페이지 홈 시작 -->
	    <jsp:include page="${my_jsp }"></jsp:include>
    <!-- 마이페이지 홈 끝 -->
	</div>
  </div>
</div>  
</body>
</html>