package nwpu.web.dao;

import nwpu.web.domain.entity.DeliveryMan;
import nwpu.web.domain.entity.Order;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface DeliveryOrderDao {


    @Insert("insert into tbl_order (fee, shippingAddress, receiveAddress, managerId, deliverymanId) values( #{fee}, #{shippingAddress}, #{receiveAddress}, #{managerId}, null)")
    public int save(Order order);

    @Update("update tbl_order set state = 1,deliverymanId = #{deliverymanId} where orderId = #{orderId}")
    public int update(Order order);

    @Update("update tbl_order set state = 2 where orderId = #{orderId}")
    public int update1(Order order);

    @Update("update tbl_order set state = 0 ,deliverymanId = null where orderId = #{orderId}")
    public int update2(Order order);

    @Delete("update tbl_order set deleteState = 1 where orderId = #{id}")
    public int delete(@Param("id") Integer id);

    @Select("select * from tbl_order where deleteState = 0 and state=0")
    public List<Order> getAll();


    @Select("select * from tbl_order where deliverymanId = #{id} and deleteState = 0")
    public List<Order> getAllDeliverymanOrder(@Param("id") Integer id);

    @Select("select count(orderId) from tbl_order where deleteState = 0")
    public int getAllOrderSum();

    @Select("select count(orderId) from tbl_order where state  =#{state} and deleteState = 0")
    public int getAllOrderSumByState(@Param("state") Integer state);

    @Select("select * from tbl_order where orderId = #{id} and deleteState = 0 and state=0")
    public List<Order> getById(@Param("id") Integer id);

    @Select("select * from tbl_order where deliverymanId = #{id} and deleteState = 0 and state = 2")
    public List<Order> getByDeliveymanId(@Param("id") Integer id);

    @Select("select * from tbl_order where deliverymanId = #{id} and deleteState = 0 and state = 1")
    public List<Order> getNowByDeliveymanId(@Param("id") Integer id);

    @Select("select * from tbl_order where state = #{state} and deleteState = 0 and state=0")
    public List<Order> getByState(@Param("state") Integer state);

    @Select("select * from tbl_order where (shippingAddress = #{address} or receiveAddress = #{address}) and deleteState = 0 and state=0")
    public List<Order> getByAddress(@Param("address") String address);

    @Select("select a.orderId,a.state,a.fee,a.deleteState,a.shippingAddress,a.receiveAddress,a.managerId,a.deliverymanId from tbl_order a left join tbl_deliveryman b on a.deliverymanId = b.deliverymanId where b.deliverymanName = #{name} and a.deleteState = 0 and state=0")
    public List<Order> getByName(@Param("name") String name);

    @Select("select state from tbl_order where orderId = #{orderId}")
    public  Integer nowState(Order order);
}
