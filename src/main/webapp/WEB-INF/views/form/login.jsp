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
        <div class="fs-1 text-center mt-5 mb-3">Login To Survey Page</div>
        <form action="/form/login" method="post">
            <div class="row d-flex justify-content-center">
                <div class="col-3 my-3">
                    <label class="form-label" for="id">ID</label>
                    <input class="form-control w-100" type="text" name="id" id="id" required>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-3 my-3">
                    <label class="form-label" for="pw">Password</label>
                    <input class="form-control w-100" type="password" name="pw" id="pw" required>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-3 my-3">
                    ${msg}
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-3 my-3">
                    <button class="btn btn-dark w-100" type="submit">Login</button>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-3 my-3">
                    <a class="btn btn-outline-dark w-100" href="/form/signup">Sign Up</a>
                </div>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>

</html>