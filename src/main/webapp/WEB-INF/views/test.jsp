<%--
  Created by IntelliJ IDEA.
  User: Максим
  Date: 22.08.2020
  Time: 0:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="userName" value="${pageContext.request.userPrincipal.name != null ? pageContext.request.userPrincipal.name : ''}"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Hello</h1>
<h2>${tableName}</h2>
<table id="carsTable">
    <thead>
        <tr>
            <th>ID</th>
            <th>Модель</th>
        </tr>
    </thead>
    <tbody>
    </tbody>

</table>
</body>
<script>
    window.cars = JSON.parse('${cars}')
    function fillTaleCars(cars) {
	    var table = document.getElementById("carsTable");
	    let body = table.children[1];
	    for (let car of cars) {
		    let tr = document.createElement('tr');
		    let tdID = document.createElement('td');
		    tdID.innerText = car.id;
		    tr.append(tdID)
		    let tdModel = document.createElement('td');
		    tdModel.innerText = car.model;
		    tr.append(tdModel)
            body.append(tr);
        }

    }

    fillTaleCars(cars);


</script>

</html>
