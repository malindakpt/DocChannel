<%@ page import="com.mkpt.DBLink" %>
<%@ page import="java.util.List" %>
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


<div class="w3-container">

    <p>
        <select id="hospital" class="w3-select" name="option">
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

        <select id="doctor" class="w3-select" name="option" onchange="setType()">
            <option value="" disabled selected>Select a Doctor</option>
            <%List<String> doctors= DBLink.getDoctors();%>
            <%for (int i = 0; i < doctors.size(); i++) {%>
            <%
                String id=doctors.get(i).split("#")[0]+"#"+doctors.get(i).split("#")[2];
                String doc=doctors.get(i).split("#")[1];
            %>
            <option value="<%=id%>"><%=doc%></option>
            <%}%>
        </select>


    <p>
        <label>Type</label>
        <input id="docType" class="w3-input" type="text" value="Doctor Type" disabled></p>


    <p>
        <select id="weekDay" class="w3-select" name="option">
            <option value="" disabled selected>Select a Week day</option>
            <option value="Sunday">Sunday</option>
            <option value="Monday">Monday</option>
            <option value="Tuesday">Tuesday</option>
            <option value="Wednesday">Wednesday</option>
            <option value="Thursday">Thursday</option>
            <option value="Friday">Friday</option>
            <option value="Saturday">Saturday</option>
        </select></p>
    <p>

        <label>Time</label>
        <input id="time" class="w3-input" type="time" name="bdaytime"></p>

    <p>
        <label>Max Patients</label>
        <input id="max" class="w3-input" type="number"/></p>

    <jsp:include page='auth.jsp'/>
    <p>
        <button class="w3-btn w3-blue" onclick="createChannel()">Register</button>
    </p>

    <script>

        function processResponse(response){
            if(response==""){
                swal("Done", "Channel session created", "success");
//                window.location.href="/dashBoard";
            }else{
                swal("Opps..", response, "error");
            }
        }


        function createChannel(){
            swal({
                        title: "Creating New Session",
                        text: "Are You Sure ?",
                        type: "info",
                        showCancelButton: true,
                        closeOnConfirm: false,
                        showLoaderOnConfirm: true,
                    },
                    function(){
                        ajaxCall("/createChannelServlet",
                                'hospital='+readSelect("hospital")+
                                '&docId='+readSelect("doctor")+
                                '&weekDay='+readSelect("weekDay")+
                                '&time='+readValue("time")+
                                '&max='+readValue("max")+
                                '&email='+readValue("email")+
                                '&pwd='+readValue("pwd")
                                ,processResponse);
                    });
        }


        function setType(){
            var e = document.getElementById("doctor");
            var type = e.options[e.selectedIndex].value.split("#")[1];
            writeValue("docType",type);
        }



    </script>

</div>

</body>
</html>
