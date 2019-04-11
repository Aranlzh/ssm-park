package ssm.service;

import java.util.List;

import ssm.entity.Orders;
import ssm.entity.UserQueryVo;

public interface OrdersService {
	
	public List<Orders> selectOrdersByUserId(UserQueryVo vo) ;
	
	public List<Orders> selectAll();
	
	public void updateOrdersByOId(Orders orders) ;
	
	public boolean delectOrdersByOId(Integer id) ;

	public List<Orders> findOrdersLike(String name, String plateNum);
	
	public void addNewOrder(Orders orders);
}
