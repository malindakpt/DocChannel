<%@ page import="com.mkpt.DBLink" %>
<%@ page import="java.util.List" %>
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


<div class="w3-container">
    <%--<select class="w3-select" name="option">--%>
        <%--<option value="0">Search by Hospital</option>--%>
        <%--<option value="1">Search by Doctor</option>--%>
    <%--</select>--%>

    <p class="watch">
        24
    </p>

        <p>
            <select id="hospital" class="w3-select" name="option"  onchange="setDoctors()">
                <option value="" disabled selected>Select a Hospital</option>
                <%List<String> hospitals= DBLink.getHospitals();%>
                <%for (int i = 0; i < hospitals.size(); i++) {%>
                <%
                    String id=hospitals.get(i).split("#")[0];
                    String hosp=hospitals.get(i).split("#")[1];
                %>
                <option value="<%=id%>"><%=hosp%></option>
                <%}%>
            </select>
        </p>

    <p>
        <select id="docList" class="w3-select" name="option">
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


</div>
<script>
    function processResponse(response){

            addElementsToSelect("docList",response);
        swal({
            title: "Wait. . .",
            text: "",
            timer: 1,
            showConfirmButton: false
        });
            //swal("Opps..", response, "error");

    }

    function setDoctors(){
        swal({
            title: "Loading Doctors. . . ",
            text: "Please wait few seconds",
            timer: 20000,
            showConfirmButton: false
        });

        var hospId=readSelect("hospital");

        ajaxCall("/getDoctorListOfHospitalServlet",
                'hospId='+hospId,processResponse);

    }
</script>
</body>
</html>
