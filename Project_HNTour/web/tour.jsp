
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Hà Nội Tour</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Travelix Project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="./styles/offers_styles.css">
        <link rel="stylesheet" type="text/css" href="./styles/offers_responsive.css">
        <link rel="stylesheet" href="./assets/css/tour.css"/>
      
    </head>
    <body>
        <div class="super_container">
            <jsp:include page="header.jsp"></jsp:include>

                <div class="menu trans_500">
                    <div class="menu_content d-flex flex-column align-items-center justify-content-center text-center">
                        <div class="menu_close_container"><div class="menu_close"></div></div>
                        <div class="logo menu_logo"><a href="#"><img src="images/logo.png" alt></a></div>
                        <ul>
                            <li class="menu_item"><a href="index.html">home</a></li>
                            <li class="menu_item"><a href="about.html">about us</a></li>
                            <li class="menu_item"><a href="#">offers</a></li>
                            <li class="menu_item"><a href="blog.html">news</a></li>
                            <li class="menu_item"><a href="contact.html">contact</a></li>
                        </ul>
                    </div>
                </div>

                <div class="home">
                    <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/about_background.jpg"></div>
                    <div class="home_content">
                        <div class="home_title">our Tour</div>
                    </div>
                </div>

                <div class="offers">

                    <div class="search">
                        <div class="search_inner">

                            <div class="container fill_height no-padding">
                                <div class="row fill_height no-margin">
                                    <div class="col fill_height no-padding">

                                        <div class="search_tabs_container">
                                            <div class="search_tabs d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                                <div class="search_tab active d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/suitcase.png" alt><span>hotels</span></div>
                                                <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/bus.png" alt>car rentals</div>
                                                <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/departure.png" alt>flights</div>
                                                <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/island.png" alt>trips</div>
                                                <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/cruise.png" alt>cruises</div>
                                                <div class="search_tab d-flex flex-row align-items-center justify-content-lg-center justify-content-start"><img src="images/diving.png" alt>activities</div>
                                            </div>
                                        </div>

                                        <div class="search_panel active">
                                            <form action="#" id="search_form_1" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                                <div class="search_item">
                                                    <div>destination</div>
                                                    <input type="text" class="destination search_input" required="required">
                                                </div>
                                                <div class="search_item">
                                                    <div>check in</div>
                                                    <input type="text" class="check_in search_input" placeholder="YYYY-MM-DD">
                                                </div>
                                                <div class="search_item">
                                                    <div>check out</div>
                                                    <input type="text" class="check_out search_input" placeholder="YYYY-MM-DD">
                                                </div>
                                                <div class="search_item">
                                                    <div>adults</div>
                                                    <select name="adults" id="adults_1" class="dropdown_item_select search_input">
                                                        <option>01</option>
                                                        <option>02</option>
                                                        <option>03</option>
                                                    </select>
                                                </div>
                                                <div class="search_item">
                                                    <div>children</div>
                                                    <select name="children" id="children_1" class="dropdown_item_select search_input">
                                                        <option>0</option>
                                                        <option>02</option>
                                                        <option>03</option>
                                                    </select>
                                                </div>
                                                <div class="extras">
                                                    <ul class="search_extras clearfix">
                                                        <li class="search_extras_item">
                                                            <div class="clearfix">
                                                                <input type="checkbox" id="search_extras_1" class="search_extras_cb">
                                                                <label for="search_extras_1">Pet Friendly</label>
                                                            </div>
                                                        </li>
                                                        <li class="search_extras_item">
                                                            <div class="clearfix">
                                                                <input type="checkbox" id="search_extras_2" class="search_extras_cb">
                                                                <label for="search_extras_2">Car Parking</label>
                                                            </div>
                                                        </li>
                                                        <li class="search_extras_item">
                                                            <div class="clearfix">
                                                                <input type="checkbox" id="search_extras_3" class="search_extras_cb">
                                                                <label for="search_extras_3">Wireless Internet</label>
                                                            </div>
                                                        </li>
                                                        <li class="search_extras_item">
                                                            <div class="clearfix">
                                                                <input type="checkbox" id="search_extras_4" class="search_extras_cb">
                                                                <label for="search_extras_4">Reservations</label>
                                                            </div>
                                                        </li>
                                                        <li class="search_extras_item">
                                                            <div class="clearfix">
                                                                <input type="checkbox" id="search_extras_5" class="search_extras_cb">
                                                                <label for="search_extras_5">Private Parking</label>
                                                            </div>
                                                        </li>
                                                        <li class="search_extras_item">
                                                            <div class="clearfix">
                                                                <input type="checkbox" id="search_extras_6" class="search_extras_cb">
                                                                <label for="search_extras_6">Smoking Area</label>
                                                            </div>
                                                        </li>
                                                        <li class="search_extras_item">
                                                            <div class="clearfix">
                                                                <input type="checkbox" id="search_extras_7" class="search_extras_cb">
                                                                <label for="search_extras_7">Wheelchair Accessible</label>
                                                            </div>
                                                        </li>
                                                        <li class="search_extras_item">
                                                            <div class="clearfix">
                                                                <input type="checkbox" id="search_extras_8" class="search_extras_cb">
                                                                <label for="search_extras_8">Pool</label>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="more_options">
                                                    <div class="more_options_trigger">
                                                        <a href="#">load more options</a>
                                                    </div>
                                                    <ul class="more_options_list clearfix">
                                                        <li class="more_options_item">
                                                            <div class="clearfix">
                                                                <input type="checkbox" id="more_options_1" class="search_extras_cb">
                                                                <label for="more_options_1">Pet Friendly</label>
                                                            </div>
                                                        </li>
                                                        <li class="more_options_item">
                                                            <div class="clearfix">
                                                                <input type="checkbox" id="more_options_2" class="search_extras_cb">
                                                                <label for="more_options_2">Car Parking</label>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <button class="button search_button">search<span></span><span></span><span></span></button>
                                            </form>
                                        </div>

                                        <div class="search_panel">
                                            <form action="#" id="search_form_2" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                                <div class="search_item">
                                                    <div>destination</div>
                                                    <input type="text" class="destination search_input" required="required">
                                                </div>
                                                <div class="search_item">
                                                    <div>check in</div>
                                                    <input type="text" class="check_in search_input" placeholder="YYYY-MM-DD">
                                                </div>
                                                <div class="search_item">
                                                    <div>check out</div>
                                                    <input type="text" class="check_out search_input" placeholder="YYYY-MM-DD">
                                                </div>
                                                <div class="search_item">
                                                    <div>adults</div>
                                                    <select name="adults" id="adults_2" class="dropdown_item_select search_input">
                                                        <option>01</option>
                                                        <option>02</option>
                                                        <option>03</option>
                                                    </select>
                                                </div>
                                                <div class="search_item">
                                                    <div>children</div>
                                                    <select name="children" id="children_2" class="dropdown_item_select search_input">
                                                        <option>0</option>
                                                        <option>02</option>
                                                        <option>03</option>
                                                    </select>
                                                </div>
                                                <button class="button search_button">search<span></span><span></span><span></span></button>
                                            </form>
                                        </div>

                                        <div class="search_panel">
                                            <form action="#" id="search_form_3" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                                <div class="search_item">
                                                    <div>destination</div>
                                                    <input type="text" class="destination search_input" required="required">
                                                </div>
                                                <div class="search_item">
                                                    <div>check in</div>
                                                    <input type="text" class="check_in search_input" placeholder="YYYY-MM-DD">
                                                </div>
                                                <div class="search_item">
                                                    <div>check out</div>
                                                    <input type="text" class="check_out search_input" placeholder="YYYY-MM-DD">
                                                </div>
                                                <div class="search_item">
                                                    <div>adults</div>
                                                    <select name="adults" id="adults_3" class="dropdown_item_select search_input">
                                                        <option>01</option>
                                                        <option>02</option>
                                                        <option>03</option>
                                                    </select>
                                                </div>
                                                <div class="search_item">
                                                    <div>children</div>
                                                    <select name="children" id="children_3" class="dropdown_item_select search_input">
                                                        <option>0</option>
                                                        <option>02</option>
                                                        <option>03</option>
                                                    </select>
                                                </div>
                                                <button class="button search_button">search<span></span><span></span><span></span></button>
                                            </form>
                                        </div>

                                        <div class="search_panel">
                                            <form action="#" id="search_form_4" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                                <div class="search_item">
                                                    <div>destination</div>
                                                    <input type="text" class="destination search_input" required="required">
                                                </div>
                                                <div class="search_item">
                                                    <div>check in</div>
                                                    <input type="text" class="check_in search_input" placeholder="YYYY-MM-DD">
                                                </div>
                                                <div class="search_item">
                                                    <div>check out</div>
                                                    <input type="text" class="check_out search_input" placeholder="YYYY-MM-DD">
                                                </div>
                                                <div class="search_item">
                                                    <div>adults</div>
                                                    <select name="adults" id="adults_4" class="dropdown_item_select search_input">
                                                        <option>01</option>
                                                        <option>02</option>
                                                        <option>03</option>
                                                    </select>
                                                </div>
                                                <div class="search_item">
                                                    <div>children</div>
                                                    <select name="children" id="children_4" class="dropdown_item_select search_input">
                                                        <option>0</option>
                                                        <option>02</option>
                                                        <option>03</option>
                                                    </select>
                                                </div>
                                                <button class="button search_button">search<span></span><span></span><span></span></button>
                                            </form>
                                        </div>

                                        <div class="search_panel">
                                            <form action="#" id="search_form_5" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                                <div class="search_item">
                                                    <div>destination</div>
                                                    <input type="text" class="destination search_input" required="required">
                                                </div>
                                                <div class="search_item">
                                                    <div>check in</div>
                                                    <input type="text" class="check_in search_input" placeholder="YYYY-MM-DD">
                                                </div>
                                                <div class="search_item">
                                                    <div>check out</div>
                                                    <input type="text" class="check_out search_input" placeholder="YYYY-MM-DD">
                                                </div>
                                                <div class="search_item">
                                                    <div>adults</div>
                                                    <select name="adults" id="adults_5" class="dropdown_item_select search_input">
                                                        <option>01</option>
                                                        <option>02</option>
                                                        <option>03</option>
                                                    </select>
                                                </div>
                                                <div class="search_item">
                                                    <div>children</div>
                                                    <select name="children" id="children_5" class="dropdown_item_select search_input">
                                                        <option>0</option>
                                                        <option>02</option>
                                                        <option>03</option>
                                                    </select>
                                                </div>
                                                <button class="button search_button">search<span></span><span></span><span></span></button>
                                            </form>
                                        </div>

                                        <div class="search_panel">
                                            <form action="#" id="search_form_6" class="search_panel_content d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-lg-between justify-content-start">
                                                <div class="search_item">
                                                    <div>destination</div>
                                                    <input type="text" class="destination search_input" required="required">
                                                </div>
                                                <div class="search_item">
                                                    <div>check in</div>
                                                    <input type="text" class="check_in search_input" placeholder="YYYY-MM-DD">
                                                </div>
                                                <div class="search_item">
                                                    <div>check out</div>
                                                    <input type="text" class="check_out search_input" placeholder="YYYY-MM-DD">
                                                </div>
                                                <div class="search_item">
                                                    <div>adults</div>
                                                    <select name="adults" id="adults_6" class="dropdown_item_select search_input">
                                                        <option>01</option>
                                                        <option>02</option>
                                                        <option>03</option>
                                                    </select>
                                                </div>
                                                <div class="search_item">
                                                    <div>children</div>
                                                    <select name="children" id="children_6" class="dropdown_item_select search_input">
                                                        <option>0</option>
                                                        <option>02</option>
                                                        <option>03</option>
                                                    </select>
                                                </div>
                                                <button class="button search_button">search<span></span><span></span><span></span></button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="container">
                        <div class="row">
                            <div class="col-lg-1 temp_col">
                                
                            </div>
                            <div class="col-lg-11">
                              <div class="offers_sorting_container">
                                    <ul class="">
                                <li class="offers_sorting">
                                 
                                    <select name="sortBy" class="sort_btn">
                                        <option id="" >Price</option>
                                        <option value="ascending">Ascending</option>
                                        <option value="descending">Descending</option>
                                    </select>
                                    <script>
                                        document.querySelector('select[name="sortBy"]').addEventListener('change', function () {
                                            var selectedValue = this.value;
                                            // Perform any additional logic if needed
                                            window.location.href = "sortprice?sortBy=" + selectedValue;
                                        });
                                    </script>
                                </li>
                                <li class="offers_sorting">
                                 
                                    <select name="sortByName" class="sort_btn">
                                        <option id="" >Name</option>
                                        <option value="ascending_name">Ascending</option>
                                        <option value="descending_name">Descending</option>
                                    </select>
                                    <script>
                                        document.querySelector('select[name="sortByName"]').addEventListener('change', function () {
                                            var selectedValue = this.value;
                                            // Perform any additional logic if needed
                                            window.location.href = "sortname?sortByName=" + selectedValue;
                                        });
                                    </script>
                                </li>
                                <li class="offers_sorting">
                                 
                                    <select name="sortByRating" class="sort_btn">
                                        <option id="" >Star</option>
                                        <option value="ascending_rating">Ascending</option>
                                        <option value="descending_rating">Descending</option>
                                    </select>
                                    <script>
                                        document.querySelector('select[name="sortByRating"]').addEventListener('change', function () {
                                            var selectedValue = this.value;
                                            // Perform any additional logic if needed
                                            window.location.href = "sortrating?sortByRating=" + selectedValue;
                                        });
                                    </script>
                                </li>
                               </ul>
                                </div>
                            </div>

                            <!--start-->
                            <div class="col-lg-12">
                                <div class="offers_grid">
                                <c:forEach items="${requestScope.tour}" var="c">  

                                    <div class="offers_item rating_4" >
                                        <div class="row">
                                            <div class="col-lg-1 temp_col"></div>
                                            <div class="col-lg-3 col-1680-4">
                                                <div class="offers_image_container">

                                                    <img class="card-img-top" src="${c.imgMain}">

                                                    <div class="offer_name"><span  style="color: white; font-size: 18px; margin-left: 35px"><fmt:formatNumber value="${c.price}" pattern="###,###"/>VND</span></div>
                                                </div>
                                            </div>
                                            <div class="col-lg-8">
                                                <div class="offers_content">
                                                    <div class="offers_price">${c.name}<span>About ${c.intendedTime}</span></div>
                                                    <p class="offers_text">${c.description}</p>
                                                    <div class="button book_button"><a href="#">book<span></span><span></span><span></span></a></div>
                                                    <div class="button book_button"><a href="detail?tid=${c.id}">Detail<span></span><span></span><span></span></a></div>
                                                    <div class="offer_reviews">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp"></jsp:include>

        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="js/offers_custom.js"></script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317" integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==" data-cf-beacon='{"rayId":"845750592bc9408f","version":"2023.10.0","token":"cd0b4b3a733644fc843ef0b185f98241"}' crossorigin="anonymous"></script>
    </body>
</html>