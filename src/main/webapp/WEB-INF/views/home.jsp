<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>방방곡곡 발도장</title>
		<link rel="stylesheet" href="/resources/css/user/header.css">
        <link rel="stylesheet" href="/resources/css/user/footer.css">
        <link rel="stylesheet" href="/resources/css/main/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/css/reset.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bacasime+Antique&family=Rajdhani&family=Roboto+Mono&family=Roboto:wght@300&family=Tilt+Prism&display=swap">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
        
			<div id="banner">
			    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			        <div class="carousel-indicators">
			            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			        </div>
			        <div class="carousel-inner">
			        <c:forEach items="${bList }" var="banner">
			        	<div id="main-banner" class="carousel-item active">
			                <img class="banner-img" src="${banner.bannerFilePath }" class="d-block w-100" alt="벚꽃">
			            </div>
			        </c:forEach>
<!-- 			            <div id="main-banner" class="carousel-item active"> -->
<!-- 			                <img class="banner-img" src="/resources/images/main/festival.png" class="d-block w-100" alt="벚꽃"> -->
<!-- 			            </div> -->
<!-- 			            <div id="main-banner" class="carousel-item"> -->
<!-- 			                <img class="banner-img" src="/resources/images/main/등대.jpg" class="d-block w-100" alt="에펠탑"> -->
<!-- 			            </div> -->
<!-- 			            <div id="main-banner" class="carousel-item"> -->
<!-- 			                <img class="banner-img" src="/resources/images/main/불꽃.jpg" class="d-block w-100" alt="강"> -->
<!-- 			            </div> -->
			        </div>
			        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			            <span class="visually-hidden">Previous</span>
			        </button>
			        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			            <span class="carousel-control-next-icon" aria-hidden="true"></span>
			            <span class="visually-hidden">Next</span>
			        </button>
			    </div>
			</div>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"></script>
            
            <main class="main-container">
                
                <div id="trip">
                    <div id="in-trip">
                        <h2>여행지 추천</h2>
                        <br>
                        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">
                        <c:forEach begin="1" end="4" var="trip" items="${tList }" varStatus="i">
                            <div class="col">
                                <div class="card h-100">
                                    <img src="/resources/images/main/개발자.jpg" class="card-img-top" alt="...">
                                    <div class="card-body">
                                    <c:url var="detailUrl" value="/trip/t_detail.do">
		                    			<c:param name="tripNo" value="${trip.tripNo }"></c:param>
		                    		</c:url>
                                        <h5 class="card-title">${trip.tripTitle}</h5>
                                        <p class="card-text">${trip.tripSummary }</p>
                                        <a href="${detailUrl }" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                        	</div>
                        </c:forEach>
                        </div>
                    </div>
                </div>

                <div id="event">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
							<c:forEach items="${tbList }" var="trip_banner">
					        	<div id="event_banner" class="carousel-item active">
					                <img class="banner-img" src="${trip_banner.bannerFilePath }" class="d-block w-100" alt="벚꽃">
					            </div>
					        </c:forEach>                        
<!--                             <div id="event-banner" class="carousel-item active"> -->
<!--                                 <img class="banner-img" src="/resources/images/main/축제배너 더 작은버전.png" class="d-block w-100" alt="벚꽃"> -->
<!--                             </div> -->
<!--                             <div id="event-banner" class="carousel-item"> -->
<!--                                 <img  class="banner-img" src="/resources/images/main/축제배너 더 작은버전.png" class="d-block w-100" alt="벚꽃"> -->
<!--                             </div> -->
<!--                             <div id="event-banner" class="carousel-item"> -->
<!--                                 <img class="banner-img" src="/resources/images/main/축제배너 더 작은버전.png" class="d-block w-100" alt="벚꽃"> -->
<!--                             </div> -->
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div id="review" class="row">
                    <div id="review-board-img" class="col-md-4 col-lg-3" >
                        <img id="review-img" class="banner-img " src="/resources/images/main/남산야경.png" alt="여행지 추천">
                    </div>
                    <div id="review-board" class="col-md-8 col-lg-8">
                        <table>
                            <thead>
                                <th class="bottom_line">
                                    <h3>여행 후기</h3>
                                </th>
                                <th class="bottom_line">
                                    <div id="more">
                                        <a href="/review/r_list.do">+ 더보기</a>
                                    </div>
                                </th>
                            </thead>
                            <tbody>
                                <c:forEach begin="1" end="5" var="review" items="${rList }" varStatus="i">
	                                <tr>
	                                <c:url var="rDetailUrl" value="/review/r_detail.do">
		                    			<c:param name="reviewNo" value="${reivew.reviewNo }"></c:param>
		                    		</c:url>
	                                    <td colspan="2" class="bottom_line">
	                                        <a href="${rDetailUrl }">${review.reivewTitle}</a>
	                                    </td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="notice">
                    <div>
                        <table>
                            <thead>
                                <th class="no-bottom-line">
                                    <h3>공지사항</h3>
                                </th>
                                <th class="no-bottom-line">
                                    <div id="more">
                                        <a href="/notice/n_list.do">+ 더보기</a>
                                    </div>
                                </th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="2" id="table-img" class="no-bottom-line">
                                        <div id="notice-img">
                                            <img class="banner-img" src="/resources/images/main/바람개비.jpg" alt="">
                                        </div>
                                    </td>
                                </tr>
                                <c:forEach begin="1" end="5" var="notice" items="${nList }" varStatus="i">
	                                <tr>
	                                <c:url var="nDetailUrl" value="/notice/n_detail.do">
		                    			<c:param name="noticeNo" value="${notice.noticeNo }"></c:param>
		                    		</c:url>
	                                    <td colspan="2" class="bottom_line">
	                                        <a href="${nDetailUrl }">${notice.noticeTitle }</a>
	                                    </td>
	                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
		    <!-- footer -->
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
            
<!--             <footer> -->
<!--                     <div class="color-bar"></div> -->
<!--                     <p>Gadients & animations in CSS to recreate Gumroad's rainbow bar as a loading animation.</p> -->
<!--             </footer> -->
	            
            <script>
                let header = document.querySelector('header');
                let bars = document.querySelector('.fa-bars');
                let navBar = document.querySelector('.navBar');
        
                function circle() {
        
                    let div = document.createElement('div');
                    div.classList.add('circle');
        
                    let left = Math.floor(Math.random() * 100);
                    let top = Math.floor(Math.random() * 100);
        
                    div.style.left = left + '%';
                    div.style.top = top + '%';
        
                    header.appendChild(div);
        
                    setTimeout(function () {
                        header.removeChild(div)
                    }, 3500)
                }
        
                setInterval(function () {
                    circle()
                }, 700);
        
                let bolean = true;
                bars.addEventListener("click", () => {
                    if (bolean == true) {
                        navBar.style.height = "40vmin";
                        bars.classList.replace("fa-bars", "fa-remove");
                        bolean = false;
                    } else {
                        navBar.style.height = "0%";
                        bars.classList.replace("fa-remove", "fa-bars");
                        bolean = true;
                    }
                })

                (function() {
                    var App, Loader;
                    Loader = (function() {
                        class Loader {
                            constructor() {
                                this.addBanner = this.addBanner.bind(this);
                            }

                            start() {
                                this.getElements();
                                return this.addListeners();
                            }

                            getElements() {
                                return this.el = document.getElementsByClassName("loader")[0];
                            }

                            addListeners() {
                                this.loadSim = setInterval(() => {
                                    return this.loaded += 1 + Math.floor(Math.random() * 5);
                                }, 200);
                                return this.loadCheck = setInterval(() => {
                                    if (this.loaded < this.total) {
                                        return this.addBanner();
                                    } else {
                                        clearInterval(this.loadSim);
                                        return clearInterval(this.loadCheck);
                                    }
                                }, 200);
                            }

                            addBanner() {
                                var banner, color, results;
                                banner = document.createElement("i");
                                color = this.lastPicked[0];
                                while (this.lastPicked.indexOf(color) !== -1) {
                                    color = this.colors[Math.floor(Math.random() * this.colors.length)];
                                }
                                this.lastPicked.unshift(color);
                                this.lastPicked.pop();
                                banner.setAttribute("class", color);
                                this.el.insertBefore(banner, this.el.children[0]);
                                results = [];
                                while (this.el.children.length > 12) {
                                    results.push(this.el.removeChild(this.el.children[12]));
                                }
                                return results;
                            }
                        };

                        Loader.prototype.loaded = 0;
                        Loader.prototype.total = 100;
                        Loader.prototype.lastPicked = ["grey", "grey", "grey"];
                        Loader.prototype.colors = ["red", "green", "blue", "yellow", "purple"];
                        return Loader;

                    }).call(this);

                    App = new Loader();
                    App.start();

                }).call(this);

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiPGFub255bW91cz4iXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7QUFBQSxNQUFBLEdBQUEsRUFBQTs7RUFBTTtJQUFOLE1BQUEsT0FBQTs7WUFpQ0UsQ0FBQSxnQkFBQSxDQUFBOzs7TUFwQkEsS0FBTyxDQUFBLENBQUE7UUFDTCxJQUFDLENBQUMsV0FBRixDQUFBO2VBQ0EsSUFBQyxDQUFDLFlBQUYsQ0FBQTtNQUZLOztNQUlQLFdBQWEsQ0FBQSxDQUFBO2VBQ1gsSUFBQyxDQUFDLEVBQUYsR0FBTyxRQUFRLENBQUMsc0JBQVQsQ0FBZ0MsUUFBaEMsQ0FBeUMsQ0FBQyxDQUFEO01BRHJDOztNQUdiLFlBQWMsQ0FBQSxDQUFBO1FBQ1osSUFBQyxDQUFDLE9BQUYsR0FBWSxXQUFBLENBQVksQ0FBQSxDQUFBLEdBQUE7aUJBQ3RCLElBQUMsQ0FBQyxNQUFGLElBQVksQ0FBQSxHQUFJLElBQUksQ0FBQyxLQUFMLENBQVksSUFBSSxDQUFDLE1BQUwsQ0FBQSxDQUFBLEdBQWdCLENBQTVCO1FBRE0sQ0FBWixFQUVWLEdBRlU7ZUFJWixJQUFDLENBQUMsU0FBRixHQUFjLFdBQUEsQ0FBWSxDQUFBLENBQUEsR0FBQTtVQUN4QixJQUFHLElBQUMsQ0FBQyxNQUFGLEdBQVcsSUFBQyxDQUFDLEtBQWhCO21CQUNFLElBQUMsQ0FBQyxTQUFGLENBQUEsRUFERjtXQUFBLE1BQUE7WUFHRSxhQUFBLENBQWUsSUFBQyxDQUFDLE9BQWpCO21CQUNBLGFBQUEsQ0FBZSxJQUFDLENBQUMsU0FBakIsRUFKRjs7UUFEd0IsQ0FBWixFQU1aLEdBTlk7TUFMRjs7TUFhZCxTQUFXLENBQUEsQ0FBQTtBQUNiLFlBQUEsTUFBQSxFQUFBLEtBQUEsRUFBQTtRQUFJLE1BQUEsR0FBUyxRQUFRLENBQUMsYUFBVCxDQUF1QixHQUF2QjtRQUNULEtBQUEsR0FBUSxJQUFDLENBQUMsVUFBVSxDQUFDLENBQUQ7QUFDcEIsZUFBTSxJQUFDLENBQUMsVUFBVSxDQUFDLE9BQWIsQ0FBc0IsS0FBdEIsQ0FBQSxLQUFtQyxDQUFDLENBQTFDO1VBQ0UsS0FBQSxHQUFRLElBQUMsQ0FBQyxNQUFNLENBQUUsSUFBSSxDQUFDLEtBQUwsQ0FBWSxJQUFJLENBQUMsTUFBTCxDQUFBLENBQUEsR0FBZ0IsSUFBQyxDQUFDLE1BQU0sQ0FBQyxNQUFyQyxDQUFGO1FBRGxCO1FBRUEsSUFBQyxDQUFDLFVBQVUsQ0FBQyxPQUFiLENBQXNCLEtBQXRCO1FBQ0EsSUFBQyxDQUFDLFVBQVUsQ0FBQyxHQUFiLENBQUE7UUFFQSxNQUFNLENBQUMsWUFBUCxDQUFxQixPQUFyQixFQUErQixLQUEvQjtRQUNBLElBQUMsQ0FBQyxFQUFFLENBQUMsWUFBTCxDQUFtQixNQUFuQixFQUE0QixJQUFDLENBQUMsRUFBRSxDQUFDLFFBQVEsQ0FBQyxDQUFELENBQXpDO0FBRUE7ZUFBTSxJQUFDLENBQUMsRUFBRSxDQUFDLFFBQVEsQ0FBQyxNQUFkLEdBQXVCLEVBQTdCO3VCQUNFLElBQUMsQ0FBQyxFQUFFLENBQUMsV0FBTCxDQUFrQixJQUFDLENBQUMsRUFBRSxDQUFDLFFBQVEsQ0FBQyxFQUFELENBQS9CO1FBREYsQ0FBQTs7TUFYUzs7SUFqQ2I7O3FCQUVFLE1BQUEsR0FBUTs7cUJBQ1IsS0FBQSxHQUFPOztxQkFDUCxVQUFBLEdBQVksQ0FBRSxNQUFGLEVBQVcsTUFBWCxFQUFvQixNQUFwQjs7cUJBQ1osTUFBQSxHQUFRLENBQ04sS0FETSxFQUVOLE9BRk0sRUFHTixNQUhNLEVBSU4sUUFKTSxFQUtOLFFBTE07Ozs7OztFQTBDVixHQUFBLEdBQU0sSUFBSSxNQUFKLENBQUE7O0VBQ04sR0FBRyxDQUFDLEtBQUosQ0FBQTtBQWhEQSIsInNvdXJjZXNDb250ZW50IjpbImNsYXNzIExvYWRlclxuICBcbiAgbG9hZGVkOiAwXG4gIHRvdGFsOiAxMDBcbiAgbGFzdFBpY2tlZDogWyBcImdyZXlcIiAsIFwiZ3JleVwiICwgXCJncmV5XCIgXVxuICBjb2xvcnM6IFtcbiAgICBcInJlZFwiXG4gICAgXCJncmVlblwiXG4gICAgXCJibHVlXCJcbiAgICBcInllbGxvd1wiXG4gICAgXCJwdXJwbGVcIlxuICBdXG4gIFxuICBzdGFydDogLT5cbiAgICBALmdldEVsZW1lbnRzKClcbiAgICBALmFkZExpc3RlbmVycygpXG4gICAgXG4gIGdldEVsZW1lbnRzOiAtPlxuICAgIEAuZWwgPSBkb2N1bWVudC5nZXRFbGVtZW50c0J5Q2xhc3NOYW1lKFwibG9hZGVyXCIpWzBdXG4gICAgXG4gIGFkZExpc3RlbmVyczogLT5cbiAgICBALmxvYWRTaW0gPSBzZXRJbnRlcnZhbCA9PlxuICAgICAgQC5sb2FkZWQgKz0gMSArIE1hdGguZmxvb3IoIE1hdGgucmFuZG9tKCkgKiA1ICkgIFxuICAgICwgMjAwXG4gICAgXG4gICAgQC5sb2FkQ2hlY2sgPSBzZXRJbnRlcnZhbCA9PlxuICAgICAgaWYgQC5sb2FkZWQgPCBALnRvdGFsXG4gICAgICAgIEAuYWRkQmFubmVyKClcbiAgICAgIGVsc2VcbiAgICAgICAgY2xlYXJJbnRlcnZhbCggQC5sb2FkU2ltIClcbiAgICAgICAgY2xlYXJJbnRlcnZhbCggQC5sb2FkQ2hlY2sgKVxuICAgICwgMjAwXG4gICAgXG4gIGFkZEJhbm5lcjogPT5cbiAgICBiYW5uZXIgPSBkb2N1bWVudC5jcmVhdGVFbGVtZW50KFwiaVwiKVxuICAgIGNvbG9yID0gQC5sYXN0UGlja2VkWzBdXG4gICAgd2hpbGUgQC5sYXN0UGlja2VkLmluZGV4T2YoIGNvbG9yICkgaXNudCAtMVxuICAgICAgY29sb3IgPSBALmNvbG9yc1sgTWF0aC5mbG9vciggTWF0aC5yYW5kb20oKSAqIEAuY29sb3JzLmxlbmd0aCldXG4gICAgQC5sYXN0UGlja2VkLnVuc2hpZnQoIGNvbG9yIClcbiAgICBALmxhc3RQaWNrZWQucG9wKClcbiAgICBcbiAgICBiYW5uZXIuc2V0QXR0cmlidXRlKCBcImNsYXNzXCIgLCBjb2xvciApXG4gICAgQC5lbC5pbnNlcnRCZWZvcmUoIGJhbm5lciAsIEAuZWwuY2hpbGRyZW5bMF0gKVxuICAgIFxuICAgIHdoaWxlIEAuZWwuY2hpbGRyZW4ubGVuZ3RoID4gMTJcbiAgICAgIEAuZWwucmVtb3ZlQ2hpbGQoIEAuZWwuY2hpbGRyZW5bMTJdIClcbiAgICBcbkFwcCA9IG5ldyBMb2FkZXJcbkFwcC5zdGFydCgpIl19
//# sourceURL=coffeescript
            </script>
        </div>
    </bo>
</html>
 
<!-- <html> -->
<!-- 	<head> -->
<!-- 		<title>Home</title> -->
<!-- 	</head> -->
<!-- 	<body> -->
<%-- 		<c:if test="${ userId ne null }"> --%>
<!-- 		<form action="/user/mypage.do" method="post"> -->
<%-- 			<input type="hidden" name="userId" value="${ userId }"> --%>
<!-- 			<input type="submit" id="myPageBtn" value="마이페이지"> -->
<!-- 		</form> -->
<%-- 		</c:if> --%>
<!-- 	</body> -->
<!-- </html> -->
