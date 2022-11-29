package nwpu.web.dao;

import nwpu.web.domain.entity.Manager;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.annotations.Param;


import java.util.List;


public interface ManagerDao {
    @Insert("insert into tbl_manager (managerName,password) values(#{managerName},#{password})")
    public int save(Manager manager);

    @Update("update tbl_manager set managerName = #{managerName},password = #{password} where managerId = #{managerId}")
    public int update(Manager manager);

    @Delete("update tbl_manager set deleteState = 1 where managerId=#{id}")
    public int delete(@Param("id") Integer id);

    @Select("select * from tbl_manager where managerId = #{id} and deleteState = 0")
    public List<Manager> getById(@Param("id") Integer id);

    @Select("select * from tbl_manager where managerName = #{managerName} and deleteState = 0")
    public List<Manager> getByName(@Param("managerName") String managerName);

    @Select("select * from tbl_manager where deleteState = 0")
    public List<Manager> getAll();

}
