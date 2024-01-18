

<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
    <div class="cart-table-area section-padding-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-lg-12">
                    <div class="cart-title mt-50">
                        <h2>Shopping Bill</h2>
                    </div>
                <%
                    String sel2 = "select * from tbl_orderhead  od inner join tbl_payment  p on od.pm_id=p.pm_id where od.od_id='" + session.getAttribute("od_id") + "'";
                    ResultSet rs2 = con.select(sel2);
                    while (rs2.next()) {

                %>
                <div class="col-12 col-lg-8">
                    <div class="che-out">
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <input type="text" name="name"  readonly=""  class="form-control" id="first_name" value="<%=rs2.getString("pm_name")%>" placeholder=" Name" required>
                            </div>
                            <div class="col-12 mb-3">
                                <input type="email" name="email" readonly="" class="form-control" id="email" value="<%=rs2.getString("pm_email")%>" placeholder="Email" value="">
                            </div>

                            <div class="col-12 mb-3">
                                <input type="text" name="address" readonly="" class="form-control mb-3" id="street_address" value="<%=rs2.getString("pm_address")%>" placeholder="Address" value="">
                            </div>
                            <div class="col-12 mb-3">
                                <input type="text" name="town" readonly="" class="form-control" id="city" value="<%=rs2.getString("pm_town")%>" placeholder="Town" value="">
                            </div>
                            <div class="col-12 mb-3">
                                <input type="text" name="landmark" readonly="" class="form-control" id="city" value="<%=rs2.getString("pm_landmark")%>" placeholder="Landmark" value="">
                            </div>
                            <div class="col-md-6 mb-3">
                                <input type="number" name="code" readonly="" class="form-control" id="zipCode" value="<%=rs2.getString("pm_zipcode")%>" placeholder="Zip Code" value="">
                            </div>
                            <div class="col-md-6 mb-3">
                                <input type="number" name="phone" readonly="" class="form-control" id="phone_number"  value="<%=rs2.getString("pm_phone")%>" placeholder="Phone No" value="">
                            </div>
                        </div>
                    </div>
                </div>
                <%
                }
                %>
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
                                <td>
                                    <h5><%=rs.getString("pd_name")%></h5>
                                </td>
                                <td class="qty">
                                    <%=rs.getString("odt_quantity")%>
                                </td>
                                <td class="price">
                                    <span><%=rs.getString("odt_unit_total")%>&nbsp;/-</span>
                                </td>

                            </tr>
                            <%
                                }
                            %>
                            <tr>
                                <td class="cart_product_img" style="color:blue;font-weight: bold">
                                    Total Amount
                                </td>
                                <td class="cart_product_img">
                                    
                                </td>
                                <td class="cart_product_img" >
                                   
                                </td>
                                <td class="cart_product_img" style="color:blue;font-weight: bold">
                                    <%=total%> /-
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


                <div class="cart-btn mt-100">
                    <a href="../home.jsp" class="btn amado-btn w-100">Back To Home</a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%@include file="footer.jsp" %>