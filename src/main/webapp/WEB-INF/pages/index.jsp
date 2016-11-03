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
    <script src="js/sweetalert.min.js"></script>
    <link rel="stylesheet" href="css/sweetalert.css"/>
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
        <div>

            <% String s = (String) request.getAttribute("page2");
                if ("channelManager".equals(s)) {%>
            <jsp:include page='channelManager.jsp'/>
            <%} else if ("createChannel".equals(s)) {%>
            <jsp:include page='createChannel.jsp'/>
            <%} else if ("dashBoard".equals(s)) {%>
            <jsp:include page='dashBoard.jsp'/>
            <%} else if ("channelManager".equals(s)) {%>
            <jsp:include page='dashBoard.jsp'/>
            <%} else if ("createDoctor".equals(s)) {%>
            <jsp:include page='createDoctor.jsp'/>
            <%} else {%>
            <jsp:include page='dashBoard.jsp'/>
            <%}%>

        </div>


    </div>


    <div class="col-3 col-m-12">
        <p>
        <ul class="w3-navbar w3-blue-grey">
            <li><a href="/dashBoard">Dashboard</a></li>
            <li><a href="/channelManager">Channel Manager</a></li>
            <li><a href="/createDoctor">+ Doctor</a></li>
            <li><a href="/createChannel">+ Channel</a></li>
        </ul>

        </p>
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

<script>

    function readValue(object){
        return document.getElementById(object).value;
    }
    function writeValue(object,value){
        document.getElementById(object).value=value;
    }
    function readSelect(object) {
        var e = document.getElementById(object);
        return e.options[e.selectedIndex].value.split("#")[0];
    }

    function ajaxCall(servlet,parameters,callBackfn) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                callBackfn(this.responseText);
            }
        };
        xhttp.open("POST", servlet, true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send(parameters);
    }
</script>
</body>
</html>
