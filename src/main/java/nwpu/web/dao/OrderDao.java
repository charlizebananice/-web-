package nwpu.web.dao;

import com.sun.org.apache.xpath.internal.operations.Or;
import nwpu.web.domain.Order;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.GetMapping;


import java.util.List;
public interface OrderDao {

    @Insert("insert into tbl_order (state, fee, shippingAddress, receiveAddress, managerId, deliverymanId) values( #{state}, #{fee}, #{shippingAddress}, #{receiveAddress}, #{managerId}, null)")
    public int save(@Param("order") Order order);

    @Update("update tbl_order set state = #{state},fee = #{fee},shippingAddress = #{shippingAddress},receiveAddress = #{receiveAddress},managerId = #{managerId},deliverymanId = #{deliverymanId} where orderId = #{orderId}")
    public int update(@Param("order") Order order);

    @Delete("delete from tbl_order where orderId = #{id}")
    public int delete(@Param("id") Integer id);

    @Select("select * from tbl_order")
    public List<Order> getAll();

    @Select("select * from tbl_order where orderId = #{id}")
    public Order getById(@Param("id") Integer id);

    @Select("select * from tbl_order where state = #{state}")
    public List<Order> getByState(@Param("state") Integer state);

    @Select("select * from tbl_order where shippingAddress = #{address} or receiveAddress = #{address}")
    public List<Order> getByAddress(@Param("address") String address);

}
