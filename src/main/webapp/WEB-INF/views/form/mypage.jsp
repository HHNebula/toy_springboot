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
        <div class="fs-1 text-center mt-5 mb-3">${userInfo == null ? 'Sign Up To Survey' : 'My Page'}</div>
        <form action="/form/${userInfo == null ? 'signup' : 'mypage'}" method="post" id="userForm">
            <input type="hidden" name="muid" id="muid" value="${userInfo.get("MUID")}">
            <div class="row d-flex justify-content-center">
                <div class="col-3 my-3">
                    <label class="form-label" for="id">ID</label>
                    <input class="form-control w-100" type="text" name="id" id="id" value="${userInfo.get("ID")}" required>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-3 my-3">
                    <label class="form-label" for="pw">Password</label>
                    <input class="form-control w-100" type="text" name="pw" id="pw" value="${userInfo.get("PW")}"required>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-3 my-3">
                    <label class="form-label" for="nickName">닉네임</label>
                    <input class="form-control w-100" type="text" name="nickName" id="nickName" value="${userInfo.get("NICK_NAME")}" required>
                </div>
            </div>
            <input type="hidden" name="allowLogin" id="allowLogin" value="Y">
            <div class="row d-flex justify-content-center">
                <div class="col-3 my-3">
                    <label class="form-label" for="cuid">관심 전기 차량</label>
                    <c:forEach items="${cars}" var="car" varStatus="loop">
                    <div>
                        <input type="radio" name="cuid" value="${car.get("CUID")}" ${userInfo.get("CUID") == car.get("CUID") ? 'checked' :  '' }>
                        <label class="form-label" for="cuid">${car.get("BRAND")} ${car.get("MODEL")}</label>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-3 my-3">
                    <button class="btn btn-dark w-100" type="submit" id="${userInfo == null ? 'insertButton' : 'updateButton'}">${userInfo == null ? '가입하기' : '수정하기'}</button>
                </div>
            </div>
        </form>
        <c:if test="${userInfo != null}">
        <form action="/form/delete" method="post" id="dropForm">
            <input type="hidden" name="muid" id="muid" value="${userInfo.get("MUID")}">
            <div class="row d-flex justify-content-center">
                <div class="col-3 my-3">
                    <div class="btn btn-danger w-100" id="dropButton">탈퇴하기</div>
                </div>
            </div>
        </form>
        </c:if>
    </div>
    <script type="text/javascript" src = "../../../resource/js/mypage.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>