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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/template.css">
    <link rel="stylesheet" type="text/css" href="css/w3css.css">
    <script src="js/sweetalert.min.js"></script>
    <link rel="stylesheet" href="css/sweetalert.css"/>
    <title></title>
</head>
<body>

<div class="header">
    <span class="inlineMenu"><img class="logo" src="img/logo1.png"/></span>
    <span class="topic">docvisit   </span>
    <span class="topic2">.lk</span>

</div>

<div class="row">


    <div class="hideInMobile col-3 col-m-3">

        <div class=" aside">
            <br><br>

            <h2>Don't waste your time at channeling centers</h2>
            <br>

            <p>NOW you can, Reach the channeling center on time</p>

            <h3>Wait at home until your number calls</h3>


            <p>You will be assisted by...</p>
            <br>

            <h2>docvisit.lk</h2>

            <h4>Automated Patient Assistant</h4>
            <br>

        </div>

    </div>

    <div class="col-6 col-m-9">
        <div>

            <%try {%>
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
            <%} else if ("loadAds".equals(s)) {%>
            <jsp:include page='loadAds.jsp'/>
            <%} else {%>
            <jsp:include page='dashBoard.jsp'/>
            <%}%>
            <%} catch (Exception e) {%>
            <jsp:include page='error.jsp?msg=DBL001'/>
            <%}%>
        </div>


    </div>


    <div class="col-3 col-m-12">

        <div class="hideInMobile aside">

            <br><br>

            <h1>Its easy, 3 Steps</h1>

            <br>

            <h3>Select a Hospital</h3>

            <h3>Select a Doctor</h3>

            <h3>Select a channeling session</h3>

            <p>You can view current patient number online from mobile</p>


        </div>

        <%--<div class="hideInMobile col-3 col-m-3 menu">--%>
        <%--<ul>--%>
        <%--<li>The Flight</li>--%>
        <%--<li>The City</li>--%>
        <%--<li>The Island</li>--%>
        <%--<li>The Food</li>--%>
        <%--</ul>--%>


        <%--</div>--%>
        <br>

        <div class="hideInMobile aside2 menu">
            <ul>
                <a href="/loadAds">
                    <li>Load Ads</li>
                </a>
                <a href="/dashBoard">
                    <li>Dashboard</li>
                </a>
                <a href="/channelManager">
                    <li>Channel Manager</li>
                </a>
                <a href="/createDoctor">
                    <li>Add Doctor</li>
                </a>
                <a href="/createChannel">
                    <li>Add Channel</li>
                </a>
            </ul>

        </div>

    </div>

</div>

<div class="footer">
    <p>Powered by MSOFT Software Solutions 2016</p>
</div>

<script>

    oFReader = new FileReader(), rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;
    oFReader.onload = function (oFREvent) {

        //createSmallImage(oFREvent);
        var img = new Image();
        img.onload = function () {
            var canvas = document.createElement("canvas");
            var ctx = canvas.getContext("2d");
            var oWidth=img.width;
            var oHeight=img.height;
            var expWidth=10;
            var expHeight=10;
//
//            if(oWidth>oHeight){
//
//                if(oWidth>expWidth){
//                    canvas.width = expWidth;
//                }else{
//                    canvas.width = oWidth;
//                }
//                canvas.height = canvas.width*oHeight/oWidth;
//
//            }else{
//                if(oHeight>expHeight){
//                    canvas.height = expHeight;
//                }else{
//                    canvas.height = oHeight;
//                }
//                canvas.width = canvas.height*oWidth/oHeight;
//            }
            canvas.height = 50;
            canvas.width = 50;

            ctx.drawImage(img, 0, 0, img.width, img.height, 0, 0, canvas.width, canvas.height);
 //           document.getElementById("prev" + window.idx).src = canvas.toDataURL();

            if (window.idx === 0) {
                img0 = canvas.toDataURL();
            } else if (window.idx === 1) {
                img1 = canvas.toDataURL();
            } else if (window.idx === 2) {
                img2 = canvas.toDataURL();
            } else if (window.idx === 3) {
                img3 = canvas.toDataURL();
            }
        }
        img.src = oFREvent.target.result;
    };
    function loadImageFile(idx) {
        document.getElementById("prev" + idx).src = "img/loading.gif";

        window.idx = idx;
        if (document.getElementById("img" + idx).files.length === 0) {
            return;
        }
        var oFile = document.getElementById("img" + idx).files[0];
        if (!rFilter.test(oFile.type)) {
            alert("You must select a valid image file!");
            return;
        }
        oFReader.readAsDataURL(oFile);
    }

    function readValue(object) {
        return document.getElementById(object).value;
    }
    function writeValue(object, value) {
        document.getElementById(object).value = value;
    }
    function readSelect(object) {
        var e = document.getElementById(object);
        return e.options[e.selectedIndex].value.split("#")[0];
    }

    function readSelectData(object,prop) {
        var e = document.getElementById(object);
        return e.options[e.selectedIndex].dataset[prop];
    }
    function readInnerHTML(object) {
        return document.getElementById(object).innerHTML;
    }
    function setInnerHTML(object, value) {
        return document.getElementById(object).innerHTML = value;
    }

    function ajaxCall(servlet, parameters, callBackfn) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                callBackfn(this.responseText);
            }
        };
        xhttp.open("POST", servlet, true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send(parameters);
    }

    function addElementsToSelect(object, list, defaultVal) {

        var select = document.getElementById(object);
        select.innerHTML = "";

        var docList = list.split("$");

        var opt0 = document.createElement("option");
        opt0.disabled = true;
        opt0.value = "1000-1000";
        opt0.textContent = defaultVal;
        select.appendChild(opt0);

        docList.forEach(function (item, index) {
            try {
                if (index > 0) {
                    var opt = document.createElement("option");
                    opt.value = item.split("#")[0];
                    opt.textContent = item.split("#")[1];
                    select.appendChild(opt);
                }
            } catch (e) {
                console.log(e);
            }
        });

        select.selectedIndex = 0;
    }
</script>


</body>
</html>
