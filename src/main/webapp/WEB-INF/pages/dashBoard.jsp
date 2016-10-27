<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/26/2016
  Time: 7:09:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<div class="w3-container w3-green">
    <h2>Dashboard</h2>
</div>


<form class="w3-container">
    <select class="w3-select" name="option">
        <option value="0">Search by Hospital</option>
        <option value="1">Search by Doctor</option>
    </select>

    <p class="watch">
        24
    </p>

    <p>
        <select class="w3-select" name="option">
            <option value="" disabled selected>Select Hospital</option>
            <option value="1">Option 1</option>
            <option value="2">Option 2</option>
            <option value="3">Option 3</option>
        </select></p>

    <p>
        <select class="w3-select" name="option">
            <option value="" disabled selected>Select Doctor</option>
            <option value="1">Option 1</option>
            <option value="2">Option 2</option>
            <option value="3">Option 3</option>
        </select></p>
    <p>
        <label>Hospital Contact No</label>
        <input class="w3-input" type="text" value="0771141194" disabled></p>

    <button class="w3-btn w3-blue">Register</button>
    </p>


</form>

</body>
</html>
