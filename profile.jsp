
<%@page import="java.sql.ResultSet"%>
<%@include file="includes/sidebar.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    // String id = (String) session.getAttribute("userid");
    String selA = "select * from tbl_user_reg where reg_id='" + session.getAttribute("userid").toString() + "' ";
    ResultSet rs = con.select(selA);
    while (rs.next()) {
%>

<div id="colorlib-main">
    <section class="ftco-section-no-padding bg-light">
        <div class="hero-wrap">
            <div class="overlay"></div>
            <div class="d-flex align-items-center js-fullheight">
                <div class="author-image text img d-flex">
                    <section class="home-slider js-fullheight owl-carousel">
                        <div class="slider-item js-fullheight" style="background-image: url(images/author.jpg);">
                        </div>

                        <div class="slider-item js-fullheight" style="background-image:url(images/author-2.jpg);">
                        </div>
                    </section>
                </div>
                <div class="author-info text p-3 p-md-5">
                    <div class="desc">
                        <span class="subheading">Hello! I'm</span>
                        <h1 class="big-letter"><%=rs.getString("reg_name")%></h1>
                        <h1 class="mb-4"><span><%=rs.getString("reg_name")%></span></h1>
                        <b>Height</b> <h4 class="big-letter"><%=rs.getString("reg_height")%></h4>
                        <b>Weight</b>  <h4 class="big-letter"><%=rs.getString("reg_weight")%></h4>
                        <b>Phone no</b> <h3 class="big-letter"><%=rs.getString("reg_phone")%></h3>
                        <ul class="ftco-social mt-3">
                            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                            <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                            <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div><!-- END COLORLIB-MAIN -->
<%
    }
%>
</div>
<%@include file="includes/scripts.jsp" %>