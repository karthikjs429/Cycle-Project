
<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
    <div id="fh5co-main">
        <div class="fh5co-narrow-content">
            <h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft"><b>Shop Here</b></h2>
            <div class="row row-bottom-padded-md">
            <%
                String sel = "select * from tbl_category";
                ResultSet rs = con.select(sel);
                while (rs.next()) {

            %>
            <div class="col-md-3 col-sm-6 col-padding text-center animate-box">
                <a href="productlist.jsp?ct_id=<%=rs.getString("ct_id")%>" class="work image-popup" style="background-image: url(../admin/assets/images/web/<%=rs.getString("ct_image")%>);" >
                    <div class="desc">
                        <h3><%=rs.getString("ct_name")%></h3>
                        <span><b><%=rs.getString("ct_desc")%></b></span>
                    </div>
                </a>
            </div>
            <%
                }
            %>

        </div>
    </div>
    <%@include file="includes/footer.jsp" %>