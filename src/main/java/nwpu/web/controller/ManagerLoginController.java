package nwpu.web.controller;

import nwpu.web.domain.entity.Manager;
import nwpu.web.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/managerlogin")
public class ManagerLoginController {
    @Autowired
    private ManagerService managerService;
    @RequestMapping(method = RequestMethod.GET)
    public String showLogin(){
        System.out.println("进入");
        return "managerlogin";
    }
    //post方法
    @RequestMapping(method = RequestMethod.POST)
    public String login(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws ServletException, IOException {
        System.out.println("进入login");
        List<Manager> data = managerService.getAllManager();
        System.out.println("1");
        String managerName = request.getParameter("managerName");
        String password = request.getParameter("password");
        System.out.println("2");
        List<Manager> managers = managerService.getManagerByManagerName(managerName);
        System.out.println("3");
        if(managers.isEmpty()){
            System.out.println("4");
            model.addAttribute("msg", "用户不存在!");
            return "managerlogin";
        }
        for(Manager manager : managers){
            if(manager.getPassword().equals(password)){
                // 把用户信息写入session, 拦截器根据session来判定用户是否登录
                System.out.println("5");
                session.setAttribute("manager", manager);
                request.setAttribute("data",data);
                // 登录成功, 别用重定向, 重定向是又向服务器重新发送请求, session会失效
                return "forward:/WEB-INF/views/management.jsp"; // return的字符串是jsp的名, 不是请求的url
            }

        }
        // 密码错误
        System.out.println("6");
        model.addAttribute("msg","密码错误!");
        return "managerlogin";
    }
}
