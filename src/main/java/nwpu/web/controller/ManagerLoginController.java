package nwpu.web.controller;

import nwpu.web.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
