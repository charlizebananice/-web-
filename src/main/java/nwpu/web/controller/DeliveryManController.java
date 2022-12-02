package nwpu.web.controller;
import nwpu.web.domain.entity.DeliveryMan;
import nwpu.web.service.DeliveryManService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/deliveryMan")
public class DeliveryManController {
    @Autowired
    private DeliveryManService deliveryManService;

    @ResponseBody
    public String testJson(@RequestBody List<String> stringList) {
        return null;
    }

    @PostMapping
    public void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DeliveryMan deliveryMan = new DeliveryMan();
        deliveryMan.setDeliveryManName(request.getParameter("deliveryManName"));
        deliveryMan.setPassword(request.getParameter("password"));
        System.out.println("进入controller"+deliveryMan);
        boolean flag = deliveryManService.saveDeliveryMan(deliveryMan);
        System.out.println("出去");
        this.getAll(request,response);
    }

    @GetMapping
    public void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入");
        List<DeliveryMan> data = deliveryManService.getAllDeliveryMan();
        request.setAttribute("data",data);
        request.getRequestDispatcher("/WEB-INF/views/Deliveryment.jsp").forward(request,response);
        System.out.println("data为"+data);
    }

    @GetMapping("/id")
    public void getById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入根据id查");
        String sid = request.getParameter("id");
        Integer id = Integer.valueOf(sid);
        System.out.println("查看ID    "+id);
        List<DeliveryMan> data = deliveryManService.getDeliveryManById(id);
        System.out.println("进入了get/id"+"   "+id);
        request.setAttribute("data",data);
        request.getRequestDispatcher("/WEB-INF/views/Deliveryment.jsp").forward(request,response);
        System.out.println("data为"+data);
    }


    @GetMapping("/name")
    public void getByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入根据name查");
        String deliveryManName = request.getParameter("deliveryManName");
        System.out.println("查看name    "+deliveryManName);
        List<DeliveryMan> data = deliveryManService.getDeliveryManByDeliveryManName(deliveryManName);
        System.out.println("进入了get/name"+"   "+deliveryManName);
        request.setAttribute("data",data);
        request.getRequestDispatcher("/WEB-INF/views/Deliveryment.jsp").forward(request,response);
        System.out.println("data为"+data);
    }


    @GetMapping("/delete/{id}")
    public void delete(@PathVariable Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入delete"+id);
        boolean flag = deliveryManService.deleteDeliveryMan(id);
        System.out.println("出delete"+id);
        this.getAll(request,response);
    }

    @GetMapping("/update/{id}")
    public void update(@PathVariable Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入update"+id);
        DeliveryMan deliveryMan = new DeliveryMan();
        deliveryMan.setDeliveryManId(id);
        deliveryMan.setDeliveryManName(request.getParameter("deliveryManName"));
        deliveryMan.setPassword(request.getParameter("password"));
        System.out.println("进入controller"+deliveryMan);
        boolean flag = deliveryManService.updateDeliveryMan(deliveryMan);
        this.getAll(request,response);

    }

    @RequestMapping
    public String test() {
        System.out.println("测试。。。");
        return "test";
    }

}
