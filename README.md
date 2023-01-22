# Spring - Mybatis CRUD Practice Project

## 📃 Info 🔍

### 📅 개발기간
2023-01-20 ~ 2023-01-21

### 📚 기술스텍
<img src="https://img.shields.io/badge/Java-FFFFFF?style=flat&logo=OpenJDK&logoColor=black" /><img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white" /><img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white" /><img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white" />
<br>
<img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=flat&logo=Spring Boot&logoColor=white" /><img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white" /><img src="https://img.shields.io/badge/MyBatis-000000?style=flat&logo=MyBatis&logoColor=white" /><img src="https://img.shields.io/badge/Servlet-000000?style=flat&logo=Servlet&logoColor=white" /><img src="https://img.shields.io/badge/JSP-000000?style=flat&logo=JSP&logoColor=white" />

### ❓ 개발목적
MVC 패턴 ( Client > Servlet > Service > DAO > DB ) 에 대해 이해한다.

<a href="https://velog.io/@hh_nebula/series/%EC%9B%B9-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-%ED%95%99%EC%8A%B5%EB%85%B8%ED%8A%B8">웹 프로그래밍 학습 노트</a>

<hr>

### 설문조사 Page 로그인 필터

```java
@WebFilter(value = { "/form/*", "/form" })
public class FromFilter implements Filter {

    private static final String[] whitelist = { "/form/login", "/form/logout", "/form/signup" };

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String requestURI = httpRequest.getRequestURI();
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        if (isLoginCheckPath(requestURI)) {
            HttpSession session = httpRequest.getSession(false);
            if (session == null || session.getAttribute("userInfo") == null) {
                httpResponse.sendRedirect("/form/login");
                return;
            }
        }
        chain.doFilter(httpRequest, httpResponse);
        return;
    }

    private boolean isLoginCheckPath(String requestURI) {
        return !PatternMatchUtils.simpleMatch(whitelist, requestURI);
    }

}
```

### 로그인 실패 시 메세지 전달
```java
@PostMapping(value = "/login")
public Object loginPost(@RequestParam Map<String, Object> params, ModelAndView modelAndView,
        HttpSession session) {

    Object userInfo = formService.loginAttempt(params);

    if (userInfo == null) {
        modelAndView.addObject("msg", "로그인 정보가 불일치합니다.");
        modelAndView.setViewName("form/login");
        return modelAndView;
    } else {
        session.setAttribute("userInfo", userInfo);
        return "redirect:/form/survey";
    }

}
```

### View 재사용
```java
...
<div class="fs-1 text-center mt-5 mb-3">${userInfo == null ? 'Sign Up To Survey' : 'My Page'}</div>
<form action="/form/${userInfo == null ? 'signup' : 'mypage'}" method="post" id="userForm">
<c:if test="${userInfo != null}">
    <input type="hidden" name="muid" id="muid" value="${userInfo.get("MUID")}">
</c:if>
    <div class="row d-flex justify-content-center">
        <div class="col-3 my-3">
            <label class="form-label" for="id">ID</label>
            <input class="form-control w-100" type="text" name="id" id="id" value="${userInfo.get("ID")}" required>
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="col-3 my-3">
            <label class="form-label" for="pw">Password</label>
            <input class="form-control w-100" type="password" name="pw" id="pw" value="${userInfo.get("PW")}"required>
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
                <input class="form-check-input" type="radio" id="${car.get("CUID")}" name="cuid" value="${car.get("CUID")}" ${userInfo.get("CUID") == car.get("CUID") ? 'checked' :  '' } required>
                <label class="form-check-label" for="${car.get("CUID")}">${car.get("BRAND")} ${car.get("MODEL")}</label>
            </div>
            </c:forEach>
        </div>
    </div>
    <div class="row d-flex justify-content-center">
        <div class="col-3 my-3">
        <c:if test="${userInfo == null}">
            <button class="btn btn-dark w-100" type="submit" id="insertButton">가입하기</button>
        </c:if>
        <c:if test="${userInfo != null}">
            <button class="btn btn-dark w-100" type="submit" id="updateButton">수정하기</button>
        </c:if>
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
...
```