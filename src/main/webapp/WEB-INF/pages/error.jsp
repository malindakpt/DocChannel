<%--
  Created by IntelliJ IDEA.
  User: MalindaK
  Date: 11/14/2016
  Time: 6:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>


<div  class=" w3-container w3-red">


    <div  style="padding: 20px;">
        <div style="font-size:150%;">Sorry, this service is currently unavailable !</div>
        <br>
        <div style="font-size:100%;">Please try again after few minutes or contact docvisit.lk for more details</div>
        <br>
        <div style="font-size:70%;">
            Error code : <%=request.getParameter("msg")%>
        </div>
    </div>

</div>


</body>
</html>
