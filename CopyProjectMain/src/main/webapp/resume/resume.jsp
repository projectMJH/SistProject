<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서</title>
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- 
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link href="../css/resume.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
</script>
</head>
<body id="top">

<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="sidebar one_quarter first"> 
      <!-- ################################################################################################ -->
      <h3 class="text-left">마이 페이지</h3>
      <nav class="sdb_holder">
        <ul>
          <li><a href="#">MY</a></li>
          <li><a href="#">계정</a>
            <ul>
              <li><a href="#">Navigation - Level 2</a></li>
              <li><a href="#">Navigation - Level 2</a></li>
            </ul>
          </li>
          <li><a href="#">리뷰</a>
            <ul>
              <li><a href="#">Navigation - Level 2</a></li>
              <li><a href="#">Navigation - Level 2</a>
                <ul>
                  <li><a href="#">Navigation - Level 3</a></li>
                  <li><a href="#">Navigation - Level 3</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li><a href="#">이력서</a></li>
          <li><a href="#">멤버십/결제</a></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="content three_quarter"> 
      <div id="comments">
      	<div class="wrapper row1">
			<section id="ctdetails" class="hoc clear" style="background-color:#FBFBFB;"> 
				<table class="table" style="border: 0px">
					<tr>
						<td>
							<a href="#"><i class="fas fa-envelope"></i></a> 
							<span><strong>이메일:</strong> 1001moon@hanafos.com</span>
						</td>
						<td rowspan="5">
							<img src="../resume/moon.png" alt="Profile Image" style="width: 100%; height: auto; border-radius: 10px;">
						</td>
					</tr>
					<tr>
						<td colspan="2">
		                    <a href="#"><i class="fas fa-phone"></i></a> 
		                    <span><strong>전화번호:</strong> 010-8778-8264</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
		                    <a href="#"><i class="fas fa-phone"></i></a> 
		                    <span><strong>성별:</strong> 남자</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
		                    <a href="#"><i class="fas fa-phone"></i></a> 
		                    <span><strong>생년월일:</strong> 1995-09-05</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
		                    <a href="#"><i class="fas fa-phone"></i></a> 
		                    <span><strong>주소:</strong> 서울 서대문</span>
						</td>
					</tr>
				</table>
			    <h1 class="text-left" style="margin: 20px">문종호</h1>
			
			    <div style="display: flex; justify-content: space-between; align-items: center;">
			        <!-- 왼쪽: 정보 -->
			        <div style="flex: 1;">
			            <ul style="list-style: none; padding: 0;">
			                <li style="display: flex; align-items: center; gap: 10px; margin-bottom: 8px;">
			                    <a href="#"><i class="fas fa-envelope"></i></a> 
			                    <span><strong>이메일:</strong> 1001moon@hanafos.com</span>
			                </li>
			                <li style="display: flex; align-items: center; gap: 10px; margin-bottom: 8px;">
			                    <a href="#"><i class="fas fa-phone"></i></a> 
			                    <span><strong>전화번호:</strong> 010-8778-8264</span>
			                </li>
			            </ul>
			            
			            <ul style="list-style: none; padding: 0;">
			                <li style="display: flex; align-items: center; gap: 10px; margin-bottom: 8px;">
			                    <a href="#"><i class="far fa-user"></i></a> 
			                    <span><strong>성별:</strong> 남자</span>
			                </li>
			                <li style="display: flex; align-items: center; gap: 10px; margin-bottom: 8px;">
			                    <a href="#"><i class="far fa-calendar-alt"></i></a> 
			                    <span><strong>생년월일:</strong> 1995-09-05</span>
			                </li>
			                <li style="display: flex; align-items: center; gap: 10px; margin-bottom: 8px;">
			                    <a href="#"><i class="fas fa-home"></i></a> 
			                    <span><strong>주소:</strong> 서울 서대문</span>
			                </li>
			            </ul>
			        </div>
			
			        <!-- 오른쪽: 사진 -->
			        <div style="width: 150px; text-align: right;">
			            <img src="../resume/moon.png" alt="Profile Image" style="width: 100%; height: auto; border-radius: 10px;">
			        </div>
			    </div>
			</section>

<!--       	
  			<section id="ctdetails" class="hoc clear" style="background-color:#FBFBFB;"> 
		      	<h1 class="text-left" style="margin: 20px">문종호</h1>
			    <ul class="nospace clear">
			      <li class="one_third first">
			        <div class="block clear"><a href="#"><i class="fas fa-envelope"></i></a> <span><strong>이메일:</strong>1001moon@hanafos.com</span></div>
			      </li>
			      <li class="one_third">
			        <div class="block clear"><a href="#"><i class="fas fa-phone"></i></a> <span><strong>전화번호:</strong>010-8778-8264</span></div>
			      </li>
			    <ul class="nospace clear">
			    </ul>
			      <li class="one_third first">
			        <div class="block clear"><a href="#"><i class="far fa-user"></i></a> <span><strong>성별:</strong>남자</span></div>
			      </li>
			      <li class="one_third">
			        <div class="block clear"><a href="#"><i class="far fa-calendar-alt"></i></a> <span><strong>생년월일:</strong>1995-09-05</span></div>
			      </li>
			      <li class="one_third">
			        <div class="block clear"><a href="#"><i class="fas fa-home"></i></a> <span><strong>주소:</strong>서울 서대문</span></div>
			      </li>
			    </ul>
			</section>
 -->			
		</div>	
      	<div class="wrapper row1">
  			<section id="ctdetails" class="hoc clear"> 
			    <ul class="nospace clear">
			      <li class="one_quarter first">
			        <div class="block clear"><a href="#"><i class="fas fa-phone"></i></a> <span><strong>Give us a call:</strong> +00 (123) 456 7890</span></div>
			      </li>
			      <li class="one_quarter">
			        <div class="block clear"><a href="#"><i class="fas fa-envelope"></i></a> <span><strong>Send us a mail:</strong> support@domain.com</span></div>
			      </li>
			      <li class="one_quarter">
			        <div class="block clear"><a href="#"><i class="fas fa-clock"></i></a> <span><strong> Mon. - Sat.:</strong> 08.00am - 18.00pm</span></div>
			      </li>
			      <li class="one_quarter">
			        <div class="block clear"><a href="#"><i class="fas fa-map-marker-alt"></i></a> <span><strong>Come visit us:</strong> Directions to <a href="#">our location</a></span></div>
			      </li>
			    </ul>
			</section>
		</div>	
      	<ul>
          <li>
            <article>
              <header>
                <figure class="avatar"><img src="../images/demo/avatar.png" alt=""></figure>
                <address>
                By <a href="#">A Name</a>
                </address>
                <time datetime="2045-04-06T08:15+00:00">Friday, 6<sup>th</sup> April 2045 @08:15:00</time>
              </header>
              <div class="comcont">
                <p>This is an example of a comment made on a post. You can either edit the comment, delete the comment or reply to the comment. Use this as a place to respond to the post or to share what you are thinking.</p>
              </div>
            </article>
          </li>
      	</ul>
      	
        <h2>Write A Comment</h2>
        <form action="#" method="post">
          <div class="one_third first">
            <label for="name">Name <span>*</span></label>
            <input type="text" name="name" id="name" value="" size="22" required>
          </div>
          <div class="one_third">
            <label for="email">Mail <span>*</span></label>
            <input type="email" name="email" id="email" value="" size="22" required>
          </div>
          <div class="one_third">
            <label for="url">Website</label>
            <input type="url" name="url" id="url" value="" size="22">
          </div>
          <div class="block clear">
            <label for="comment">Your Comment</label>
            <textarea name="comment" id="comment" cols="25" rows="10"></textarea>
          </div>
          <div>
            <input type="submit" name="submit" value="Submit Form">
            &nbsp;
            <input type="reset" name="reset" value="Reset Form">
          </div>
        </form>
      </div>  
      <h1>Table(s)</h1>
      <div class="scrollable">

      </div>
<!-- 
      <div id="comments">
        <h2>Write A Comment</h2>
        <article>
        <form action="#" method="post">
          <div class="one_third first">
            <label for="name">Name <span>*</span></label>
            <input type="text" name="name" id="name" value="" size="22" required>
          </div>
          <div class="one_third">
            <label for="email">Mail <span>*</span></label>
            <input type="email" name="email" id="email" value="" size="22" required>
          </div>
          <div class="one_third">
            <label for="url">Website</label>
            <input type="url" name="url" id="url" value="" size="22">
          </div>
          <div class="block clear">
            <label for="comment">Your Comment</label>
            <textarea name="comment" id="comment" cols="25" rows="10"></textarea>
          </div>
          <div>
            <input type="submit" name="submit" value="Submit Form">
            &nbsp;
            <input type="reset" name="reset" value="Reset Form">
          </div>
        </form>
        </article>
      </div>
 -->
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>

</body>
</html>