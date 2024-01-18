

<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    if (request.getParameter("op") != null) {
        String odt_id = request.getParameter("odt_id");
        if (request.getParameter("op").equals("plus")) {
            String ins = "update tbl_order_details set odt_quantity=odt_quantity+1,odt_unit_total=odt_unit_total+odt_unit_price where odt_id='" + odt_id + "'";
            con.insert(ins);
        } else if (request.getParameter("op").equals("minus")) {
            String ins = "update tbl_order_details set odt_quantity=odt_quantity-1,odt_unit_total=odt_unit_total-odt_unit_price where odt_id='" + odt_id + "'";
            con.insert(ins);
        }
        response.sendRedirect("cart.jsp?od_id=" + session.getAttribute("od_id"));
    }
%>
<div class="cart-table-area section-padding-100">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 col-lg-12">
                <div class="cart-title mt-50">
                    <h2>Shopping Cart</h2>
                </div>

                <div class="cart-table clearfix" >
                    <table class="table table-responsive">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                float total = 0;
                                String od_id = request.getParameter("od_id");
                                String sel = "select * from tbl_order_details od inner join tbl_product p on od.pd_id=p.pd_id where od.od_id='" + session.getAttribute("od_id") + "'";
                                ResultSet rs = con.select(sel);
                                while (rs.next()) {
                                    total = total + rs.getFloat("odt_unit_total");

                            %>
                            <tr>
                                <td class="cart_product_img">
                                    <a href="#"><img src="../../shopowner/products/<%=rs.getString("pd_image")%>" alt="Product"></a>
                                </td>
                                <td class="cart_product_desc">
                                    <h5><%=rs.getString("pd_name")%></h5>
                                </td>
                                <td class="qty">
                                    <div class="qty-btn d-flex">
                                        <p>Qty</p>
                                        <div class="quantity">
                                            <a href="cart.jsp?odt_id=<%=rs.getString("odt_id")%>&op=minus"><span class="qty-minus"><i class="fa fa-minus" aria-hidden="true"></i></span></a>
                                            <input type="number" class="qty-text" id="qty2" step="1" min="1" max="300" name="quantity" value="<%=rs.getString("odt_quantity")%>">
                                            <a href="cart.jsp?odt_id=<%=rs.getString("odt_id")%>&op=plus"><span class="qty-plus" ><i class="fa fa-plus" aria-hidden="true"></i></span></a>
                                        </div>
                                    </div>
                                </td>
                                <td class="price">
                                    <span><%=rs.getString("odt_unit_total")%>&nbsp;/-</span>
                                </td>

                            </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td align="right" colspan="10">
                                    <%=total%>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


                <div class="cart-btn mt-100">
                    <a href="../home.jsp" class="btn amado-btn w-100">Buy another product</a>
                </div>

                <div class="cart-btn mt-100">
                    <a href="cart.jsp?checkout=<%=total%>" class="btn amado-btn w-100">Checkout</a>
                </div>

                <%
                    if (request.getParameter("checkout") != null) {
                        String ins = "update tbl_orderhead  set od_headtotal='"+total+"' where od_id='" + session.getAttribute("od_id") + "'";
                        con.insert(ins);
//                        System.out.println(ins);
                        response.sendRedirect("checkout.jsp");
                    }
                %>

            </div>
        </div>
    </div>
</div>
</div>
<%@include file="footer.jsp" %>