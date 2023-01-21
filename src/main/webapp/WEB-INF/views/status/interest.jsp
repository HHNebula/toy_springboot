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
        <div class="d-flex justify-content-center">
            <table class="table text-center my-5 table-striped" style="width: 50vw;">
                <thead class="table-dark">
                    <tr class="text-center">
                        <th class="col-2">차량</th>
                        <th class="col-2">관심수</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${carList}" var="car" varStatus="status">
                    <tr>
                        <td class="col-2 my-5">
                            <div class="fs-4">
                                ${car.get("BRAND")} ${car.get("MODEL")}
                            </div>
                            <div style="">
                                <img class="" style="display: block; margin: 0 auto; width:15vw;" src="../../../resource/img/${car.get("MODEL")}.png" alt="">
                            </div>
                        </td>
                        <td class="col-2 fs-1 align-middle">
                            ${interestList.get(car.get("CUID"))}<span class="fs-5">명</span>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>