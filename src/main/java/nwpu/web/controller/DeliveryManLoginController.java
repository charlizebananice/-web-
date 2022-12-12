package nwpu.web.controller;

import nwpu.web.domain.entity.DeliveryMan;
import nwpu.web.domain.entity.Manager;
import nwpu.web.service.DeliveryManService;
import nwpu.web.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/deliverymanlogin")
public class DeliveryManLoginController {

        @Autowired
        private DeliveryManService deliveryManService;

        @RequestMapping(method = RequestMethod.GET)
        public String showLogin(){
            System.out.println("进入");
            return "deliverymanlogin";
        }
        //post方法
        @RequestMapping(method = RequestMethod.POST)
        public String login(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws ServletException, IOException {
            System.out.println("进入login");
            System.out.println("1");
            String deliveryManId = request.getParameter("deliveryManId");
            String password = request.getParameter("password");
            System.out.println("2");
            String remember = request.getParameter("remember");
            System.out.println("remember" + remember);
            if("1".equals(remember)){
                System.out.println("remember" + remember);
                //勾选了，发送Cookie
                //1. 创建Cookie对象
                Cookie c_deliveryManId = new Cookie("deliveryManId",deliveryManId);
                Cookie c_password = new Cookie("password",password);
                // 设置Cookie的存活时间
                c_deliveryManId.setMaxAge( 60 * 60 * 24 * 7);
                c_password.setMaxAge( 60 * 60 * 24 * 7);

                c_deliveryManId.setPath(request.getContextPath());
                c_password.setPath(request.getContextPath());
                //2. 发送
                response.addCookie(c_deliveryManId);
                response.addCookie(c_password);
            }
            List<DeliveryMan> deliveryMans = deliveryManService.getDeliveryManById(Integer.valueOf(deliveryManId));
            System.out.println("3");
            if(deliveryMans.isEmpty()){
                System.out.println("4");
                model.addAttribute("msg", "用户不存在!");
                return "deliverymanlogin";
            }
            for(DeliveryMan deliveryMan : deliveryMans){
                if(deliveryMan.getPassword().equals(password)){
                    // 把用户信息写入session, 拦截器根据session来判定用户是否登录
                    System.out.println("5");
                    session.setAttribute("deliveryMan", deliveryMan);
                    // 登录成功, 别用重定向, 重定向是又向服务器重新发送请求, session会失效
                    return "deliveryman"; // return的字符串是jsp的名, 不是请求的url
                }

            }
            // 密码错误
            System.out.println("6");
            model.addAttribute("msg","密码错误!");
            return "deliverymanlogin";
        }
    }


