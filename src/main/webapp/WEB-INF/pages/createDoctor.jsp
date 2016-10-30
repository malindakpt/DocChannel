<%@ page import="java.util.List" %>
<%@ page import="com.mkpt.DBLink" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/26/2016
  Time: 7:14:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title></title>
</head>
<body>

<div class="w3-container w3-green">
    <h2>Create Doctor</h2>
</div>


<div class="w3-container">
    <p>
        <label>Name</label>
        <input class="w3-input" type="text"></p>

    <p>
        <label>Phone number</label>
        <input class="w3-input" type="text"></p>

    <p></p>

    <p>
        <select class="w3-select" name="option">
            <option value="" disabled selected>Select Category</option>
            <%List<String> types= DBLink.getTypes();%>
            <%for (int i = 0; i < types.size(); i++) {%>
                <option value="1"><%=types.get(i)%></option>
            <%}%>
        </select></p>

    <p>
        <button class="w3-btn w3-blue" onclick="addDOctor()">Register</button>
    </p>


</div>

<script>
    function addDOctor(){
        swal("Oops...", "asd", "error");
    }


</script>
</body>
</html>
