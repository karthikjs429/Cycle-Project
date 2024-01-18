
<%@page import="java.sql.ResultSet"%>
<%@include file="header.jsp" %>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    String total = "";
    String sel = "select * from tbl_orderhead where od_id='" + session.getAttribute("od_id") + "'";
    ResultSet se = con.select(sel);
    if (se.next()) {
        total = se.getString("od_headtotal");
    }

    if (request.getParameter("submit") != null) {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String town = request.getParameter("town");
        String landmark = request.getParameter("landmark");
        String code = request.getParameter("code");
        String phone = request.getParameter("phone");
        String ins = "insert into tbl_payment (pm_name,pm_email,pm_address,pm_town,pm_landmark,pm_zipcode,pm_phone) values('" + name + "','" + email + "','" + address + "','" + town + "','" + landmark + "','" + code + "','" + phone + "')";
        System.out.println(ins);
        boolean b = con.insert(ins);
        if (b) {
            String sel2 = "select * from tbl_payment order by pm_id desc limit 1";
            ResultSet se2 = con.select(sel2);
            if (se2.next()) {
                String ins2 = "update tbl_orderhead  set pm_id='" + se2.getString("pm_id") + "' where od_id='" + session.getAttribute("od_id") + "'";
                boolean bb = con.insert(ins2);
                if (bb) {
                    response.sendRedirect("paymentportal.jsp?od_id="+session.getAttribute("od_id"));
                }
            } else {
%>
<script>alert('Error')</script>
<%
    }

} else {
%>
<script>alert('Error2')</script>
<%
        }
    }
%>
<div class="cart-table-area section-padding-100">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 col-lg-12">
                <div class="checkout_details_area mt-50 clearfix">

                    <div class="cart-title">
                        <h2>Checkout</h2>
                    </div>
                    <div class="cart-title">
                        <h4>Fill in address for shipment</h4>
                    </div>

                    <form method="post">
                        <div class="row">
                            <div class="col-12 col-lg-8">
                                <div class="che-out">
                                    <div class="row">
                                        <div class="col-md-12 mb-3">
                                            <input type="text" name="name" class="form-control" id="first_name" placeholder=" Name" required>
                                        </div>
                                        <div class="col-12 mb-3">
                                            <input type="email" name="email" class="form-control" id="email" placeholder="Email">
                                        </div>

                                        <div class="col-12 mb-3">
                                            <input type="text" name="address" class="form-control mb-3" id="street_address" placeholder="Address">
                                        </div>
                                        <div class="col-12 mb-3">
                                            <input type="text" name="town" class="form-control" id="city" placeholder="Town">
                                        </div>
                                        <div class="col-12 mb-3">
                                            <input type="text" name="landmark" class="form-control" id="city" placeholder="Landmark">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <input type="number" name="code" class="form-control" id="zipCode" placeholder="Zip Code">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <input type="number" name="phone" class="form-control" id="phone_number"  placeholder="Phone No">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-4">
                                <div class="cart-summary" style="margin-top: unset;">
                                    <div class="row">
                                        <div class="col-md-12 mb-12">
                                            <h5>Cart Total</h5>
                                            <ul class="summary-table">
                                                <li><span>subtotal:</span> <span><%=total%> /-</span></li>
                                                <li><span>delivery:</span> <span>Free</span></li>
                                                <li><span>total:</span> <span><%=total%> /-</span></li>
                                            </ul>

                                            <div class="payment-method">
                                                <!-- Cash on delivery -->
                                                <div class="custom-control custom-checkbox mr-sm-2">
                                                    <input type="checkbox" class="custom-control-input" id="cod" checked>
                                                    <label class="custom-control-label" for="cod">Cash on Delivery</label>
                                                </div>
                                                <!-- Paypal -->
                                                <div class="custom-control custom-checkbox mr-sm-2">
                                                    <input type="checkbox" class="custom-control-input" id="paypal">
                                                    <label class="custom-control-label" for="paypal">Paypal <img class="ml-15" src="img/core-img/paypal.png" alt=""></label>
                                                </div>
                                            </div>

                                            <div class="cart-btn mt-80">
                                                <button type="submit" name="submit" class="btn amado-btn w-100">Pay</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%@include file="footer.jsp" %>