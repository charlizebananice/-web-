package nwpu.web.controller;

import nwpu.web.domain.common.Code;
import nwpu.web.domain.entity.Order;
import nwpu.web.domain.common.Result;
import nwpu.web.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @PostMapping
    public Result save(@RequestBody Order order) {
        System.out.println("进入controller"+order);
        boolean flag = orderService.saveOrder(order);
        System.out.println("出去");
        return new Result(flag, flag ? Code.SAVE_OK : Code.SAVE_ERR);
    }

    @PutMapping
    public Result update(@RequestBody Order order) {
        System.out.println("进入controller"+order);
        boolean flag = orderService.updateOrder(order);
        return new Result(flag, flag ? Code.UPDATE_OK : Code.UPDATE_ERR);
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        System.out.println("进入delete"+id);
        boolean flag = orderService.deleteOrder(id);
        return new Result(flag, flag ? Code.DELETE_OK : Code.DELETE_ERR);
    }

    @GetMapping
    public Result getAll(){
        List<Order> data = orderService.getAllOrder();
        return new Result(data, Code.GET_OK);
    }

    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id){
        Order data = orderService.getOrderById(id);
        return new Result(data, Code.GET_OK);
    }

    @GetMapping("/name/{deliverymanName}")
    public Result getById(@PathVariable String deliverymanName){
        List<Order> data = orderService.getAllOrderByName(deliverymanName);
        return new Result(data, Code.GET_OK);
    }

    @GetMapping("/address/{address}")
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

    @GetMapping("/orderSum")
    public Result getAllOrderSum(){
        Integer data = orderService.getAllOrderSum();
        return new Result(data, Code.GET_OK);
    }

    @GetMapping("/OrderSumByState/{state}")
    public Result getAllOrderSumByState(@PathVariable Integer state){
        Integer data = orderService.getAllOrderSumByState(state);
        return new Result(data,Code.GET_OK);
    }
}
