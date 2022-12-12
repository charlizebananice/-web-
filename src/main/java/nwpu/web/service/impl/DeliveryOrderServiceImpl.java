package nwpu.web.service.impl;

import nwpu.web.dao.DeliveryOrderDao;
import nwpu.web.domain.entity.Order;
import nwpu.web.service.DeliveryOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DeliveryOrderServiceImpl implements DeliveryOrderService {
    @Autowired
    private DeliveryOrderDao deliveryOrderDao;

    public boolean saveOrder(Order order) {
        return deliveryOrderDao.save(order)>0;
    }

    public boolean updateOrder(Order order) {
        return deliveryOrderDao.update(order)>0;
    }

    public boolean updateOrder1(Order order) {
        return deliveryOrderDao.update1(order)>0;
    }

    public boolean updateOrder2(Order order) {
        return deliveryOrderDao.update2(order)>0;
    }

    public boolean deleteOrder(Integer id) {
        return deliveryOrderDao.delete(id)>0;
    }

    public List<Order> getOrderById(Integer id) {
        return deliveryOrderDao.getById(id);
    }

    public List<Order> getAllOrder() {
        return deliveryOrderDao.getAll();
    }


    public List<Order> getAllOrderByState(Integer state) {
        return deliveryOrderDao.getByState(state);
    }

    public List<Order> getAllOrderByAddress(String address) {
        return deliveryOrderDao.getByAddress(address);
    }

    public List<Order> getAllOrderByName(String deliverymanName) {
        return deliveryOrderDao.getByName(deliverymanName);
    }

    public List<Order> getAllDeliverymanOrder(Integer deliverymanId) {
        return deliveryOrderDao.getAllDeliverymanOrder(deliverymanId);
    }

    public int getAllOrderSum() {
        return deliveryOrderDao.getAllOrderSum();
    }

    public int getAllOrderSumByState(Integer state) {
        return deliveryOrderDao.getAllOrderSumByState(state);
    }

    public List<Order> getOrderByDeliveymanId(Integer id) {
        return deliveryOrderDao.getByDeliveymanId(id);
    }


    public List<Order> getNowByDeliveymanId(Integer id) {
        return deliveryOrderDao.getNowByDeliveymanId(id);
    }

    public Integer nowState(Order order) {
        return deliveryOrderDao.nowState(order);
    }
}
