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
    <div class="container">
        <div class="fs-1 text-center mt-5 mb-3">CRUD 연습</div>
        <div class="row row-cols-1 row-cols-md-2 mb-3 text-center">
            <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3 text-bg-dark">
                        <h4 class="my-0 fw-normal">Public</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">Survey</h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>로그인&아웃 / 회원 가입&수정&탈퇴</li>
                            <li>설문 등록</li>
                        </ul>
                        <a href="/form" type="button" class="w-100 btn btn-lg btn-outline-dark">Link</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3 text-bg-dark">
                        <h4 class="my-0 fw-normal">Public</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">Status</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>관심 차량 현황</li>
                            <li>차량별 설문 결과</li>
                        </ul>
                        <a href="/status" type="button" class="w-100 btn btn-lg btn-outline-dark">Link</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>