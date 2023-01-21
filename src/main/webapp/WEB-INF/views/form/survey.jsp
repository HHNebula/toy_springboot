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
        <div class="fs-1 text-center mt-5 mb-3">To Submit A Survey</div>
        <div class="text-center mt-3 mb-3">
            ${userInfo.get("NICK_NAME")}님 환영합니다.
        </div>
        <div class="text-center mt-3 mb-3">
            <a href="/form/mypage" class="btn btn-outline-dark">마이페이지</a>
            <a href="/form/logout" class="btn btn-dark">로그아웃</a>
        </div>
        <form action="/form/survey" method="post" id="surveyForm">
            <input type="hidden" name="cuid" id="cuid" value="${carInfo.get("CUID")}">
            <div class="row d-flex justify-content-center">
                <div class="col-6 my-3 text-center">
                    선택하신 관심 차종 ${carInfo.get("BRAND")} ${carInfo.get("MODEL")} 에 대한 설문입니다.
                </div>
            </div>
            <div>
                <img class="my-3" style="width:40vw; display: block; margin: 0 auto;" src="../../../resource/img/${carInfo.get("MODEL")}.png" alt="">
            </div>
            <c:forEach items="${questionList}" var="question" varStatus="status">
            <div class="row d-flex justify-content-center">
                <div class="col-5 my-3 text-center">
                    <div class="card">
                        <div class="card-header text-bg-secondary">
                            ${question.get("QUESTION")}에 대한 만족도를 선택해주세요.
                        </div>
                        <div class="card-body">
                            <c:forEach items="${answerList}" var="answer" varStatus="status">
                            <span>
                                <input class="form-check-input" type="radio" id="${question.get("QUID")}${answer.get("AUID")}" name="${question.get("QUID")}" value="${answer.get("AUID")}" required>
                                <label class="form-check-label" for="${question.get("QUID")}${answer.get("AUID")}">${answer.get("ANSWER")}</label>
                            </span>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
            <div class="row d-flex justify-content-center">
                <div class="col-6 my-3 text-center">
                    <button class="w-75 btn btn-dark" type="submit">Submit</button>
                </div>
            </div>
        </form>
    </div>

    <script type="text/javascript" src = "../../../resource/js/survey.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>