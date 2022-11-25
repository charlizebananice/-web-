package nwpu.web.dao;

import nwpu.web.domain.entity.Manager;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ManagerDao {
    @Insert("insert into tbl_manager (managerName, password) values (#{managerName},#{password})")
    public int save(@Param("manager") Manager manager);

    @Update("update tbl_manager set managerName = #{managerName},password = #{password}")
    public int update(@Param("manager") Manager manager);

    @Delete("delete from tbl_manager where managerId=#{id}")
    public int delete(@Param("id") Integer id);

    @Select("select * from tbl_manager where managerId = #{id}")
    public Manager getById(@Param("id") Integer id);

    @Select("select * from tbl_manager")
    public List<Manager> getAll();

}
