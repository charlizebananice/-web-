package nwpu.web.controller.HandlerInterceptor;

import nwpu.web.domain.entity.DeliveryMan;
import nwpu.web.domain.entity.Manager;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
//定义拦截器类，实现HandlerInterceptor接口
public class DeliveryManInterceptor implements HandlerInterceptor {
    //原始方法调用前执行的内容
    //用户已登录返回true，否则返回false
    public boolean preHandle(HttpServletRequest request, HttpServletResponse
            response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        DeliveryMan deliveryMan = (DeliveryMan)session.getAttribute("deliveryMan");
        if (deliveryMan!=null){
            return true;
        }else {
            response.sendRedirect(request.getContextPath()+"/deliverymanlogin");
            return false;
        }
    }

    //原始方法调用后执行的内容
    public void postHandle(HttpServletRequest request, HttpServletResponse
            response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    //原始方法调用完成后执行的内容
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}