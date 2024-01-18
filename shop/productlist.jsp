

<%@page import="java.sql.ResultSet"%>
<%@include file="includes/header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    String od_id = "", odt_id = "";
    if (request.getParameter("pd_id") != null) {
        if (session.getAttribute("userid") == null) {
            response.sendRedirect("../user/login.jsp?od_id=order");
        } else {

            String payment = request.getParameter("pd_id");
            String selc = "select * from tbl_product where pd_id='" + request.getParameter("pd_id") + "'";
            ResultSet rs = con.select(selc);
            if (rs.next()) {

                String sel = "select * from tbl_orderhead where user_id='" + session.getAttribute("userid") + "' and od_headdate=curdate() and od_headstatus='active'";
                ResultSet se = con.select(sel);
                if (se.next()) {

                    od_id = se.getString("od_id");
                } else {

                    String ins = "insert into tbl_orderhead (od_headdate,user_id,od_headstatus)values(curdate(),'" + session.getAttribute("userid") + "','active')";
                    System.out.println(ins);
                    out.println(ins);
                    boolean b = con.insert(ins);
                    if (b) {

                        String sel2 = "select * from tbl_orderhead where user_id='" + session.getAttribute("userid") + "' and od_headdate=curdate() and od_headstatus='active' order by od_id desc limit 1";
                       out.println(sel2);
                        ResultSet se2 = con.select(sel2);
                        if (se2.next()) {
                            od_id = se2.getString("od_id");
                        }
                    }
                }

                String seld = "select * from tbl_order_details where od_id='" + od_id + "' and pd_id='" + request.getParameter("pd_id") + "' and odt_status='active'";
                ResultSet sed = con.select(seld);
                if (sed.next()) {
                    odt_id = sed.getString("odt_id");
                    String ins = "update tbl_order_details set odt_quantity='1',odt_unit_price='" + rs.getString("pd_price") + "',odt_unit_total='" + rs.getString("pd_price") + "',odt_status='active' where odt_id='" + odt_id + "'";
                    con.insert(ins);
                } else {
                  %><%
                    String ins = "insert into tbl_order_details (od_id,pd_id,odt_quantity,odt_unit_price,odt_unit_total,odt_status)values('" + od_id + "','" + request.getParameter("pd_id") + "','1','" + rs.getString("pd_price") + "','" + rs.getString("pd_price") + "','active')";
                    con.insert(ins);
                }
                if (!od_id.equals("")) {
session.setAttribute("od_id", od_id);
                    response.sendRedirect("payment/cart.jsp?od_id=" + od_id);
                }
            }
        }
    }
%>
<div id="fh5co-main">
    <div class="fh5co-narrow-content">
        <h2 class="fh5co-heading animate-box" data-animate-effect="fadeInLeft"><b>Cycle Accessories</b></h2>
        <div class="row row-bottom-padded-md">
            <%
                String sel = "select * from tbl_product where ct_id='" + request.getParameter("ct_id") + "'";
                ResultSet rs = con.select(sel);
                while (rs.next()) {


            %>
            <div class="col-md-3 col-sm-6 col-padding animate-box" data-animate-effect="fadeInLeft">
                <div class="blog-entry">
                    <a href="#" class="blog-img"><img src="../shopowner/products/<%=rs.getString("pd_image")%>" height="250px" width="250px" class="img-responsive" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"></a>
                    <div class="desc">
                        <h4><a href="#"><%=rs.getString("pd_name")%></a></h4>
                        <h3><a href="#"><b><%=rs.getString("pd_price")%></b>&nbsp;Rs</a></h3>
                        <h4><a href="#"><%=rs.getString("pd_brand")%></a></h4>
                        <p><%=rs.getString("pd_desc")%></p>
                        <a href="productlist.jsp?pd_id=<%=rs.getString("ct_id")%>" class="lead">Buy Now <i class="icon-arrow-right3"></i></a>

                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
    <%@include file="includes/footer.jsp" %>