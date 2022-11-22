package nwpu.web.service.impl;

import nwpu.web.dao.ManagerDao;
import nwpu.web.domain.Manager;
import nwpu.web.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    private ManagerDao managerDao;
    public boolean saveManager(Manager manager) {
        return managerDao.save(manager)>0;
    }

    public boolean updateManager(Manager manager) {
        return false;
    }

    public boolean deleteManager(Integer id) {
        return false;
    }

    public Manager getManagerById(Integer id) {
        return null;
    }

    public List<Manager> getAllManager() {
        return null;
    }
}
