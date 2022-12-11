package nwpu.web.service;

import nwpu.web.domain.entity.Manager;
import nwpu.web.domain.entity.DeliveryMan;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface DeliveryManService {

    /**
     * 修改DeliveryMan
     * @param deliveryMan
     * @return
     */
    public boolean updateDeliveryMan(DeliveryMan deliveryMan);

    /**
     * 新建一个配送员
     * @param deliveryMan
     * @return
     */
    public boolean saveDeliveryMan(DeliveryMan deliveryMan);

    /**
     * 删除DeliveryMan
     * @param id
     * @return
     */
    public boolean deleteDeliveryMan(Integer id);
    /**
     * 按id查找DeliveryMan
     * @param id
     * @return DeliveryMan
     */
    public List<DeliveryMan> getDeliveryManById(Integer id);
    /**
     * 按DeliveryManName查找DeliveryMan
     * @param DeliveryManName
     * @return manager
     */
    public List<DeliveryMan> getDeliveryManByDeliveryManName(String DeliveryManName);
    /**
     * 查找所有manager
     * @param
     * @return List<Manager>
     */
    public List<DeliveryMan> getAllDeliveryMan();

    public boolean updateState(DeliveryMan deliveryMan);

    public boolean updateState0(DeliveryMan deliveryMan);

    public Integer nowState(DeliveryMan deliveryMan);
}
