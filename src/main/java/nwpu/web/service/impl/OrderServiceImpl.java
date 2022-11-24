package nwpu.web.service.impl;

import com.sun.org.apache.xpath.internal.operations.Or;
import nwpu.web.dao.OrderDao;
import nwpu.web.domain.Order;
import nwpu.web.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    public boolean saveOrder(Order order) {
        return orderDao.save(order)>0;
    }

    public boolean updateOrder(Order order) {
        return orderDao.update(order)>0;
    }

    public boolean deleteOrder(Integer id) {
        return orderDao.delete(id)>0;
    }

    public Order getOrderById(Integer id) {
        return orderDao.getById(id);
    }

    public List<Order> getAllOrder() {
        return orderDao.getAll();
    }

    public List<Order> getAllOrderByState(Integer state) {
        return orderDao.getByState(state);
    }

    public List<Order> getAllOrderByAddress(String address) {
        return orderDao.getByAddress(address);
    }
}
