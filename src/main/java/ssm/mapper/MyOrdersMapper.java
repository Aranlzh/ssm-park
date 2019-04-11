package ssm.mapper;

import java.util.List;

import ssm.entity.Orders;
import ssm.entity.OrdersQueryVo;
import ssm.entity.UserQueryVo;

public interface MyOrdersMapper {
	
	public List<Orders> findOrdersByUserId(UserQueryVo userQueryVo);

	public List<Orders> findAllOrders();

	public List<Orders> findOrdersLike(OrdersQueryVo vo);
	
}
