package nwpu.web.service;

import nwpu.web.domain.Manager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    /**
     * 删除manager
     * @param id
     * @return
     */
    public boolean deleteManager(Integer id);
    /**
     * 按id查找manager
     * @param id
     * @return manager
     */
    public Manager getManagerById(Integer id);
    /**
     * 查找所有manager
     * @param
     * @return List<Manager>
     */
    public List<Manager> getAllManager();

}
