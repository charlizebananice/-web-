package nwpu.web.dao;

import nwpu.web.domain.entity.DeliveryMan;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeliveryManDao {
    @Insert("insert into tbl_deliveryMan (deliveryManName,password, phoneNo, email) values(#{deliveryManName},#{password},#{phoneNo}, #{email})")
    public int save(DeliveryMan deliveryMan);

    @Update("update tbl_deliveryMan set deliveryManName = #{deliveryManName},email = #{email},phoneNo = #{phoneNo},password = #{password} where deliveryManID = #{deliveryManId}")
    public int update(DeliveryMan deliveryMan);

    @Delete("update tbl_deliveryMan set deleteState = 1 where deliveryManID=#{id}")
    public int delete(@Param("id") Integer id);

    @Select("select * from tbl_deliveryMan where deliveryManID = #{id} and deleteState = 0")
    public List<DeliveryMan> getById(@Param("id") Integer id);

    @Select("select * from tbl_deliveryMan where deliveryManName = #{deliveryManName} and deleteState = 0")
    public List<DeliveryMan> getByName(@Param("deliveryManName") String managerName);

    @Select("select * from tbl_deliveryMan where deleteState = 0")
    public List<DeliveryMan> getAll();

    @Update("update tbl_deliveryMan set state = 1 where deliveryManID = #{deliveryManId}")
    public int updateState(DeliveryMan deliveryMan);

    @Update("update tbl_deliveryMan set state = 0 where deliveryManID = #{deliveryManId}")
    public int updateState0(DeliveryMan deliveryMan);

    @Select("select state from tbl_deliveryMan where deliveryManID = #{deliveryManId}")
    public  Integer nowState(DeliveryMan deliveryMan);



}
