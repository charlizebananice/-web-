package nwpu.web.controller;

import nwpu.web.domain.common.Code;
import nwpu.web.domain.common.Result;
import nwpu.web.domain.entity.Manager;
import nwpu.web.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import sun.misc.Request;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/manager")
public class ManagerController {
    @Autowired
    private ManagerService managerService;

    @ResponseBody
    public String testJson(@RequestBody List<String> stringList) {
        return null;
    }

    @PostMapping
    public void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Manager manager = new Manager();
        manager.setManagerName(request.getParameter("managerName"));
        manager.setPassword(request.getParameter("password"));
        System.out.println("进入controller"+manager);
        boolean flag = managerService.saveManager(manager);
        System.out.println("出去");
        this.getAll(request,response);
    }

    @GetMapping
    public void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入");
        List<Manager> data = managerService.getAllManager();
        request.setAttribute("data",data);
        request.getRequestDispatcher("/WEB-INF/views/management.jsp").forward(request,response);
        System.out.println("data为"+data);
    }

    @GetMapping("/id")
    public void getById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入根据id查");
        String sid = request.getParameter("id");
        Integer id = Integer.valueOf(sid);
        System.out.println("查看ID    "+id);
        List<Manager> data = managerService.getManagerById(id);
        System.out.println("进入了get/id"+"   "+id);
        request.setAttribute("data",data);
        request.getRequestDispatcher("/WEB-INF/views/management.jsp").forward(request,response);
        System.out.println("data为"+data);
    }


    @GetMapping("/name")
    public void getByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入根据name查");
        String managerName = request.getParameter("managerName");
        System.out.println("查看name    "+managerName);
        List<Manager> data = managerService.getManagerByManagerName(managerName);
        System.out.println("进入了get/name"+"   "+managerName);
        request.setAttribute("data",data);
        request.getRequestDispatcher("/WEB-INF/views/management.jsp").forward(request,response);
        System.out.println("data为"+data);
    }


    @GetMapping("/delete/{id}")
    public void delete(@PathVariable Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入delete"+id);
        boolean flag = managerService.deleteManager(id);
        System.out.println("出delete"+id);
        this.getAll(request,response);
    }

    @GetMapping("/update/{id}")
    public void update(@PathVariable Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入update"+id);
        Manager manager = new Manager();
        manager.setManagerId(id);
        manager.setManagerName(request.getParameter("managerName"));
        manager.setPassword(request.getParameter("password"));
        System.out.println("进入controller"+manager);
        boolean flag = managerService.updateManager(manager);
        this.getAll(request,response);

    }

    @RequestMapping
    public String test() {
        System.out.println("测试。。。");
        return "test";
    }
}
