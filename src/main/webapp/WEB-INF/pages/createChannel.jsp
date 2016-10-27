<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/28/2016
  Time: 3:26:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="w3-container w3-green">
    <h2>Create Channeling</h2>
</div>


<form class="w3-container">

    <p>
        <select class="w3-select" name="option">
            <option value="" disabled selected>Select a Hospital</option>
            <option value="1">Option 1</option>
            <option value="2">Option 2</option>
            <option value="3">Option 3</option>
        </select></p>

    <p>
        <select class="w3-select" name="option">
            <option value="" disabled selected>Select a Doctor</option>
            <option value="1">Option 1</option>
            <option value="2">Option 2</option>
            <option value="3">Option 3</option>
        </select></p>

    <p>
        <label>Type</label>
        <input class="w3-input" type="text" value="VOG" disabled></p>


    <p>
        <select class="w3-select" name="option">
            <option value="" disabled selected>Select a Week day</option>
            <option value="1">Sunday</option>
            <option value="2">Monday</option>
            <option value="3">Tuesday</option>
            <option value="3">Wednesday</option>
            <option value="3">Thursday</option>
            <option value="3">Friday</option>
            <option value="3">Saturday</option>
        </select></p>
    <p>

        <label>Time</label>
        <input class="w3-input" type="time" name="bdaytime"></p>

    <p>
        <label>Max Patients</label>
        <input class="w3-input" type="number"/></p>

    <p>
        <label>User Name</label>
        <input class="w3-input" type="text" style="max-width: 200px"/></p>
    <p>
        <label>Password</label>
        <input class="w3-input" type="password" style="max-width: 200px"/></p>
    <p>
        <button class="w3-btn w3-blue">Register</button>
    </p>


</form>

</body>
</html>
