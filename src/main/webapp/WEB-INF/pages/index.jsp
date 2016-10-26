<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/24/2016
  Time: 9:44:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="css/template.css">
  <link rel="stylesheet" type="text/css" href="css/w3css.css">
    <title></title>
</head>
<body>

<div class="header">
  <h1>Chania</h1>
</div>

<div class="row">
  <div class="col-3 col-m-3 menu">
    <ul>
      <li>The Flight</li>
      <li>The City</li>
      <li>The Island</li>
      <li>The Food</li>
    </ul>
  </div>

  <div class="col-6 col-m-9">

    <div class="w3-container w3-green">
      <h2>Create Doctor</h2>
    </div>


    <form class="w3-container">
      <p>
        <label>Name</label>
        <input class="w3-input" type="text"></p>
      <p>
        <label>Phone number</label>
        <input class="w3-input" type="text"></p>
      <br>
      <p>
        <select class="w3-select" name="option">
          <option value="" disabled selected>Select Category</option>
          <option value="1">Option 1</option>
          <option value="2">Option 2</option>
          <option value="3">Option 3</option>
        </select></p>

      <p>
      <button class="w3-btn w3-blue">Register</button>
      </p>


    </form>
  </div>



















  <div class="col-3 col-m-12">
    <div class="aside">
      <h2>What?</h2>
      <p>Chania is a city on the island of Crete.</p>
      <h2>Where?</h2>
      <p>Crete is a Greek island in the Mediterranean Sea.</p>
      <h2>How?</h2>
      <p>You can reach Chania airport from all over Europe.</p>
    </div>
  </div>

</div>

<div class="footer">
  <p>Resize the browser window to see how the content respond to the resizing.</p>
</div>
</body>
</html>
