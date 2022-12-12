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
import javax.servlet.http.HttpSession;
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
    /**
     * 通过session获取登录的配送员的信息
     * @param request
     * @return
     */
    @GetMapping
    public void getAll(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        System.out.println("进入");
        DeliveryMan d = (DeliveryMan) session.getAttribute("deliveryMan");
        List<DeliveryMan> deliveryMan = deliveryManService.getDeliveryManById(d.getDeliveryManId());
        request.setAttribute("deliveryMan",deliveryMan.get(0));
        System.out.println("deliveryMan为"+deliveryMan.get(0));
        request.getRequestDispatcher("/WEB-INF/views/deliveryManSelf.jsp").forward(request,response);
        System.out.println("deliveryMan为"+deliveryMan);
    }
    /**
     * 实现修改个人信息功能
     * @param request
     * @return
     */
    @GetMapping("/update/{id}")
    public void update(@PathVariable Integer id,HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        System.out.println("进入update"+id);
        DeliveryMan deliveryMan = new DeliveryMan();
        deliveryMan.setDeliveryManId(id);
        deliveryMan.setPhoneNo(request.getParameter("phoneNo"));
        deliveryMan.setEmail(request.getParameter("email"));
        deliveryMan.setDeliveryManName(request.getParameter("deliveryManName"));
        deliveryMan.setPassword(request.getParameter("password"));
        session.setAttribute("deliveryMan",deliveryMan);
        System.out.println("进入controller"+deliveryMan);
        boolean flag = deliveryManService.updateDeliveryMan(deliveryMan);
        this.getAll(request,response,session);

    }

}
