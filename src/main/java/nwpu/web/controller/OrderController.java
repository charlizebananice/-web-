package nwpu.web.controller;

import com.sun.org.apache.xpath.internal.operations.Or;
import nwpu.web.domain.common.Code;
import nwpu.web.domain.entity.Order;
import nwpu.web.domain.common.Result;
import nwpu.web.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
/**
 * 配送员历史订单Controller
 *
 */
@Controller
@RequestMapping("/manager/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @PostMapping
    public void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Order order = new Order();
        order.setFee(Integer.valueOf(request.getParameter("fee")));
        order.setManagerId(Integer.valueOf(request.getParameter("managerId")));
        order.setReceiveAddress(request.getParameter("receiveAddress"));
        order.setShippingAddress(request.getParameter("shippingAddress"));
        System.out.println("进入controller"+order);
        boolean flag = orderService.saveOrder(order);
        System.out.println("出去");
        this.getAll(request,response);
    }

    @GetMapping("/update/{id}")
    public void update(@PathVariable Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入update"+id);
        Order order = new Order();
        order.setOrderId(id);
        order.setFee(Integer.valueOf(request.getParameter("fee")));
        order.setManagerId(Integer.valueOf(request.getParameter("managerId")));
        order.setReceiveAddress(request.getParameter("receiveAddress"));
        order.setShippingAddress(request.getParameter("shippingAddress"));
        System.out.println("1111111111"+id);
        order.setState(Integer.valueOf(request.getParameter("state")));
        System.out.println("进入controller"+order);
        boolean flag = orderService.updateOrder(order);
        this.getAll(request,response);
    }

    @GetMapping("/delete/{id}")
    public void delete(@PathVariable Integer id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入delete"+id);
        boolean flag = orderService.deleteOrder(id);
        System.out.println("出delete"+id);
        this.getAll(request,response);
    }

    @GetMapping
    public void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> data = orderService.getAllOrder();
        Integer state0 = orderService.getAllOrderSumByState(0);
        Integer state1 = orderService.getAllOrderSumByState(1);
        Integer state2 = orderService.getAllOrderSumByState(2);

        request.getSession().setAttribute("state0",state0);
        request.getSession().setAttribute("state1",state1);
        request.getSession().setAttribute("state2",state2);

        request.setAttribute("data",data);
        request.getRequestDispatcher("/WEB-INF/views/managementOrder.jsp").forward(request,response);
    }

    @GetMapping("/id")
    public void getById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入根据id查");
        String sid = request.getParameter("id");
        Integer id = Integer.valueOf(sid);
        System.out.println("查看ID    "+id);
        List<Order> data = orderService.getOrderById(id);
        System.out.println("进入了get/id"+"   "+id);
        request.setAttribute("data",data);
        request.getRequestDispatcher("/WEB-INF/views/managementOrder.jsp").forward(request,response);
        System.out.println("data为"+data);
    }

    @GetMapping("/name")
    public void getByDeliverymanName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进入根据name查");
        String deliverymanName = request.getParameter("deliverymanName");
        System.out.println("查看name    "+deliverymanName);
        List<Order> data = orderService.getAllOrderByName(deliverymanName);
        System.out.println("进入了get/name"+"   "+deliverymanName);
        data.addAll(orderService.getAllOrderByAddress(deliverymanName));
        request.setAttribute("data",data);
        request.getRequestDispatcher("/WEB-INF/views/managementOrder.jsp").forward(request,response);
        System.out.println("data为"+data);
    }

    @GetMapping("/address")
    public Result getByAddress(@PathVariable String address){
        List<Order> data = orderService.getAllOrderByAddress(address);
        return new Result(data, Code.GET_OK);
    }

    @GetMapping("/state/{state}")
    public Result getByState(@PathVariable Integer state){
        List<Order> data = orderService.getAllOrderByState(state);
        return new Result(data , Code.GET_OK);
    }

    @GetMapping("/deliveryman/{deliverymanId}")
    public Result getAllDeliverymanOrder(@PathVariable Integer deliverymanId){
        List<Order> data = orderService.getAllDeliverymanOrder(deliverymanId);
        return new Result(data , Code.GET_OK);
    }

    @GetMapping("/ordersum")
    public void getAllOrderSum(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> data = orderService.getAllOrderByState(2);
        request.setAttribute("data",data);
        request.getRequestDispatcher("/WEB-INF/views/managementOrder.jsp").forward(request,response);
        System.out.println("data为"+data);
    }

    @GetMapping("/OrderSumByState/{state}")
    public Result getAllOrderSumByState(@PathVariable Integer state){
        Integer data = orderService.getAllOrderSumByState(state);
        return new Result(data,Code.GET_OK);
    }
}
