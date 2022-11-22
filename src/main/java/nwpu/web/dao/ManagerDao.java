package nwpu.web.dao;

import nwpu.web.domain.Manager;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
public interface ManagerDao {
    @Insert("insert into tbl_manager (managerName, password) values (#{managerName},#{password})")
    public int save(@Param("manager") Manager manager);
}
