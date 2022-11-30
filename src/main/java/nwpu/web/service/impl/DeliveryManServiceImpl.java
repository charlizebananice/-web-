package nwpu.web.service.impl;

import nwpu.web.dao.DeliveryManDao;
import nwpu.web.domain.entity.DeliveryMan;
import nwpu.web.service.DeliveryManService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DeliveryManServiceImpl implements DeliveryManService {

    @Autowired
    private DeliveryManDao deliveryManDao;

    public boolean saveDeliveryMan(DeliveryMan deliveryMan) {

        System.out.println("进入service"+deliveryMan);
        return deliveryManDao.save(deliveryMan)>0;
    }
    public boolean updateDeliveryMan(DeliveryMan deliveryMan) {
        return deliveryManDao.update(deliveryMan)>0;
    }


    public boolean deleteDeliveryMan(Integer id) {

        return deliveryManDao.delete(id)>0;
    }

    public List<DeliveryMan> getDeliveryManById(Integer id) {

        return deliveryManDao.getById(id);
    }


    public List<DeliveryMan> getDeliveryManByDeliveryManName(String DeliveryManName) {
        return deliveryManDao.getByName(DeliveryManName);
    }

    public List<DeliveryMan> getAllDeliveryMan() {
        System.out.println("进入service");
        return deliveryManDao.getAll();
    }
}
