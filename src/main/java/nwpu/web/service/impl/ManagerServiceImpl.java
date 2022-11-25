package nwpu.web.service.impl;

import nwpu.web.dao.ManagerDao;
import nwpu.web.domain.entity.Manager;
import nwpu.web.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerDao managerDao;
    public boolean saveManager(Manager manager) {
        System.out.println("进入service"+manager);
        return managerDao.save(manager)>0;
    }

    public boolean updateManager(Manager manager) {
        return managerDao.update(manager)>0;
    }

    public boolean deleteManager(Integer id) {
        return managerDao.delete(id)>0;
    }

    public Manager getManagerById(Integer id) {
        return managerDao.getById(id);
    }

    public List<Manager> getManagerByManagerName(String managerName){
        return managerDao.getByName(managerName);
    }

    public List<Manager> getAllManager() {
        System.out.println("进入service");
        return managerDao.getAll();
    }
}
