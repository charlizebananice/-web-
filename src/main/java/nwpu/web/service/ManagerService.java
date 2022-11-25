package nwpu.web.service;

import nwpu.web.domain.entity.Manager;
import org.springframework.stereotype.Service;

import java.util.List;

//@Transactional
/**
 * 定义整个类为事务类，正常时提交，异常时回滚
 */
//事务注释有问题，先用@Service
@Service
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
