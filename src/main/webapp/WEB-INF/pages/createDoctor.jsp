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
        <input id="docName" class="w3-input" type="text"></p>

    <p>
        <label>Phone number</label>
        <input id="docPhone" class="w3-input" type="text"></p>

    <p></p>

    <p>
        <select id="docType" class="w3-select" name="option">
            <option value="" disabled selected>Select Category</option>
            <%List<String> types= DBLink.getTypes();%>
            <%for (int i = 0; i < types.size(); i++) {%>
            <%
                String id=types.get(i).split("#")[0];
                String type=types.get(i).split("#")[1];
            %>
                <option value="<%=id%>"><%=type%></option>
            <%}%>
        </select>
    </p>

    <jsp:include page='auth.jsp'/>
    <p>
        <button class="w3-btn w3-blue" onclick="tryAdd()">Register</button>
    </p>


</div>

<script>
    function addDOctor(response){
        if(response==""){
            swal("Done", "Doctor profile created", "success");
        }else{
            swal("Opps..", response, "error");
        }

    }

    function tryAdd(){
        ajaxCall("/createDoctorServlet","docName="+readValue("docName")+'&docPhone='+readValue("docPhone")+'&docType='+readSelect("docType")
                +'&email='+readValue("email")+'&pwd='+readValue("pwd"),addDOctor);
    }

</script>
</body>
</html>
