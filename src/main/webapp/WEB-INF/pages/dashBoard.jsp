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
<div class="w3-container w3-green">
    <h3>Dashboard  </h3>
    <span style="font-size:100%;"><b>ONLINE </b>, current patient no. of your doctor</span>
</div>
<div>
            <span >
                <p id="timeDiff" style="text-align: right;font-size:80%;">Select a Hospital, Doctor and Session to view their status</p>
            </span>
</div>
<div class="w3-container">

    <p class="watch">
    <span style="padding-right: 30px">


        </span>
        <label id="patientNo">00</label>
    <span style="padding-left: 30px">

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
        <select id="channelSessions" class="w3-select" name="option" onchange="startUpdating()">
            <option value="" disabled selected>Select Session</option>
        </select></p>
    <p>



</div>
</body>


<script>
 var updater;
     function startUpdating(){

         clearInterval(updater);
         setInnerHTML("timeDiff","wait . . .");
         updateChannel();
         updater = setInterval(updateChannel, 20000);
    }

 function updateChannel(){
     ajaxCall("/getChannelUpdateServlet",
             'channelId='+readSelect('channelSessions'),
             processChannelUpdate);
 }

 function processChannelUpdate(response){
        var patientNo=response.split("#")[0];
        var timeDiff=response.split("#")[1];

        setInnerHTML("patientNo",patientNo)
        setInnerHTML("timeDiff",timeDiff)
 }



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
