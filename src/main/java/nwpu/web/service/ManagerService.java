package nwpu.web.service;

import nwpu.web.domain.Manager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
//定义整个类为事务类，正常时提交，异常时回滚
public interface ManagerService {
    /**
     * 新建一个管理员
     * @param manager
     * @return
     */
    public boolean saveManager(Manager manager);

    /**
     * 修改manager
     * @param manager
     * @return
     */
    public boolean updateManager(Manager manager);
    public boolean deleteManager(Integer id);
    public Manager getManagerById(Integer id);
    public List<Manager> getAllManager();

}
