<%@page import="com.collagemanagement.bean.FeesDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%	FeesDetails fees = (FeesDetails)request.getSession(false).getAttribute("fees"); %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Payment Invoice</title>
    <link rel="stylesheet" href="assets/css/color/style.css" media="all" />
  </head>
  
  
  <body>
    <header class="clearfix">
      <div id="logo">
        <img src="assets/images/Educhamp_logo.png">
        <img src="assets/images/Black.png">
      </div>
      <div id="company">
        <h2 class="name">Educhamp</h2>
        <div>455 Foggy Heights, AZ 85004, US</div>
        <div>(602) 519-0450</div>
        <div><a href="mailto:company@example.com">company@example.com</a></div>
      </div>
      </div>
    </header>
    <main>
      <div id="details" class="clearfix">
        <div id="client">
          <div class="to">INVOICE TO:</div>
        <%--   <h2 class="name"   <%=fees.getUsername() %> > </h2> --%>         
        <%--   <div class="email"  <%=fees.getAmount() %>   > <a href=""></a></div> --%>
        </div>
        <div id="invoice">
          <h1>INVOICE 3-2-1</h1>
          <div class="date"  <%=fees.getPaymentdate() %>></div>          
        </div>
      </div>
      <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th class="no">#</th>
            <th class="desc">DESCRIPTION</th>
            <th class="unit">UNIT PRICE</th>
            <th class="total">TOTAL</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="no">01</td>
            <td class="desc"><h3>Fees Payment</h3>Creating a recognizable design solution based on the company's existing visual identity</td>
            <td class="unit"  <%=fees.getAmount() %> ></td>
            <td class="total" <%=fees.getAmount() %> ></td>
          </tr>
        </tbody>
        <tfoot>         
          <!-- <tr>
            <td colspan="2"></td>
            <td colspan="2">TAX 25%</td>
            <td>$1,300.00</td>
          </tr> -->
          <tr>
            <td colspan="2"></td>
            <td colspan="2">GRAND TOTAL</td>
            <td><%=fees.getAmount() %></td>
          </tr>
        </tfoot>
      </table>
      <div id="thanks">Thank you!</div>
      <div id="notices">
        <div>NOTICE:</div>
        <div class="notice">A finance charge of 1.5% will be made on unpaid balances after 30 days.</div>
      </div>
    </main>
    <footer>
      
    </footer>
  </body>
</html>