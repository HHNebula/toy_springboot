<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>CRUD Practice</title>
</head>

<body>
    <%-- Header Nav Include --%>
    <%@ include file="../common/header.jsp" %>
    <div class="container">
        <%@ include file="../common/statuscommon.jsp" %>
        <div class="my-5 mx-3 text-center">
            <c:forEach items="${carList}" var="car" varStatus="status">
                <a class="btn ${car.get("CUID") == cuid ? 'btn-dark' : 'btn-outline-dark'}" href="/status/satisfaction/${car.get("CUID")}">${car.get("BRAND")} ${car.get("MODEL")}</a>
            </c:forEach>
        </div>
        <c:forEach items="${carList}" var="car" varStatus="status">
            <c:if test="${car.get('CUID') == cuid}">
                <img class="img-fluid" style="width:30vw; display: block; margin: 0 auto;" src="../../../resource/img/${car.get("MODEL")}.png" alt="">
            </c:if>
        </c:forEach>
        <table class="table text-center my-5 table-striped">
            <thead class="table-dark">
                <tr>
                    <th class="col-1">#</th>
                        <c:forEach items="${answerList}" var="answer" varStatus="status">
                            <th class="col-2">${answer.get("ANSWER")}</th>
                        </c:forEach>
                <tr>
            </thead>
            <tbody>
                <c:forEach items="${questionList}" var="question" varStatus="status">
                    <tr>
                        <td class="col-1">${question.get("QUESTION")}</td>
                        <td class="col-2">${satisfactionList[status.index].get("A1")}</td>
                        <td class="col-2">${satisfactionList[status.index].get("A2")}</td>
                        <td class="col-2">${satisfactionList[status.index].get("A3")}</td>
                        <td class="col-2">${satisfactionList[status.index].get("A4")}</td>
                        <td class="col-2">${satisfactionList[status.index].get("A5")}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>