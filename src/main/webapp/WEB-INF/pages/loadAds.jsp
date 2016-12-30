<%@ page import="com.mkpt.DBLink" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="com.mkpt.Cnst" %>
<%--
  Created by IntelliJ IDEA.
  User: MalindaK
  Date: 12/25/2016
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="w3-container w3-green">
    <h2>Add Advertisements</h2>
</div>

<p>
    <select id="LAhospital" class="w3-select" name="option">
        <option value="" disabled selected>Select a Hospital</option>
        <% JSONArray hospitals = DBLink.getHospitalsForAds();
            for (int i = 0; i < hospitals.size(); i++) {
                JSONObject hospt = (JSONObject) hospitals.get(i);
                String id = (String) hospt.get(Cnst.HOSPT_ID);
                String name = (String) hospt.get(Cnst.HOSPT_NAME);
                String adCount = (String) hospt.get(Cnst.HOSPT_NO_OF_ADS);
        %>
        <option data-adcount="<%=adCount%>" data-hosptid="<%=id%>" id="opt<%=id%>"><%=name%>
        </option>
        <%}%>
    </select>
</p>
<p>
        <%
        for (int i = 0; i < 3; i++) {
    %>

<p><input id="img<%=i%>" class="w3-input" type="file" onchange="loadImageFile(<%=i%>)">
    <img id="prev<%=i%>" style="width:70px;height:40px;" src="img/noImageSmall.jpg" /></p>
<%}%>
</p>
<span style="float: right">
        <button class="w3-btn w3-orange" onclick="saveChanges()">Save Changes</button>
</span>
<jsp:include page='auth.jsp'/>

</body>


<script>
    function saveChanges() {
        swal({
                    title: "Saving Ads",
                    text: "Are You Sure ?",
                    type: "info",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    showLoaderOnConfirm: true,
                },
                function(){
                    ajaxCall("/loadAdPhotosServlet",
                            'hosptID='+readSelectData('LAhospital','hosptid')+
                            '&img0='+img0+
                            '&img1='+img1+
                            '&img2='+img2+
//                            '&img3='+img3+
                            '&email='+readValue("email")+
                            '&pwd='+readValue("pwd")
                            ,processResponse);
                });

    }
    function processResponse(response){
        if(response==""){
            swal("Done", "Images Saved", "success");
//                window.location.href="/dashBoard";
        }else{
            swal("Opps..", response, "error");
        }
    }

</script>
</html>
