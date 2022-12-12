package nwpu.web.service;

import nwpu.web.domain.entity.Order;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface DeliveryOrderService {
    /**
     * 新建一个订单
     * @param order
     * @return
     */
    public boolean saveOrder(Order order);

    /**
     * 修改订单
     * @param order
     * @return
     */
    public boolean updateOrder(Order order);

    public boolean updateOrder1(Order order);

    public boolean updateOrder2(Order order);

    /**
     * 删除order
     * @param id
     * @return
     */
    public boolean deleteOrder(Integer id);

    /**
     * 按id查找order
     * @param id
     * @return Order
     */
    public List<Order> getOrderById(Integer id);

    /**
     * 查找所有order
     * @param
     * @return List<Order>
     */
    public List<Order> getAllOrder();



    /**
     * 按state查找所有order
     * @param state
     * @return List<Order>
     */
    public List<Order> getAllOrderByState(Integer state);

    /**
     * 按address查找所有order
     * @param address
     * @return List<Order>
     */
    public List<Order> getAllOrderByAddress(String address);

    /**
     * 按deliverymanName查找所有order
     * @param deliverymanName
     * @return List<Order>
     */
    public List<Order> getAllOrderByName(String deliverymanName);

    /**
     * 查找派送员的所有order
     * @param deliverymanId
     * @return List<Order>
     */
    public List<Order> getAllDeliverymanOrder(Integer deliverymanId);

    /**
     * 查找订单总数
     * @param
     * @return List<Order>
     */
    public int getAllOrderSum();

    /**
     * 查找各个状态的订单数
     * @param state
     * @return List<Order>
     */
    public int getAllOrderSumByState(Integer state);
    /**
     * 查找对应配送员的订单
     * @param id
     * @return List<Order>
     */

    public List<Order> getOrderByDeliveymanId(Integer id);

    public Integer nowState(Order order);

    public List<Order> getNowByDeliveymanId(Integer id);
}
