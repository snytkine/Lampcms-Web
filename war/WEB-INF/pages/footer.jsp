<%-- 
    Document   : footer.jsp
    Created on : Dec 9, 2012, 2:17:31 PM
    Author     : admin
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%
    GregorianCalendar currentDate = new GregorianCalendar();
    int currentYear = currentDate.get(Calendar.YEAR);
%>
<hr>
<footer>
    <p>&copy; LampCMS 2011 - <%= currentYear%></p>
</footer>
</div> 
<!-- /container -->

<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>