package nwpu.web.dao;

import nwpu.web.domain.Manager;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.annotations.Param;


import java.util.List;


public interface ManagerDao {
    @Insert("insert into tbl_manager (managerName,password) values(#{managerName},#{password})")
    public int save(@Param("manager") Manager manager);

    @Update("update tbl_manager set managerName = #{managerName},password = #{password} where managerId = #{id}")
    public int update(@Param("manager") Manager manager);

    @Delete("delete from tbl_manager where managerId=#{id}")
    public int delete(@Param("id") Integer id);

    @Select("select * from tbl_manager where managerId = #{id}")
    public Manager getById(@Param("id") Integer id);

    @Select("select * from tbl_manager")
    public List<Manager> getAll();

}
