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

## View

<a href="https://github.com/HHNebula/toy_springboot/blob/master/docs/img/main.png">Main</a>

<hr>

## 주요 코드

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

### View 재사용 (회원가입 및 정보수정)
```html

...

<!-- 로그인 여부에 따라 페이지명을 다르게 출력 -->
<div class="fs-1 text-center mt-5 mb-3">${userInfo == null ? 'Sign Up To Survey' : 'My Page'}</div>

<!-- 로그인 여부에 따라 input:hidden 추가 및 form action 동작 -->
<form action="/form/${userInfo == null ? 'signup' : 'mypage'}" method="post" id="userForm">
<c:if test="${userInfo != null}">
    <input type="hidden" name="muid" id="muid" value="${userInfo.get("MUID")}">
</c:if>

    <!-- 로그인 여부에 따라 value 작성 -->
    <div class="row d-flex justify-content-center">
        <div class="col-3 my-3">
            <label class="form-label" for="id">ID</label>
            <input class="form-control w-100" type="text" name="id" id="id" value="${userInfo.get("ID")}" required>
        </div>
    </div>

    ...

    <!-- 로그인 여부에 따라 버튼명 작성 -->
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

<!-- 정보수정일 경우에만 탈퇴하기 버튼 노출 -->
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
