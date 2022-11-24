package nwpu.web.service;

import com.sun.org.apache.xpath.internal.operations.Or;
import nwpu.web.domain.Manager;
import nwpu.web.domain.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public interface OrderService {
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
    public Order getOrderById(Integer id);

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
}
