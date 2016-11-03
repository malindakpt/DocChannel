<%@ page import="com.mkpt.DBLink" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/28/2016
  Time: 4:18:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="w3-container w3-red">
    <h2>Channel Manager</h2>
</div>
<div class="w3-container">

    <p>

    <h3><b>Asiri Hospital</b></h3>

    <p class="watch">
    <span style="padding-right: 30px">
        <button class="w3-btn w3-blue" style="font-size: 20px;">Prev</button>
        </span>
        24
    <span style="padding-left: 30px">
        <button class="w3-btn w3-blue" style="font-size: 20px;">Next</button>
        </span>
    </p>
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
        <select id="docList" class="w3-select" name="option"  onchange="setChannelSessions()">
            <option value="" disabled selected>Select Doctor</option>
        </select></p>
    <p>
    <p>
        <select id="channelSessions" class="w3-select" name="option">
            <option value="" disabled selected>Select Channelling Session</option>
        </select></p>
    <p>

    <jsp:include page='auth.jsp'/>

</div>
</body>


<script>

    function setChannelSessions(){
        swal({
            title: "Loading Sessions. . . ",
            text: "Please wait few seconds",
            timer: 20000,
            showConfirmButton: false
        });
        var hospId=readSelect("hospital");
        var docId=readSelect("docList");
        ajaxCall("/getChannelSessionsServlet",
                'hospId='+hospId+
                '&docId='+docId,
                        processChannels);
    }
    function processChannels(response){
        addElementsToSelect("channelSessions",response,"Select a Channelling Session");
        swal({
            title: "Wait. . .",
            text: "",
            timer: 1,
            showConfirmButton: false
        });
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
    function processResponse(response){
        addElementsToSelect("docList",response,"Select a Doctor");
        addElementsToSelect("channelSessions","","Select Channelling Session");
        swal({
            title: "Wait. . .",
            text: "",
            timer: 1,
            showConfirmButton: false
        });
    }

</script>
</html>
