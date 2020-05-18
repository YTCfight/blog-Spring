package frank.config;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    // Controller 类方法调用前，如果匹配到拦截器的 url，就会调用 preHandle 进行拦截
    // 返回值为 true 表示能够继续访问（可以调用 Controller中的方法，或者是访问某个页面）
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 获取 session，如果没有就返回 null
        HttpSession session = request.getSession(false);
        if (session != null) {
            Object user = session.getAttribute("user");
            if (user != null) {
                return true;
            }
        }
        response.sendRedirect("/login");
        return false;
    }
}
