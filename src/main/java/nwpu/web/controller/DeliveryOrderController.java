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

/**
 * 配送员接单Controller
 *
 */
@Controller
@RequestMapping("/deliveryorder")
public class DeliveryOrderController {

    @Autowired
    private DeliveryOrderService deliveryOrderService;
    @Autowired
    private DeliveryManService deliveryManService;


    /**
     * 实现接单功能，若配送员正在配送则无法接单
     * @param request
     * @return
     */
    @GetMapping("/update/{id}")
    public void update(@PathVariable Integer id, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        System.out.println("进入update" + id);
        Order order = new Order();
        order.setOrderId(id);
        DeliveryMan deliveryMan = (DeliveryMan) session.getAttribute("deliveryMan");
        order.setDeliverymanId(deliveryMan.getDeliveryManId());

        System.out.println("deliverymanid" + deliveryMan.getDeliveryManId());
        System.out.println("进入controller" + order);
        Integer state = deliveryManService.nowState(deliveryMan);
        int i = state.intValue();
        if(i==0) {
            boolean flag = deliveryOrderService.updateOrder(order);
            boolean f = deliveryManService.updateState(deliveryMan);
        }else{
            System.out.println("配送状态无法接单");
        }


        this.getAll(request, response,session);
    }


    @GetMapping
    public void getAll(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        System.out.println("进入");
        DeliveryMan d = (DeliveryMan) session.getAttribute("deliveryMan");
        List<DeliveryMan> deliveryMan = deliveryManService.getDeliveryManById(d.getDeliveryManId());
        request.setAttribute("deliveryMan",deliveryMan.get(0));
        System.out.println("deliveryMan为"+deliveryMan.get(0));
        System.out.println("deliveryMan为"+deliveryMan);
        List<Order> data = deliveryOrderService.getAllOrder();
        request.setAttribute("data", data);
        request.getRequestDispatcher("/WEB-INF/views/deliveryOrder.jsp").forward(request,response);


    }

    @GetMapping("/id")
    public void getById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入根据id查");
        String sid = request.getParameter("id");
        Integer id = Integer.valueOf(sid);
        System.out.println("查看ID    " + id);
        List<Order> data = deliveryOrderService.getOrderById(id);
        System.out.println("进入了get/id" + "   " + id);
        request.setAttribute("data", data);
        request.getRequestDispatcher("/WEB-INF/views/deliveryOrder.jsp").forward(request, response);
        System.out.println("data为" + data);
    }


    @GetMapping("/name")
    public void getByDeliverymanName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入根据name查");
        String deliverymanName = request.getParameter("deliverymanName");
        System.out.println("查看name    " + deliverymanName);
        List<Order> data = deliveryOrderService.getAllOrderByName(deliverymanName);
        System.out.println("进入了get/name" + "   " + deliverymanName);
        data.addAll(deliveryOrderService.getAllOrderByAddress(deliverymanName));
        request.setAttribute("data", data);
        request.getRequestDispatcher("/WEB-INF/views/deliveryOrder.jsp").forward(request, response);
        System.out.println("data为" + data);
    }

    @GetMapping("/address")
    public Result getByAddress(@PathVariable String address) {
        List<Order> data = deliveryOrderService.getAllOrderByAddress(address);
        return new Result(data, Code.GET_OK);
    }

    @GetMapping("/state/{state}")
    public Result getByState(@PathVariable Integer state) {
        List<Order> data = deliveryOrderService.getAllOrderByState(state);
        return new Result(data, Code.GET_OK);
    }

    @GetMapping("/deliveryman/{deliverymanId}")
    public Result getAllDeliverymanOrder(@PathVariable Integer deliverymanId) {
        List<Order> data = deliveryOrderService.getAllDeliverymanOrder(deliverymanId);
        return new Result(data, Code.GET_OK);
    }

    @GetMapping("/orderSum")
    public Result getAllOrderSum() {
        Integer data = deliveryOrderService.getAllOrderSum();
        return new Result(data, Code.GET_OK);
    }

    @GetMapping("/OrderSumByState/{state}")
    public Result getAllOrderSumByState(@PathVariable Integer state) {
        Integer data = deliveryOrderService.getAllOrderSumByState(state);
        return new Result(data, Code.GET_OK);
    }

}

