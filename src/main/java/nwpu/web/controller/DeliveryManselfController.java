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
/*
*
* 个人信息修改功能实现
*
 */
@Controller
@RequestMapping("/deliveryManself")
public class DeliveryManselfController {

    @Autowired
    private DeliveryManService deliveryManService;

    @GetMapping
    public void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入");
        List<DeliveryMan> data = deliveryManService.getDeliveryManById(6);
        request.setAttribute("data",data);
        request.getRequestDispatcher("/WEB-INF/views/deliveryManSelf.jsp").forward(request,response);
        System.out.println("data为"+data);
    }
    @GetMapping("/update/{id}")
    public void update(@PathVariable Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入update"+id);
        DeliveryMan deliveryMan = new DeliveryMan();
        deliveryMan.setDeliveryManId(id);
        deliveryMan.setPhoneNo(request.getParameter("phoneNo"));
        deliveryMan.setEmail(request.getParameter("email"));
        deliveryMan.setDeliveryManName(request.getParameter("deliveryManName"));
        deliveryMan.setPassword(request.getParameter("password"));
        System.out.println("进入controller"+deliveryMan);
        boolean flag = deliveryManService.updateDeliveryMan(deliveryMan);
        this.getAll(request,response);

    }

}
