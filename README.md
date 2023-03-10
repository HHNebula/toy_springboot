# Spring - Mybatis CRUD Practice Project

## π Info π

### π κ°λ°κΈ°κ°
2023-01-20 ~ 2023-01-21

### π κΈ°μ μ€ν
<img src="https://img.shields.io/badge/Java-FFFFFF?style=flat&logo=OpenJDK&logoColor=black" /><img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white" /><img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white" /><img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat&logo=JavaScript&logoColor=white" />
<br>
<img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=flat&logo=Spring Boot&logoColor=white" /><img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white" /><img src="https://img.shields.io/badge/MyBatis-000000?style=flat&logo=MyBatis&logoColor=white" /><img src="https://img.shields.io/badge/Servlet-000000?style=flat&logo=Servlet&logoColor=white" /><img src="https://img.shields.io/badge/JSP-000000?style=flat&logo=JSP&logoColor=white" />

### β κ°λ°λͺ©μ 
MVC ν¨ν΄ ( Client > Servlet > Service > DAO > DB ) μ λν΄ μ΄ν΄νλ€.

<a href="https://velog.io/@hh_nebula/series/%EC%9B%B9-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-%ED%95%99%EC%8A%B5%EB%85%B8%ED%8A%B8">μΉ νλ‘κ·Έλλ° νμ΅ λΈνΈ</a>

<hr>

## View

<a href="https://github.com/HHNebula/toy_springboot/blob/master/docs/img/main.png">Main</a>

<hr>

## μ£Όμ μ½λ

### μ€λ¬Έμ‘°μ¬ Page λ‘κ·ΈμΈ νν°

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

### λ‘κ·ΈμΈ μ€ν¨ μ λ©μΈμ§ μ λ¬
```java
@PostMapping(value = "/login")
public Object loginPost(@RequestParam Map<String, Object> params, ModelAndView modelAndView,
        HttpSession session) {

    Object userInfo = formService.loginAttempt(params);

    if (userInfo == null) {
        modelAndView.addObject("msg", "λ‘κ·ΈμΈ μ λ³΄κ° λΆμΌμΉν©λλ€.");
        modelAndView.setViewName("form/login");
        return modelAndView;
    } else {
        session.setAttribute("userInfo", userInfo);
        return "redirect:/form/survey";
    }

}
```

### View μ¬μ¬μ© (νμκ°μ λ° μ λ³΄μμ )
```html

...

<!-- λ‘κ·ΈμΈ μ¬λΆμ λ°λΌ νμ΄μ§λͺμ λ€λ₯΄κ² μΆλ ₯ -->
<div class="fs-1 text-center mt-5 mb-3">${userInfo == null ? 'Sign Up To Survey' : 'My Page'}</div>

<!-- λ‘κ·ΈμΈ μ¬λΆμ λ°λΌ input:hidden μΆκ° λ° form action λμ -->
<form action="/form/${userInfo == null ? 'signup' : 'mypage'}" method="post" id="userForm">
<c:if test="${userInfo != null}">
    <input type="hidden" name="muid" id="muid" value="${userInfo.get("MUID")}">
</c:if>

    <!-- λ‘κ·ΈμΈ μ¬λΆμ λ°λΌ value μμ± -->
    <div class="row d-flex justify-content-center">
        <div class="col-3 my-3">
            <label class="form-label" for="id">ID</label>
            <input class="form-control w-100" type="text" name="id" id="id" value="${userInfo.get("ID")}" required>
        </div>
    </div>

    ...

    <!-- λ‘κ·ΈμΈ μ¬λΆμ λ°λΌ λ²νΌλͺ μμ± -->
    <div class="row d-flex justify-content-center">
        <div class="col-3 my-3">
        <c:if test="${userInfo == null}">
            <button class="btn btn-dark w-100" type="submit" id="insertButton">κ°μνκΈ°</button>
        </c:if>
        <c:if test="${userInfo != null}">
            <button class="btn btn-dark w-100" type="submit" id="updateButton">μμ νκΈ°</button>
        </c:if>
        </div>
    </div>
</form>

<!-- μ λ³΄μμ μΌ κ²½μ°μλ§ νν΄νκΈ° λ²νΌ λΈμΆ -->
<c:if test="${userInfo != null}">
    <form action="/form/delete" method="post" id="dropForm">
        <input type="hidden" name="muid" id="muid" value="${userInfo.get("MUID")}">
        <div class="row d-flex justify-content-center">
            <div class="col-3 my-3">
                <div class="btn btn-danger w-100" id="dropButton">νν΄νκΈ°</div>
            </div>
        </div>
    </form>
</c:if>
...

```
