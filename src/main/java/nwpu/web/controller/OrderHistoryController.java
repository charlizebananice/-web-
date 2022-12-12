package nwpu.web.controller;

import nwpu.web.domain.common.Code;
import nwpu.web.domain.common.Result;
import nwpu.web.domain.entity.DeliveryMan;
import nwpu.web.domain.entity.Order;
import nwpu.web.service.DeliveryManService;
import nwpu.web.service.DeliveryOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/orderhistory")
public class OrderHistoryController {

    @Autowired
    private DeliveryOrderService deliveryOrderService;
    @Autowired
    private DeliveryManService deliveryManService;

    /**
     * 点击完成订单，将订单状态变为已完成
     * @param request
     * @return
     */
    @GetMapping("/update1/{id}")
    public void update1(@PathVariable Integer id, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        DeliveryMan deliveryMan = (DeliveryMan) session.getAttribute("deliveryMan");
        System.out.println("进入update"+id);
        Order order = new Order();
        order.setOrderId(id);
        System.out.println("进入controller"+order);
        Integer state = deliveryOrderService.nowState(order);
        int i = state.intValue();
        if(i==1) {
            boolean flag = deliveryOrderService.updateOrder1(order);
            boolean f = deliveryManService.updateState0(deliveryMan);
        }else if(i==2){
            System.out.println("该订单已完成！"+order);
        }
        this.getAll(request,response,session);
    }
    /**
     * 退单功能
     * @param request
     * @return
     */
    @GetMapping("/update2/{id}")
    public void update2(@PathVariable Integer id, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        DeliveryMan deliveryMan = (DeliveryMan) session.getAttribute("deliveryMan");
        System.out.println("进入update0"+id);
        Order order = new Order();
        order.setOrderId(id);
        System.out.println("进入controller"+order);
        Integer state = deliveryOrderService.nowState(order);
        int i = state.intValue();
        if(i==1) {
            boolean flag = deliveryOrderService.updateOrder2(order);
            boolean f = deliveryManService.updateState0(deliveryMan);
        }else if(i==2){
            System.out.println("该订单已完成！无法退单!!!!"+order);
        }
        this.getAll(request,response,session);
    }
    /**
     * 获取该配送员订单
     * @param request
     * @return
     */

    @GetMapping
    public void getAll(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        DeliveryMan deliveryMan = (DeliveryMan) session.getAttribute("deliveryMan");

        Integer id = Integer.valueOf(deliveryMan.getDeliveryManId());
        System.out.println("查看ID    " + id);
        List<Order> data = deliveryOrderService.getOrderByDeliveymanId(id);
        System.out.println("进入了get/id" + "   " + id);
        request.setAttribute("data", data);
        request.getRequestDispatcher("/WEB-INF/views/orderHistory.jsp").forward(request, response);
        System.out.println("data为" + data);
    }






}