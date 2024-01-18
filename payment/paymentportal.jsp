
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DataBase.ConnectionClass" id="con"></jsp:useBean>
<%
    String upt = "update tbl_orderhead  set od_headstatus='pending' where od_id='" + session.getAttribute("od_id") + "'";
    boolean bb = con.insert(upt);
    if (bb) {
        String upt2 = "update tbl_order_details  set odt_status='pending' where od_id='" + session.getAttribute("od_id") + "'";
        boolean bb2 = con.insert(upt2);
        if (bb2) {
            response.sendRedirect("process1.jsp");
        } else {
%>
<script>
    window.alert("Error.");

    window.location.href = "../home.jsp";
</script>
<%
    }

} else {
%>
<script>
    window.alert("Error");

    window.location.href = "../home.jsp";
</script>
<%
    }
%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Payment Checkout Form</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <div class="wrapper">
            <div class="payment">
                <div class="payment-logo">
                    <p>p</p>
                </div>

                <form method="get">
                    <h2>Payment Gateway</h2>
                    <div class="form">
                        <div class="card space icon-relative">
                            <label class="label">Card holder:</label>
                            <input type="text" class="input" pattern="[A-Za-z]+" placeholder="Holder name" required="">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="card space icon-relative">
                            <label class="label">Card number:</label>
                            <input type="text" class="input" data-mask="0000 0000 0000 0000" placeholder="0000 0000 0000 0000" required="">
                            <i class="far fa-credit-card"></i>
                        </div>
                        <div class="card-grp space">
                            <div class="card-item icon-relative">
                                <label class="label">Expiry date:</label>
                                <input type="text" name="expiry-data" class="input" data-mask="00 / 00"  placeholder="00 / 00" required="">
                                <i class="far fa-calendar-alt"></i>
                            </div>
                            <div class="card-item icon-relative">
                                <label class="label">CVC:</label>
                                <input type="number" min="99" max="999" class="input" data-mask="000" placeholder="000" required="">
                                <i class="fas fa-lock"></i>
                            </div>
                        </div>
                        <button name="route" value="<?php echo $_GET['rt_id'] ?>" class="btn">pay now</button>
                        <br>
                        <li><a href="../home.jsp"><b>Home</b></a></li>
                    </div>
                </form>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>


    </body>
</html>